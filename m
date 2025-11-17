Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429F7CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:40:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4540.1763365215241187834
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guvWVZhn;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so10376525e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Nov 2025 23:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763365213; x=1763970013; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ma1Tm6wTNlqx9l3a6JvoAtcmWNU+I7GgxO5hcrD0n2Y=;
        b=guvWVZhnq0vAa+DLvrns5u/ySPKTob1IVtEGmNm0PTuJa4Y0iGs7M/fnNfNsZ82Wc6
         w3vYo/3CVJIvbnthKIWsc3h2LsG0rLt40DnAZwxI8VUaPA1UWLN1hkysCy62SD1DJoIh
         8rNcItNA1ofSQKwzCg2OxO8tCB7rFx+vzgCwkzMqArxXBFNEeO+WECUpFE2K1iQ17G4C
         TOxO6L8LuqM/SUArYBRPzFvVymuXolqd8LSyqBfWYeYslmHqnTH/vQR+iGng/aRnfe66
         Aw3IHDjGOz9CSsJIjjBVBmQ0bgzEgXqul5bPY9k3sBT9b098PzKVkrhYte1Gm8/m7utg
         ESLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763365213; x=1763970013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma1Tm6wTNlqx9l3a6JvoAtcmWNU+I7GgxO5hcrD0n2Y=;
        b=lTuduQHtNakm6RQzN5atuTfCasWx6YBMGauy3UPiWL38sIRAyTN91ppwd8gdEQznZx
         uMCDOKIq31Io0WYgV5hBaBMkJIIvCb6/XADBigG0/LHVjrfh3fb6sZ2T6Pcngk29uJ7P
         TXkDhs9VccrlRuV8tnOAQYVqcxF6T+QY4eZ5IfzesUkRPMQMKC4bvKmMNcXpO/FRX6z5
         8ZHw3dzKQdZ+e/cWtdyIS435Q037tihTCWfEakgKxE6S2ewp5PQsk769TxY0kDxqtDkv
         l+xTkMs6VNIc9aXAgg51uGYx+RlbglKCeuQVQ2WXVnWxUDNBEcnBlreHEhuQMA6tVxsw
         +hPw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZSuh0QdCQM4hO5SvCSPbllnmvYG9N2MQ94MDIw5GzO7CnkEj/zy/STn9wtQFWjW/H/Kx08kVNl9M/OTURLEoTbM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3/zba3XOsu3BNuaITCwhkqwpb+CpTOWLXqeKq4ExckQaJTnhd
	ZmvwtxZ3A1d7+votY5BW5vcfufOuT4TbkRaVBknGLCo7Tgruzb7kiOGXssTprMDn
X-Gm-Gg: ASbGncs/SWtpo9qV478eiH8qMOnGquEJk8EXcNlirPGB54qjMhEHmFAku7TNz1qw7c8
	uHx4p3T92p2JJfZcM7yDr+kEhyWMu+EFzl/vQ+GbtlxIT+yiOxbtJO/nCQWt9YrEMCQ4GAsD7Up
	gZpIPnH29QIbG+BJbahx/L6lA0ju++2jOvWZiX6lMEg/uiWYhYKJM650wWTkB1H47PojXYi/SSu
	8cstClcBiXePTRrra8B0W2b0duuX+FcJdaZXTf9WxAbIlv/HGW+SOTpUKB1AZ+hZR940Oean6Mf
	bS9qwswrfwIcnFki8++WlRbBpur/14IhkzsoCRSZzpx53UU7jToTzmPj2rcsjBo82I2Cu0OSlIU
	P0ShCzdltGTzQiNFCsvAy5qRXoB5B8Sm7zTC/wCQhGWPxvyoOY2uNk+Qa+/Eimd76ZgNkjiz2wR
	F9EpjhO86a
X-Google-Smtp-Source: AGHT+IFd/VT9Zh7hSdozjvUa5XunDCCQUXU5arPaO70gSGLjvuNRMukvfcsV6xJgNTjeQO9luaFkow==
X-Received: by 2002:a05:600c:a06:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-4778fe5ece9mr119352765e9.5.1763365213044;
        Sun, 16 Nov 2025 23:40:13 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477952823d3sm150046765e9.11.2025.11.16.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 23:40:10 -0800 (PST)
Message-ID: <fcf207d4-6b57-49bb-be82-3dc264206969@gmail.com>
Date: Mon, 17 Nov 2025 08:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2025-26699
To: saravanan.kadambathursubramaniyam@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20251117031438.3872441-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251117031438.3872441-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121756

On 11/17/25 04:14, Kadambathur Subramaniyam, Saravanan via
lists.openembedded.org wrote:
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-26699
>
> Upstream-patch:
> https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
>
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> ---
>  .../CVE-2025-26699.patch                      | 107 ++++++++++++++++++
>  .../CVE-2025-26699.patch                      | 105 +++++++++++++++++
>  .../CVE-2025-26699.patch                      | 107 ++++++++++++++++++
>  .../python/python3-django_2.2.28.bb           |   1 +
>  .../python/python3-django_3.2.23.bb           |   5 +-
>  .../python/python3-django_4.2.17.bb           |   2 +
>  6 files changed, 326 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
> new file mode 100644
> index 0000000000..d1c3767069
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2025-26699.patch
> @@ -0,0 +1,107 @@
> +From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
> +From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> +Date: Tue, 25 Feb 2025 09:40:54 +0100
> +Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
> + template filter.
> +
> +Thanks sw0rd1ight for the report.
> +
> +Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
> +
> +CVE: CVE-2025-26699
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
> +
> +Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>

Please do not add other people's sign off without their explicit
permission. If the author didn't include it in the original patch, then
it should go without it. Your sign off is enough.

> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/utils/text.py                          | 28 ++++++++-----------
> + docs/releases/2.2.28.txt                      |  6 ++++
> + .../filter_tests/test_wordwrap.py             | 12 ++++++++
> + 3 files changed, 29 insertions(+), 17 deletions(-)
> +
> +diff --git a/django/utils/text.py b/django/utils/text.py
> +index 2c4040e..c474d56 100644
> +--- a/django/utils/text.py
> ++++ b/django/utils/text.py
> +@@ -1,5 +1,6 @@
> + import html.entities
> + import re
> ++import textwrap
> + import unicodedata
> + from gzip import GzipFile
> + from io import BytesIO
> +@@ -88,23 +89,16 @@ def wrap(text, width):
> +     Don't wrap long words, thus the output text may have lines longer than
> +     ``width``.
> +     """
> +-    def _generator():
> +-        for line in text.splitlines(True):  # True keeps trailing linebreaks
> +-            max_width = min((line.endswith('\n') and width + 1 or width), width)
> +-            while len(line) > max_width:
> +-                space = line[:max_width + 1].rfind(' ') + 1
> +-                if space == 0:
> +-                    space = line.find(' ') + 1
> +-                    if space == 0:
> +-                        yield line
> +-                        line = ''
> +-                        break
> +-                yield '%s\n' % line[:space - 1]
> +-                line = line[space:]
> +-                max_width = min((line.endswith('\n') and width + 1 or width), width)
> +-            if line:
> +-                yield line
> +-    return ''.join(_generator())
> ++
> ++    wrapper = textwrap.TextWrapper(
> ++        width=width,
> ++        break_long_words=False,
> ++        break_on_hyphens=False,
> ++    )
> ++    result = []
> ++    for line in text.splitlines(True):
> ++        result.extend(wrapper.wrap(line))
> ++    return "\n".join(result)
> +
> +
> + class Truncator(SimpleLazyObject):
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
> +index 8f79fd0..63877eb 100644
> +--- a/docs/releases/2.2.28.txt
> ++++ b/docs/releases/2.2.28.txt
> +@@ -6,6 +6,12 @@ Django 2.2.28 release notes
> +
> + Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
> +
> ++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
> ++=========================================================================================
> ++
> ++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
> ++potential denial-of-service attack when used with very long strings.
> ++
> + CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
> + =========================================================================================================
> +
> +diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
> +index 02f8605..c1c1fe9 100644
> +--- a/tests/template_tests/filter_tests/test_wordwrap.py
> ++++ b/tests/template_tests/filter_tests/test_wordwrap.py
> +@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
> +             ), 14),
> +             'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
> +         )
> ++
> ++    def test_wrap_long_text(self):
> ++        long_text = (
> ++            "this is a long paragraph of text that really needs"
> ++            " to be wrapped I'm afraid " * 20_000
> ++        )
> ++        self.assertIn(
> ++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
> ++            "I'm afraid",
> ++            wordwrap(long_text, 10),
> ++        )
> ++
> +--
> +2.35.5
> diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
> new file mode 100644
> index 0000000000..e9552bbfbc
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2025-26699.patch
> @@ -0,0 +1,105 @@
> +From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
> +From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> +Date: Tue, 25 Feb 2025 09:40:54 +0100
> +Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
> + template filter.
> +
> +Thanks sw0rd1ight for the report.
> +
> +Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
> +
> +CVE: CVE-2025-26699
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
> +
> +Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/utils/text.py                          | 27 +++++++------------
> + docs/releases/3.2.23.txt                      |  7 +++++
> + .../filter_tests/test_wordwrap.py             | 12 +++++++++
> + 3 files changed, 29 insertions(+), 17 deletions(-)
> +
> +diff --git a/django/utils/text.py b/django/utils/text.py
> +index 88da9a2..cabd76f 100644
> +--- a/django/utils/text.py
> ++++ b/django/utils/text.py
> +@@ -1,5 +1,6 @@
> + import html.entities
> + import re
> ++import textwrap
> + import unicodedata
> + import warnings
> + from gzip import GzipFile
> +@@ -91,23 +92,15 @@ def wrap(text, width):
> +     Don't wrap long words, thus the output text may have lines longer than
> +     ``width``.
> +     """
> +-    def _generator():
> +-        for line in text.splitlines(True):  # True keeps trailing linebreaks
> +-            max_width = min((line.endswith('\n') and width + 1 or width), width)
> +-            while len(line) > max_width:
> +-                space = line[:max_width + 1].rfind(' ') + 1
> +-                if space == 0:
> +-                    space = line.find(' ') + 1
> +-                    if space == 0:
> +-                        yield line
> +-                        line = ''
> +-                        break
> +-                yield '%s\n' % line[:space - 1]
> +-                line = line[space:]
> +-                max_width = min((line.endswith('\n') and width + 1 or width), width)
> +-            if line:
> +-                yield line
> +-    return ''.join(_generator())
> ++    wrapper = textwrap.TextWrapper(
> ++        width=width,
> ++        break_long_words=False,
> ++        break_on_hyphens=False,
> ++    )
> ++    result = []
> ++    for line in text.splitlines(True):
> ++        result.extend(wrapper.wrap(line))
> ++    return "\n".join(result)
> + 
> + 
> + class Truncator(SimpleLazyObject):
> +diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
> +index dd9d68a..da75eca 100644
> +--- a/docs/releases/3.2.23.txt
> ++++ b/docs/releases/3.2.23.txt
> +@@ -25,3 +25,10 @@ CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils
> + :tfilter:`truncatewords_html` template filter were subject to a potential
> + regular expression denial-of-service attack using a suitably crafted string
> + (follow up to :cve:`2019-14232` and :cve:`2023-43665`).
> ++
> ++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
> ++=========================================================================================
> ++
> ++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
> ++potential denial-of-service attack when used with very long strings.
> ++
> +diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
> +index 02f8605..e6f2afb 100644
> +--- a/tests/template_tests/filter_tests/test_wordwrap.py
> ++++ b/tests/template_tests/filter_tests/test_wordwrap.py
> +@@ -51,3 +51,15 @@ class FunctionTests(SimpleTestCase):
> +             ), 14),
> +             'this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\nI\'m afraid',
> +         )
> ++
> ++    def test_wrap_long_text(self):
> ++        long_text = (
> ++            "this is a long paragraph of text that really needs"
> ++            " to be wrapped I'm afraid " * 20_000
> ++        )
> ++        self.assertIn(
> ++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
> ++            "I'm afraid",
> ++            wordwrap(long_text, 10),
> ++        )
> ++
> +-- 
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch
> new file mode 100644
> index 0000000000..6a4e32bd27
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-4.2.17/CVE-2025-26699.patch
> @@ -0,0 +1,107 @@
> +From e88f7376fe68dbf4ebaf11fad1513ce700b45860 Mon Sep 17 00:00:00 2001
> +From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> +Date: Tue, 25 Feb 2025 09:40:54 +0100
> +Subject: [PATCH] Fixed CVE-2025-26699 -- Mitigated potential DoS in wordwrap
> + template filter.
> +
> +Thanks sw0rd1ight for the report.
> +
> +Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
> +
> +CVE: CVE-2025-26699
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/e88f7376fe68dbf4ebaf11fad1513ce700b45860
> +
> +Signed-off-by: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/utils/text.py                          | 28 +++++++------------
> + docs/releases/4.2.17.txt                      |  8 ++++++
> + .../filter_tests/test_wordwrap.py             | 11 ++++++++
> + 3 files changed, 29 insertions(+), 18 deletions(-)
> +
> +diff --git a/django/utils/text.py b/django/utils/text.py
> +index e1b835e..81ae88d 100644
> +--- a/django/utils/text.py
> ++++ b/django/utils/text.py
> +@@ -1,6 +1,7 @@
> + import gzip
> + import re
> + import secrets
> ++import textwrap
> + import unicodedata
> + from gzip import GzipFile
> + from gzip import compress as gzip_compress
> +@@ -97,24 +98,15 @@ def wrap(text, width):
> +     ``width``.
> +     """
> + 
> +-    def _generator():
> +-        for line in text.splitlines(True):  # True keeps trailing linebreaks
> +-            max_width = min((line.endswith("\n") and width + 1 or width), width)
> +-            while len(line) > max_width:
> +-                space = line[: max_width + 1].rfind(" ") + 1
> +-                if space == 0:
> +-                    space = line.find(" ") + 1
> +-                    if space == 0:
> +-                        yield line
> +-                        line = ""
> +-                        break
> +-                yield "%s\n" % line[: space - 1]
> +-                line = line[space:]
> +-                max_width = min((line.endswith("\n") and width + 1 or width), width)
> +-            if line:
> +-                yield line
> +-
> +-    return "".join(_generator())
> ++    wrapper = textwrap.TextWrapper(
> ++        width=width,
> ++        break_long_words=False,
> ++        break_on_hyphens=False,
> ++    )
> ++    result = []
> ++    for line in text.splitlines(True):
> ++        result.extend(wrapper.wrap(line))
> ++    return "\n".join(result)
> + 
> + 
> + class Truncator(SimpleLazyObject):
> +diff --git a/docs/releases/4.2.17.txt b/docs/releases/4.2.17.txt
> +index 9a6aee3..0475a96 100644
> +--- a/docs/releases/4.2.17.txt
> ++++ b/docs/releases/4.2.17.txt
> +@@ -31,3 +31,11 @@ was subject to SQL injection if untrusted data was used as a ``lhs`` value.
> + 
> + Applications that use the :lookup:`has_key <jsonfield.has_key>` lookup through
> + the ``__`` syntax are unaffected.
> ++
> ++
> ++CVE-2025-26699: Potential denial-of-service vulnerability in ``django.utils.text.wrap()``
> ++=========================================================================================
> ++
> ++The ``wrap()`` and :tfilter:`wordwrap` template filter were subject to a
> ++potential denial-of-service attack when used with very long strings.
> ++
> +diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
> +index 88fbd27..4afa1dd 100644
> +--- a/tests/template_tests/filter_tests/test_wordwrap.py
> ++++ b/tests/template_tests/filter_tests/test_wordwrap.py
> +@@ -78,3 +78,14 @@ class FunctionTests(SimpleTestCase):
> +             "this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\n"
> +             "I'm afraid",
> +         )
> ++
> ++    def test_wrap_long_text(self):
> ++        long_text = (
> ++            "this is a long paragraph of text that really needs"
> ++            " to be wrapped I'm afraid " * 20_000
> ++        )
> ++        self.assertIn(
> ++            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
> ++            "I'm afraid",
> ++            wordwrap(long_text, 10),
> ++        )
> +-- 
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> index f394397453..24eee95f03 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> @@ -25,6 +25,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
>              file://CVE-2024-45231.patch \
>              file://CVE-2024-53907.patch \
>              file://CVE-2024-27351.patch \
> +            file://CVE-2025-26699.patch \
>             "
>  
>  SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> index e049b6552c..92a3886cbc 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> @@ -6,7 +6,10 @@ SRC_URI[sha256sum] = "82968f3640e29ef4a773af2c28448f5f7a08d001c6ac05b32d02aeee65
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>  "
> -SRC_URI += "file://CVE-2024-27351.patch"
> +SRC_URI += "\
> +	file://CVE-2024-27351.patch \
> +	file://CVE-2025-26699.patch \
> +"
>  
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 3.x branch, 
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> index dfce4b85c2..c2b517a441 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.17.bb
> @@ -7,6 +7,8 @@ RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>  "
>  
> +SRC_URI += "file://CVE-2025-26699.patch"
> +
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 4.x branch, 
>  # PREFERRED_VERSION_python3-django = "4.2.17" can be added to local.conf
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121752): https://lists.openembedded.org/g/openembedded-devel/message/121752
> Mute This Topic: https://lists.openembedded.org/mt/116332353/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


