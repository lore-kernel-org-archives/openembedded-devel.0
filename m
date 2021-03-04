Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.1998.1614878378647148141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Mar 2021 09:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UuTcG1DU;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id c16so7045831ply.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Mar 2021 09:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gn3BytJe7r4Lzai1AydGAZNv1kydIKtdW/VuDb3jdOs=;
        b=UuTcG1DUXA1+37aadpFw+73DSN4bJU5wqXnv/LKvPE/fWukjqSXtSQ2y+4af0qTAOT
         Lw1RCNrhk0PzQK9JiszsISke2dxGVlOV6n7P9VJdnxpaUARWmbEY/glw1Ip/jmDaz2py
         7lWfuAuQjJ5zBOAyVYldI2dr5GreD2WC9HQWPt7R7Nuk5o3cQvcIiqwcaTwa8SC+IFB0
         pERQvZAnWOmZSeS6b6LRzTp3/G4ppy5psKZbSHhZSUNbkUioKUy+s+EEWd/DXIAzWipz
         SDRrgZLj4uoUrEoTRvklcysihiCVs/VwTmJUuO5Cu4DSbmwVgSmwRcNMxYmp4t1EKeyi
         gFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gn3BytJe7r4Lzai1AydGAZNv1kydIKtdW/VuDb3jdOs=;
        b=Irvnu/aQXgyfm1JlUSDDqp1KZTNLqtK7zxL0mHv+iqtJolEEAFXdIsFtyAyi84xLX8
         PfO3vLE8q4aCKSeL6TxIsNFq886JWQaEYfE7WX8qDX0/VSncfm86dn0oLN+4Y+79TchH
         mzoe4fSxa/rV8A1Dqax1RmILLBJv/forWGm4CMpOySTfRQ6VN9XjJa8pfOsrmbL2H9Iv
         NuqOQQcfO91urlvc93ZyXVQ2iodEL8zAVuSp6f2QGHLIzrLkGDxA1LNG8Qtfui8nW4NM
         L78jqzK5Ov63cHWbbklEzIc82bJXg3p10e/nhddlg/+dKwiwkAdWwc4jVFCD6WouFbp/
         Dh+Q==
X-Gm-Message-State: AOAM533Dju8BexNM7cB+1bSxTuie0BoG8+NiV/0fTzAE1aSeoNiczBQQ
	NMTCWKr/tyUXVoEThjSJM0U=
X-Google-Smtp-Source: ABdhPJw5ssID+31VTS28TY/R30OJJy8qqsgij816DpbLJNgvOrhQcN50ERvCH5g0Ev1dwiUQ4BG7lw==
X-Received: by 2002:a17:90a:c096:: with SMTP id o22mr5591689pjs.119.1614878378066;
        Thu, 04 Mar 2021 09:19:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b3bf? ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id 6sm1110pfv.185.2021.03.04.09.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 09:19:37 -0800 (PST)
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: Move to meta-multimedia
To: Carlos Rafael Giani <crg7475@mailbox.org>,
 =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 quentin.schulz@streamunlimited.com,
 George Kiagiadakis <george.kiagiadakis@collabora.com>
References: <20210303114130.2317817-1-crg7475@mailbox.org>
 <CALbNGRT-L+khTL5277KAjfqwCdQ66yH-o6tcw35=0cr_CKzttQ@mail.gmail.com>
 <74063b8d-88e6-6c98-e2d2-7a640f7ebea4@mailbox.org>
 <da6a5e66-997f-aff4-7e81-d166c7014bd2@gmail.com>
 <9f1a880f-531a-3794-1e6f-058c5d43fe99@mailbox.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <7b6a99eb-7e94-68c7-9ffe-0da35ec0d18e@gmail.com>
Date: Thu, 4 Mar 2021 09:19:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9f1a880f-531a-3794-1e6f-058c5d43fe99@mailbox.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 3/4/21 9:17 AM, Carlos Rafael Giani wrote:
> I see three steps then:
> 
> 1. Upgrade the recipe to 0.3.23 that was released today
> 2. Migrate it to oe-core
> 3. Establish a packagegroup feature to be able to easily replace PA with it
> 
> I think steps 1 and 2 can be combined, but 3 should remain separate. 
> That is, once it is in oe-core, we can start thinking about establishing 
> that packagegroup feature.
> 


since we already have it in meta-oe for now. you can submit 1 and 2 
firsy and let it soak while you work on 3

> On 04.03.21 18:02, Khem Raj wrote:
>>
>>
>> On 3/4/21 5:12 AM, Carlos Rafael Giani via lists.openembedded.org wrote:
>>> Well, fine by me, though I'd like to ask others as well what they 
>>> think about moving this to oe-core?
>>
>>
>> I think its a good idea and perhaps if we can make it an easy 
>> replacement for PA via a packagegroup or feature ( like init systems ) 
>> then it will be a good thing to have in core
>>
>>>
>>> On 03.03.21 22:01, Andreas Müller wrote:
>>>> On Wed, Mar 3, 2021 at 12:41 PM Carlos Rafael Giani via
>>>> lists.openembedded.org <crg7475=mailbox.org@lists.openembedded.org>
>>>> wrote:
>>>>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>>>>> ---
>>>>> .../recipes-multimedia/pipewire/pipewire-0.2_git.bb | 0
>>>>> .../recipes-multimedia/pipewire/pipewire_git.bb | 0
>>>>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>>>>   rename {meta-oe => 
>>>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire-0.2_git.bb 
>>>>> (100%)
>>>>>   rename {meta-oe => 
>>>>> meta-multimedia}/recipes-multimedia/pipewire/pipewire_git.bb (100%)
>>>>>
>>>>> diff --git 
>>>>> a/meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb 
>>>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>>> rename to 
>>>>> meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
>>>>> diff --git a/meta-oe/recipes-multimedia/pipewire/pipewire_git.bb 
>>>>> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-multimedia/pipewire/pipewire_git.bb
>>>>> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_git.bb
>>>>> -- 
>>>>> 2.25.1
>>>>>
>>>> To be honest: I'd prefer the other way: Add it to oe-core (of course
>>>> not this old version). Haven't found the time to check more on details
>>>> but it is a drop in replacement for at least pulseaudio and jack.
>>>>
>>>> Andreas
>>>
>>>
>>> 
>>>
