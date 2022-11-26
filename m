Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA41CC4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 16:05:16 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.72934.1669478708285793316
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 08:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ct82eOVs;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id a27so4123781qtw.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 08:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBoTHzDcmJ+tv29nWIu+N4atu4qo7AF5dbW8d8rPDxo=;
        b=ct82eOVs6gElQHrfhkaeif7qsZZwp1oeIgIVkUbZhJ+6iytxiB9+nOtTXbzZHQNuZX
         Y75DcDypWRiJZ4XYJ/fQTfzczHXDQSm0imIPPRNfJ6y9wL4/wWZW9gHVyN8w8T1tVBFO
         KVFL8GcEX1EwzcM4FCWcIh7kFHD0hqXxdf0ip0vyEG7vvjp/EPTRZaTDf+ubDHRZw5s/
         0Ct2TM66FK8eU/zJdrhvW42GfE/HijGcKCVrd+5PA9gOBJXBlq4Kfh+KT3sNP8KUWz+L
         dBqSgNaZhbI7SSSWPKjURuVwUCo5lOO5gmb2yGXbBNufnJtsu2TdGHAPtRoVi3nDfI94
         JIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBoTHzDcmJ+tv29nWIu+N4atu4qo7AF5dbW8d8rPDxo=;
        b=JZnyzQstNVf8D7k/8aPxFw6GBVMihGs5bpYJlR09g1l5liohBWrVntgMIrdZG8ZD5R
         3d3BK2CPohXSlWOvuFPnV7a+aGGdM8o98DfYF3CexcboC2h6dBQuY2apXh45bZRhCuU1
         hXqKjek87r319jgyGNCv/n4siW2SpK655ZtoXBxEnTEGCQR//DUISn3OHjtk0YMppmrb
         gOENQd2brejHDJenJTgb422TkTu8xu73QOvcqTBcvkDZrIeQWz6+utr50ivKP48L6tRc
         FZWIISZYSONGHSdNsCWTotI7kIkweP58ksRABNW55wwVmCXK5QUdLdlxdIDWuv0zFCAW
         HTMg==
X-Gm-Message-State: ANoB5plgOX/B+4b2jIpdyvncbGLKAXWSk4xhUBX8qRpKQPzJ/LQQGBi6
	8sB/Ufp8kS5EnuorBd4z2lg=
X-Google-Smtp-Source: AA0mqf7A2YNrkPfoF44/5Q9X0Eb4zct0jucM9vn4JzOV9+AR9ZGQ0A1iUC5QSN3fUja5Pg25cENoSQ==
X-Received: by 2002:ac8:70c7:0:b0:3a5:6d59:852e with SMTP id g7-20020ac870c7000000b003a56d59852emr41029760qtp.334.1669478707040;
        Sat, 26 Nov 2022 08:05:07 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:aba1:3501:519f:4a6e? ([2600:1700:9190:ba10:aba1:3501:519f:4a6e])
        by smtp.gmail.com with ESMTPSA id z127-20020a379785000000b006eed75805a2sm4742832qkd.126.2022.11.26.08.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 08:05:05 -0800 (PST)
Message-ID: <b10b1591-933f-0ac3-07bb-d80a490ddd1d@gmail.com>
Date: Sat, 26 Nov 2022 11:05:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>,
 openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com>
 <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 16:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99750



On 11/24/22 2:18 PM, Martin Jansa wrote:
> On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod 
> <randy.macleod@windriver.com> wrote:
>
>     Add Armin to ensure he seems this once he recovers from US
>     Thanksgiving indulgences.
>
>     On 2022-11-24 12:05, Martin Jansa wrote:
>>     I see this is now queued in kirkstone-next
>>     https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f
>>     <https://urldefense.com/v3/__https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$>
>>
>>     I see bunch of recipes failing since this upgrade landed in
>>     master, mostly due to npm dependency resolution being more strict
>>     now and builds failing with
>>
>>     npm ERR! code ERESOLVE
>>     npm ERR! ERESOLVE could not resolve
>>     ...
>>     npm ERR! Fix the upstream dependency conflict, or retry
>>     npm ERR! this command with --force, or --legacy-peer-deps
>>     npm ERR! to accept an incorrect (and potentially broken)
>>     dependency resolution.
>>
>>     Can we please delay backporting to kirkstone and langdale a bit more?
>
>     Seconded!
>

Noted. will remove from kirkstone-next
-armin
>
>     What recipes encounters this bug?
>
>
> I've seen it in ~10 recipes, but all are internal and not available in 
> any public layer. I've added --force to them as work around to see how 
> many other recipes will start failing now.
>
> There is one more failing from public layer:
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-webos/localization-tool/localization-tool-native.bb
> but that's different issue, caused by the sysroot_stage_all:append() 
> and new nodejs now installing node_gyp_bins with symlink to python3 
> causing:
>
> ERROR: localization-tool-native-1.7.0-r7 do_populate_sysroot: sstate 
> found an absolute path symlink 
> /OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/sysroot-destdir/OE/work/x86_64-linux/localization-tool-native/1.7.0-r7/recipe-sysroot-native/opt/js-loctool/node_modules/node-expat/build/node_gyp_bins/python3 
> pointing at /OE/hosttools/python3. Please replace this with a relative 
> link.
>
> But I haven't narrowed it down yet to see which exact nodejs/npm 
> change caused this. And yes this recipe has other issues as well and 
> doesn't even use npm.bbclass nor npmsw:// fetcher.
>
>>
>>     And if others are seeing similar failures please share them here
>>     as well.
>>
>>     The older nodejs was using npm@8.5.0, now its npm@8.19.2 more
>>     details about this change in behavior from 8.6.0 in
>>     https://github.com/npm/cli/issues/4998
>>     <https://urldefense.com/v3/__https://github.com/npm/cli/issues/4998__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMZmTsAyk$>
>
>
>     Someone in the linked issue thread said:
>
>            "We rolled back to Node v16.15.0, which has a working
>     version of npm 8.5.5."
>
>     Should we drop the 16.18.x update and stick with 16.15.1 for
>     kirkstone/langdale?
>
>
> I don't mind keeping it in master, once I figure out how to fix it in 
> master I wouldn't mind it getting backported to kirkstone and langdale 
> as well.
>
> This was just warning that this isn't just simple minor upgrade for 
> some and at least some longer delay would be useful.
>
>
>     For master, I'd like to update to 18, 19, or ideally 20 if it's
>     available before the end of M3.
>
>     Martin,
>
>     What version of node make sense to you for master?
>
>
> I don't have strong opinion, we have a lot of ugly npm/nodejs recipes 
> in webOS which need to be re-worked first, independently on nodejs 
> version used.
>
>     Do you agree that we should leave master on 16.18.x and people
>     should fix their
>     'broken' npm dependencies?
>
>
> Yes, from that npm bug it looks, that the old behavior was even worse 
> than the current clear failure and the --force as work around seems to 
> work reasonably well, so I don't mind keeping it in master and even 
> eventually backporting it to kirkstone a bit later.
>
> Cheers,


