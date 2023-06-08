Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0823DC7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:43:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.6723.1686224614303814667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lzWc1fx2;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3063433fa66so366783f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 04:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686224613; x=1688816613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCaWdHYzlXBKnYe4f1VX0B4sQ2x5E1Koj8YER9d4UJk=;
        b=lzWc1fx2ahgDEZv114nxPXO//4ixRem9zaj1Dttt1JYnNzytAoOThiD0eB9/IMiawC
         W/e3doCLTaNwasHu5YFWRPQsmHzBgHLQeZYf4th9jBvCoWARBkzCaPHK9vqizn1RWTiQ
         e3Zg2188zzNw/KZRY3Io7j+rdEEHs4Feds8aH2r5tXt9j3JBezozy79swsPHwosoDO0r
         x9Yp6Y8zde4h/H5RaIi2ZpSBQGFpPGaAaNiq9EDyNeLgtScToUnFoFi+StrHscvSxqws
         YWl2sbLhDmI12Nv/r0+nukfRq9CFO0iq5OXtdXalsJjcaeaz7oQt5P+GaXj5cNV7scdl
         P2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686224613; x=1688816613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCaWdHYzlXBKnYe4f1VX0B4sQ2x5E1Koj8YER9d4UJk=;
        b=Oh7uH6SYxbEZqqPCBR/GzgGGT+IAqpZC7pJnYg5m35Coe4EcAhIuvIhtWa0moQ05wv
         Ueyad2wWX37WHCej8nas3UcxUbvI8qozx0NWbCiIQ7lKy3Nn8ZY4xS7sWrsu1rcyI9of
         ZXVL0ryrFC8I0EwZ9pucjgDyOcpcqOqBcK1nwoF/fQOsRD2tFbotkLzdtekSwD/HIIcJ
         nVRsoCONY2o4GFMG82Kmrn5qlBkz17NjYASOCyB3m8a5WM+eS4Vl4bydeWcoE0A6fvnK
         s9hPNH+Y9AX8ewfjU9E2wBaHirse/WcmaH9fO+DqLQARZ8nibfBahwWfpNF97uvdgcNM
         z+ew==
X-Gm-Message-State: AC+VfDwWd8Z2ZN9CvnifH2o78+/NSycDtQYoYYPLmcWWNSXdvhApS1GS
	auG/Hneh0jdR9GXoQ+uupT4=
X-Google-Smtp-Source: ACHHUZ6rZxVvkL3PRDtRqoyXhVkcRB5AVXSDVTEyMrilRXUWclgp/citpCt6Dar61glaywTZU+MmRQ==
X-Received: by 2002:a5d:480b:0:b0:30e:5b7c:de1c with SMTP id l11-20020a5d480b000000b0030e5b7cde1cmr3832479wrq.11.1686224612594;
        Thu, 08 Jun 2023 04:43:32 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d6b4e000000b00307d58b3da9sm1338513wrw.25.2023.06.08.04.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 04:43:32 -0700 (PDT)
Message-ID: <e898023e-a0df-43f2-9a70-8bd1f468f4c7@gmail.com>
Date: Thu, 8 Jun 2023 13:43:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-python][PATCH 2/2] python_mesonpy: New class
Content-Language: en-US
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
 <1766AB9E7F95CBC1.3462@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1766AB9E7F95CBC1.3462@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jun 2023 11:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103187

2023. 06. 08. 13:30 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 06. 07. 17:35 keltezéssel, Ross Burton írta:
>> On 7 Jun 2023, at 12:41, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>> 2023. 06. 07. 13:26 keltezéssel, Ross Burton írta:
>>>> On 7 Jun 2023, at 12:24, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>>>>> +# This prevents the meson error:
>>>>>>> +# ERROR: Got argument buildtype as both -Dbuildtype and --buildtype. Pick one.
>>>>>>> +MESONOPTS:remove = "--buildtype ${MESON_BUILDTYPE}"
>>>>>> If mesonpy ever switches to —buildtype then this will break, right?  Might be 
>>>>>> better to patch mesonpy instead.
>>>>> Why would it break? It does not affect what meson-python is adding internally.
>>>>>
>>>>> This only removes the setting imposed by meson.bbclass
>>>>> and only needs to change if meson.bbclass switches to -Dbuildtype.
>>>> My understanding is that meson.bbclass is passing —buildtype and then mesonpy is 
>>>> passing -Dbuildtype.
>>> Correct.
>>>
>>>> This :remove removes any —buildtype option, so if mesonpy changes to using —buildtype 
>>>> instead of -Dbuildtype then _both_ buildtype options will be removed, which isn’t 
>>>> what you want.
>>> Wrong.
>>>
>>> This only removes the --buildtype setting from MESONOPTS set by meson.bbclass.
>> Okay, I take it back, thanks.
>
> Thanks. I will send the updated series shortly.
>
> As a side note, do you know why -I/usr/include/python3.11 may get added
> to the build command by meson? It happens on a Fedora 38 build host
> but it doesn't happen on a Fedora 33 build host. As a result, building
> my in-house python3-scikit-image recipe fails on Fedora 38.

Nevermind, it's fixed by adding "inherit pkgconfig" to the recipe.

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103186): https://lists.openembedded.org/g/openembedded-devel/message/103186
> Mute This Topic: https://lists.openembedded.org/mt/99379800/3617728
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


