Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE960C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:30:08 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6484.1686223807319028031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=X+vAtNKm;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30e57e0a0c7so358506f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 04:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686223806; x=1688815806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxgbE0i/0xO4v7bGMI9rZLjzM/uKc0Uh4weGq+MXKcc=;
        b=X+vAtNKmRGys3UuAWeF7TCAhEn5pU9TI7o0tHp8qYF+OCtMYWEim1rWGHr0Y9eOeA3
         Pt1WJjRRNET47xy4g5SJ8xMfjGHmKxWoneaTvzq9VedezrPFq+am+PdNvL+f/rJVps/q
         u0qQWO1vMCcTCupVa24EdK0t9L7TTBTAJIAmO0BZLUdSpY1NtwoKv8VzGoY+eyxhwhmt
         N5R+ek8wk9aI66xnL7BkNdmjFec092hAhNJXXanfF3zA986j+gj6LSH6nx4Hs0NYfyIQ
         vJXYCh2XxcIqYO9RqGXefVgEG7KxMXmrN2lwqSA+eC9zaJ0w2p0GjA49ggshneCSL2rv
         2iZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686223806; x=1688815806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxgbE0i/0xO4v7bGMI9rZLjzM/uKc0Uh4weGq+MXKcc=;
        b=lF5O9boElwE+4fhjpXQfBmz/RRGfCzmc1uUZUG1UzhOBK+1QmOW5zjbE/DyRCGlm4B
         3UCARxHNz0SemaM+gmO/C92ibX4gNlv1PGUTvd4D+fI66gYSJgLV8/AcouRzNluiwQ2T
         R4IaRJ19crxeNygQMgQtgmy2agBssIPnz7oPd01YPP0Eu9BDhQq0eqmxp5YtRqau88wc
         QbzgnaDtLn/iFHY1bKaxFA7lcbwriAMuBoJGLLsYleKrHek03isjMWAlo3m+L3EaA+tg
         zlKqfj2Two4KhtPkgq3SKxp4TIsnhDPPHUj9D6UkDegm8tc5Q6q2kh+cRW9DaKdUOLhc
         YZGg==
X-Gm-Message-State: AC+VfDzLY2KFK7VgiBaMD/lJ5LroJOM+qXU/i3jy/gEUbG5re4kL50cS
	Ieqj9cxTBOopr0RGUlRh/U4=
X-Google-Smtp-Source: ACHHUZ61dtOOfw0/LN+qoIVdh2kQeyPueBTIKbYqArjzv4B63wV7teUy6S5KJJKeUsH2Vx8fx4R+xQ==
X-Received: by 2002:a05:6000:503:b0:30a:b0e7:34b with SMTP id a3-20020a056000050300b0030ab0e7034bmr6583713wrf.66.1686223805469;
        Thu, 08 Jun 2023 04:30:05 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d4387000000b003064088a94fsm1348887wrq.16.2023.06.08.04.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 04:30:05 -0700 (PDT)
Message-ID: <f8859ef4-951a-f1f1-60c1-5e053461463b@gmail.com>
Date: Thu, 8 Jun 2023 13:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
 Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>
References: <20230607065547.128661-1-zboszor@gmail.com>
 <20230607065547.128661-2-zboszor@gmail.com>
 <C15808F7-1E10-415B-9281-82CD6FE46FC8@arm.com>
 <782e17f9-9ae6-b6db-6b61-f41e670d4030@gmail.com>
 <8236819D-4370-4B6E-AFD1-845010C00239@arm.com>
 <cdd1f449-d73e-edb5-4572-563818dbbbb8@gmail.com>
 <12635BEA-BDB6-46DB-A29B-54B501B4A4CA@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <12635BEA-BDB6-46DB-A29B-54B501B4A4CA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 11:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103186

2023. 06. 07. 17:35 keltezéssel, Ross Burton írta:
> On 7 Jun 2023, at 12:41, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2023. 06. 07. 13:26 keltezéssel, Ross Burton írta:
>>> On 7 Jun 2023, at 12:24, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>>>> +# This prevents the meson error:
>>>>>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>>>>>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
>>>>> If mesonpy ever switches to —buildtype then this will break, right?  Might be better to patch mesonpy instead.
>>>> Why would it break? It does not affect what meson-python is adding internally.
>>>>
>>>> This only removes the setting imposed by meson.bbclass
>>>> and only needs to change if meson.bbclass switches to -Dbuildtype.
>>> My understanding is that meson.bbclass is passing —buildtype and then mesonpy is passing -Dbuildtype.
>> Correct.
>>
>>> This :remove removes any —buildtype option, so if mesonpy changes to using —buildtype instead of -Dbuildtype then _both_ buildtype options will be removed, which isn’t what you want.
>> Wrong.
>>
>> This only removes the --buildtype setting from MESONOPTS set by meson.bbclass.
> Okay, I take it back, thanks.

Thanks. I will send the updated series shortly.

As a side note, do you know why -I/usr/include/python3.11 may get added
to the build command by meson? It happens on a Fedora 38 build host
but it doesn't happen on a Fedora 33 build host. As a result, building
my in-house python3-scikit-image recipe fails on Fedora 38.


