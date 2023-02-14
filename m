Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A34C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 17:24:05 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.13508.1676395312890763672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 09:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PM1qM2t0;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: fntoth@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id qw12so41902397ejc.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 09:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zhQZHhfbcGfZKD1OafFDd25ogKziEiiatS013wA+PuQ=;
        b=PM1qM2t0JoFPDYlM6ZUMAx6pcwxqpZDGZZJ1toH0toIiy4NrBG22yo+cDtDuZB89xV
         nPvxuBZYNpY3flxNynjil6fSWM+Jv7X90n71eDjSdrNzojJLCyeR/0fGfMzkCdpifusu
         YrtPkx+ASkQk4HtztRNqHhGXvOu7cOau7o8RME5DaXJ47iOqi452ujPfZ82wpNk7tNNA
         XH73YXNAVHpPwbUU7S+ayG3lHBYjzjoCGMunnsslSEg1eYm0H9QFRbEQCG+kK3RrDGKw
         CP7r2s94j3/VqOe2N7QyWGVgc7Y3B1gCc16R5nk7l1OhG0XDyd9zUSy5zLAeN/yk1zOZ
         YSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zhQZHhfbcGfZKD1OafFDd25ogKziEiiatS013wA+PuQ=;
        b=WxPjmbNFBVz/LFTeNp/O/mP6s9cnl7d/L+afZ+8vSbLaHhBX0rnIU4003D0rcZTFq+
         8A0S81EHq/yitSXNoqFkKcwGcICWc/2N/voofWIBXDxGEuPOjmp2C/x3P2AQI99kLTzc
         Uz6NQ7y9yHHwSzJIlYvJspGjekjQLhCz1Dn2o5CC0xTprjQ5JpNTsU6ruWf0WAj7QmdW
         f8OS4r4xXGF89AK9BcHCrKxuoh21ZFdRN23pw5IC5KqgdGW0lQey9YGWvCY0lCc9y3bZ
         Py5Pj4DHIxD1Z3BEWnXmo0a1X+W0jhKrYazihjTnwyowZtXf0O/DTBwKGSX48ePJpTDH
         aYuQ==
X-Gm-Message-State: AO0yUKXSwemkCLKaLQOVeZIvaeXz8nC4ircazGm1UStZruUt6rd+ICgw
	0MQk16lL7//REmQOERZtC9k=
X-Google-Smtp-Source: AK7set8Es/q79A2cn8uJ6GyAvtVFwv/qenTweSBKGOwglWizUYcUinkmHR3YOzYM+Uyf5UvprD3zrw==
X-Received: by 2002:a17:906:730b:b0:886:50d:be8d with SMTP id di11-20020a170906730b00b00886050dbe8dmr6214575ejc.13.1676395311342;
        Tue, 14 Feb 2023 09:21:51 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:884:c751:a3fb:d522? (2a02-a466-68ed-1-884-c751-a3fb-d522.fixed6.kpn.net. [2a02:a466:68ed:1:884:c751:a3fb:d522])
        by smtp.gmail.com with ESMTPSA id bj4-20020a170906b04400b008af444b9c02sm7709494ejb.28.2023.02.14.09.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 09:21:50 -0800 (PST)
Message-ID: <535761c1-07f0-b6fa-3df9-14db6690da82@gmail.com>
Date: Tue, 14 Feb 2023 18:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230208152541.136848-1-brgl@bgdev.pl>
 <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
 <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
 <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com>
 <CAMRc=Md0SRAnbQ=A1qgwJ8thoApe6pOZ9xyim89bigfRkvxGJA@mail.gmail.com>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <CAMRc=Md0SRAnbQ=A1qgwJ8thoApe6pOZ9xyim89bigfRkvxGJA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 17:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101077

Op 14-02-2023 om 15:05 schreef Bartosz Golaszewski:
> On Mon, Feb 13, 2023 at 11:15 PM Ferry Toth <fntoth@gmail.com> wrote:
>>
>> Op 09-02-2023 om 20:57 schreef Bartosz Golaszewski:
>>> On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> We've just tagged the release candidate for libgpiod v2. This is a major
>>>>> release entirely overhauling the API in a backward incompatible way.
>>>>
>>>> Thanks for creating this!
>>>>
>>>>> While this is not the final release yet, it's not likely to change much so
>>>>> I'd like to make it available in meta-openembedded to give it exposure to
>>>>> some testing. When we do release v2.0, it'll be just a matter of bumping the
>>>>> version.
>>>>>
>>>>> Currently no other package depends on libgpiod in meta-openembedded, so I'd
>>>>> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
>>>>> provide recipes for both versions but keep them under the common libgpiod name
>>>>> as it's unlikely anyone would need both versions in a single system. This is
>>>>> after all a medium-sized project that shouldn't require too much work in order
>>>>> to port a user to the new major release.
>>>>
>>>> Nevertheless there may be packages in other layers using it (meta-acpi,
>>>> meta-intel-edison). I think there will be a period where both may need
>>>> to coexist.
>>>>
>>>
>>> Can those layers just set the PREFERRED_VERSION?
>>
>> Yes, but it doesn't the problem when one app needs v1 and the other
>> needs v2.
>>
> 
> Yeah, this is what I'm trying to explain. How likely is it that the
> same system will use two versions of libgpiod at the same time? IMO
> highly unlikely because this is not gstreamer or some other huge
> project, it's a small-to-middle-sized library that's most likely ever
> only used by a single program or script on a given system.
> 
> I'd prefer to not provide libgpiod and libgpiod2 packages but instea
> allow to alternate between them using PREFERRED_VERSION. If anyone
> complains, then we can rethink it.


libgpiod2 is in Ubuntu Kinetic and is a dependency of openocd (> 1,1) 
and eg25-amanager.

Those packages will block libgpiod v2 from going in (that would be a 
pity) until they are ported, or until they are dropped (a pity to have 
your dependents dropped too).

On a smaller scale, Intel Edison Arduino uses libgpiod in 2 apps. To 
port them I need to figure what changed and how to fix them. Try some 
example etc. because at this point in time there is not much example 
code. But installing libgpiod v2 breaks some systemd services because v1 
gets uninstalled. Luckily in my case it does not break boot.
> It's not like we're changing the default version in any of the stable
> branches anyway.

True. I just like libs to change version when they have compatibility 
breaks. But maybe that's just me.

> Bart
> 
> 
> 
> 
> 


