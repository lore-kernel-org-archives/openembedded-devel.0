Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD16CC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 08:07:58 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.16158.1742544474535385326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 01:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YNzEZcpF;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso348259366b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742544473; x=1743149273; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RJsvMPuyS7CZS5yCEqzLLQAWhkJI6Rjc+GLUNKOvig=;
        b=YNzEZcpFXN6ap1B6Db1KvxfacP3/p9wo8PjfqGwhREx4xEH2DICpbZWTPimQxPT8vt
         mc0vUDC5gNzGv8aZwS7mUCQmgKZq1qvOt7X+CPIrn9VkOUExlSEdhFYTeflZHLweMc4Z
         ZAHW6TADhd2gnzWoyOQdJ3Atb7GpvgQWAQvcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742544473; x=1743149273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RJsvMPuyS7CZS5yCEqzLLQAWhkJI6Rjc+GLUNKOvig=;
        b=j9UG5IA3BYYw1CEyrPGO/oDR+7MHKUUpm3V1RkJkL67YB/9DyjKaFj9ws7CT/+saIa
         5FnGDneJ8VOrHEx4xpV05bmvbZGqqiubzZZrSlhkFQ/6XBcvVmKLNLisSKaVKTbMkWCm
         2QcUodtQ9OgNYAZ4Kx4dsfeV8/WdFQIIy2iOERqX31frMQA0ZqQBxgdTiJboDQn4t8sm
         feNHqptGqpPu7utAJIi+Sf8+NjacK2ptUGyPb/8RwBKRWtut57XIhd9FhuYogcuqEYyd
         eIwUeXEDX2FhN0x1JMpG57iPrPIVKd4HrNByj0jRm6jdKwuhfX7B8cKv/6pBDpy6ttyN
         AvJQ==
X-Gm-Message-State: AOJu0YxLIdvUiN2rdH7ZldexA+wdM6yJ0sBDXEOcjiDaJZhuVaCt9x2m
	xbE2kZmYRaDnWgBzmWtSkkoQE/ylKWNBFnm1QwNXTB1I58AEkfgLATWUkhO4qn0=
X-Gm-Gg: ASbGncsnvorT5Au9c6V3H20I8PnTvw9Mdk5daHM+KndRZkjmLr2XFOtxAe5l05CR877
	LHFCfl3XaEQuX4yHUNNHS3bUgLunOhBk3RgmKxCkKnUpBLbesHPXLPpEk4KPOmPDxxlBVRNfrmI
	/XY9oANgndpCgm7GwNN9wwKtbvPSrERf6n6/OXndJh4P3gV79gvmEsV7b3SuGFX63Flf7hgK6u0
	5wUSYDfp5qpR29qGJQOfz8882Sk7Bq2KNvJCtc65EW0VLEwFLFSSvE8KpncczFgR6xQ1xXBLiGX
	zFEbAIG1bn0/F7wp9RpHdRBhzizk+LF5VNOw/2LHkZrE6aOiblJI
X-Google-Smtp-Source: AGHT+IE5D52tK/C4C3rhtI7PJT7DYalyYesCH68ez7s+8LshtsN3gJSaBrNgISlbLXEbjer8AWs4Zg==
X-Received: by 2002:a17:907:6089:b0:ac2:b414:ba2a with SMTP id a640c23a62f3a-ac3f2524e79mr194789966b.37.1742544472523;
        Fri, 21 Mar 2025 01:07:52 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd48021sm103717766b.168.2025.03.21.01.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 01:07:52 -0700 (PDT)
Message-ID: <7ffb47e1-52c0-4c83-8579-8c4dd17d71b8@konsulko.com>
Date: Fri, 21 Mar 2025 10:07:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.1.0 ->
 6.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250319082110.2907028-1-leon.anavi@konsulko.com>
 <CAMKF1spq0LPZ8NN=9_2s9=6GuU9qEoGdjnLvtwYME8ejyC=dSA@mail.gmail.com>
 <77f6bda7-d880-4e52-8a66-de975d185a59@konsulko.com>
 <CAMKF1spub-KYytBQvNiTT0Mc0+nw6TabUckpDBfBxLO7funLYA@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CAMKF1spub-KYytBQvNiTT0Mc0+nw6TabUckpDBfBxLO7funLYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 08:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116173

Hi Khem,

On 20.03.25 г. 20:19 ч., Khem Raj wrote:
> On Thu, Mar 20, 2025 at 3:41 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Hi Khem,
>>
>> On 19.03.25 г. 22:43 ч., Khem Raj wrote:
>>> This fails ptests due to missing dependency on python3-pytest-codspeed
>>>
>>> I would encourage to run recipe ptests when doing upgrades etc. e.g.
>>> for python3-multidict one would do
>>> bitbake meta-python-image-ptest-python3-multidict
>> Thank you for the feedback. I fixed it and I sent v2 of the patch.
>> Please note that it has to be applied after the my other patch from
>> earlier today that updates the runtime dependencies of
>> python3-pytest-codspeed.
> Thanks for working on it.
> I was already carrying fixes for the ptest regressions so I went ahead
> with that patchset

Thank you, Khem. Should I rebase and submit again any of my patches 
related to ptest?

Best regards, Leon

>
>> Best regards,
>> Leon
>>
>>
>>> On Wed, Mar 19, 2025 at 1:21 AM Leon Anavi via lists.openembedded.org
>>> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>>>> Upgrade to release 6.2.0:
>>>>
>>>> - Fixed in checks throwing an exception instead of returning
>>>>     :data:`False` when testing non-strings.
>>>> - Fix a leak when the last accessed module in PyInit__multidict
>>>>     init is not released.
>>>> - Implemented support for the free-threaded build of CPython 3.13
>>>> - Started publishing wheels made for the free-threaded build of
>>>>     CPython 3.13
>>>> - Used stricter typing across the code base, resulting in improved
>>>>     typing accuracy across multidict classes. Funded by an NLnet grant.
>>>>
>>>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>>>> ---
>>>>    .../{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb}  | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>    rename meta-python/recipes-devtools/python/{python3-multidict_6.1.0.bb => python3-multidict_6.2.0.bb} (90%)
>>>>
>>>> diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>>>> similarity index 90%
>>>> rename from meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
>>>> rename to meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>>>> index ed49b8ff02..568b1b93ce 100644
>>>> --- a/meta-python/recipes-devtools/python/python3-multidict_6.1.0.bb
>>>> +++ b/meta-python/recipes-devtools/python/python3-multidict_6.2.0.bb
>>>> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
>>>>
>>>>    PV .= "+git"
>>>>
>>>> -SRCREV = "4140e63780dc6dd600a1837cb9b4c5198c3dcd68"
>>>> +SRCREV = "af07d5b2b18bb30e041983db2bea1fcb3e1c4b79"
>>>>    PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
>>>>    S = "${WORKDIR}/git"
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#116065): https://lists.openembedded.org/g/openembedded-devel/message/116065
>>>> Mute This Topic: https://lists.openembedded.org/mt/111785561/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

