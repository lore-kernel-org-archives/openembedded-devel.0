Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0698C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 16:37:48 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2985.1641400667376090714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:37:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ip3Fopo4;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id ie13so1639672pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jan 2022 08:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5gcS37Qoe9IXK5sCLIiDe+EY16fniyNdM0sX+5Pr4g8=;
        b=ip3Fopo44ZJG/kqNamikid7CnXiWobpVENIcvXN5lqu+/LeVx/HOyj/bvr1++K49Zr
         OKHlZFODfny18NSoBvhnjto76v70zct7ptFZ85PsQYYYkA3HGW3VmlUld0NH/AGv6DPX
         uqHMRJLz15/46gDr0aotst456vQwL32adR87CdRzgicPqM4EU3qsT84dHk9ciCrxIS6Q
         RBkVXNyGbfhQ1L4qPFKKS4RBedFf30SSYTDLo3INlXJBaeJe4lWom8gr/NXbwEgUZ6xj
         /BK+JGkSXAxUUluwoEkw21LokjLtcT0EBChrCwFpNxd5efBuKULq15w2fEU74kAmLLO0
         X9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5gcS37Qoe9IXK5sCLIiDe+EY16fniyNdM0sX+5Pr4g8=;
        b=ClkpK4oj4W8DVm9s6CwASv8+Cnl6T+CzCrmMXXW4hdzrKOT+rKazG0GJXPcgSxwGnc
         vUR7avBBKN88Pc8+B8ytjL5s4rR9R+ADFRXJyAmSx2uL4NcJ9eXXpilhJ6V0La3QazOX
         5b+teE+MLtZS41N7oIxyS9Eh5vQzqUzUlnHFf5u5gHZUVnkzqmd9PvEEbeOfKzKr6XaF
         fFAvaUL3jz24y86efwLUhXbXyzBwR/TUYwewJFTrqTEO56714wFcDRxfQ4glIouZuqki
         7fl1UjBSi8Qjpi899sMGBtGTcppbQ5sT9ZvY0BpsxXdB5jW0lBc058FGpcPAkAC5atqq
         9LcQ==
X-Gm-Message-State: AOAM531xSP2vqGSekh+APm9LRKa8sgXyuLGCRVuTn44EK8YLwY5I41HU
	fg0V/r3HQEvmr/VysCZgpQY=
X-Google-Smtp-Source: 
 ABdhPJxToM1u55e5pE1RQB8ezjAgT+6sHWjv192X9NVj5y8H5GzCdC25VRlDSP1gnQOoLsOigouJVA==
X-Received: by 2002:a17:90b:384e:: with SMTP id
 nl14mr5124106pjb.243.1641400666703;
        Wed, 05 Jan 2022 08:37:46 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:5d79:c66b:f67:4480?
 ([2601:646:9200:a0f0:5d79:c66b:f67:4480])
        by smtp.gmail.com with ESMTPSA id
 z2sm37471552pge.86.2022.01.05.08.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 08:37:46 -0800 (PST)
Message-ID: <1097f292-fa38-e981-4d4e-b3f3c0f21a2e@gmail.com>
Date: Wed, 5 Jan 2022 08:37:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [oe] [meta-networking][PATCH v2] ifupdown-ng: Add recipe
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
References: <20220103163754.32439-1-alexk@zuma.ai>
 <CAAnfSTvy_xKboMuVNqodt5PduOtdj+tNM+qPc84X-Z=vKtSRWw@mail.gmail.com>
 <CAP9ODKpSjs7_g-aHDf=WjNDbwLDrru8h8Xu9K2zAuDGAN=beRQ@mail.gmail.com>
 <CAO5Uq5TMppqwskcZOHPUE=5fDUN5Q1QP_vRPegfFoi4jmG8M=w@mail.gmail.com>
 <CAAnfSTu04cesHKxFYYA1DGDDHnXHXOEvs6tr9TzbhdBko0R1Vg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAAnfSTu04cesHKxFYYA1DGDDHnXHXOEvs6tr9TzbhdBko0R1Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jan 2022 16:37:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94663



On 1/5/22 8:36 AM, Ross Burton wrote:
> On Wed, 5 Jan 2022 at 12:51, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> Smaller if anything (though I've just realised I've not dealt the
>> ALTERNATIVES paths correctly):
> 
> There's a case to be made for just conflicting with ifupdown and not
> bothering with alternatives.

thats works for me.

> 
> Ross
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94662): https://lists.openembedded.org/g/openembedded-devel/message/94662
> Mute This Topic: https://lists.openembedded.org/mt/88115930/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

