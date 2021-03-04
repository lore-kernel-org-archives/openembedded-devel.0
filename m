Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.1755.1614877358498988680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 09:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uX4Frf1f;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id i4-20020a17090a7184b02900bfb60fbc6bso4789282pjk.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uKbpnrOyATjNWRL11Z3qxTQvTYE+j9+Wgyz3qThEqv8=;
        b=uX4Frf1fT233kXbtxoyeboB7E+pev+oI1TOfZfsJl2jUDIeocIcCnY5KfubNYAQGuQ
         uVjUGk2cF4lSCrBXAY7Dih9sdCRdaX5TtCXGiBHQBauUXCGeLUmgW+fn1X7ll9lLctc0
         2szlJ7elJ0Bk6DKFk+blPUHvUfQLvRzvhMPzJXj6vR2RvOCBHP40nWTK/GwG10Ngebd1
         JAaGnaYyJfWQPUbL5LQ2ZL1mMHT0v3294Ue2h17hxWuyTcOm4b54uLpwgZU1b9t33++1
         eSBSWceNX/V/NnIDaGyr+pvOZq/eLYfdIB0iHduFDOw0R24O3lWMotI/22I++EpyHljs
         DzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uKbpnrOyATjNWRL11Z3qxTQvTYE+j9+Wgyz3qThEqv8=;
        b=AFrxhm1dwSdsbFuAM3EXgi9xRk1bFw2z1ZrpioeaecfsrD7TaKPDsNHWU/YfZK+Q4a
         FJnFTTFaMPOwg0cTpN1vsNQB3W91jbPgTY6IcN8mMAsEeuEaTTus4hbz3GPvXfW+1Oag
         f9+Ow+gFkxUntuMD7uH2xNmz1VaaIwwyfqo8M5yKzrcyff1TzKdg66KCdaU1SLHAfZEI
         p0IdIBkr0J8znCsMCOXLH4nhoGgoCk8xPfcydsWcd6fk1WKVmKP/o2jJV/WJqZyIbyaD
         MwdlB+Jp7nWTYihKXoT/MQdt5uwVtqvz/TSJVX02l9mvwST/7SQY10qO67zn1FYrkWnm
         TSWw==
X-Gm-Message-State: AOAM530/ePbxj8Qfd9yRvwTpWdzcDoZiGskD0S/cI+SGwRy+XoUhOvgk
	FuQdzrxDfg2LM2jJkhwf1/o=
X-Google-Smtp-Source: ABdhPJxHXGNrMQxq8lf32dnzKGcTjd0l/YLiOxpERvy9G6Br47JPok+AnyEgkUfRT9pSg71IteX4Tg==
X-Received: by 2002:a17:90a:8405:: with SMTP id j5mr5408000pjn.152.1614877357902;
        Thu, 04 Mar 2021 09:02:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b3bf? ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id t7sm22321pgr.53.2021.03.04.09.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 09:02:37 -0800 (PST)
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
To: crg7475@mailbox.org, =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 quentin.schulz@streamunlimited.com,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
References: <20210303114130.2317817-1-crg7475@mailbox.org>
 <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
 <74063b8d-88e6-6c98-e2d2-7a640f7ebea4@mailbox.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <da6a5e66-997f-aff4-7e81-d166c7014bd2@gmail.com>
Date: Thu, 4 Mar 2021 09:02:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <74063b8d-88e6-6c98-e2d2-7a640f7ebea4@mailbox.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/4/21 5:12 AM, Carlos Rafael Giani via lists.openembedded.org wrote:
> Well, fine by me, though I'd like to ask others as well what they think 
> about moving this to oe-core?


I think its a good idea and perhaps if we can make it an easy 
replacement for PA via a packagegroup or feature ( like init systems ) 
then it will be a good thing to have in core

> 
> On 03.03.21 22:01, Andreas Müller wrote:
>> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
>> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
>> wrote:
>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>> ---
>>>   .../recipes-multimedia/pipewire/pipewire-0.2_git.bb               | 0
>>>   .../recipes-multimedia/pipewire/pipewire_git.bb                   | 0
>>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>>   rename {meta-oe => 
>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire-0.2_git.bb (100%)
>>>   rename {meta-oe => 
>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire_git.bb (100%)
>>>
>>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>> similarity index 100%
>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>> rename to 
>>> meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb 
>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>> similarity index 100%
>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
>>> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>> -- 
>>> 2.25.1
>>>
>> To be honest: I'd prefer the other way: Add it to oe-core (of course
>> not this old version). Haven't found the time to check more on details
>> but it is a drop in replacement for at least pulseaudio and jack.
>>
>> Andreas
> 
> 
> 
> 
