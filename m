Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B67C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 10:41:47 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.4308.1742467299735603371
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fOfMcIJO;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so1269796a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 03:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742467298; x=1743072098; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpIi1B473epKrCeu322/tWSYbRiyxF30LJLxt6nMnMw=;
        b=fOfMcIJOTn/EFrJ9ifIvlLmUvorqeowVMSx8t+zYp3MFtH/pCU+3zKk7o2XvamOqag
         bUR4YrznZylk/d/aZF2jCkJpdxoLvCz7b7pmQaZ+9xMA2p4HKURnzkwZDKVRV6Q3QUMp
         FpllyAUe8fMcuhdyQWz3zVnzzeDDcd0ln8H4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467298; x=1743072098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpIi1B473epKrCeu322/tWSYbRiyxF30LJLxt6nMnMw=;
        b=EwcUT86uCS+lhlAK++5gaV0jM+Y/+ycfSYfCAJ+hdn+NYXrxpc9WvW+z3tAbZ7fmhF
         VH5wWvTdEbmyM2dKfIxIPuzpHAtgHLlf1PbCTa2Zy5sGcS3FxlECX14tZki06/JfSnah
         YsdwQJJoUhH/NiKgSzwCqpwfT3yZ93b2KSYF9f0fGLSYdtqua/pasxcCOJ5r4fdNIbtF
         oaBPm9v56vKKJF1lLfKmPwSPsKQZ2Ub2CsDT7OXud2cJfWNAH50bTRNEi34JImvOkBhG
         UpqL7+4/lSQkXrc66moXlRAe/jQPcJ5N6GXjIWPvSGHhACuW1FEA+gCj7MhfFJoxE+k8
         HONg==
X-Gm-Message-State: AOJu0YxIUPWMzlNyWjx1AihMuKM9Ofqt4D9QaVoxx6GhLuNUm2pm49fo
	YN9tBCyMPsPCAcWh/CWuO2GJPpT6mlaU54TQOU7uMohTKZlCOA5vAz0/is5wOiIftGxJRtcTB+4
	i
X-Gm-Gg: ASbGncsvjt9SxC290O7hPCsyAfww2P/oiIXvISdu9sN6Kb/EeiJ/X10B0HITS8YYDM+
	/W+Y3RQrMtVYDByaEHpGy6968i79Sg2QN1NDNhbg7F++2WQ4DZ5HOjs+yZv5XSHax1zZqspCPll
	jqZRTysyN9riRDXXvF6jiIr+/Z4rdOplvyfrYceYPz+Drloircqx0t4Zt8ygqA3QTgvuCJoPUID
	W7kdW+EjiW6zpb3oJd9BNW3JxfGjGEkt5P/ivzoCvm+p82zwie/v6VQX35GGD77aXUKMsidEOYF
	6zxMFgqqVHuQsqdkCKGjLWX20GCy30djr5VgLlHf25fF3RLXLBz2
X-Google-Smtp-Source: AGHT+IFE8iBK7/yD/u/5ekKBZc9F/i4HxgXRF2Izkf4FOgyrk8KMRQwjUe8N5DJQblao7er8ORgnTQ==
X-Received: by 2002:a17:907:d7c8:b0:ac3:e4ea:de3b with SMTP id a640c23a62f3a-ac3e4eade48mr84353066b.27.1742467298054;
        Thu, 20 Mar 2025 03:41:38 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3df6fd73esm59105366b.96.2025.03.20.03.41.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:41:37 -0700 (PDT)
Message-ID: <77f6bda7-d880-4e52-8a66-de975d185a59@konsulko.com>
Date: Thu, 20 Mar 2025 12:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.1.0 ->
 6.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
 <CAMKF1spq0LPZ8NN=9_2s9=6GuU9qEoGdjnLvtwYME8ejyC=dSA@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1spq0LPZ8NN=9_2s9=6GuU9qEoGdjnLvtwYME8ejyC=dSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 10:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116131

Hi Khem,

On 19.03.25 г. 22:43 ч., Khem Raj wrote:
> This fails ptests due to missing dependency on python3-pytest-codspeed
>
> I would encourage to run recipe ptests when doing upgrades etc. e.g.
> for python3-multidict one would do
> bitbake meta-python-image-ptest-python3-multidict

Thank you for the feedback. I fixed it and I sent v2 of the patch. 
Please note that it has to be applied after the my other patch from 
earlier today that updates the runtime dependencies of 
python3-pytest-codspeed.

Best regards,
Leon


>
> On Wed, Mar 19, 2025 at 1:21 AM Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> Upgrade to release 6.2.0:
>>
>> - Fixed in checks throwing an exception instead of returning
>>    :data:`False` when testing non-strings.
>> - Fix a leak when the last accessed module in PyInit__multidict
>>    init is not released.
>> - Implemented support for the free-threaded build of CPython 3.13
>> - Started publishing wheels made for the free-threaded build of
>>    CPython 3.13
>> - Used stricter typing across the code base, resulting in improved
>>    typing accuracy across multidict classes. Funded by an NLnet grant.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb}  | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb} (90%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>> similarity index 90%
>> rename from meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
>> rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>> index ed49b8ff02..568b1b93ce 100644
>> --- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
>>
>>   PV .= "+git"
>>
>> -SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
>> +SRCREV = "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
>>   PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
>>   S = "${WORKDIR}/git"
>>
>> --
>> 2.39.5
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#116065): https://lists.openembedded.org/g/openembedded-devel/message/116065
>> Mute This Topic: https://lists.openembedded.org/mt/111785561/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

