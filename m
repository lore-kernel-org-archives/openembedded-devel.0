Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A947CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 20:03:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.4196.1761163428462762751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 13:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eRRubWbb;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so30880f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761163427; x=1761768227; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n27uydBZfYkW95tsjVN9epObn3IXsVODHdquLdqrxfw=;
        b=eRRubWbbcNlquuHJrpiRY7mCW2Fb93D9dsXI0jdgTUbWS1iJF9zlh5BEprUUL2GPcg
         jA2aSqF9UNujt8oT5eP4fxnDbgHNleuQ4K0BC0vU9OsRCRp2XC8WcMSyc6oIlhi++qBo
         oMD21JKXYhKgIToTJy+CG3wuzs5QpLD8riZaOMfXbwoB4w2PDpW/bRGomQYZSDsa6F6f
         XmPUqV27d2E96TcrD1gYZAkUSSX6zNEqC0lGG6dfZMYnACm4kXDCd7O27Acj8Gbf4Lfn
         CPJa349s5UGZwtSu8wF2KUH1vYXORehWPwsgDY0SxktJUCZBTIgpw5K/G4kfVIY10idH
         gJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761163427; x=1761768227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n27uydBZfYkW95tsjVN9epObn3IXsVODHdquLdqrxfw=;
        b=xCTAVZmhGLMP6MmkiGIF5deicO7OHxJsyMTDQiHgb1bicOPrEMuavnuJt6QanLBaz0
         oTcdd9Pj7kNSU3ffZZOYY5YysafxdqyMzD2dJWWJ0KoFbVUAUrEMVB5EPUG55Z8GB57/
         2hBn4A4jnt6FvImUYFH0JO+f3Y4m0PNeJ+Lr4g1SL7T2N1J1Rg2tf666xmE/yS8ewMyG
         YvMop9iymH4qT9kmqa6gA+uPDTpMJM5u0p70eD9axBXML003AG1T1ZirLC7UuUr/IHb7
         NORQRXBCfcuEiCpOwdU3ocu2wR8dUx0tR9OB1Oei9o7IvDjgANt+erNiYuX6Bw4q6llV
         u2Uw==
X-Gm-Message-State: AOJu0Yyn68sD5a/vuCHttbdCfeV+ZwnMWAYa8530Xq0dDXOp0PArsIax
	MDFw9enUnxjxpUVVfhmhcKBdVyEY8ifs6I4W2r4x27TZgaIR9WpjCzC+
X-Gm-Gg: ASbGncsxVebjaoSz/F7si1YrX/ULTGVyeuw6e9Iuh5tU6adfJvmz8jg0ExSvgQgtQDh
	5dkXkLtmOoxhjvlFdw+l56FB44TZONQ6sB7wfKNlXoZ2MW5iv9dchdMU/aojGZIpzLVFvGv73TF
	EZWyV+HPzrLV3s+ZCXVssXR7bZAW4042AQ5bDu+2nI0zPjDSzpKy/khHMleKXWRusJEJZMP7Hpz
	pda2p/+jB9M4tOGnOZVvzumFDu+ydafOeykdBmgr+3WGLmGnxSw8k7wNeoJaaJIcftbsSS7pOHt
	QvgRPGl8YXEBGOB6LmvI0J2JP3RUsP6EU7jo9KWVFXZbJWsOE6OMI6GMlgF+VNR+XSjNu7mNL4z
	Pq3jsPhSE8wSRXKC2F20sHS/UcHbhAWJl/vh/an/Ga3h1gBlQOmnVPpfnCTIMNdgzM/Kjc2WNvn
	hvBjVSIqFa
X-Google-Smtp-Source: AGHT+IEg0+QTvFvlX2lRzi6Tf/7BrXN/nNh2mb0V62y1gH9c/DUjER5ojG06iJIR32Mq+F6c+N5LMw==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id ffacd0b85a97d-4283f7cbeefmr11932464f8f.29.1761163426551;
        Wed, 22 Oct 2025 13:03:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ee8a9sm124406f8f.46.2025.10.22.13.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 13:03:45 -0700 (PDT)
Message-ID: <3b5a0316-c9b5-43cd-b25c-6640481b3e24@gmail.com>
Date: Wed, 22 Oct 2025 22:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-python][scarthgap][PATCH 2/8] python3-django: patch
 CVE-2025-26699
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
 <20251022061803.887676-2-ankur.tyagi85@gmail.com>
 <e890a1cc-ce4d-4e65-8327-123db3370b6e@gmail.com>
 <CADySD0FK1-8BYFCXZZTD1g7k6NpTGm_Bvhnw=0f5sdpix0q_rg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CADySD0FK1-8BYFCXZZTD1g7k6NpTGm_Bvhnw=0f5sdpix0q_rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120899



On 10/22/25 21:53, Ankur Tyagi wrote:
> On Wed, Oct 22, 2025 at 10:48 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> The patch looks correct and necessary to me, but I find the commit
>> subject and the CVE tag in the patch somewhat misleading. The CVE is
>> patched in 4.2.20, this patch is a fix for a regression that was caused
>> by the fix, but otherwise not related to the CVE.
>>
>> I think the patch should just come as it is, with and explanation of
>> what is it, but without referring to it as a CVE fix.
>>
> Good point, I'll submit v2 soon.
>
> Should I do similar for the following patches from [patch 4/8] as well?
>  - CVE-2025-48432-1.patch
>  - CVE-2025-48432-2.patch
>  - CVE-2025-48432-4.patch
> Because they are not the CVE fix but needed to apply CVE fix cleanly.

Personally I wouldn't bother with that - if you want to be pedantic,
then you can do the same, but since they are pre-reqs for the actual
fix, I can also argue for keeping the CVE tag in all.

>
> cheers
> Ankur
>
>> On 10/22/25 08:17, Ankur Tyagi via lists.openembedded.org wrote:
>>> This fixes a regression in Django 4.2.20, introduced when fixing CVE-2025-26699
>>>
>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>> ---
>>>  .../CVE-2025-26699.patch                      | 102 ++++++++++++++++++
>>>  .../python/python3-django_4.2.20.bb           |   4 +
>>>  2 files changed, 106 insertions(+)
>>>  create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch
>>> new file mode 100644
>>> index 0000000000..54a43b123d
>>> --- /dev/null
>>> +++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-26699.patch
>>> @@ -0,0 +1,102 @@
>>> +From 3407ea136bd619591d259221d8712b72b3f3b9a0 Mon Sep 17 00:00:00 2001
>>> +From: Matti Pohjanvirta <matti.pohjanvirta@iki.fi>
>>> +Date: Sun, 20 Apr 2025 18:22:51 +0300
>>> +Subject: [PATCH] [4.2.x] Fixed #36341 -- Preserved whitespaces in wordwrap
>>> + template filter.
>>> +
>>> +Regression in 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b.
>>> +
>>> +This work improves the django.utils.text.wrap() function to ensure that
>>> +empty lines and lines with whitespace only are kept instead of being
>>> +dropped.
>>> +
>>> +Thanks Matti Pohjanvirta for the report and fix.
>>> +
>>> +Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
>>> +
>>> +Backport of 1e9db35836d42a3c72f3d1015c2f302eb6fee046 from main.
>>> +
>>> +CVE: CVE-2025-26699
>>> +Upstream-Status: Backport [https://github.com/django/django/commit/e61e3daaf037507211028494d61f24382be31e5a]
>>> +(cherry picked from commit e61e3daaf037507211028494d61f24382be31e5a)
>>> +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>> +---
>>> + django/utils/text.py                          | 13 +++++-
>>> + .../filter_tests/test_wordwrap.py             | 41 +++++++++++++++++++
>>> + 2 files changed, 52 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/django/utils/text.py b/django/utils/text.py
>>> +index 81ae88dc76..b018f2601f 100644
>>> +--- a/django/utils/text.py
>>> ++++ b/django/utils/text.py
>>> +@@ -102,10 +102,19 @@ def wrap(text, width):
>>> +         width=width,
>>> +         break_long_words=False,
>>> +         break_on_hyphens=False,
>>> ++        replace_whitespace=False,
>>> +     )
>>> +     result = []
>>> +-    for line in text.splitlines(True):
>>> +-        result.extend(wrapper.wrap(line))
>>> ++    for line in text.splitlines():
>>> ++        wrapped = wrapper.wrap(line)
>>> ++        if not wrapped:
>>> ++            # If `line` contains only whitespaces that are dropped, restore it.
>>> ++            result.append(line)
>>> ++        else:
>>> ++            result.extend(wrapped)
>>> ++    if text.endswith("\n"):
>>> ++        # If `text` ends with a newline, preserve it.
>>> ++        result.append("")
>>> +     return "\n".join(result)
>>> +
>>> +
>>> +diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
>>> +index 4afa1dd234..1692332e1e 100644
>>> +--- a/tests/template_tests/filter_tests/test_wordwrap.py
>>> ++++ b/tests/template_tests/filter_tests/test_wordwrap.py
>>> +@@ -89,3 +89,44 @@ class FunctionTests(SimpleTestCase):
>>> +             "I'm afraid",
>>> +             wordwrap(long_text, 10),
>>> +         )
>>> ++
>>> ++    def test_wrap_preserve_newlines(self):
>>> ++        cases = [
>>> ++            (
>>> ++                "this is a long paragraph of text that really needs to be wrapped\n\n"
>>> ++                "that is followed by another paragraph separated by an empty line\n",
>>> ++                "this is a long paragraph of\ntext that really needs to be\nwrapped\n\n"
>>> ++                "that is followed by another\nparagraph separated by an\nempty line\n",
>>> ++                30,
>>> ++            ),
>>> ++            ("\n\n\n", "\n\n\n", 5),
>>> ++            ("\n\n\n\n\n\n", "\n\n\n\n\n\n", 5),
>>> ++        ]
>>> ++        for text, expected, width in cases:
>>> ++            with self.subTest(text=text):
>>> ++                self.assertEqual(wordwrap(text, width), expected)
>>> ++
>>> ++    def test_wrap_preserve_whitespace(self):
>>> ++        width = 5
>>> ++        width_spaces = " " * width
>>> ++        cases = [
>>> ++            (
>>> ++                f"first line\n{width_spaces}\nsecond line",
>>> ++                f"first\nline\n{width_spaces}\nsecond\nline",
>>> ++            ),
>>> ++            (
>>> ++                "first line\n \t\t\t \nsecond line",
>>> ++                "first\nline\n \t\t\t \nsecond\nline",
>>> ++            ),
>>> ++            (
>>> ++                f"first line\n{width_spaces}\nsecond line\n\nthird{width_spaces}\n",
>>> ++                f"first\nline\n{width_spaces}\nsecond\nline\n\nthird\n",
>>> ++            ),
>>> ++            (
>>> ++                f"first line\n{width_spaces}{width_spaces}\nsecond line",
>>> ++                f"first\nline\n{width_spaces}{width_spaces}\nsecond\nline",
>>> ++            ),
>>> ++        ]
>>> ++        for text, expected in cases:
>>> ++            with self.subTest(text=text):
>>> ++                self.assertEqual(wordwrap(text, width), expected)
>>> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
>>> index 3fb8b03224..0b9ff1b8c0 100644
>>> --- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
>>> @@ -1,6 +1,10 @@
>>>  require python-django.inc
>>>  inherit setuptools3
>>>
>>> +SRC_URI += " \
>>> +    file://CVE-2025-26699.patch \
>>> +"
>>> +
>>>  SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
>>>
>>>  RDEPENDS:${PN} += "\
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#120885): https://lists.openembedded.org/g/openembedded-devel/message/120885
>>> Mute This Topic: https://lists.openembedded.org/mt/115888203/6084445
>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


