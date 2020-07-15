Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.61.1594785156618436651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jul 2020 20:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OiPlGKKt;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id o22so1958614pjw.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jul 2020 20:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sCAJd6div5qY9UKgz0zK7o5c2NroERT9lfbnT9o2pdM=;
        b=OiPlGKKtGit815+OiKQo2VfbDVU+PBTaFlIryE77ukku5lWUPXHxMtQzeM50ljJvhN
         aiQrYmpPBSKf40G7jeCfUNJTk34A6qz3oPzl91YVzVYK4erSL64U4V6wDff3w6BSaH63
         pNBlofxt1UMqPa9LI5q2Ko+eFwCA2iltyNsjH4drO0U4zkPDY+8HQPgr8IgbmXkV/kQK
         2KKb47n3YnGMQ0goKNUGiTYFqek778UzO48N3VclhvJCt7w7JjI4Or8Bsvy64ZlNk1et
         X3aAAy8hx8wS0/MsQwIamQ7FV8E/VKnIbos55MWhtaP7hgppIui7OpIKUGyTR9xJOjPj
         UOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=sCAJd6div5qY9UKgz0zK7o5c2NroERT9lfbnT9o2pdM=;
        b=L9aiEtWE1eIxocvX/YTnBCgM2Se2Daui2ODmUyUQKJVaCUIxi1lDtMdA7Nyfxj2zvB
         nunH6BkS1kXbRSYMRduuHF+h+Ej1zZlwycy8tiL9LZDzJx1wuKoIotB7qGd0yBp6+lSE
         TKf5grR8OSTiGXtOWMaJz8F+dqRzyBXel6xy5ylHZQO8ZV0a4VTYyB9yJUng3f533uoB
         qnn6p3t6OynC6xlFMKOHkpISJCTrTUAbKugFOP6Ryg//2DSv8Y/t9ReHN9il9EJx0gzI
         gTdaggFhmnz9SxiA09obcm2EUBd1F2OHWAaAm8MZYtHg4T0aWrM49z2P5JeObqxMhUdJ
         Jxnw==
X-Gm-Message-State: AOAM533UMYCO6WeO/8a8j4UHQ3JHdoSjFzP7/29UOQAdgag1+wYYkRzf
	z9DdarIeU/Ktwt2OAYOs2Wp3hJh5Nkw=
X-Google-Smtp-Source: ABdhPJwRoD3NAYqh/hSopmoKeXfg7WPRrx8h5xazH53XBEwskABEy3xFHQP6RhFmMDEA01MnCJOYbw==
X-Received: by 2002:a17:90b:1b44:: with SMTP id nv4mr8037405pjb.84.1594785155920;
        Tue, 14 Jul 2020 20:52:35 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7df4:7f73:717d:af68? ([2601:202:4180:a5c0:7df4:7f73:717d:af68])
        by smtp.gmail.com with ESMTPSA id r2sm526677pfh.106.2020.07.14.20.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 20:52:35 -0700 (PDT)
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: Khem Raj <raj.khem@gmail.com>, Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
 <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
 <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
 <20200710073738.GQ108868@korppu>
 <06e723c4-54f1-10f8-3d2a-f8be6cca1a06@gmail.com>
 <20200713082540.GX108868@korppu>
 <CAMKF1soout4WD0nWYa5Nmx9+GiW69UfLTpP6x+iFPtWF0mny1A@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3dad38ce-0b75-2a75-6488-189753b36ac4@gmail.com>
Date: Tue, 14 Jul 2020 20:52:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soout4WD0nWYa5Nmx9+GiW69UfLTpP6x+iFPtWF0mny1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/13/20 8:46 AM, Khem Raj wrote:
> On Mon, Jul 13, 2020 at 1:25 AM <Mikko.Rapeli@bmw.de> wrote:
>> Hi,
>>
>> On Sun, Jul 12, 2020 at 11:41:58AM -0700, akuster wrote:
>>>
>>> On 7/10/20 12:37 AM, Mikko.Rapeli@bmw.de wrote:
>>>> Hi,
>>>>
>>>> jsoncpp seems to have messy ABI history so I would not update even minor versions
>>>> in stable branch:
>>> so are you for a revert?
>> Yes, I would prefer a revert.
> I think that's fine. Armin can you include this in your latest pull
> review bundle, please?

Sure.  I have a few more things to capture too.

-armin
>
>> -Mikko
>>
>>> -armin
>>>> https://abi-laboratory.pro/index.php?view=timeline&l=jsoncpp
>>>>
>>>> Cheers,
>>>>
>>>> -Mikko
>>> 

