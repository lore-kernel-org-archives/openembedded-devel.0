Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77659C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 10:51:56 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.8846.1744973514583589791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 03:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=h60zmWwd;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso2238755a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1744973513; x=1745578313; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDcmPx2/ZsNz7TyCWKOCAMeqvPG+WgTgLq2DNJXas8c=;
        b=h60zmWwdCpqexVgIrGIYj5Q2avBwFwQoo2t1TXIwHI0bg7iyXJfrXsG2NAUQ9rEsNN
         bw/2owIBVuZJwtEdkPTwxwevZq67Rmm4YghMmCnKhdWNFynvaG1eGCJfNc4CMg/w97jM
         Xj5fm3W1Okbt4LBDlhHUMH8+R5CAovmAKJO6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973513; x=1745578313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDcmPx2/ZsNz7TyCWKOCAMeqvPG+WgTgLq2DNJXas8c=;
        b=ehEYMSmF1qYXEp0cfYp6t1+ikOTxWUY435L4R6TfHuoYj+6Y4HCAy3ZRYv0SyJCEWj
         Xeg0SgBt2U8o3yTCa7tsEGCaODN4GQd4EvcfV5+CJNlyT1789IqPM4nDwW4Cc8uqeFFx
         3Hyikzduii/G/3SZj4m1wKo9I5d+Wl5gDX3BHQh5D93VzDA/ksMzBJ/rhI6YNc8/DURG
         s2m0gUxw2kozk3Si5QiJNJOSuSRAVDjLVYykL3RPBZFH+inFvA78HroX+A9L0T0hzNUv
         gmWsixU+PheAe7vRy+EYI+OtRIkPp9+zARhpW5tfc1coR1MXwadB74At40V1YNFv83xh
         M6cg==
X-Gm-Message-State: AOJu0YwxteYPATIEzMf/afaneBiXILrZ0iIha9OTlj8qXJcUVIHqCn6O
	2FtUAiy87SD6yvpX7d3ho/NOygeJFl9M4SVj3bsgfXMOr76E0TDF4mXpPbSQuzg=
X-Gm-Gg: ASbGncveKCo4RY1t5ZI+4ueTIdHYz957zBVJ1aNvG3Bd0SW/D/jtHh4BB9EtvEPvA5q
	ClCmiMOuEOq0PsfSHusynFssUlPbon0swAt9hkHu6ij7GZDiKaCEmB8c3ZChNk7JKwQwb1iDfDa
	UTPk1WOwz/rNy71SFMgBuMKxVz3Xaa3dEVC+SBqqI8VYZY5jLln1y6GWsiGIJBcbGi+7FJC/6s2
	vTPza8wCXPHJZEDiZW0gJMr2sVueQc21SDvTPA4xolX7WpaX8HSqzFROi17lBlJ4WgN2Q9nkVcz
	hxkyD6jOLIMOTTfwpGtdsRtdsXEaTqq0npQPlWOCUmrF2nRHjf5G/KrRIjc=
X-Google-Smtp-Source: AGHT+IFIWx6m3L1W5Ay+sf1La+a+hH/dd7uYjaSXKv0WNj2bhERMzG93nBvsF+JPeAK2c0ZcS8zqYA==
X-Received: by 2002:a17:906:6a1e:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-acb74b2d990mr213558166b.14.1744973512931;
        Fri, 18 Apr 2025 03:51:52 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc722sm105354366b.99.2025.04.18.03.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:51:52 -0700 (PDT)
Message-ID: <91777b53-3c7c-4331-add1-7ca66a8c0eee@konsulko.com>
Date: Fri, 18 Apr 2025 13:51:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-eth-utils: Upgrade 5.2.0 ->
 5.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250417123231.3063208-1-leon.anavi@konsulko.com>
 <20250417123231.3063208-6-leon.anavi@konsulko.com>
 <CAMKF1sr-t089ZNTZSVF7dzM0_LR6Zpw8bDtE=QdEOxUc57TT_g@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1sr-t089ZNTZSVF7dzM0_LR6Zpw8bDtE=QdEOxUc57TT_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 10:51:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116948

Hi Khem,

On 18.04.25 г. 5:20 ч., Khem Raj wrote:
> On Thu, Apr 17, 2025 at 5:32 AM Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> Upgrade to release 5.3.0:
>>
>> - Replace arg["name"] with arg.get("name") to correctly handle
>>    optional names
>> - Add new methods: to_wei_decimals, and from_wei_decimals which
>>    take a number instead of a string
>> - Add CamelModel pydantic model for validating objects and
>>    serializing to camelCase when used with by_alias=True, with
>>    the general expectation of a well-formed JSON-RPC object.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-eth-utils_5.2.0.bb => python3-eth-utils_5.3.0.bb} (80%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>> similarity index 80%
>> rename from meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>> rename to meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>> index 435d032a84..84db8b32b3 100644
>> --- a/meta-python/recipes-devtools/python/python3-eth-utils_5.2.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.3.0.bb
>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d3f53e7cc5bf80b16eff1f4a38c73182"
>>
>> -SRC_URI[sha256sum] = "17e474eb654df6e18f20797b22c6caabb77415a996b3ba0f3cc8df3437463134"
>> +SRC_URI[sha256sum] = "1f096867ac6be895f456fa3acb26e9573ae66e753abad9208f316d24d6178156"
>>
>>   PYPI_PACKAGE = "eth_utils"
>>   UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>> @@ -16,4 +16,5 @@ RDEPENDS:${PN} += " \
>>       python3-eth-typing \
>>       python3-setuptools \
>>       python3-toolz \
>> +    python3-pydantic \
> pydantic module is not buildable on riscv32 so please add that same
> list here as well now.
>
> COMPATIBLE_HOST:riscv32 = "null"

Thank you for the code review. I've just sent version 2 of the patch.

Best regards,
Leon

>
>
>>   "
>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116936): https://lists.openembedded.org/g/openembedded-devel/message/116936
>> Mute This Topic: https://lists.openembedded.org/mt/112312253/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

