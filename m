Return-Path: <koansoftware@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFB9C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 12:07:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7012.1634731628246950635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 05:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ude2X0WF;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: koansoftware@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 5so24645770edw.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xiLUOdEhU0TvHbfegXQJBNEb0nozHZsg32lYMIWLQ+k=;
        b=Ude2X0WFmAzVyc+OjSzVRA/TwlbqnawX9G9/9eZGuycTytbrUIkXGOEyyoquylu/td
         H2zWiJXJbCn46eZOQKsTc2RoVaLcImmHm9ZykOeDx9BcHjci/3XvCe51P3213d0dwzJI
         DQ+cXyTqxR94X9IHoZgAUhs9Mk08aWIJbhIBmEtsyVm/H1AFdJfXdyoH3gZqg4G1oDPd
         p9mRSw88vUyJHotArfbNSLbwr92VcIhYL5oO7Q19WFOVQPDoVQvsJt1Qy6Opd9eYqEf7
         ShL4oUoXEDjIJxWFMPr5YMBhNrSbL+oyIzEdh0uOhuDSUFptNg1QTDN2hYVFlTOD15B4
         W+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xiLUOdEhU0TvHbfegXQJBNEb0nozHZsg32lYMIWLQ+k=;
        b=cDywpenjA1R1pnD+ocPQnVuG7mkDKLCoqDG3QmblCMZA41qGX03X8+e2HLTINSAkuc
         Ob2g8lFXVvR9THLqz3wyVYmeV9tQDDZAjzJuJ8z1/aBFX+zzviygQyQwQ+ukNdGJoBdV
         iTpPHxKFnBO7ki/iRNTwUHs82nvCkbX7eCa5BEVtbFceS3OUEB6jEwHMIz0yghLDmqK3
         00r5xMu7ujenbtmmks4ZXF76MAwnHJlM5QvmTnWNxy2vEix/ifAt2dUwWN4+GAUrzNKB
         wsBpZpcXjqFEf2bEE94Gz+nUerreMcaXzZ4jMxhu1VFEsgZdEtrp7MKJIAL4TrheNJR/
         xI7Q==
X-Gm-Message-State: AOAM530RaK2Ub5SUd4jvkejZLquXo2X7e46t2VUSWJiy8E/hmOOnfCZL
	dojf4YjUTnrvCGGYE1w0bJE=
X-Google-Smtp-Source: 
 ABdhPJzTKaWItSUa7gCMh0s1ubb+BzJmoZi4X4oIjiFSGnh3WRJbKg52ahhcZRd/h8LmS1IDF55ttw==
X-Received: by 2002:a17:906:fb19:: with SMTP id
 lz25mr47410581ejb.406.1634731625582;
        Wed, 20 Oct 2021 05:07:05 -0700 (PDT)
Received: from [192.168.0.6] (host-79-3-92-72.business.telecomitalia.it.
 [79.3.92.72])
        by smtp.googlemail.com with ESMTPSA id
 h18sm963078ejt.29.2021.10.20.05.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 05:07:04 -0700 (PDT)
Reply-To: koansoftware@gmail.com
Subject: Re: [oe] [meta-networking][PATCH v2] bluepy_git.bb: Added recipe for
 BluePy Python interface to Bluetooth LE on Linux (v2)
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Marco Cavallini <m.cavallini@koansoftware.com>
References: <20211019131925.21725-1-koansoftware@gmail.com>
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
From: Marco <koansoftware@gmail.com>
Message-ID: <41085dec-5948-b1c1-56ea-b10004e07939@gmail.com>
Date: Wed, 20 Oct 2021 14:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1sqso8ZijOMFVoEYWZG70W1rAK9ih3AthPOvjV3_A+q-sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 12:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93481

On 20/10/21 13:45, Khem Raj wrote:
> fails during install now on musl/x86 arm/glibc
> 
> https://errors.yoctoproject.org/Errors/Details/613446/
> https://errors.yoctoproject.org/Errors/Details/613456/
> 

Hi Khem,
I diligently followed the instructions on the site
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

To correct the errors you reported to me previously, I installed the 
'master' version of Poky + Openembedded and recompiled everything 
without errors and I re-sent the v2 patch.

At this point I no longer know what the requirements are for submitting 
a patch.
Do you need to pass any series of tests?
Which one?
How do I reproduce them locally?

Thank you
--
Marco

