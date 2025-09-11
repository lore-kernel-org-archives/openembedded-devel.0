Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2CCCA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 07:03:57 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.40087.1757574228155675415
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 00:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a2ANO+3m;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-61cb4374d2fso525158a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 00:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757574226; x=1758179026; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFBtTSJUS1N/O+UwpSqm2yBWoO/AAlJRjqo65zRHRCo=;
        b=a2ANO+3m7nQL4kKI0SZMVz/Mm833AMtw7gUL27OCTwKL/G9nUvMesDBsoakfnoxQbs
         yhA/hZFEIdFLwmR3sw8tYnKbqU+9ldobIFJs/LfiZd3eEuBlv3GmbrgLTYDVZ7YnpEz8
         1F6cRsE8DyO49rNlrDq1EL1SZDAVXJYJ29c1LjukDY2ljB29vgZjVnEMGwDObXeiguU6
         jEe5vyeyKE5LO27R3ubw79VFkZBSYkPL1bjxJ8H6d9HJc8Uc1uFia4mCzjEekSCv1+83
         jFbC/cANRQQV+EHyiMiYR6hyM+ke91RYXWg2t8f02jSQR+05MGOs41+JlxNiDpYQr0Zz
         OSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574226; x=1758179026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFBtTSJUS1N/O+UwpSqm2yBWoO/AAlJRjqo65zRHRCo=;
        b=Nf7Cv1b/eJsuvwZ3fBddK99gULwHuR0xRrrZaSNZygE+mswNiH3VCKGr3EtQQddw/F
         7e8k2Z0hgdcPq2snh6ZbOdaX32h99qQzyepyOdt5yPKNbrE64g/vHNznNqQuVJXDBaHq
         oDqVM+jypJUs0MzMYCs5RzYNDDugyPp9IFLKs0cBeh0sidD+qaRmOlEpz85glPvd28wb
         t0oafX4ekK8GWojI6t3O9FaZnVU3g5abDtiSUZ9US4YvdeEUWzAl3/z5YLShPbenkSsY
         jUfl8CN71KFKvloXQ4yhpG2lVOqviaEmkiZZQ+Z3v7uKWnzmpN6y4DNKnGBe3hzyofPS
         BICw==
X-Forwarded-Encrypted: i=1; AJvYcCVcbxOc5tLTGeJE5FthHqKTlLlx3R7R2swuhH0u91LaaVAiazr8A3Q0X/pQaAvi+DZt+TYsdi5ms/8I87Jd7Fnqr+Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCyggLQ3Q0jctdtvmNkvOLB4T9/jY5acID5KGpNxLAjS8ccMTe
	+bfMHAEORQ0CnySgpNFsieEgpsvqBdrZkPDGNzXWCyaNFieN0Ik9EknS
X-Gm-Gg: ASbGncubBUeIXPyPP69/Mob3fC61Fx0aw/45f02TpG1uhvDTEPDPWiTGao1tKr0IpAw
	Ou+KTNBsBopjwyBov04Iy2/hgjyvaejKxHV5auC/fwbeqRucBIp+wjehT2B/LYUprL6+3EkLnKZ
	Lohzc7Bc239m1v56b94POrpfYy2xt0o7QOyGmNNIXABTBsOxjw214jwJAziAySvSHUtp4pzjbd9
	hrXIFWUjKDiEAMRfXGTxxJKk1oGhGGvqEZHJxRmm46n4zw1xPUYzDt3zht14Un95cnDugrw0f6u
	XYCEElGm6pEMtE7BudZqKR/ySu4rLuwWjlKjrWaXwoKnP++1d/HINc5P1C8rugRCioJOigBXPkn
	nTQnZOgYb3GDoBASiBXgAODjsmyic0cY=
X-Google-Smtp-Source: AGHT+IEiUljTaR1hOXpc+89o/6JjhMeDHl7p3vPf9VlyVgdC4lEczn7p5BJROptjhPjLmze5ZXj8/g==
X-Received: by 2002:a05:6402:34d4:b0:627:c739:ee36 with SMTP id 4fb4d7f45d1cf-627c73a26d7mr13066041a12.14.1757574226378;
        Thu, 11 Sep 2025 00:03:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec3400b0csm559933a12.37.2025.09.11.00.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 00:03:46 -0700 (PDT)
Message-ID: <bbf7db3c-13da-4c81-a769-8d249ee7f7db@gmail.com>
Date: Thu, 11 Sep 2025 09:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][walnascar][PATCH 2/2] libwnck3: fix build
 failure for lib32-libwnck3
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20250910152923.859295-1-skandigraun@gmail.com>
 <20250910152923.859295-2-skandigraun@gmail.com>
 <01c77da4-06b6-48c9-9a50-f49e96d0ebb5@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <01c77da4-06b6-48c9-9a50-f49e96d0ebb5@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 07:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119355

On 9/11/25 06:16, Changqing Li wrote:
> On 9/10/25 23:29, Gyorgy Sarvari via lists.openembedded.org wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> Refresh patch for fix build issue
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...caused-by-OE-core-changes-to-startup.patch | 33 +++++++++++--------
>>  1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
>> index 91e23c785b..0328202f1b 100644
>> --- a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
>> +++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
>> @@ -1,4 +1,4 @@
>> -From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
>> +From fd075074182f756e2872569925f70f5f4e2386c2 Mon Sep 17 00:00:00 2001
>>  From: Koen Kooi <koen@dominion.thruhere.net>
>>  Date: Sun, 25 May 2025 12:24:16 +0000
>>  Subject: [PATCH] Fix build issue caused by OE-core changes to
>> @@ -21,23 +21,30 @@ It is caused by a patch of startup-notification in oe-core which is backported f
>>  Upstream-Status: Inappropriate [oe-specific]
>>
>>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> +
>> +Refresh the patch
>> +Don't use explicit type cast to avoid truncation, use long long for tv_sec.
>
> Hi, Gyorgy
>
> Sorry to say that this patch need to update according to the following
> commit:
>
> https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=15a204024dcc87ab16bdd24a8c52fab5287c2e0f
>

You are correct, the build has indeed failed eventually for libwnck.

Thank you for the review, I have submitted the missing backports.

> Regards
>
> Changqing
>
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +
>>  ---
>> - libwnck/tasklist.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> + libwnck/tasklist.c | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>>  diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
>> -index 7418f89..460e11d 100644
>> +index 7418f89..f0f30b2 100644
>>  --- a/libwnck/tasklist.c
>>  +++ b/libwnck/tasklist.c
>> -@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
>> -       WnckTask *task = WNCK_TASK (tmp->data);
>> -
>> -       sn_startup_sequence_get_last_active_time (task->startup_sequence,
>> --                                                &tv_sec, &tv_usec);
>> -+                                                (time_t *) &tv_sec, &tv_usec);
>> -
>> -       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
>> +@@ -5019,7 +5019,8 @@ sequence_timeout_callback (void *user_data)
>> +   WnckTasklist *tasklist = user_data;
>> +   GList *tmp;
>> +   gint64 now;
>> +-  long tv_sec, tv_usec;
>> ++  long long tv_sec;
>> ++  long tv_usec;
>> +   double elapsed;
>>
>> +   now = g_get_real_time ();
>>  --
>> -2.33.0
>> +2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119349): https://lists.openembedded.org/g/openembedded-devel/message/119349
>> Mute This Topic: https://lists.openembedded.org/mt/115171723/3616873
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [changqing.li@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


