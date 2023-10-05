Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757E4E9270A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.17062.1696516731609041734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 07:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oz+7kSp3;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c60cec8041so7193775ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696516731; x=1697121531; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8REWAePwXUSxi4te3oDEIPp2AInNyJroZqK/XwB2ik=;
        b=Oz+7kSp3DYd0kwcNuO+Ra+JmJLMdERxWEcb+I43w4gFwYvZC6ie1MvK5tc5aDc5B+x
         51hyJAL7eEW0+ma2QQ2tzOHBz3WuvpYHNYMzFUiXYcK/YoqhDS8aOz5C/lt25r+vny9b
         epanVIW2O9/kwqkH9lwlBXFv14DEKsSOLfDHMjEDpkiWehMTazzSB37Z2fX2thwi8L04
         SSpzxJdV9SgLPxzLwf7GOeTuasS7a9CMAhuMzuI8fQqZozZ9fPrKWq+s/ITl39ViTPh8
         ZjsmETcU0bFTgRc9rQORuhGSy6cOKRvwhFrFG0+0ZVJaEoET73xI/NPk83IFpMFZZ/rj
         K33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696516731; x=1697121531;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8REWAePwXUSxi4te3oDEIPp2AInNyJroZqK/XwB2ik=;
        b=RRPJHQ37QZ4VCKKa6CEErC3jRFhFMWBm9mzd1yI01k9EazQZqNqStzLX8Bo5bRZROs
         qMML1fen0td4mAN/80Oendba5I/XdL6XCeEd5JheZu/HqwqWRVSaiGItTmRP5twtdIQv
         HORmsgz+w5o51qHWDBIEY+3ZzCJYNlo/V2OAWhOIwzrGxOxds1yZMKJ+Em/rCi36VRq2
         eSQp8tvoMmkpEgvwB7v6CNzhbxSrK4dx5Jo28E5i8vyDDGJmeRINyNcJvYPd7XeGhqJH
         uiNdGzt2cWYQ0KCCk+lJXCsvon12pEKbwgEWM+D2Q8J5bYQExOBewb9bIqO8a8AdBT3I
         uhbw==
X-Gm-Message-State: AOJu0Yzgca5+1m1evIEEx4gIov9feL+nxC/nObupbpR0ZP2ShKMxoHyq
	aipYnkZlMprD2hnyzcYfjtY=
X-Google-Smtp-Source: AGHT+IHJVo7svwAv7OY6L0iuoa02px+ZPnNPJAltFdH+xpNWBGmOAsZV+CJ5wZn4d4pNOuy5jMaDrg==
X-Received: by 2002:a17:902:ceca:b0:1c5:9c73:c91c with SMTP id d10-20020a170902ceca00b001c59c73c91cmr6548622plg.48.1696516730980;
        Thu, 05 Oct 2023 07:38:50 -0700 (PDT)
Received: from [10.0.237.240] ([50.202.47.34])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902e84500b001c60a04e1cesm1762658plg.36.2023.10.05.07.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:38:50 -0700 (PDT)
Message-ID: <0eb5fc91-7e63-4e89-ae6f-955aa635c2a0@gmail.com>
Date: Thu, 5 Oct 2023 07:38:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] What are the plans for the nanbield branch?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "OE Development (openembedded-devel@lists.openembedded.org)"
 <openembedded-devel@lists.openembedded.org>
References: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <DB5PR02MB10213DB493B73CBCA0E2D8D55EFCAA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 14:38:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105358



On 10/5/23 7:01 AM, Peter Kjellerstedt wrote:
> Khem and Armin,
>
> what are the plans for the nanbield branch, given that is was
> branched off long before the actual Nanbield release? Do you plan
> on merging master into it once Nanbield is released, or will it
> stay as it is and relevant parts will have to be backported?

I started a stable/nanbield-nut with a sync to the tip of master. That 
will most likely be the starting point depending on when 4.3 is 
released. I might sync once more.

>
> The reason I ask is because I am currently working on preparing
> our layers for the upgrade to Nanbield and currently there is
> quite a big difference between the nanbield branch and the master
> branch in meta-openembedded. Thus it would help to know if should
> continue to track the master branch for meta-openembedded, or if
> I should revert to the nanbield branch.

Typically if there are no new applications added after a new stable 
branch is released, the first few merges tend to be in line with master.

hope this helps,
Armin

>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105357): https://lists.openembedded.org/g/openembedded-devel/message/105357
> Mute This Topic: https://lists.openembedded.org/mt/101777064/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


