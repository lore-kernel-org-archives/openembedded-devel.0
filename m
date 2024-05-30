Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5882AC25B7E
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:32:03 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.639.1717097396040238346
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUu5fAoz;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: fntoth@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ae38957e8so1510702e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717097394; x=1717702194; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RdPDyRxta+Bs8BwRd9Xm65nW290Rg8xVMVU7RRjONug=;
        b=ZUu5fAozXhp6UId95KZnlLACdT2KcImQRVSKIfzH4pf/apA65szX8NvlZI2WrwsDyL
         nf31jgJNgsdksJc4WPEzAzCTVcOiLRw0O1SJ1VJeDTazGk/Oslb1m5ESQW3APd4ymIz3
         rdffG+BCImiTzeHrc/0UDo1e+AehI7BXeEi6CrDdcUa7i+OKnEjsm/QD2EjPSHvlnhsn
         MJHRxdkjabtjRpc4NnChrH2xwaR/OGTZ+VIo8pMJpd59e6H95HY1/xvXOQfAikM9HCfj
         pksDYzEzFd/dnmfazTXb5J1gulh7jbgNjXooktOiq/MtUm3JYUFIJed1kg6sVfvC2oja
         /p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717097394; x=1717702194;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdPDyRxta+Bs8BwRd9Xm65nW290Rg8xVMVU7RRjONug=;
        b=NMoRVgdUiqpRzU22GPVNFdkVfBQ2dMSaTWC/IoqsJ9OyYgX1QUUfRRdZa1ju3S3j8i
         isEZziQXSRNgatch3Hz2X+hAUPhg9AsUqVJETRiq7I20+QAXHWxIIFtFocC4B23CVfj6
         dvGDlOmjPMX/+8DF7HWdjs6QFEiY58x3O4qmh3tN6s/qOmEA77WOS16IOynkoBr5WYJ0
         YErFAuHcSTRPDc8gthHPBsqu2A40khVR0cx3NFmJCnwQ7rOCCrYi2IvXNKgNXKuYRcyi
         IpxKilAX06F4T9fFldNr+WqC3wUveeQeQXtKFMFwXYVSRfG5pptjGbEzhmgp0epYpiLQ
         hl9w==
X-Gm-Message-State: AOJu0YzYB9eIjxii4B2A/GA4jFVaatamiWXWSWGwe2LPPl2gG5pn70Z6
	lymwodpklRohBVNXsFE2jvy1qcP/KtW226FDIkHpp5YEf3T4OnXu
X-Google-Smtp-Source: AGHT+IGxhyPSJW62kooyCcxOi1B3YcDp7B4q1HmMvapKpCq6kANoaqItYVz+XPh3SfWugRHxBjjczg==
X-Received: by 2002:a05:6512:4883:b0:52b:7881:1938 with SMTP id 2adb3069b0e04-52b7d4324eemr1832554e87.36.1717097393876;
        Thu, 30 May 2024 12:29:53 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:b231:870c:a9f6:5cdf? (2a02-a466-68ed-1-b231-870c-a9f6-5cdf.fixed6.kpn.net. [2a02:a466:68ed:1:b231:870c:a9f6:5cdf])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b993b5sm137007a12.15.2024.05.30.12.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 12:29:53 -0700 (PDT)
Message-ID: <3519ec32-5c40-4a02-bfbb-b0c0de22d800@gmail.com>
Date: Thu, 30 May 2024 21:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
From: "Ferry Toth" <fntoth@gmail.com>
To: Geoff Parker <geoffhp@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 akuster808 <akuster808@gmail.com>
References: <CAMKF1so10fduO3FksorrkVw6wUGNLWXqZM5gjf1ucEkZvNbdbg@mail.gmail.com>
 <25272.1715583428346104272@lists.openembedded.org>
 <CAMKF1sqtpdSbdNKGsvsJOd2q7xRs6UoU1rCfHUYVUbTjK2Bhow@mail.gmail.com>
 <CAHNuFG+VTPkL3zqaMh8a46atjC21GcgQgJ7GTix9BNsMzm88rA@mail.gmail.com>
 <db7616fd-ae00-4f88-80c0-35e063f400f7@gmail.com>
In-Reply-To: <db7616fd-ae00-4f88-80c0-35e063f400f7@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110645

Hi,

Op 21-05-2024 om 21:33 schreef Ferry Toth:
> Hi,
> 
> Op 14-05-2024 om 19:39 schreef Geoff Parker:
>> Thanks Khem for the link to openembedded-contrib and information on
>> how scarthgap updates
>> are staged. However,  I'm not seeing the nodejs-os-cache commit in the
>> stable/scarthgap-nut
>> branch which is needed to fix nodejs builds on scarthgap also. Are
>> recent fixes in
>> meta-openembedded master backported also?
>>
>> cc: Armin
>>
>> On Mon, May 13, 2024 at 9:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Sun, May 12, 2024 at 11:57 PM Geoff Parker via
>>> lists.openembedded.org <geoffhp=gmail.com@lists.openembedded.org>
>>> wrote:
>>>>
>>>> When is the expected next update to the scarthgap branch? I've 
>>>> watched the patch move from  master-next  to  master, but there does 
>>>> not seem to be a visible scarthgap-next branch to watch.
> 
> Indeed
> 
>>> Usually there is a monthly release update to stable branches that
>>> Armin queues up in contrib repo e.g.
>>>
>>> https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/scarthgap-nut
> 
> Not there yet

Thanks, it landed in scarthgap.


>>> eventually when this branch is gone through some level of testing, it
>>> is proposed to upstream
>>> branch via scarthgap-next in main repo.
> 
> I am guessing this patch is badly needed to get many nodejs modules to 
> build.
> 
> Tested-by: Ferry Toth <fntoth@gmail.com> [scarthgap, nodejs-module-libiio]
> 
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
> 
> 
> 
> 
> 

