Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DD2C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 09:19:25 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.18333.1751534355717373230
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 02:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSS2RfwC;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so10527101a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751534354; x=1752139154; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/xsbtMJu1JLLFQ/T7yua8lzosdjvbde2aNpY6LrPv84=;
        b=iSS2RfwCbUrhA8poywYzKrePBugrcDmBCqGSyp3QjerV3tBmlrQa5q2BbNx1XfDTPN
         IsG8pGW9UkF4P6wNNNmXRPtXFv8/KSPmDW5BR6RAokpY6TqQZUChugYNtHDMCIONe8Xl
         m+iL74XxB156weh8mm/BdjZa/DkrUHA1n5KeB/PqZhLAO22dLDsSeR+menQ6w8K63SFa
         gsBizVEvWMwoW++eNoJ68SPzRclKk7Q/GJp7DiDKLOj2y8JoU3BWU8Fy6i8/6oOE+q1k
         elzMYlmOvyPSq5b9Uk2I5KarVaz+hNksUenbOhb+qEUA+tNPxaQNfeNhpT+8SrFXjME4
         ClsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534354; x=1752139154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xsbtMJu1JLLFQ/T7yua8lzosdjvbde2aNpY6LrPv84=;
        b=C7SFJbfrLik209pWzwJday5A7m7rsI1QhvUdw7ahlYrP+QEddtUqcZ2inpcOGheYTy
         QiSHKm7YzYWBkPok/TrFPMTX/SbA5p40WwFz/e4jaGaLtdKiXuvehs5HUJkHl4TCzpgC
         M7+mRFrpLABQuugdthP7RWhG7o/x8QaJ95pz/UVWvrzvoQHhJ9MusRiPt8winef1D6yv
         w6OTSEt9nYThWRJV2pzoc9LsNViVWHfzB3n9n4qw8s7h/MF0kpmuwmuP6U7VzqKDRmAZ
         uAo2eIm3EM3yFRTIVhkc1vyyzA06fm5q0DDlOUvRSqmnrX3ZH0zCDYwLrt2T34aIEmrv
         jf3A==
X-Gm-Message-State: AOJu0YzYzSsTqCiVKRB/rj4m71rJO36Lqc2L3ZmxKOmAPB3e2sgr4NvD
	AYZmTE+BrSmXa3S4zToBy9ftIAOQ2usDQAXR4C/Rg4FyefYbxoxX+JTh0TN3YQ==
X-Gm-Gg: ASbGncug3tHMtWHkeydyIdzWD+JmxajQHbN4aklwAyhBhj4S5I47OkF/epGBY5EXSYR
	chZmG3HWj58nsfmj/paS3qSSLb+d3t/96ZFnlmNHTVx2SoqQEeOw4zRtvOR5FY7XXx2TVL63LLz
	ksXnKgWonvREjvsIB0RJQGCASa/GusQntyzOUGyVsQwnqACXqCEAySnHxUVWoE0kp6QDTaFElI+
	TxYVaOWNvUrO3mPSFtDd7jUEi7RSc03kZWcET/kui+hcAD3WkAfjeAkoEmltaKYCa4ozANT2Me2
	BGjC34GmEIJt0+OxAL0s4lHuJ1zhaFbDxqfcT3KzZ5v6atslebipBU+4Se20nyQPLmM8mA==
X-Google-Smtp-Source: AGHT+IG07OE/3OfTmy9ehZJ4j8mbi0wuK9nf/fLtkspONR3IQjBhld2UCE8exkZrqhtzPJCWRjeE2A==
X-Received: by 2002:a17:907:3e23:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-ae3c2c9d310mr679052966b.43.1751534353580;
        Thu, 03 Jul 2025 02:19:13 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0198bsm1246083066b.91.2025.07.03.02.19.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:19:13 -0700 (PDT)
Message-ID: <9a39cf74-147a-4e07-90c1-b3c3aedf985f@gmail.com>
Date: Thu, 3 Jul 2025 11:19:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] mozjs-128: avoid using build host's rust
 toolchain
To: openembedded-devel@lists.openembedded.org
References: <184EB1345CA463A8.15677@lists.openembedded.org>
 <5042bc5b-59ad-4ec8-9e6c-7bb1b55c7c08@gmail.com>
 <CANNYZj9XpCRxX4FqjzmpmF4bTBxgVvRRFOG9GZfytDwrERnwHg@mail.gmail.com>
 <CANNYZj-Yfqx_wsoOCt_vUfh-wa8V-CuL2cKKdWo-WyXzfpRg6w@mail.gmail.com>
 <184EB24134F0DA25.15677@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <184EB24134F0DA25.15677@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 09:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118218

On 7/3/25 11:01, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 7/3/25 10:53, Alexander Kanavin wrote:
>> Forgot to add, the patch is fine as it is though. Two lines are ok, a
>> mass copy-paste-tweak of the class would not be ok.
> I do like the cargo_common idea, and even fewer lines than 2 and would
> be safer too (it wouldn't be just 2 random variables). My test build has
> just failed, but if I can pull it together than actually I would prefer
> your suggestion, and will submit it as v2.

Huhh, actually it looks like I'm on a bit outdated master branch, and
this was already submitted not so long ago:
https://git.openembedded.org/meta-openembedded/commit/?id=6cf005f38654ca014377e08c770c11e2505d65a3

Then this patch is redundant - please ignore. 

>> Alex
>>
>>
>> On Thu, 3 Jul 2025 at 10:48, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>> cargo class is intended for components that use cargo as the top level
>>> build tool.
>>>
>>> If they use something else, and cargo usage is 'hidden', then the
>>> correct class to inherit is cargo_common - if it misses the needed
>>> bits or does too much, then that class should be fixed.
>>>
>>> E.g. see how librsvg recipe works.
>>>
>>> Alex
>>>
>>> On Thu, 3 Jul 2025 at 10:43, Gyorgy Sarvari via lists.openembedded.org
>>> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>>>> Alternatively, instead of inheriting rust class, cargo class could be
>>>> inherited. This would set up the correct environment also, but would
>>>> also need to override the do_compile task, with something like
>>>>
>>>> do_compile(){
>>>>     oe_runmake
>>>> }
>>>>
>>>> Though IMO it is technically slightly more correct, I find the two
>>>> variables in the patch easier to grasp. But if someone would prefer this
>>>> (or an other solution), I can submit a v2.
>>>>
>>>>
>>>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118217): https://lists.openembedded.org/g/openembedded-devel/message/118217
> Mute This Topic: https://lists.openembedded.org/mt/113962964/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


