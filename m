Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AABC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:58:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.31218.1702454284439177878
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=2FqCdWId;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-336420a244dso34248f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702454283; x=1703059083; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Jwqg40IXGW95uZCASGbpPZ7AbXklDnLuEZ6IiotBE=;
        b=2FqCdWIduVHwYI4bgd26qSpQNvjJlKdvigxXbMq0Q34qH1a+EBukY3E79/SItIBnQy
         kxSK6J39XZ0eETABmSbHJupRPNXoLDmk2uPj2hQbkLQ+o4AuorEFlxuVASmEmsvnhcyl
         hzILkafgumizCk88nhioawv/3uTJRHJsmEx48wlswjLZ164H26XusiieD1qtOyhAUc+m
         6W8sPHH+w0pc0TNWZ2nNiy6pPXlRJTKULLY9/Nb1lWnmvoInSXCCMvlhjRWlXeD+JGix
         4VhUT4jqIPJbNCqEtpe9XPXuSqJLijZy2B1XUki5eVyv1dytDrwgZgvFQ4D2OajeieS4
         BSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702454283; x=1703059083;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6Jwqg40IXGW95uZCASGbpPZ7AbXklDnLuEZ6IiotBE=;
        b=t1VjgS3ZvT8UTe+1ESypfWL72QU/K/IPvUf1cX3F0FXEDFcMlt0fb+RaSle00jmlfY
         nkj3Hfb/itCSvsJA8FgNiLB4xNG+zwBCtSC/dIvH80NQCPZ1fMchV+RsfZGy11vi7b6M
         BTKJn+FLDfGJPR+SHaVY2AOzAYTDFYSypeg1pUlmUKPbM+PjX+UPZ6yjujLrJp1uVfAt
         KW9w3btVGsLRNpQeE+ExcBW4NE/l/2Y+nIgCtld5ekb55Y8lt9/w5jPWcCN7bQT+RHuv
         64KgmY9zBZwE5M98ACb+jPRe4UbfiUqkJumxXSTLVbdAlcBrvNNCfBUn0637WBRktesl
         CF4A==
X-Gm-Message-State: AOJu0Yy6rRgG7rnp8r0Y1b5KbhCKFr6vv0YVtdyMzc/axA/ObFdBAnD5
	7ixhnC+fQPG8HwjRjFJJJQCwBw==
X-Google-Smtp-Source: AGHT+IHqMC0y0Nn1Rs6q70mTGN7+22Wwm33DkR+oYvh44orLMCFNwiHgIPGGFboVqJBTkpvkAXLp+g==
X-Received: by 2002:a05:600c:54d0:b0:40c:2d78:c765 with SMTP id iw16-20020a05600c54d000b0040c2d78c765mr3476699wmb.187.1702454282894;
        Tue, 12 Dec 2023 23:58:02 -0800 (PST)
Received: from ?IPV6:2a02:8440:b212:574d:3097:4294:ab2f:13a5? ([2a02:8440:b212:574d:3097:4294:ab2f:13a5])
        by smtp.gmail.com with ESMTPSA id e12-20020adfe38c000000b003332fa77a0fsm12497198wrm.21.2023.12.12.23.58.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 23:58:02 -0800 (PST)
Message-ID: <3b8923cb-f65b-41c7-bbf7-e2f377e85669@smile.fr>
Date: Wed, 13 Dec 2023 08:58:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-pyudev: provide native
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org,
 kai.kang@windriver.com
References: <20231205145032.1116030-1-kai.kang@windriver.com>
 <170245123409.133993.13195774594233702101.b4-ty@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <170245123409.133993.13195774594233702101.b4-ty@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107388

Hi,

Le 13/12/2023 à 08:07, Khem Raj a écrit :
> On Tue, 05 Dec 2023 22:50:31 +0800, kai.kang@windriver.com wrote:
>> Add 'native' to BBCLASSEXTEND to provides python3-pyudev-native which is
>> required by lvm2 when package config 'dbus' is enabled.
>>
>>
> 
> Applied, thanks!
> 
> [1/2] python3-pyudev: provide native
>       (no commit info)
> [2/2] lvm2: 2.03.16 -> 2.03.22
>       commit: 02f460c5e379b3b0980374b3f89d55bc195d03d3
I just check on the git repo, this means that only the lvm2 patch was applied (but not the pyudev one)

Maybe this case (partial application of a patch series) could be made more explicit in your template answer?

Thanks!

> Best regards,
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107351): https://lists.openembedded.org/g/openembedded-devel/message/107351
> Mute This Topic: https://lists.openembedded.org/mt/102992734/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

