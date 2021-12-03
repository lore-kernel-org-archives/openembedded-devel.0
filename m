Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB708C433FE
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 23:38:32 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.19042.1638574711674322290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 15:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OGX3/60x;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id n12so10167910lfe.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NA3drLOzWmm1IKq/rSCaxGZF3mu2WgY0uSgUW/Y3KXM=;
        b=OGX3/60xtadZa1XMWqNIK6PwYaZ/VCC2RWqx1pblS/ESxZqUrDpp2yU3JoSQ33eyhL
         +oXwOICb2mH7Zy7tEdhpuQ+PG42g5IzyZgyIogaQjEOlEbozNhKA4oses2vCjmnCVnma
         W5qzrALgObwwv04lWGuFTtMEEQV6g5PSxqG2+JQ0W3iNfDNxvn/43+Gxp5NlFnTgBq6i
         1Sbz+R5ItdMu97HKpir5HpxutmtIOVXYPvbc08mTqvbX3wrEFM47zjz2ayrHKmzHwNAH
         AidasCRguD2x8c//gkU7S+ZzRx72jHlweJ0T8z8XIX3nwHW/Wp6t8JWMX2ciYX3qse8T
         FALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NA3drLOzWmm1IKq/rSCaxGZF3mu2WgY0uSgUW/Y3KXM=;
        b=U+ddegV1Uyo2RQHinbTcGPr+30WQ+kLwAtOOZz7hnxsaFHUsGKy0s0UZGNtsz5vLxw
         uK0zZucBzixtT8H3+dvw/3bK7SOpLhodbuTQ06Rn/ogCWUZf8habZMd3/HG9eSRW2apc
         1w+5RRJCZZwtcpIUkUdzI3kFP8Ym8pPKABWOHMx3U546I0H0MzgmaH/aWbpkZyYmUM67
         Wqg2l0zT5L/RuW6/GMFgLVwKwuM0T4hqCD8uc6MerV0+gW6VO1N9fg6p7G6y0f93jvaf
         365DiHTDZwTkccGWiLVx8QwOQwqg6vvMOfACHIfBmTjXH5yl2XRHLkyT78bdkgmKApDy
         rQFg==
X-Gm-Message-State: AOAM532R3FBgvnh53Eh7Hab+GuJ09AApJNC3LBkzIheTTfc7i9Ap+iE+
	As95Gc0R97ViWAG2+FnYiQg=
X-Google-Smtp-Source: 
 ABdhPJzIeAPs2hm7o8Bccq1dQtZ2oOmZxsNcQRs/owZoFOYZU2/lqdVP5UKYHTkWpe1ppQPg+08M9g==
X-Received: by 2002:a05:6512:2eb:: with SMTP id
 m11mr19961958lfq.326.1638574709803;
        Fri, 03 Dec 2021 15:38:29 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 v9sm590665lja.109.2021.12.03.15.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 15:38:29 -0800 (PST)
Message-ID: <9da3512d-7173-f42e-d29e-fe5c41d94f8b@gmail.com>
Date: Sat, 4 Dec 2021 00:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [oe] [meta-java] Request to pull honister branch and override
 syntax commits from master-next to master branch
Content-Language: en-US
To: Richard Leitner <richard.leitner@skidata.com>,
 "geoffhp@gmail.com" <geoffhp@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <16AE031C14A64EBB.21980@lists.openembedded.org>
 <CAHNuFG+QkyytMAp+9LGLtoBmFX3ztug2od6OBqCcwvR_=T5nUg@mail.gmail.com>
 <YZUmg2oqYa/btYrE@ltleri2>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <YZUmg2oqYa/btYrE@ltleri2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 23:38:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94206

Hi Richard,

On 11/17/21 16:57, Richard Leitner wrote:
> Hi Geoff,
> 
> On Sun, Nov 14, 2021 at 08:55:41PM -0800, Geoff Parker via lists.openembedded.org wrote:
>> I made this request a month ago, still no change to the master branch
>> so that builds can be made using  meta-java with honister or master
>> openembedded layers.
> 
> Thanks for the reminder.
> It seems my CI script missed the final push.
> 

I think your CI script needs some more love :-D
Or in case of errors, perhaps publish them here.

Jacob

