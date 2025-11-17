Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BC8CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:16:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4904.1763367382729674786
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 00:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdHIyX6X;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae77516so44821965e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 00:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763367381; x=1763972181; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/XxaUfLdKuyeZCzAYZXQphheoQBqZGx6czLNgdJNjM=;
        b=HdHIyX6XCjLrZF+EW2qhlO0SVEA98Q9jbDAn9cizYzeAlG6n8hny/lSTq9t8RKW14g
         AyFA/rzwrdrzdGyVM6ugBhEQgtA8PmjBpHx9mIFsgoBpvKFG0xmmUYNgO918+uaD6lHV
         Aqti7Tk3Z5n0xdN8P+qizJcOsdXted7e8+CiAuuwYd0GUL2DH7RPis++h/xy4Qpfvyje
         qMO/w3SYADhXvXhJ+qfzfPm/VjHdj8DXo1wNvzZ0LSKld+/Wwr+EhL4LYevjr/44VUVi
         XJnSTMJB/yTvPt3JqUQuaVQFhZTJ5UuHW578MorHh05MAG/YfwsuFSpzcoB4vTGZGdjv
         zPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763367381; x=1763972181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/XxaUfLdKuyeZCzAYZXQphheoQBqZGx6czLNgdJNjM=;
        b=VtKK/NMRQQiyS/Qo00Dy0bkoMJuPz28+x39d3YuOm5an0So+9ZOjcxnp3UljvG2ccB
         nvUsxd01QKKdBwJGH/U54MR3ey4shYhj06jVX9pCHaYbXt0JzpFRM0X1Nn5IJuXgP3SD
         br8HndXSathsw/A9h4LAcOpQo2Supel6WMEltuygjjoRa/Pq2Nt2oASkZ2MHy/wxKV4c
         6f5SxEZm48FuRl32JWOXvWz6nkhClSP6DC7s/T7M1bt/lr4PnqSWYVcW1iL9zxDSAAVm
         lBGsNGTgOH2gwl1IxLrU+gB8QBiWxoo8hYNuJbxkfTNa1rLeesDaRZrdTqB825Jpem5l
         ZXaA==
X-Forwarded-Encrypted: i=1; AJvYcCWdxKBPx2jR8abIB7Hkj2Y8RAkhQuPP7C/VrLUg7gAW9s2LeLQYV/biBbAzuuDhz39BA0lb0FXrc2Q8cCOv6BcuOgU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxChKDqfo2nCFvGSGuxjU33SmHwythYcyUqYurpTrLOwQi+K2K1
	Qjs2koOdsH9kQTjd4mkuEY3PViZoYwgm+h9VyHaxqDfhxZgUiQlQYQ4v
X-Gm-Gg: ASbGncugJtt5Csw/rNbETIwMAb7YRGNW7r1iEMpr0tKsmaenXSKhPeozRJ9dTth9oyt
	h6pXh+A1DO6DL0t9c9w/VC4lp7fvleqk/vVxinQYXz0/iWBv0l674f3dELMOczSEFWdRdEPPa4Z
	L1C245/uNKyzMi17BRCL0jNSS0lf8v07BMG4KKpKS/hrkGKk9G/f8oPNGvp/ogWP5mdgXQp2EvV
	W3MbDatmEr+J4xcu/Rgaz79TI8q+46Ph5pV5sn3Cu7VtFrJsNLx7GJiYcsnQl0Wno7WgsZb6bpO
	jaFU+7piRIHGO2e/MCYheenPasmx+/xnrZOBQ2sWycp/Evg2Q+XiwTUJeJ+M0oMV5bDh4vyEnE8
	VDAs7DYGZDclsa3XBRecMwxoafGIqrBbekkcELjUoNOOyj2hY6dA4E19nEcMm37pIb8PbNdgBj1
	HfQkScbfv4DKaJ1DSPMOo=
X-Google-Smtp-Source: AGHT+IEJQnz7clkAA6pdh2ok7ImhEazNa6ypuhkG7fF1Xoeuy+0FdHTtFReojubxFgKVC+yIQBNUOw==
X-Received: by 2002:a05:600c:3512:b0:477:7ab8:ad7 with SMTP id 5b1f17b1804b1-4778fe5ddd2mr113072285e9.9.1763367380719;
        Mon, 17 Nov 2025 00:16:20 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a0f4ff42sm61414405e9.12.2025.11.17.00.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:16:20 -0800 (PST)
Message-ID: <ec309346-e8a9-4996-8e0e-6d5dfb7d4267@gmail.com>
Date: Mon, 17 Nov 2025 09:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2024-27351
To: saravanan.kadambathursubramaniyam@windriver.com,
 openembedded-devel@lists.openembedded.org
References: <20251114120343.4109634-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251114120343.4109634-1-saravanan.kadambathursubramaniyam@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 08:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121763

I think for the 3.2.x recipe it could be just updated to 3.2.25, which
contains this patch (and has some other fixes too).

On 11/14/25 13:03, Kadambathur Subramaniyam, Saravanan via
lists.openembedded.org wrote:
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2024-27351
>
> Upstream-patch:
> https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521
>
> Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> ---
>  .../CVE-2024-27351.patch                      | 149 ++++++++++++++++++
>  .../CVE-2024-27351.patch                      | 145 +++++++++++++++++
>  .../python/python3-django_2.2.28.bb           |   1 +
>  .../python/python3-django_3.2.23.bb           |   1 +
>  4 files changed, 296 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-27351.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-27351.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-27351.patch
> new file mode 100644
> index 0000000000..f240b0852e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.28/CVE-2024-27351.patch
> @@ -0,0 +1,149 @@
> +From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
> +From: Shai Berger <shai@platonix.com>
> +Date: Mon, 19 Feb 2024 13:56:37 +0100
> +Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
> + Truncator.words().
> +
> +Thanks Seokchan Yoon for the report.
> +
> +CVE: CVE-2024-27351
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521
> +
> +Signed-off-by: Shai Berger <shai@platonix.com>
> +Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
> + docs/releases/2.2.28.txt       |  8 +++++
> + tests/utils_tests/test_text.py | 26 ++++++++++++++++
> + 3 files changed, 89 insertions(+), 2 deletions(-)
> +
> +diff --git a/django/utils/text.py b/django/utils/text.py
> +index 06a377b..2c4040e 100644
> +--- a/django/utils/text.py
> ++++ b/django/utils/text.py
> +@@ -15,8 +15,61 @@ def capfirst(x):
> +     return x and str(x)[0].upper() + str(x)[1:]
> +
> +
> +-# Set up regular expressions
> +-re_words = re.compile(r'<[^>]+?>|([^<>\s]+)', re.S)
> ++# ----- Begin security-related performance workaround -----
> ++
> ++# We used to have, below
> ++#
> ++# re_words = _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)
> ++#
> ++# But it was shown that this regex, in the way we use it here, has some
> ++# catastrophic edge-case performance features. Namely, when it is applied to
> ++# text with only open brackets "<<<...". The class below provides the services
> ++# and correct answers for the use cases, but in these edge cases does it much
> ++# faster.
> ++re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
> ++re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
> ++
> ++
> ++class WordsRegex:
> ++    @staticmethod
> ++    def search(text, pos):
> ++        # Look for "<" or a non-tag word.
> ++        partial = re_prt.search(text, pos)
> ++        if partial is None or partial[1] is not None:
> ++            return partial
> ++
> ++        # "<" was found, look for a closing ">".
> ++        end = text.find(">", partial.end(0))
> ++        if end < 0:
> ++            # ">" cannot be found, look for a word.
> ++            return re_notag.search(text, pos + 1)
> ++        else:
> ++            # "<" followed by a ">" was found -- fake a match.
> ++            end += 1
> ++            return FakeMatch(text[partial.start(0): end], end)
> ++
> ++
> ++class FakeMatch:
> ++    __slots__ = ["_text", "_end"]
> ++
> ++    def end(self, group=0):
> ++        assert group == 0, "This specific object takes only group=0"
> ++        return self._end
> ++
> ++    def __getitem__(self, group):
> ++        if group == 1:
> ++            return None
> ++        assert group == 0, "This specific object takes only group in {0,1}"
> ++        return self._text
> ++
> ++    def __init__(self, text, end):
> ++        self._text, self._end = text, end
> ++
> ++
> ++# ----- End security-related performance workaround -----
> ++
> ++# Set up regular expressions.
> ++re_words = WordsRegex
> + re_chars = re.compile(r'<[^>]+?>|(.)', re.S)
> + re_tag = re.compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
> + re_newlines = re.compile(r'\r\n|\r')  # Used in normalize_newlines
> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
> +index c653cb6..8f79fd0 100644
> +--- a/docs/releases/2.2.28.txt
> ++++ b/docs/releases/2.2.28.txt
> +@@ -6,6 +6,14 @@ Django 2.2.28 release notes
> +
> + Django 2.2.28 fixes two security issues with severity "high" in 2.2.27.
> +
> ++CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
> ++=========================================================================================================
> ++
> ++``django.utils.text.Truncator.words()`` method (with ``html=True``) and
> ++:tfilter:`truncatewords_html` template filter were subject to a potential
> ++regular expression denial-of-service attack using a suitably crafted string
> ++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
> ++
> + CVE-2022-28346: Potential SQL injection in ``QuerySet.annotate()``, ``aggregate()``, and ``extra()``
> + ====================================================================================================
> + 
> +diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_text.py
> +index cb3063d..7e9f2b3 100644
> +--- a/tests/utils_tests/test_text.py
> ++++ b/tests/utils_tests/test_text.py
> +@@ -156,6 +156,32 @@ class TestUtilsText(SimpleTestCase):
> +         truncator = text.Truncator('<p>I &lt;3 python, what about you?</p>')
> +         self.assertEqual('<p>I &lt;3 python,…</p>', truncator.words(3, html=True))
> + 
> ++        # Only open brackets.
> ++        test = "<" * 60_000
> ++        truncator = text.Truncator(test)
> ++        self.assertEqual(truncator.words(1, html=True), test)
> ++
> ++        # Tags with special chars in attrs.
> ++        truncator = text.Truncator(
> ++            """<i style="margin: 5%; font: *;">Hello, my dear lady!</i>"""
> ++        )
> ++        self.assertEqual(
> ++            """<i style="margin: 5%; font: *;">Hello, my dear…</i>""",
> ++            truncator.words(3, html=True),
> ++        )
> ++
> ++        # Tags with special non-latin chars in attrs.
> ++        truncator = text.Truncator("""<p data-x="א">Hello, my dear lady!</p>""")
> ++        self.assertEqual(
> ++            """<p data-x="א">Hello, my dear…</p>""",
> ++            truncator.words(3, html=True),
> ++        )
> ++
> ++        # Misplaced brackets.
> ++        truncator = text.Truncator("hello >< world")
> ++        self.assertEqual(truncator.words(1, html=True), "hello…")
> ++        self.assertEqual(truncator.words(2, html=True), "hello >< world")
> ++
> +     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
> +     def test_truncate_words_html_size_limit(self):
> +         max_len = text.Truncator.MAX_LENGTH_HTML
> +-- 
> +2.35.5
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-27351.patch b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-27351.patch
> new file mode 100644
> index 0000000000..1251a41bb5
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-3.2.23/CVE-2024-27351.patch
> @@ -0,0 +1,145 @@
> +From 072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521 Mon Sep 17 00:00:00 2001
> +From: Shai Berger <shai@platonix.com>
> +Date: Mon, 19 Feb 2024 13:56:37 +0100
> +Subject: [PATCH] Fixed CVE-2024-27351 -- Prevented potential ReDoS in
> + Truncator.words().
> +
> +Thanks Seokchan Yoon for the report.
> +
> +CVE: CVE-2024-27351
> +
> +Upstream-Status: Backport
> +https://github.com/django/django/commit/072963e4c4d0b3a7a8c5412bc0c7d27d1a9c3521
> +
> +Signed-off-by: Shai Berger <shai@platonix.com>
> +Co-Authored-By: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
> +---
> + django/utils/text.py           | 57 ++++++++++++++++++++++++++++++++--
> + docs/releases/3.2.23.txt       |  8 +++++
> + tests/utils_tests/test_text.py | 26 ++++++++++++++++
> + 3 files changed, 89 insertions(+), 2 deletions(-)
> +
> +diff --git a/django/utils/text.py b/django/utils/text.py
> +index 83e258f..88da9a2 100644
> +--- a/django/utils/text.py
> ++++ b/django/utils/text.py
> +@@ -18,8 +18,61 @@ def capfirst(x):
> +     return x and str(x)[0].upper() + str(x)[1:]
> +
> +
> +-# Set up regular expressions
> +-re_words = _lazy_re_compile(r'<[^>]+?>|([^<>\s]+)', re.S)
> ++# ----- Begin security-related performance workaround -----
> ++
> ++# We used to have, below
> ++#
> ++# re_words = _lazy_re_compile(r"<[^>]+?>|([^<>\s]+)", re.S)
> ++#
> ++# But it was shown that this regex, in the way we use it here, has some
> ++# catastrophic edge-case performance features. Namely, when it is applied to
> ++# text with only open brackets "<<<...". The class below provides the services
> ++# and correct answers for the use cases, but in these edge cases does it much
> ++# faster.
> ++re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
> ++re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
> ++
> ++
> ++class WordsRegex:
> ++    @staticmethod
> ++    def search(text, pos):
> ++        # Look for "<" or a non-tag word.
> ++        partial = re_prt.search(text, pos)
> ++        if partial is None or partial[1] is not None:
> ++            return partial
> ++
> ++        # "<" was found, look for a closing ">".
> ++        end = text.find(">", partial.end(0))
> ++        if end < 0:
> ++            # ">" cannot be found, look for a word.
> ++            return re_notag.search(text, pos + 1)
> ++        else:
> ++            # "<" followed by a ">" was found -- fake a match.
> ++            end += 1
> ++            return FakeMatch(text[partial.start(0): end], end)
> ++
> ++
> ++class FakeMatch:
> ++    __slots__ = ["_text", "_end"]
> ++
> ++    def end(self, group=0):
> ++        assert group == 0, "This specific object takes only group=0"
> ++        return self._end
> ++
> ++    def __getitem__(self, group):
> ++        if group == 1:
> ++            return None
> ++        assert group == 0, "This specific object takes only group in {0,1}"
> ++        return self._text
> ++
> ++    def __init__(self, text, end):
> ++        self._text, self._end = text, end
> ++
> ++
> ++# ----- End security-related performance workaround -----
> ++
> ++# Set up regular expressions.
> ++re_words = WordsRegex
> + re_chars = _lazy_re_compile(r'<[^>]+?>|(.)', re.S)
> + re_tag = _lazy_re_compile(r'<(/)?(\S+?)(?:(\s*/)|\s.*?)?>', re.S)
> + re_newlines = _lazy_re_compile(r'\r\n|\r')  # Used in normalize_newlines
> +diff --git a/docs/releases/3.2.23.txt b/docs/releases/3.2.23.txt
> +index ba23d11..dd9d68a 100644
> +--- a/docs/releases/3.2.23.txt
> ++++ b/docs/releases/3.2.23.txt
> +@@ -17,3 +17,11 @@ large number of Unicode characters.
> + In order to avoid the vulnerability, invalid values longer than
> + ``UsernameField.max_length`` are no longer normalized, since they cannot pass
> + validation anyway.
> ++
> ++CVE-2024-27351: Potential regular expression denial-of-service in ``django.utils.text.Truncator.words()``
> ++=========================================================================================================
> ++
> ++``django.utils.text.Truncator.words()`` method (with ``html=True``) and
> ++:tfilter:`truncatewords_html` template filter were subject to a potential
> ++regular expression denial-of-service attack using a suitably crafted string
> ++(follow up to :cve:`2019-14232` and :cve:`2023-43665`).
> +diff --git a/tests/utils_tests/test_text.py b/tests/utils_tests/test_text.py
> +index 0a6f0bc..758919c 100644
> +--- a/tests/utils_tests/test_text.py
> ++++ b/tests/utils_tests/test_text.py
> +@@ -159,6 +159,32 @@ class TestUtilsText(SimpleTestCase):
> +         truncator = text.Truncator('<p>I &lt;3 python, what about you?</p>')
> +         self.assertEqual('<p>I &lt;3 python,…</p>', truncator.words(3, html=True))
> +
> ++        # Only open brackets.
> ++        test = "<" * 60_000
> ++        truncator = text.Truncator(test)
> ++        self.assertEqual(truncator.words(1, html=True), test)
> ++
> ++        # Tags with special chars in attrs.
> ++        truncator = text.Truncator(
> ++            """<i style="margin: 5%; font: *;">Hello, my dear lady!</i>"""
> ++        )
> ++        self.assertEqual(
> ++            """<i style="margin: 5%; font: *;">Hello, my dear…</i>""",
> ++            truncator.words(3, html=True),
> ++        )
> ++
> ++        # Tags with special non-latin chars in attrs.
> ++        truncator = text.Truncator("""<p data-x="א">Hello, my dear lady!</p>""")
> ++        self.assertEqual(
> ++            """<p data-x="א">Hello, my dear…</p>""",
> ++            truncator.words(3, html=True),
> ++        )
> ++
> ++        # Misplaced brackets.
> ++        truncator = text.Truncator("hello >< world")
> ++        self.assertEqual(truncator.words(1, html=True), "hello…")
> ++        self.assertEqual(truncator.words(2, html=True), "hello >< world")
> ++
> +     @patch("django.utils.text.Truncator.MAX_LENGTH_HTML", 10_000)
> +     def test_truncate_words_html_size_limit(self):
> +         max_len = text.Truncator.MAX_LENGTH_HTML
> +--
> +2.35.5
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> index 0478fd3883..f394397453 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> @@ -24,6 +24,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
>              file://CVE-2024-45230.patch \
>              file://CVE-2024-45231.patch \
>              file://CVE-2024-53907.patch \
> +            file://CVE-2024-27351.patch \
>             "
>  
>  SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> index beecaa607c..e049b6552c 100644
> --- a/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
> @@ -6,6 +6,7 @@ SRC_URI[sha256sum] = "82968f3640e29ef4a773af2c28448f5f7a08d001c6ac05b32d02aeee65
>  RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-sqlparse \
>  "
> +SRC_URI += "file://CVE-2024-27351.patch"
>  
>  # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
>  # default. To build the 3.x branch, 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121707): https://lists.openembedded.org/g/openembedded-devel/message/121707
> Mute This Topic: https://lists.openembedded.org/mt/116290447/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


