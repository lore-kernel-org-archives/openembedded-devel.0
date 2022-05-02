Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD47DC433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 19:12:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.1598.1651518773513530296
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 12:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iHn+AXIC;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id iq10so13483048pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iUwZsm2Xr+wN5E51wwT1Y+drFeGlbXEvNZ5fczVTqm4=;
        b=iHn+AXICedplYaomO53PHLtE/6liX6DA67BgBL0QotZAW+51IHLnMrwqmngPk35m/A
         ztd+c7n9r8Cu0v+mU82BzsEsRtH5abw5U7LS8Yp2FgNZ+6IjKksVQkWU3FlwEpZ5lIAM
         YIPZqhgd9zC9+VTJqQzagHezjjwGYJFoki2POQ9wqkymRSBGRBHC+CpTHt9hUKLCHPgq
         cZiNVZkPRu3m5dsNb95tdYNDUCNWukjr4O8TqeVvFyEno4E8MC7xFLyxi8Ox/JPcxHxh
         CYgOXnlv0JuT93WTUzp2JSa2Tm4rdsYncRvkPcmQ6ZgFojKIQ5051IWhGpIJ3qYrtoiG
         xctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iUwZsm2Xr+wN5E51wwT1Y+drFeGlbXEvNZ5fczVTqm4=;
        b=fT1P6Pb2Zt9BeuG03aLln/PEEQ/2n7i3J8OO+IOMQF+5LEVamhAnG/5UikKxp6Ouox
         B01+T0anMz0XiMecJfylDKL+LkduGcGskChDfyBZgdpVGyU2QW592OZfqMeyEFmwTb2e
         DSeLg4h0OWxsxRL3qzvtuMhgZMn5NXCKaSiQSL2aPqd3I2kfcrlwbo/yxLTwyauIZIJ4
         VVptwKIZR2hpUGojb02quajx3ZP0A0PmAnUqEJkMZmwCsrSCSzzNbJf4yeQSQd/RpAuM
         SFR+fS8Fb//72nzNDSga0ln5P4WdfWq4MHB9UvmBrQcdni1QTIuzO9pYkZuKAHF/TYnm
         crFA==
X-Gm-Message-State: AOAM531iewNjiF7ewuUZKp7rQZOgMCjZkDYspdkdKGPtMZ9xzuQboCzK
	PXZvki7nnycUdNg/zl0qkbk=
X-Google-Smtp-Source: 
 ABdhPJwq9oYhxUtiDGtXBf2NlOvib06zvxJBD165tbw8zVGNeMTU4JMMFhdVNeP5Rpv00gAVyafpzQ==
X-Received: by 2002:a17:90b:3441:b0:1da:4030:c4ec with SMTP id
 lj1-20020a17090b344100b001da4030c4ecmr694066pjb.33.1651518772962;
        Mon, 02 May 2022 12:12:52 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:33c6:b9d3:2a7b:1418?
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a17090aea0c00b001d9e3b0e10fsm59659pjy.16.2022.05.02.12.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 12:12:52 -0700 (PDT)
Message-ID: <adc95993-249c-7182-3581-1f9cb7fbd8aa@gmail.com>
Date: Mon, 2 May 2022 12:12:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [oe] [meta-oe][v2][PATCH 01/10] crda: move to a dynamic-layer for
 python
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220502143345.1500852-1-akuster808@gmail.com>
 <CAMKF1soiTT-UvMVbekXAAojAO5AgRiP2YOiTt8T0ZSgF_qTvzA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: 
 <CAMKF1soiTT-UvMVbekXAAojAO5AgRiP2YOiTt8T0ZSgF_qTvzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 19:12:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96942



On 5/2/22 10:53, Khem Raj wrote:
> still no luck see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1712/steps/12/logs/stdio

So what am I not seeing?


INFO: Summary of results:
INFO:
INFO: meta-oe ... PASS
INFO: meta-multimedia ... PASS
INFO: meta-python ... PASS
INFO: meta-xfce ... PASS
INFO: meta-gnome ... FAIL

Nothing PROVIDES 'python3-lxml-native' (but 
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/yelp/yelp-tools_42.0.bb 
DEPENDS on or otherwise requires it). Close matches:

INFO: meta-filesystems ... PASS
INFO: meta-initramfs ... PASS
INFO: meta-perl ... PASS
INFO: meta-webserver ... PASS
INFO: meta-networking ... PASS

Did I slip in a change for meta-gnome?

-armin


>
>
> On Mon, May 2, 2022 at 7:33 AM Armin Kuster <akuster808@gmail.com> wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch      | 0
>>   .../crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch      | 0
>>   .../recipes-connectivity/crda/crda/crda-4.14-python-3.patch       | 0
>>   .../crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch         | 0
>>   .../crda/crda/fix-gcc-6-unused-variables.patch                    | 0
>>   .../crda/crda/fix-issues-when-USE_OPENSSL-1.patch                 | 0
>>   .../crda/crda/fix-linking-of-libraries-used-by-reglib.patch       | 0
>>   .../meta-python}/recipes-connectivity/crda/crda/make.patch        | 0
>>   .../crda/crda/use-target-word-size-instead-of-host-s.patch        | 0
>>   .../meta-python}/recipes-connectivity/crda/crda_3.18.bb           | 0
>>   10 files changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/crda-4.14-python-3.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/make.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch (100%)
>>   rename meta-networking/{ => dynamic-layers/meta-python}/recipes-connectivity/crda/crda_3.18.bb (100%)
>>
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Make-alpha2-to-be-3-characters-long.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/0001-Makefile-respect-LDFLAGS-for-libreg.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/crda-4.14-python-3.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/do-not-run-ldconfig-if-destdir-is-set.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-gcc-6-unused-variables.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-issues-when-USE_OPENSSL-1.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/make.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/make.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/make.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda/use-target-word-size-instead-of-host-s.patch
>> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
>> similarity index 100%
>> rename from meta-networking/recipes-connectivity/crda/crda_3.18.bb
>> rename to meta-networking/dynamic-layers/meta-python/recipes-connectivity/crda/crda_3.18.bb
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96930): https://lists.openembedded.org/g/openembedded-devel/message/96930
>> Mute This Topic: https://lists.openembedded.org/mt/90836456/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


