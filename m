Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.4371.1592389187274919005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 03:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZQQ1D3gB;
 spf=pass (domain: konsulko.com, ip: 209.85.208.68, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f68.google.com with SMTP id o26so1536707edq.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2020 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0xFznvW/uOuUwpg5O9v7Ma1ToLw/MqATaQ+tI2lNYv8=;
        b=ZQQ1D3gBX+ouU9TBF42qFnw49L890QJJRUcAcQc8H/00JMgWHx+GIoXtK+WlbH/uHE
         sLPExf7GcwZTq0RHRfkErynNL7IWg/LGSl64Rz1iX/IC43urt5gJzh4DcHqoStzz9QcX
         q2A9jiTkJg+OnXz56wyrkaSo2D7Oe2n84XClQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0xFznvW/uOuUwpg5O9v7Ma1ToLw/MqATaQ+tI2lNYv8=;
        b=aUiKSxcwCqCkTAOOC7C1jpsfo3E5VmVQ8WRjXrCKcBd23EJce3WsZ7rbl9YMoB9lJw
         Ch0xd6MMjPZCIrz7E5e0o0fTijQg/MUHRMYXBTlCgBiv/k7EFgJk++wyAcNebk+Afu7h
         uIgIMOi4hrqTRRXDsKbSzg5BP01sqPmZKvEipb07lluaFcv2IFhTc69FHKGjTznLubS3
         qO7xPrH1XTurCPqMm5OwQtTqG99FPO0PHPCifFg+2uvDPAWVBVItTbpw2DseujEKV0os
         1rVSBAmYAxbU3+Zyib+5+hvUAyG6EqWh4BVqgGrqhKBIzlmqmqcR2+25Go46j0m3t1kF
         vd7Q==
X-Gm-Message-State: AOAM5312mu1gjdJZVxpzT78BguPByoAMu+nEyUiNW1YpBL/wK+NAgXIU
	Gn+RFuhep43zwSBWBuoR/8ye8Tvd17g=
X-Google-Smtp-Source: ABdhPJyCKr7ow3cYp02f+5OPoYK7y58UgtdkfvWuxcrMsO77ZbvYKFIPAePlhmL6nP+SbMot4cY3Ig==
X-Received: by 2002:a05:6402:22a5:: with SMTP id cx5mr6911988edb.246.1592389185512;
        Wed, 17 Jun 2020 03:19:45 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id h17sm11901035edw.92.2020.06.17.03.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 03:19:44 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-pocketsphinx: 0.1.0 -> 0.1.15
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200611090904.29772-1-leon.anavi@konsulko.com>
 <20200611090904.29772-7-leon.anavi@konsulko.com>
 <CAMKF1soGT84aAF9Swywx7XQ+cUpfK44GvnEM+C0xNYcJJjQstQ@mail.gmail.com>
 <CAMKF1srE06vgexB8xjkYpLXZzKY1PGGsdcVAKYSAJh=0psbS0A@mail.gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <f8ee5191-8949-313a-6d09-f09fc68a73ba@konsulko.com>
Date: Wed, 17 Jun 2020 13:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srE06vgexB8xjkYpLXZzKY1PGGsdcVAKYSAJh=0psbS0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 16.06.20 г. 21:44 ч., Khem Raj wrote:
> Leon
>
> please look into
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/392/steps/8/logs/warnings
>
> I have accepted this patch in confidence that a follow up is coming
> from you to fix this warning
Thank you for bringing up this topic. Following your suggestion I have 
just prepared, tested and submitted a fix.

Thanks,
Leon
>
> Thanks
>
> On Thu, Jun 11, 2020 at 10:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jun 11, 2020 at 2:10 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>>> Add pulseaudio as a dependency and required distro feature because
>>> libsphinxad requires it. Upgrade to release 0.1.15:
>>>
>>> - Add all travis osx
>>> - Remove bdist_egg and bdist_msi
>>> - Bug fixes
>>>
>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>> ---
>>>   ...ocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>   rename meta-python/recipes-devtools/python/{python3-pocketsphinx_0.1.0.bb => python3-pocketsphinx_0.1.15.bb} (65%)
>>>
>>> diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
>>> similarity index 65%
>>> rename from meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
>>> rename to meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
>>> index cb22040df..5aa0eb6bc 100644
>>> --- a/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.0.bb
>>> +++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_0.1.15.bb
>>> @@ -5,9 +5,10 @@ SECTION = "devel/python"
>>>   LICENSE = "BSD-2-Clause"
>>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=826ebda787eb48e78aec2624f9faba72"
>>>
>>> -SRC_URI[md5sum] = "c0f2bfd54bc4c438c3bb64825f57d575"
>>> -SRC_URI[sha256sum] = "2cc493ed48c1301e0d2e69b137dc646c2f8caca190ef4bce61836eac96d1796f"
>>> +SRC_URI[md5sum] = "94d008eebea16acb60a9ffe614575dee"
>>> +SRC_URI[sha256sum] = "34d290745c7dbe6fa2cac9815b5c19d10f393e528ecd70e779c21ebc448f9b63"
>>>
>>>   inherit pypi setuptools3
>>>
>>> -DEPENDS += "swig-native"
>>> +DEPENDS += "swig-native pulseaudio"
>>> +REQUIRED_DISTRO_FEATURES += "pulseaudio"
>> this also needs to inherit feature_check
>> please send a followup since I have applied the original patch.
>>
>>> --
>>> 2.17.1
>>>
>>> 

-- 
Leon Anavi
Software Engineer
konsulko.com

