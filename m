Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C91DC433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:40:09 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.84500.1638312007070354588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R8nCJYU9;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id iq11so16444627pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=JWdbyvlFsmkdBwdx6NvTsPSVxz4Fl9NPxz2K8S9e93c=;
        b=R8nCJYU9grflcu3e0LKw08Ubi4/YvwvA5PhwWTKJOz5h6v2X7OQ9CSX0xo8g1XzuLx
         mQmpPCXDOX7IfcYkkHfIdOfwWMSY838mUkwBJpwTqGe0O/d8DxstByUSt1r7ZqY13mho
         /oPTcL77zO9OTbeE5QqIqFKLhapR46K9fbpu5a7wTHeOP2a0Zkt+QFlb/PBmGDYIogm/
         CcGsUyVlmmT66OOnDRhR+SR31IZ2PznBZTIqo+mwGmJZNz40IOjPE5YQi1W9SfTlD2tw
         g3gfv0rW4X+1Zjrj2u+7vPhUyWjVsmaBT8alcPv4xisSZ7ou+ZO4P7VMRhhePxBcIudG
         oHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JWdbyvlFsmkdBwdx6NvTsPSVxz4Fl9NPxz2K8S9e93c=;
        b=AfoiT2/KJzv294pKw7WwMt92vf10CDrHMeXCRNy1IjSAXshW0k8ftlhyDayDjvELIA
         7tXibJAJtwgL7x2KNJQAt1FGpLbBn6kCFIsp4bJm5Tu+n+fTGqKLrc7sSxJJAGfD5J9Y
         UMb9zrkzSjGO2kLr/KywMTn1ukqX4OZNJTbU9EDm35CmzJNvXWyAUA1JA4bzrHNQ0B84
         UknfNVSvZJc3s7kre21wdc1GGCiLY2N+Ir+0ZBZobUqWS35jyUQr87x/e8haS/wgmfJ3
         72sPBXRa5hoQO8Oiw9AJVoA2iSIVv3IVL6jLRETGIOcdjJrFE9d4HVK0PN0759mPvJl/
         eo6A==
X-Gm-Message-State: AOAM530DQtY4xTPMhw0PcD73tJy+/1hgMNoFwmZPsD4Y+KbkHsfWAkTn
	ITTbxgZKD7Iq6fpmhDuV6pPC44trpro=
X-Google-Smtp-Source: 
 ABdhPJx7+jtdru/AHP/lOS89wnqS891ae7AN953XHcU8Z2jZyTU7d6480NRjCmsePqj89GVZ5ThEhA==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr2465452pjb.36.1638312006355;
        Tue, 30 Nov 2021 14:40:06 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:7839:c9c5:3df1:81ad?
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 p16sm23348526pfh.97.2021.11.30.14.40.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 14:40:06 -0800 (PST)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Fix CVE-2020-12403
To: openembedded-devel@lists.openembedded.org
References: <20211112053236.17530-1-ranjitsinhrathod1991@gmail.com>
 <29012.1637477977357454402@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3f87a991-dd8b-0bd1-127d-c8d6447bcf1f@gmail.com>
Date: Tue, 30 Nov 2021 14:40:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <29012.1637477977357454402@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94153



On 11/20/21 10:59 PM, Ranjitsinh Rathod wrote:
> Can someone confirm if this goes to dunfell or not?
it is staged in
https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

been dealing with build server issue over the past week so I am behind

-armin

>
> Thanks,
> Ranjitsinh Rathod
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94087): https://lists.openembedded.org/g/openembedded-devel/message/94087
> Mute This Topic: https://lists.openembedded.org/mt/87000607/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


