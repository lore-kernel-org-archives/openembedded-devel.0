Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.15147.1617364046664909298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Apr 2021 04:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rJ6Xr+Os;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id kt15so7067055ejb.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Apr 2021 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8bBGYmfPtP/yydvuK5leyDuBqTQyXygHk1Z0e7niMGk=;
        b=rJ6Xr+OsXrbXvXt6G5dyidwfOmavVs7hlWyY6yqQXHQQ3DqN4MuJ5iRRnT4qAbSL9I
         LjiHe5AozWPyY8MsKF8kx+8efTC7OTpZ2snf8+uPiBKMDMoGMtRCdsyucwTOc0da8K+q
         NG/Jw4zEy0hLU5BpC/a9qYVMfo9zRYCCGqZ9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8bBGYmfPtP/yydvuK5leyDuBqTQyXygHk1Z0e7niMGk=;
        b=LNTbcp0+eurKtXbHBIF+IOlgyr042LAaWO0p30mKtJ0z9B7+COr0bur1Pvdw+ik8N3
         9E08hVpjQk+QT3eCaghXS3/+8KWNZEhIOKNKPEyVuidFHyC7mCKUav3fr8SoK2Q3Atb1
         ylUnJFFmyFglJrBM2MBPuhgVP5RR1XC6l1wLAPxqXPgsfr4y2/KjZ4LdDV3mklsJK7rY
         mJw3MdBR5S1C/C3SP27DPnS0sU2YZkmGpcMQY1fwZfNSBR4fTEOnhu37EiDMJW4oOslv
         vfPzl9nGht4U5l+VtpjCnCpK8afOWJ8hekn55ZSv41Omms+QExlovy/TR4LFJxwu3aa5
         MYWA==
X-Gm-Message-State: AOAM532A8ji/yS47C8UutROlcNRbCW+qlqZe3vH0rx2YWnUxLevwxpuM
	RqLCCgoR1KT32VJU7KzF/tt7cHnVsZYnig==
X-Google-Smtp-Source: ABdhPJxPIALeBXaUS39b35Ua57qOFKzwnuG4ETqp0Q6Anz28gJqnYRNJj3AyjUe2nhsoSic1DWSriw==
X-Received: by 2002:a17:906:828e:: with SMTP id h14mr13788349ejx.529.1617364044690;
        Fri, 02 Apr 2021 04:47:24 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id cw11sm553483ejc.67.2021.04.02.04.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Apr 2021 04:47:23 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-cryptography: Upgrade 3.3.1 -> 3.4.6
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210401123310.566-1-leon.anavi@konsulko.com>
 <CAMKF1sp8N4stvPNnMKOBcZh94uaGsurKekZLCd4FVWAj=RAiXw@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <4f180757-0c94-1abc-d506-63fb2cf2c96f@konsulko.com>
Date: Fri, 2 Apr 2021 14:47:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp8N4stvPNnMKOBcZh94uaGsurKekZLCd4FVWAj=RAiXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

Thank you for the feedback. I forgot I have the recipe for this 
dependency only locally. I've just submitted it for a review at 
openembedded-core mailing list:

https://lists.openembedded.org/g/openembedded-core/topic/meta_oe_patch/81800474?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,81800474

Thanks,
Leon

On 2.04.21 г. 1:19, Khem Raj wrote:
> it seems to be causing
>
> 00:02:15.567 ERROR: Nothing PROVIDES 'python3-setuptools-rust-native'
> (but /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
> DEPENDS on or otherwise requires it). Close matches:
> 00:02:15.567   python3-setuptools-native
> 00:02:15.567   python3-setuptools-scm
> 00:02:15.567   python3-setuptools-scm-native
> 00:02:16.009 ERROR: Nothing RPROVIDES 'python3-pyopenssl' (but
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-autobahn_21.3.1.bb,
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb,
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-pyopenssl_20.0.1.bb,
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-requests_2.25.1.bb,
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
> RDEPENDS on or otherwise requires it)
>
> On Thu, Apr 1, 2021 at 5:33 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Upgrade to release 3.4.6:
>>
>> - Updated Windows, macOS, and manylinux wheels to be compiled
>>    with OpenSSL 1.1.1j.
>>
>> New versions of python3-cryptography depend on Rust. Temporary,
>> the environment variable CRYPTOGRAPHY_DONT_BUILD_RUST has been set
>> to disable Rust and to avoid dependency on addional layers such
>> as meta-rust. Hopefully, in long-term with the introduction of
>> Rust recipes in newer Yocto releases this will be fixed.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../python/python3-cryptography/h-test.patch  | 23 ++++++++++++++++---
>>   ...3.3.1.bb => python3-cryptography_3.4.6.bb} |  7 +++++-
>>   2 files changed, 26 insertions(+), 4 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.4.6.bb} (84%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
>> index 9f07c7380..0f257a5ed 100644
>> --- a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
>> +++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
>> @@ -1,10 +1,27 @@
>> +From 0707dc0701ea265cbf979d4a10457b29721bcaf7 Mon Sep 17 00:00:00 2001
>> +From: Leon Anavi <leon.anavi@konsulko.com>
>> +Date: Fri, 26 Feb 2021 12:58:22 +0200
>> +Subject: [PATCH] tests/hypothesis/__init__.py: Import pytest
>> +
>> +Import pytest.
>> +
>> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> +---
>> + tests/hypothesis/__init__.py | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/tests/hypothesis/__init__.py b/tests/hypothesis/__init__.py
>> +index b5093362..d4c9b80b 100644
>>   --- a/tests/hypothesis/__init__.py
>>   +++ b/tests/hypothesis/__init__.py
>> -@@ -3,3 +3,7 @@
>> +@@ -1,3 +1,7 @@
>> + # This file is dual licensed under the terms of the Apache License, Version
>> + # 2.0, and the BSD License. See the LICENSE file in the root of this repository
>>    # for complete details.
>> -
>> - from __future__ import absolute_import, division, print_function
>>   +
>>   +import pytest
>>   +hypothesis = pytest.importorskip("hypothesis")
>>   +
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
>> similarity index 84%
>> rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
>> rename to meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
>> index 79a7ac1bf..3978952ed 100644
>> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
>> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
>>
>>   LDSHARED += "-pthread"
>>
>> -SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
>> +SRC_URI[sha256sum] = "2d32223e5b0ee02943f32b19245b61a62db83a882f0e76cc564e1cec60d48f87"
>>
>>   SRC_URI += " \
>>       file://run-ptest \
>> @@ -15,11 +15,16 @@ SRC_URI += " \
>>
>>   inherit pypi setuptools3
>>
>> +# Set the environment variable to disable Rust
>> +export CRYPTOGRAPHY_DONT_BUILD_RUST="1"
>> +
>>   DEPENDS += " \
>>       ${PYTHON_PN}-cffi \
>>       ${PYTHON_PN}-cffi-native \
>>       ${PYTHON_PN}-asn1crypto \
>>       ${PYTHON_PN}-six \
>> +    ${PYTHON_PN}-semantic-version-native \
>> +    ${PYTHON_PN}-setuptools-rust-native \
>>   "
>>
>>   RDEPENDS_${PN} += " \
>> --
>> 2.17.1
>>
>>
>> 
>>
-- 
Leon Anavi
Software Engineer
konsulko.com

