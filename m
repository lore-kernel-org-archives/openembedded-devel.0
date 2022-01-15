Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6FEC433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 13:43:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.7250.1642254228339669919
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 05:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OPSmGA/G;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso4587622pjh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 05:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mEDb8G5MmgVdps6uvrRkFDiIKt134mYOLTAJqlR7mxE=;
        b=OPSmGA/GmB0vVRXOzq1xzSxqf9GBfN8x8T71/R0OD69cdD6Y4aQBeLljCeE78tcleU
         H16Tapaoc7GqPCiAwhIyb2NUjhxeR0aIbj84gF0EQmEyZ7sYL42SEnN5IGrjJbCXksol
         5gW6qfPmeC7bmP2bWUwdAt2pm3pzWTBtSnit/b73ZQLVTPw1vwVYYnVTJ4bMQBAY3V5j
         aqFFMVCwm49rVGH5Ukf5Pj16Vbaybze+jN/LCuoaeihDz2ccUhGHpj/NMdDCtuArxfm1
         LUWFEDjBBphx9ZmIH6Guociv87acvS6IodFHB2QPKjsIGIdjkUp6K+i/mWOoALVLM1pz
         0e+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mEDb8G5MmgVdps6uvrRkFDiIKt134mYOLTAJqlR7mxE=;
        b=U5w1+H42B3GqVW/TPTkLd1mq+PcxDYkQ+zcok01eAa0YbNsCBUNEpF8zhyymdAQKo0
         00BWcwDGd6bziDVRtifjF+1Xw5KHLERvznMRUjSwk1izVYI4BOcBYRI94tzJTTYPioci
         NPeVxEd4QaOI51+K0dbOX5x7xZI6qbh1BVm5kuIVJZCIfYjt0yk1b7xgPuWal6x2GQwm
         G6GkMI2GwDldxG/h7FYbJQOedrhZjMKBaf2Xa3QJNLHrHy/+ppSgSOUB2ENkAPy2UVHp
         ohqaVz62maaH3pWnk1YqGvO4+c5FfU0DZjCwG/XCTk50jEsQQmnmQJGjjxEK+qTwZSt1
         F7Qw==
X-Gm-Message-State: AOAM533xwMUnLnUiVorWi47yw2VJRTgkw5Uxkp2aE1QfaPK6kVNA+vNR
	fHMkdYuO/9ko4DUBQ3iqYxM=
X-Google-Smtp-Source: 
 ABdhPJz5KChdaMu4oC02NMpex1BTQ0K3p/qiQZ1fw1wj0cN9NY3zye0UL9j+uk8DjPk0jBxlCkYszg==
X-Received: by 2002:a17:90b:1d8b:: with SMTP id
 pf11mr15834296pjb.89.1642254227897;
        Sat, 15 Jan 2022 05:43:47 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7ab9:6507:6566:58c8?
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 b16sm5452079pff.123.2022.01.15.05.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 05:43:47 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/5] freerdp: Upgrade to 2.2.0
To: Marek Vasut <marex@denx.de>, openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20220111224714.1289840-1-marex@denx.de>
 <4d1f655b-23c4-7f6a-c4bd-259a890738f5@gmail.com>
 <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d2d5d5dc-c1db-700d-470c-42126bc394dc@gmail.com>
Date: Sat, 15 Jan 2022 05:43:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c020d0e7-8702-c169-5812-5a8c06f19b7c@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 13:43:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94855



On 1/11/22 8:57 PM, Marek Vasut wrote:
> On 1/12/22 05:42, akuster808 wrote:
>>
>>
>> On 1/11/22 2:47 PM, Marek Vasut wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> (cherry picked from commit f751dcf81a18fe817b40e755a2ba3f54a74d1e02)
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>
>> And why should I allow this?
>
> This ... what ? The SoB line or the update ?

What is in the update from 2.2.0 to 2.4.1?

I had to look at the release notes myself and found new features being
added between those two. New features are not allowed per our process.

This patch set will not be included.

- armin
>
> SoB line, well, aren't you supposed to add them to backported patches
> ? If not, then I can resend with them dropped, or drop them where
> applicable.
>
> The update to 2.4.1, because of the CVE fixes.


