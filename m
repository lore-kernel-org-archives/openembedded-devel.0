Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0537C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:29:45 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.74283.1680535780602508468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QzNFFmz+;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-544f7c176easo558442217b3.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 08:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680535780; x=1683127780;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Duhr/hpYqyMUUpyKC0aDSgMRLpWBQ5VNBBzKEvO72wY=;
        b=QzNFFmz+LXp5DE1Ve+68jtacHxPdYsOARIG3lsUvyiM2Ll4CIxa2UZhKWXFyJ2fP86
         Gxx9rbcTBXKHeC7hOilOIxM4z3HeY1RFfNv/d3ZjtVEdgmWy4J9iuUXMtnBqo8kEb7tZ
         M/Di/3MMhlKpZJNtallrrCQOrnSTiTwGYu/KOw2+94fChk9P1L/L7xnWtixFDd59d90f
         th5ggJOvvgzX/8kyS///QL6AkEEE6+mJS6+Ufx2dHExv2hPTt+7IYVyyqtzVkGbBbexJ
         rrjbVHsWya4yERdsWoIrz0FdSHpRICKNJOVt5c5rNrgIliD3YV9o+T89TOi3yd+jF/Em
         hgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680535780; x=1683127780;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Duhr/hpYqyMUUpyKC0aDSgMRLpWBQ5VNBBzKEvO72wY=;
        b=CLWp+LX0RXp4Vh1TU2/8R4nErv9gP3cfZPiXoTONk7Kly3rm6FN/ROp4GbChY7+4U5
         i0LSx4LY1a+ioAa9j87koiarsAuQFttkGx3s66u4y0r76uk30oXf8Or4Cybo5kqpTPhU
         quTPhcqhnybL62igzrgaTXyWJOZnODddPXf7MMRc0OxEeTMmlgt4XBv4Gp7albQ5inVt
         pmO89LwchC7M7ZXIZ4IBtU7Qp8Bv1J+0rKuu/kt/oyUjIIXbw5ZQWbFKa79RsRL8gucz
         PPxjJsbo5Fyn+NbRscKmGWw1Xc+rPZTjtAYYClpkDKalFUC/lDWxP6daCk3AEMkrPeb/
         VYKQ==
X-Gm-Message-State: AAQBX9dsDnboA6xcL8A+TRSngomWEpIKxhzm4lmNy/dk89zq/WwHI7YM
	U1sqnfEiOtt5NCrHCn/V91JxpXfpQBaXEA==
X-Google-Smtp-Source: AKy350Zr9IdV8aJEJF2bK14CIGrLb+AaBLbkmwkE0wTllqV0Iq3KWxJ7UHkQIh6Zz4KRVIYp7PY1Nw==
X-Received: by 2002:a81:a1d5:0:b0:541:8d70:aadd with SMTP id y204-20020a81a1d5000000b005418d70aaddmr17313304ywg.8.1680535779729;
        Mon, 03 Apr 2023 08:29:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:713:62d2:17c5:a94a? ([2600:1700:9190:ba10:713:62d2:17c5:a94a])
        by smtp.gmail.com with ESMTPSA id l34-20020a81ad22000000b00545a08184besm2585509ywh.78.2023.04.03.08.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 08:29:39 -0700 (PDT)
Message-ID: <e333be95-97e4-74d7-7a4e-a144897abb55@gmail.com>
Date: Mon, 3 Apr 2023 11:29:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH] postgresql: CVE-2022-41862 Client
 memory disclosure when connecting with Kerberos to modified server
Content-Language: en-US
To: Hitendra Prajapati <hpprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20230324120404.43733-1-hprajapati@mvista.com>
 <24425.1680520543580336166@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <24425.1680520543580336166@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 15:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101939



On 4/3/23 7:15 AM, Hitendra Prajapati wrote:
> Hi Team,
>
> Any update on this issue ?

Don't know yet. I have only on build system and these things take time 
to work though the branch rotations.

-armin
>
> Regards,
> Hitendra
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101937): https://lists.openembedded.org/g/openembedded-devel/message/101937
> Mute This Topic: https://lists.openembedded.org/mt/97822021/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


