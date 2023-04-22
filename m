Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCFAC7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 19:14:40 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.14302.1682190878893155890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Apr 2023 12:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=akBfMBC8;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-b95fb433f59so5251537276.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682190878; x=1684782878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfavuoP2IxTJh9j8Miyer6aH5Zs10Y1uxzm/3eYW2XI=;
        b=akBfMBC8NDCvniLSKj5VKCtPCohtIiF5ZpO7MrMJNDpDc6RkxTeUqiBNlkU81rL036
         dO4GZYcqa1qrF1lCG1NeJFVR7D8hj2bRWYhfv1ccf0Oncq49e0FIqFMAzYZb8JEx5TNp
         ik3+Zob8t7Rf8ysgmD/ZLqJxs50/MOLZpxgs/qY2A4VNQN2UpCUcAs0ZpiyJNUG4AgpX
         J6v5oJduzF5ybXP5fP1f8sWGjjaMfJNLzYPp9fpObc2LMizuUcqaCVItjIyVJmvm6deB
         UTa6Ye2OqzDS5Gov0ao7QEnVq1MnimjSggnLG3ANSo8bHasK46lUVF9PcEWOu0/kUOsy
         Kutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682190878; x=1684782878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfavuoP2IxTJh9j8Miyer6aH5Zs10Y1uxzm/3eYW2XI=;
        b=SFQeA/VB8NV9QzhyXyK0koj75f1C03+zRly5eqiPxbnxoEhzq5/6PkJjr3/ATGAYgc
         qSo31Z16qwZz4o5Ifs91Ll7L5lw2+viGnMgcAa2LAsWK4HCu+/pARpWGK0Rf6dvssxUp
         TgNrtAeYLhuZs1Tz16B8Rl+4BIZNbs8FoxjwBTjzx8MXBZZCTLr+giFaRKnlve6asw6Z
         Jn2ApPosxR3xDxfE0PKuuV+S72aSMtZJ4pzGQBq8xr66ocAnLUDeiiTNHF+hxNSFGYII
         MZx4k6btBp98+FnfxErMSy3b7JQHA+hLiePvvuWsMj9Pq7vtdGKpf++G54laYT23wi8e
         pCxg==
X-Gm-Message-State: AAQBX9eBu9N4qhX8VimOp9WXyGOmm8csAUAdt3VZjEIL5YCNN+hGKn30
	Dve/GMUVuz4wpXVR4r+jtcM=
X-Google-Smtp-Source: AKy350bbtA+X2bKX4g88ZqQLw+oGDRwm8nIczMtif8VPhsqqX8QoFub8yWTx9PWv3KjhPYUdekbZKw==
X-Received: by 2002:a05:6902:154b:b0:b92:5b0d:5164 with SMTP id r11-20020a056902154b00b00b925b0d5164mr6833660ybu.29.1682190877911;
        Sat, 22 Apr 2023 12:14:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:e657:faa7:932f:a273? ([2600:1700:9190:ba10:e657:faa7:932f:a273])
        by smtp.gmail.com with ESMTPSA id j129-20020a819287000000b0054c0a8ceb2fsm1793838ywg.28.2023.04.22.12.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Apr 2023 12:14:37 -0700 (PDT)
Message-ID: <82bcdce6-e833-d2d0-aed6-6e627d81424d@gmail.com>
Date: Sat, 22 Apr 2023 15:14:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [kirkstone][meta-oe][PATCH] redis: upgrade 7.0.9 -> 7.0.10
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>,
 Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230322082921.2464069-1-changqing.li@windriver.com>
 <ad2ad401-b01c-ad73-7a93-a699af8a9fd3@gmail.com>
 <17ccc23e-537d-ffa6-562a-021633894a08@windriver.com>
 <CA+chaQdwfcR9gCfY-5wOSvA8WWP9xDq2NvdbeBGp7SHAsh_X9g@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <CA+chaQdwfcR9gCfY-5wOSvA8WWP9xDq2NvdbeBGp7SHAsh_X9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Apr 2023 19:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102147



On 4/21/23 7:04 AM, Martin Jansa wrote:
> What's the status of these changes? I don't see them in 
> kirkstone-next/langdale-next nor contrib/stable/kirkstone-nut 
> contrib/stable/langdale-nut

My apologies. I had a question if Master was affected and it was so I 
forgot to keep an eye on the changes in Master for this package.

Thanks for the reminder.

- armin
>
> The current meta-oe/kirkstone redis fails since 7.0.9 upgrade with:
>
> ERROR: redis-7.0.9-r0 do_patch: Fuzz detected:
> Applying patch GNU_SOURCE.patch
> patching file src/zmalloc.c
> Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).
> ERROR: redis-7.0.9-r0 do_patch: QA Issue: Patch log indicates that 
> patches do not apply cleanly. [patch-fuzz]
>
> And I don't see this issue fixed here.
>
> I'll send separate patch to fix just patch-fuzz.
>
> On Thu, Mar 23, 2023 at 2:33 AM Changqing Li 
> <changqing.li@eng.windriver.com> wrote:
>
>
>     On 3/22/23 19:23, akuster808 wrote:
>     > CAUTION: This email comes from a non Wind River email account!
>     > Do not click links or open attachments unless you recognize the
>     sender
>     > and know the content is safe.
>     >
>     > On 3/22/23 4:29 AM, Changqing Li wrote:
>     >> From: Changqing Li <changqing.li@windriver.com>
>     >>
>     >> Upgrade urgency: SECURITY, contains fixes to security issues.
>     >>
>     >> Security Fixes:
>     >>
>     >> (CVE-2023-28425) Specially crafted MSETNX command can lead to
>     >> assertion and denial-of-service
>     >
>     > Was this sent to master?
>
>     Yes,  It is another patch, because  the context of the changed
>     line is a
>     little different.
>
>     Regards
>
>     Changqing
>
>     >>
>     >> Bug Fixes
>     >> Large blocks of replica client output buffer may lead to PSYNC
>     loops
>     >> and unnecessary memory usage (#11666)
>     >> Fix CLIENT REPLY OFF|SKIP to not silence push notifications
>     (#11875)
>     >> Trim excessive memory usage in stream nodes when exceeding
>     >> stream-node-max-bytes (#11885)
>     >> Fix module RM_Call commands failing with OOM when maxmemory is
>     >> changed to zero (#11319)
>     >>
>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     >> ---
>     >>   .../recipes-extended/redis/{redis_7.0.9.bb
>     <http://redis_7.0.9.bb> => redis_7.0.10.bb
>     <http://redis_7.0.10.bb>} | 2 +-
>     >>   1 file changed, 1 insertion(+), 1 deletion(-)
>     >>   rename meta-oe/recipes-extended/redis/{redis_7.0.9.bb
>     <http://redis_7.0.9.bb> =>
>     >> redis_7.0.10.bb <http://redis_7.0.10.bb>} (96%)
>     >>
>     >> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
>     <http://redis_7.0.9.bb>
>     >> b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
>     <http://redis_7.0.10.bb>
>     >> similarity index 96%
>     >> rename from meta-oe/recipes-extended/redis/redis_7.0.9.bb
>     <http://redis_7.0.9.bb>
>     >> rename to meta-oe/recipes-extended/redis/redis_7.0.10.bb
>     <http://redis_7.0.10.bb>
>     >> index e4b2d45a4..5f972033f 100644
>     >> --- a/meta-oe/recipes-extended/redis/redis_7.0.9.bb
>     <http://redis_7.0.9.bb>
>     >> +++ b/meta-oe/recipes-extended/redis/redis_7.0.10.bb
>     <http://redis_7.0.10.bb>
>     >> @@ -19,7 +19,7 @@ SRC_URI =
>     >> "http://download.redis.io/releases/${BP}.tar.gz
>     <http://download.redis.io/releases/$%7BBP%7D.tar.gz> \
>     >>              file://GNU_SOURCE.patch \
>     >> file://0006-Define-correct-gregs-for-RISCV32.patch \
>     >>              "
>     >> -SRC_URI[sha256sum] =
>     >> "f77135c2a47c9151d4028bfea3b34470ab4d324d1484f79a84c6f32a3cfb9f65"
>     >> +SRC_URI[sha256sum] =
>     >> "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
>     >>
>     >>   inherit autotools-brokensep update-rc.d systemd useradd
>     >>
>     >>
>     >>
>     >>
>     >
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#101640):
>     https://lists.openembedded.org/g/openembedded-devel/message/101640
>     Mute This Topic: https://lists.openembedded.org/mt/97773847/3617156
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [Martin.Jansa@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


