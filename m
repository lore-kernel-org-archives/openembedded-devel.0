Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD31D20682
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 23:01:32 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10601.1729033289530405712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 16:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YUm6bs8n;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d5aedd177so3075489f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 16:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1729033288; x=1729638088; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bz/cMvzbUe+gwVZtM/YEg0Jn3NyEslUKfK6BcvUQbCM=;
        b=YUm6bs8naihJhQCg/XN+cBJn0am0RU0sjfJbFYy3CcjcqI+G7jEWiiyQxVx4Xpll8l
         RIY2aOyM+dQR+Gx89E8S2Q0UAkZ9uAaJgjZ+bmRPXffUCeKK4WJARxZuXUqa04eC2xq6
         chXOvhQmGErjoIN7aNEN7y25oK4ERE3xZuJMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729033288; x=1729638088;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz/cMvzbUe+gwVZtM/YEg0Jn3NyEslUKfK6BcvUQbCM=;
        b=N0dw8Niw4UYJFxy6Cr0XO8N3yAYQiFONsT+M8xsrlZUuhKSHCCbUOGn7ICMPvcK67n
         rz4fbmKnrrAtlezvS3XMZCuvJEFZGyE+5WOMqiX6pclfcuZmvHNqufftHgb7sw2nKzqT
         qC5R+5M4JbE7eerVBNgP12S7pRQ4FS8JVqcNsQ3+MI16lNqgf52G3uh1rwq6KzLj0sZo
         6hLVjhOnjlBOl6cJYg3abDdnOYPwoO3ijf8TmaaoJAVFm4YIfhOPx8hEZAEl+b4ec425
         Z3nJY4EyYt/1pvN4dx3r1YFasdyfkrnFuYPl1yCdfB07sHs7Vq3qssR3Du2N3DYJZFz6
         ux2g==
X-Gm-Message-State: AOJu0YxCSCtwW43g6At2ef+5RsuiRkHysuJofz8ivopzlqT/XQ3Xmn7D
	NyJ7Jy3gDcT0F508zdmBE+1wPoSnGq6dZ089hgSNSDJfRDygUqXpWiu5M3TBb2g=
X-Google-Smtp-Source: AGHT+IHwrniodeWIz25yO7Kk8o/67QEJTn8qRaYSoZLjXO9jY49tkt+uSoidGUEzEo5UlBIqlP+sTQ==
X-Received: by 2002:a5d:6b83:0:b0:37d:395a:bb7 with SMTP id ffacd0b85a97d-37d551fc5ffmr10305786f8f.31.1729033287364;
        Tue, 15 Oct 2024 16:01:27 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a04asm2727782f8f.8.2024.10.15.16.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 16:01:27 -0700 (PDT)
Message-ID: <ba2ed216-2503-43c2-b9eb-cda2b56f7b57@smile.fr>
Date: Wed, 16 Oct 2024 01:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20241011151023.1516957-1-yoann.congal@smile.fr>
 <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
 <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com>
 <CAMKF1sqTxHSL3yhb0Y486YDB56jgsRj-Y9WhpOCYXomV1CKEhg@mail.gmail.com>
 <CAMSfU+5RCkCT+VytkR+PN_pv60O+wg5Zr0yOg_XjSqW9D7R6zQ@mail.gmail.com>
 <CAMKF1spOZbaabZrRkTq2dfRBeQempvhVhh+BAQzuDTez8zwpYg@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAMKF1spOZbaabZrRkTq2dfRBeQempvhVhh+BAQzuDTez8zwpYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 23:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112931



Le 11/10/2024 à 18:39, Khem Raj a écrit :
> On Fri, Oct 11, 2024 at 8:51 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>> Le ven. 11 oct. 2024 à 17:37, Khem Raj <raj.khem@gmail.com> a écrit :
>>>
>>> On Fri, Oct 11, 2024 at 8:34 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>>>>
>>>>
>>>>
>>>> Le ven. 11 oct. 2024 à 17:15, Khem Raj <raj.khem@gmail.com> a écrit :
>>>>>
>>>>> On Fri, Oct 11, 2024 at 8:10 AM Yoann Congal via
>>>>> lists.openembedded.org <yoann.congal=smile.fr@lists.openembedded.org>
>>>>> wrote:
>>>>>>
>>>>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>>>>
>>>>>> gimptool can be used in GIMP plugin compilation. It would make more
>>>>>> sense as a native tool. It also contains the sysroot path which break
>>>>>> build with buildpaths QA error. Remove it from target packages.
>>>>>>
>>>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>>>> ---
>>>>>>  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
>>>>>>  1 file changed, 7 insertions(+)
>>>>>>
>>>>>> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>>>>> index a17e03b103..8755af94a9 100644
>>>>>> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>>>>> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
>>>>>> @@ -70,6 +70,13 @@ do_compile:prepend() {
>>>>>>      export GEGL_PATH=`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'`
>>>>>>  }
>>>>>>
>>>>>> +do_install:append:class-target() {
>>>>>> +    # gimptool can be used in GIMP plugin compilation. It would make more sense
>>>>>> +    # as a native tool. It also contains the sysroot path which break build
>>>>>> +    # with buildpaths QA error. Remove it from target packages.
>>>>>> +    rm ${D}/${bindir}/gimptool-2.0
>>>>>> +}
>>>>>
>>>>> it does mean we can't build plugins in a usecase where an on-device
>>>>> SDK is being used, even though it is a rare usecase.
>>>>> Can we explore a way to omit the sysroot from being emitted into the
>>>>> target version of gimptool ?
>>>>
>>>>
>>>> Sure!
>>>>
>>>> Right now, Host CC is embedded in the target binary as a last-resort default to make gimptool output a reasonable CC for gimp plugins compilation.
>>>> I don't see how to provide a good value to put there unless I can get the CC that will be used in the target SDK? (I don't think I can)
>>>>
>>>
>>> Perhaps replacing instances of SYSROOT with target exec_prefix in CC
>>> emitted to binary would be a workable solution.
>>
>>
>> For Poky/qemux86-64, that would output
>> CC="x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/usr"
>>
>> Does this look correct to you? (I've never tried the target SDK) Is the compiler really called "x86_64-poky-linux-gcc" (or just "gcc")?
>>
> 
> Just remove the --sysroot option completely.

Here is a v2 around this idea :
https://lists.openembedded.org/g/openembedded-devel/message/112930

> 
>>>
>>>> What do you think about removing this last-resort default with a patch? That would make gimptool dependent on a correct CC being provided to it (but the target SDK should already do that)
>>>>
>>>>>
>>>>>> +
>>>>>>  FILES:${PN}  += "${datadir}/metainfo"
>>>>>>
>>>>>>  RDEPENDS:${PN} += "mypaint-brushes-1.0"
>>>>>>
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#112807): https://lists.openembedded.org/g/openembedded-devel/message/112807
>>>>>> Mute This Topic: https://lists.openembedded.org/mt/108950447/1997914
>>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>>
>>>>
>>>>
>>>>
>>>> --
>>>> Yoann Congal
>>>> Smile ECS - Tech expert
>>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS - Tech expert

-- 
Yoann Congal
Smile ECS - Tech Expert

