Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6AAC05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 18:54:37 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.1626.1676398613167554682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Feb 2023 10:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CWLWbVOd;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: fntoth@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id w3so11676020edc.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 10:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJfLW2fQZ/uxqGSHExbHgJWxzzlVlMHocALkAuynvcY=;
        b=CWLWbVOdVnqwkk00hIe/OED/MWA+rCiGVU/3RyXdMxW0SkiFdQeB9TaxqptPuxXw5R
         qic6RQwC1qui7+mhEfG8fsrn5ZjFZLDpoZnfF6VsYPwPfl5YZsY5ZLoD78wVzEwH71Qc
         58fkM2aZaMJlUsQzywmSuDOTtNGu0lavFaKZNsQtXS62O9i4iUCW6C1gDol8D8k5LRVI
         jKVvgCzTIh/Yuh2/tvjLdVtHsCCPEq1mFy2nY8Y//Jf4zIcrnkeYyCS/vk2jIptvGIYo
         zMfI4yly8LnwcSE8ceUFdxtKKIoY991Ygvd/aahCkpG30dxysDAY6FZ2ik+pWgOco4Hz
         DKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJfLW2fQZ/uxqGSHExbHgJWxzzlVlMHocALkAuynvcY=;
        b=ViT7QlkLAh3DjfTuxK+GGqunp8Zk2qT9o7IHRS6ht5DtrYGXvH0RvTIwKoocwdoqjX
         q/8dSjLdHVTIi3fqewPoul/WS4t7OWsrnMTVp2N1KRAgAc+xLIy8tgu5qHoz1SlNwUjt
         U09wqbxsFi3uRqvFopZCUk5520W5lNtxxzRHPGixb/gRN1qZLb41/MqMXAT6Lw3dEMeE
         rPVzfTYx2yG2KMgZ0LzXOaTqL9nLW10DsJR0anUayD8z/RGBv4ztti6F4YEMZTxbNSrY
         1pwLVDveDUPuQBjdxaSLMBljjb8ZcRIhpJIeSjREFOUocAsKp1fhYVj7qJqLc9tAUlt8
         kQSQ==
X-Gm-Message-State: AO0yUKXgWqOZ9SewuSJlJeYt/2FpRTLt0WnEDsbr7hxAiqTLldGQDY17
	NrZFHT1Vn6PpmYXmxjF1Zqw=
X-Google-Smtp-Source: AK7set+yVok98lOrcSECa3BsZjmtU0LELjDCVtxhiorBfQoHxXV0juVqfUk7TCVxizEDl0n/Bk+trA==
X-Received: by 2002:a50:8712:0:b0:4ac:d2b4:ec2c with SMTP id i18-20020a508712000000b004acd2b4ec2cmr3287764edb.29.1676398611496;
        Tue, 14 Feb 2023 10:16:51 -0800 (PST)
Received: from ?IPV6:2a02:a466:68ed:1:6a6:542:9341:4591? (2a02-a466-68ed-1-6a6-542-9341-4591.fixed6.kpn.net. [2a02:a466:68ed:1:6a6:542:9341:4591])
        by smtp.gmail.com with ESMTPSA id k26-20020a50c09a000000b004a21304f5a0sm8357801edf.72.2023.02.14.10.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 10:16:51 -0800 (PST)
Message-ID: <40fc9b0a-32de-81b7-ca51-62c4189d08b5@gmail.com>
Date: Tue, 14 Feb 2023 19:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH 0/3] libgpiod: add support for libgpiod v2
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20230208152541.136848-1-brgl@bgdev.pl>
 <b49ddb5c-3f15-2887-8f53-c6d73c93afa2@gmail.com>
 <CAMRc=McjbMaNk=DRYvq8deBUWtiHZQEs-8CTvGOSDSYQdBZojA@mail.gmail.com>
 <5e17e6d3-da7b-7222-bcf3-feef6c6fc776@gmail.com>
 <CAMRc=Md0SRAnbQ=A1qgwJ8thoApe6pOZ9xyim89bigfRkvxGJA@mail.gmail.com>
 <535761c1-07f0-b6fa-3df9-14db6690da82@gmail.com>
 <CACMJSevdEqhyyV1mDjA2xt5nm28T996aPjyOa69uy8Z-GsuckA@mail.gmail.com>
From: "Ferry Toth" <fntoth@gmail.com>
In-Reply-To: <CACMJSevdEqhyyV1mDjA2xt5nm28T996aPjyOa69uy8Z-GsuckA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Feb 2023 18:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101080

Hi

Op 14-02-2023 om 19:10 schreef Bartosz Golaszewski:
> On Tue, 14 Feb 2023 at 18:21, Ferry Toth <fntoth@gmail.com> wrote:
>> Op 14-02-2023 om 15:05 schreef Bartosz Golaszewski:
>>> On Mon, Feb 13, 2023 at 11:15 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>> Op 09-02-2023 om 20:57 schreef Bartosz Golaszewski:
>>>>> On Thu, Feb 9, 2023 at 8:26 PM Ferry Toth <fntoth@gmail.com> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Op 08-02-2023 om 16:25 schreef Bartosz Golaszewski:
>>>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>>
>>>>>>> We've just tagged the release candidate for libgpiod v2. This is a major
>>>>>>> release entirely overhauling the API in a backward incompatible way.
>>>>>> Thanks for creating this!
>>>>>>
>>>>>>> While this is not the final release yet, it's not likely to change much so
>>>>>>> I'd like to make it available in meta-openembedded to give it exposure to
>>>>>>> some testing. When we do release v2.0, it'll be just a matter of bumping the
>>>>>>> version.
>>>>>>>
>>>>>>> Currently no other package depends on libgpiod in meta-openembedded, so I'd
>>>>>>> like to avoid having two packages (libgpiod and libgpiod2). Instead let's
>>>>>>> provide recipes for both versions but keep them under the common libgpiod name
>>>>>>> as it's unlikely anyone would need both versions in a single system. This is
>>>>>>> after all a medium-sized project that shouldn't require too much work in order
>>>>>>> to port a user to the new major release.
>>>>>> Nevertheless there may be packages in other layers using it (meta-acpi,
>>>>>> meta-intel-edison). I think there will be a period where both may need
>>>>>> to coexist.
>>>>>>
>>>>> Can those layers just set the PREFERRED_VERSION?
>>>> Yes, but it doesn't the problem when one app needs v1 and the other
>>>> needs v2.
>>>>
>>> Yeah, this is what I'm trying to explain. How likely is it that the
>>> same system will use two versions of libgpiod at the same time? IMO
>>> highly unlikely because this is not gstreamer or some other huge
>>> project, it's a small-to-middle-sized library that's most likely ever
>>> only used by a single program or script on a given system.
>>>
>>> I'd prefer to not provide libgpiod and libgpiod2 packages but instea
>>> allow to alternate between them using PREFERRED_VERSION. If anyone
>>> complains, then we can rethink it.
>>
>> libgpiod2 is in Ubuntu Kinetic and is a dependency of openocd (> 1,1)
>> and eg25-amanager.
>>
> Wait what? libgpiod v2 is not out yet, what's up with ubuntu?
libgpiod2 (the package) is based on libgpiod 1.6.3 (the source)
>> Those packages will block libgpiod v2 from going in (that would be a
>> pity) until they are ported, or until they are dropped (a pity to have
>> your dependents dropped too).
>>
>> On a smaller scale, Intel Edison Arduino uses libgpiod in 2 apps. To
>> port them I need to figure what changed and how to fix them. Try some
>> example etc. because at this point in time there is not much example
>> code. But installing libgpiod v2 breaks some systemd services because v1
>> gets uninstalled. Luckily in my case it does not break boot.
> I will be more than happy to assist with porting! In fact I will look
> at porting openocd myself.
Thanks, I start a new thread if I get stuck
>>> It's not like we're changing the default version in any of the stable
>>> branches anyway.
>> True. I just like libs to change version when they have compatibility
>> breaks. But maybe that's just me.
>>
> I don't really care what distros do. I maintain the meta-openembedded
> recipe and only have interest in its versioning. Ubuntu can call it
> libgpiod2137 for what I care.

Of course. That was just an example, I didn't mean to hijack the discussion.

I just seems libgpiod 1.6.3 and 2.0-rc1 can not currently coexist (i.e. 
the packages can not be installed simultaneously). Or I tried (to modify 
the recipe) and did something wrong.

> Bart
>
>>> Bart
>>>
>>>
>>>
>>> 
>>>

