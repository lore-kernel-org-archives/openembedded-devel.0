Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EACC001DB
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 14:34:03 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.44292.1691764439265896437
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 07:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jBWoP2kf;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1c0fff40ec6so1262856fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764438; x=1692369238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1MiB7bwIEQUe9PxPl189fj2Yhu3G0OdcE8uk6ovoxM=;
        b=jBWoP2kfTE7TCOjYn4wEEcuGx/2XpHkU3Q2SgsnrYQDhAPXD8J3sSIOKgGmKJhJq9B
         G34RfqWZv6BugX+2CW2W6ZkXvRFLWu19HbE0TPGRzmWdH1ziFE8/ryK/Sfho9mH/5CeG
         tUrX2lbN8OAQ8vXKgcJVBrYVTuVIQYGegLxEU/VWGssTV1mvgkd57I85QDhloG+9UBgT
         Lrpqx6WQ/dzGvzEn8Mfqn7FcL5n9pm8Pvw3b+ZR+XEI69+atMqCrRVErCP3M2515CEGn
         P5QCFTiuWkoFmQhh7Vae+2MkV30oBHq1pFroF/27Bq0aXMlR198YPkeT9q83ar/O1G3k
         n5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764438; x=1692369238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W1MiB7bwIEQUe9PxPl189fj2Yhu3G0OdcE8uk6ovoxM=;
        b=PgXDx5UJ6Z5GffirpXxsHanVeoaAKSGGwvZT6kBr9blqhF/EEKzWqDY+bwz+aREMS7
         o5Qo5Vku2i0z2T65Qnafr7i0gYgIBOrBMKIafGkMl5cCheMS8hpDSd9U4+ctBDF8hmvu
         VFmO/N4HLVyeRpIoE8dw7oGoeStyiNG9yp7biTS1bTsp4WphMGcFQQf3knhPH/rwP5bT
         Z2RyZd8FJgGKLjwdCLxTWckMem0xuwYrAYnhYHGqd2ytr7/bD6TvOkZ2nmL+7CkhFAcO
         IxcOgIlFJEXtbL/pb5r5SeZNBaaomPS3dYkluLhChna1fq71Yx7Sos4hNUhpWLINK5v5
         j2nA==
X-Gm-Message-State: AOJu0YyKqis0JVMaVq8F4iVFI3omKu5ZHuKx/n3F18Ya2uHo1PTRi5JD
	QUF57R0HfrvNq3bAbR6vvPI=
X-Google-Smtp-Source: AGHT+IHq5SWjnJWIkT27xLwKAz6jRfacfUSlapSQVv8FB2/UhhyiG1NuFd1bbtimVB+LlVKxXYqvaw==
X-Received: by 2002:a05:6870:9a0c:b0:1b0:222f:9cda with SMTP id fo12-20020a0568709a0c00b001b0222f9cdamr2612532oab.0.1691764438352;
        Fri, 11 Aug 2023 07:33:58 -0700 (PDT)
Received: from [192.168.19.123] (c-73-90-186-127.hsd1.ca.comcast.net. [73.90.186.127])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a031000b002696aeb72e5sm5690426pje.2.2023.08.11.07.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 07:33:57 -0700 (PDT)
Message-ID: <8d484356-f433-f210-4577-0ef7310bca3a@gmail.com>
Date: Fri, 11 Aug 2023 10:33:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] lmsensors: do not pull in
 unneeded perl modules for run-time dependencies
Content-Language: en-US
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <1777F944D33CE024.19936@lists.openembedded.org>
 <8a52ceed-e4d5-6008-2995-e1c28955575d@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <8a52ceed-e4d5-6008-2995-e1c28955575d@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 14:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104338



On 8/10/23 2:56 PM, Randy MacLeod wrote:
> On 2023-08-03 16:24, Randy MacLeod via lists.openembedded.org wrote:
>> From: Beniamin Sandu<beniaminsandu@gmail.com>
>>
>> Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
>> index f821cdaf4..aba5ab587 100644
>> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
>> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
>> @@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = "lmsensors-config-fancontrol"
>>   # sensors-detect script files
>>   FILES:${PN}-sensorsdetect = "${sbindir}/sensors-detect"
>>   FILES:${PN}-sensorsdetect-doc = "${mandir}/man8/sensors-detect.8"
>> -RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-modules"
>> +RDEPENDS:${PN}-sensorsdetect = "${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
>> +	perl-module-strict perl-module-constant"
>>   
>>   # sensors-conf-convert script files
>>   FILES:${PN}-sensorsconfconvert = "${bindir}/sensors-conf-convert"
>>   FILES:${PN}-sensorsconfconvert-doc = "${mandir}/man8/sensors-conf-convert.8"
>> -RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-modules"
>> +RDEPENDS:${PN}-sensorsconfconvert = "${PN}-sensors perl perl-module-strict perl-module-vars"
>>   
>>   # pwmconfig script files
>>   FILES:${PN}-pwmconfig = "${sbindir}/pwmconfig"
>
>
> Armin,
>
> I see this lmsensors cherry-pick merged to mickledore a week ago but 
> it didn't land in kirkstone yet:
>
Yeah, looks like I missed it.

Its staged now.

Thanks,
Armin
>
> https://git.openembedded.org/meta-openembedded/commit/?h=mickledore&id=75cf318cef3b4ee81fad2782cf063ecd69ba8842
> https://git.openembedded.org/meta-openembedded/log/?h=kirkstone
>
> Thanks,
>
> ../Randy
>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104224):https://lists.openembedded.org/g/openembedded-devel/message/104224
>> Mute This Topic:https://lists.openembedded.org/mt/100534246/3616765
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


