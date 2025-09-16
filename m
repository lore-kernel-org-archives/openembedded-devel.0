Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F052FCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:16:32 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.15109.1758014190187558637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QbG7VjPB;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b0415e03e25so660077566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 02:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758014188; x=1758618988; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqaOb7m2VlpaVJqph2530m3On3ZmRUW4ch6F1VD4RtA=;
        b=QbG7VjPB0OQ+iNTSvPalt2Q9ThcPXJtDVwfYf+JE0S90hU/Ea0EYNtp+rV6f/ltAtx
         PGl/ghP1uqX33Whp4qwWkmutsitr66WFIBrWI4cYe8rOY79ZJKSmEcKut9vJYaedsZ/1
         8Kk3EepQVNwS1qiGr2/UTlm0nAKBweO02K7ELT+Dh6NH4eEJ8lasP9SvXnrvoy7z+LcC
         vSwhbYP1hf3hSAJATDe5YeH1fwX9zaWZzk90QmLskUFu8RD73+CAtOuAzXM34Hz4zEfG
         vSqcEwEO9OTnYgRnsBPpN6PEOmEIrQIgCLyDDmhS2MW6cNV2expJO2vBH/7TuFrd6sE4
         TWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758014188; x=1758618988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqaOb7m2VlpaVJqph2530m3On3ZmRUW4ch6F1VD4RtA=;
        b=p4ef2psQBr1rq5q6JgqgJ0MCrKa1UUH2tVjfEW07dy+UtH5F5Q5K4JmhAVB5nmcNj0
         fzLVgTpfn19bTYMJ5SKJEhNb6lhB535DoPaOLqX+bN2MwAMxZhEr8xkaarvwNiHNYoZJ
         91U2dOWr5yiXTMrCZXiLkC24yCdKhCa3Bx1YpDmxs3Shkcs+Zs3HjYMKSF7/6RwzbIHl
         g7sCVTAruCXErkzLMFQjRNadf17L2QQ2JuOGE/D3/MI4XDJPetWt+S9Fq6cA+NocL2FF
         Kl5GnWF+LyGGtwKgT4VKDl92h/QTv/ynQ+lXl8thjucKw5S1zTFgn7OsRkDgyqtSals5
         3RUg==
X-Gm-Message-State: AOJu0YzvFxLUdwES01mHDkn9toVK5s1SBbTHKWCRXl3ns8uI2laiegFw
	rqAhhxhMSfSAAC59sDniLR81ZVgluLueJWuTHFc5Rczfo9G2HqIqXShS
X-Gm-Gg: ASbGnctA24/6zWDoYDpwFvKWhz5mKNqDCFbccMBtYbwalg95hLddmrzA0nEWPaTT2Sy
	1dqJYyfQYZDao4eUVgeDyHt25gxpaGgLqg1ZZ2HBffG2X/9o2pQULKZSbj4V/kGcOUzHB6jE7yf
	G2C2FSspmn0yUmDJ8vtlT8KmBeP4Y1T+1CJFbDwXb8C4keHIWkq0nYyQ4YXsieJl5PTsJNSYQRb
	p9A9wd/PBVrfcPC9mHSxxTVpFyRXCdBShbIPK+A2KXSrSXoThXt9oeOEVoYOvgV9fBTM/vrfwf5
	dQZYikrSA44VchKT0vr/Bd6eyST6/vMVA6OjDlX4kxVs2dThSITeVYVzSiE4PgL8Z9tVg3cBNVh
	RxkUzm69lPGkVjte48x4YPM5WYmkoYUAT8IsHeEuXiQ==
X-Google-Smtp-Source: AGHT+IH4mP1F1L0soEq/tX2+CPn98rxV5tCnyB5I097qPceRUjfkJJLUNR1VDNy+A5pr0B6b3XJ+sw==
X-Received: by 2002:a17:906:2493:b0:b04:9822:1ab4 with SMTP id a640c23a62f3a-b07c35fb2e4mr1413882466b.27.1758014188023;
        Tue, 16 Sep 2025 02:16:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da327sm1129371366b.11.2025.09.16.02.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 02:16:27 -0700 (PDT)
Message-ID: <754e2c0a-dc81-4255-b8c0-447c8b350dfd@gmail.com>
Date: Tue, 16 Sep 2025 11:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
To: peter.marko@siemens.com, jan vermaete <jan.vermaete@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20250904221139.3131569-1-peter.marko@siemens.com>
 <20250904221139.3131569-9-peter.marko@siemens.com>
 <CABF_=yi6KqviCqT4MFTKwbLFuBSCNjB0g+ucy+HvvYM0Xp36qw@mail.gmail.com>
 <AS1PR10MB5697405DE0AFC728BBE605BFFD15A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697405DE0AFC728BBE605BFFD15A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119422

On 9/15/25 12:53, Peter Marko via lists.openembedded.org wrote:
>> -----Original Message-----
>> From: jan vermaete <jan.vermaete@gmail.com>
>> Sent: Saturday, September 6, 2025 19:22
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>> Cc: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH 09/10] utf8proc: add new recipe with ptest
>>
>> If I'm not mistaken the usage of a tag in the fetcher does require
>> network access.
>> What's not always the case.
>> This does break the parsing by bitbake when no network/Internet is available.
> Hello, that is true for older releases.
> In master, using tag is possible and even encouraged/required to validate that the hash belongs to a tag.
>

Yes, but this patch seems to be missing a revision also, in which case
the old behavior stays.

> Peter
>
>> On Fri, Sep 5, 2025 at 12:13 AM Peter Marko via lists.openembedded.org
>> <peter.marko=siemens.com@lists.openembedded.org> wrote:
>>> From: Peter Marko <peter.marko@siemens.com>
>>>
>>> It is needed for poco 1.14+
>>> Ptest runs for less than a second.
>>>
>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>> ---
>>>  .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>>  .../utf8proc/utf8proc/run-ptest               | 15 +++++++++
>>>  .../utf8proc/utf8proc_2.10.0.bb               | 33 +++++++++++++++++++
>>>  3 files changed, 49 insertions(+)
>>>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>>>  create mode 100644 meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>>>
>>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-
>> oe/conf/include/ptest-packagelists-meta-oe.inc
>>> index d77b97d576..18324ff0d3 100644
>>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>> @@ -44,6 +44,7 @@ PTESTS_FAST_META_OE = "\
>>>      pv \
>>>      sdbus-c++ \
>>>      tomlplusplus \
>>> +    utf8proc \
>>>      uthash \
>>>      xmlsec1 \
>>>      zeromq \
>>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest b/meta-
>> oe/recipes-support/utf8proc/utf8proc/run-ptest
>>> new file mode 100644
>>> index 0000000000..349e496d68
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc/run-ptest
>>> @@ -0,0 +1,15 @@
>>> +#!/bin/sh
>>> +
>>> +execute_test() {
>>> +    eval "./$1" && echo "PASS: $1" || echo "FAIL: $1"
>>> +}
>>> +
>>> +execute_test "case"
>>> +execute_test "custom"
>>> +execute_test "iterate"
>>> +execute_test "misc"
>>> +execute_test "printproperty"
>>> +execute_test "valid"
>>> +execute_test "charwidth"
>>> +execute_test "graphemetest data/GraphemeBreakTest.txt"
>>> +execute_test "normtest data/NormalizationTest.txt"
>>> diff --git a/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb b/meta-
>> oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>>> new file mode 100644
>>> index 0000000000..e42d16b8b7
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-support/utf8proc/utf8proc_2.10.0.bb
>>> @@ -0,0 +1,33 @@
>>> +SUMMARY = "library that provides operations for data in the UTF-8 encoding"
>>> +DESCRIPTION = "utf8proc is a small, clean C library that provides Unicode \
>>> +normalization, case-folding, and other operations for data in the UTF-8 \
>>> +encoding, supporting Unicode version 16.0"
>>> +HOMEPAGE = "https://juliastrings.github.io/utf8proc/"
>>> +SECTION = "libs"
>>> +
>>> +LICENSE = "MIT & Unicode-3.0"
>>> +LIC_FILES_CHKSUM =
>> "file://LICENSE.md;md5=96d5a3ba306e0f24fb289427af484408"
>>> +
>>> +SRC_URI = "\
>>> +
>> git://github.com/JuliaStrings/utf8proc;protocol=https;branch=master;tag=v${PV} \
>>> +    file://run-ptest \
>>> +"
>>> +
>>> +inherit cmake ptest
>>> +
>>> +EXTRA_OECMAKE = "\
>>> +    -DBUILD_SHARED_LIBS=ON \
>>> +    ${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=ON -
>> DUTF8PROC_ENABLE_TESTING=ON ', '', d)} \
>>> +"
>>> +
>>> +do_install_ptest() {
>>> +    # this list and run-ptest needs to be updated on upgrade (the project uses
>> add_test feature)
>>> +    for t in "case" custom iterate misc printproperty valid charwidth
>> graphemetest normtest; do
>>> +        install -m 0755 ${B}/$t ${D}${PTEST_PATH}/
>>> +    done
>>> +    install -d ${D}${PTEST_PATH}/data
>>> +    install -m 0644 ${B}/data/GraphemeBreakTest.txt
>> ${D}${PTEST_PATH}/data/
>>> +    install -m 0644 ${B}/data/NormalizationTest.txt ${D}${PTEST_PATH}/data/
>>> +}
>>> +
>>> +BBCLASSEXTEND = "native"
>>>
>>>
>>>
>>
>> --
>> Jan Vermaete
>> “Success is a self-correcting phenomenom.” -- Gary Hamel
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119405): https://lists.openembedded.org/g/openembedded-devel/message/119405
>> Mute This Topic: https://lists.openembedded.org/mt/115073156/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


