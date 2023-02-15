Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D86C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:03:43 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.5027.1676495015598773571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ITJqPcyi;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id be34so1014611oib.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 13:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7oV8njPdq5qAJ1iy5RTCfkBSaBBqXDZhf+lJNGbDdj8=;
        b=ITJqPcyiSv6K2ZizFn931ImIjhf7hVSMwo8FyY69eZlksnntj4j5Vt55amYYe1eUwf
         cpMbDFGAWvR1EASCIiKqXlC/tzkBSG5aZa94o+jDnfl3Kvfhd89FVttQwmXbimW5xDh4
         v2ekGTBvKhQP8/jIh8yLOEaQ+T+TgJ83GZNDPqzAtO8abK0Nd0p5BQZpNKenmi/nNrES
         pP0YIHcsB2sDiULqaOiZ05LB2fB7+tz3/RFZgi8edKfvZeDneOk8dNOaHb2Dh11yzBKe
         uGEuIsOuUIxKctumympsUApYHCpkn80Uauo2YX2iqUdkmcqTppJZJVRs0Xy1kR0jUptO
         KMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7oV8njPdq5qAJ1iy5RTCfkBSaBBqXDZhf+lJNGbDdj8=;
        b=ayFSN7EEJKXJPBDL6Ogj+BT77rD9E0V8BqXVIkwJcXqp/Evonusb64vndgweomK+l1
         Ar3pfH+OdTz/6g5AC6PT1nMJPb2i80LVpti2NdEBOU4tvx/j3FJtCZFv6xyTEp8wfPRu
         zDMM0FNQ6LpLerGe0/3L21MycS7tQi4TplfBa2JoN9lpnQc4ogKEwIfR+dhSboFLJayI
         4CoOuZFSJgTvENFet8XkgPDqc/OAVCqkOt/dLOTv6tzWwFRmgIRzxEAn0HZKxdkCHcVc
         paywOniA403mMQdCi49piT4jueBERla75SdULo70z/G73HxAalSubi4zzDqv9P87gTm3
         xE0A==
X-Gm-Message-State: AO0yUKVWebnN8lniWNVcGD5cz/fKhqR0ZXyVH4RJGkJ9C2eHSlDxXyrP
	vvOhxpk7GJkk36xH5c9INTKigxKbbuTJxppElnQ=
X-Google-Smtp-Source: AK7set8GvvB+cyDGK7DBBpeiZaVVo5DdDS8milzyL90dWq4EIHUUF27RRMh/Xrjzm/0E1lvfYdtNRms0dKntGUhdluA=
X-Received: by 2002:a05:6808:19a8:b0:37b:592b:ec39 with SMTP id
 bj40-20020a05680819a800b0037b592bec39mr344773oib.262.1676495014841; Wed, 15
 Feb 2023 13:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20230208131157.2564692-1-archana.polampalli@windriver.com>
 <1744195A99711A03.22975@lists.openembedded.org> <CA+chaQcMqU=V4BoAoBP=vjGfhhyhVXXb2wBBsqGUBZfo6+5HnQ@mail.gmail.com>
In-Reply-To: <CA+chaQcMqU=V4BoAoBP=vjGfhhyhVXXb2wBBsqGUBZfo6+5HnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Feb 2023 13:03:09 -0800
Message-ID: <CAMKF1soAdYkFja+KorJAyPe+xu8iwkUnhFi1n+MLjztpq+A8yg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] Nodejs: fix buildpaths warning
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>, 
	openembedded-devel@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101087

On Wed, Feb 15, 2023 at 1:00 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Wed, Feb 15, 2023 at 9:27 PM Martin Jansa via lists.openembedded.org <Martin.Jansa=gmail.com@lists.openembedded.org> wrote:
>>
>> This breaks the do_install when "shared" PACKAGECONFIG is enabled, see:
>>
>> http://errors.yoctoproject.org/Errors/Details/689959/
>
>
> Using baselib (just "lib") works and install respects prefix as well, so it ends in  image/usr/lib/libnode.so.108 as before and there are no TMPDIR warnings as well.

interesting. Is it installing everything in right places ?

>
>> On Wed, Feb 8, 2023 at 2:12 PM Polampalli, Archana <archana.polampalli@windriver.com> wrote:
>>>
>>> Correct libdir used at configure time to avoid packaging warnings
>>> WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:
>>> File /usr/bin/node in package nodejs contains reference to TMPDIR [buildpaths]
>>> File /usr/bin/.debug/node in package nodejs-dbg contains reference to TMPDIR
>>> File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains reference to TMPDIR [buildpaths]
>>> File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains reference to TMPDIR [buildpaths]
>>> File /usr/include/node/config.gypi in package nodejs-dev contains reference to TMPDIR [buildpaths]
>>>
>>> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
>>> ---
>>>  meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>>> index e96913e56..04a80a6b8 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>>> @@ -145,7 +145,7 @@ do_configure () {
>>>                 --without-etw \
>>>                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
>>>                 --dest-os=linux \
>>> -               --libdir=${D}${libdir} \
>>> +               --libdir=${libdir} \
>>>                 ${ARCHFLAGS} \
>>>                 ${PACKAGECONFIG_CONFARGS}
>>>  }
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101085): https://lists.openembedded.org/g/openembedded-devel/message/101085
> Mute This Topic: https://lists.openembedded.org/mt/96829436/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

