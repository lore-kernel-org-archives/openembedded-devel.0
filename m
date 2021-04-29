Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.1258.1619663470177647133
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 19:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hGXGlIv1;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id l19so12784252ilk.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Apr 2021 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=FD4SFoo9QYSXy57Z1UzPZsznKP4iGLT2MgL+ugDy7Ps=;
        b=hGXGlIv18BfZqZlGnWMGO5QBmR4fTxtNaWQko0KgV0taIgoTkznRR+V1PnhlqakZVY
         OndwUDDe2cQD8h7KwBf82yvHhXB8bpoZkLXdNx2+IFnyQBJ/a9ZYew7AtzW/TF+Bn2kL
         Wvtn0p+WD+Fc/pVBlWl9qYBNazyYl5bDmGhPamaMRDOHmnWQ3jLNm2qvuy5kt3K1zyAA
         IKcsu+MaoSRTc/xn48DpMTAAiruPwekZtQ4mN3/slYHq9NM0fzzSE9Hnu6D5kpGTYt1l
         XyZHI8mK3hOtWP95bdQN2nr9q3AbLoObqeUa8uXnQ8xsLzWnYA/cTjPvMsCLTVQPC2fZ
         h0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=FD4SFoo9QYSXy57Z1UzPZsznKP4iGLT2MgL+ugDy7Ps=;
        b=t1DpFj1YtM6MBxwZK89CXZSFK6uT2BxKtGbDokYYN2jqG6Cl5bdeaVTlV0Y49Vc+uE
         VDR96pA5z0136UKllccrC/Fu6ZxrUE/xOdpHMvFRhAJQny9j6yNK8qbgtiWT7FnchjD4
         RzJmq5dAPcLzvnjSwiV25+dlM5zQaGUlFJI9VUGFY/Mid/o5C6YMB1IpRXXEPiPsJbCa
         ay66C6krkat/X9BquIAhc0b2ASBIcqI10399MSrg9ciA6axO55Mi601w3rz6QeqwgG6g
         BqtWL9/A+LHI4I2d93HDN0DszfcHSaULot3qbKE21ya60xw+K9oDfrPoyuhsVj7oMNK3
         ZpJA==
X-Gm-Message-State: AOAM530VaUS0ow0XwxQWS43RbdOZgYQ1rMgHnYivjlkQUqMSgt9xDgxo
	WjXB97LizQWSPYZvahOa4p/XKxCAiq9faA==
X-Google-Smtp-Source: ABdhPJzwMmaT5IjSenHYXAvX9K6P4mXQFyiT3Xw76pR6LQHa0O2eXd5q923yiU8OugyLy88gIXm64w==
X-Received: by 2002:a92:d09:: with SMTP id 9mr25284248iln.229.1619663469459;
        Wed, 28 Apr 2021 19:31:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:a9ac:3dd7:2c01:881? ([2601:202:4180:a5c0:a9ac:3dd7:2c01:881])
        by smtp.gmail.com with ESMTPSA id u8sm713776ilq.9.2021.04.28.19.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 19:31:08 -0700 (PDT)
Subject: Re: [oe] nostromo fetch error on master/hardknott
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
 <CAMKF1srqFHxSdOspdBTuj-i8dqTDfTUsYgErq3yT=9p7+k33+w@mail.gmail.com>
 <2775537c-e217-bb3a-f82b-699c987993cb@gmail.com>
 <CAMKF1sqhVK=tKWja90Ss+kL1wh3vUMd59YBhBEWKGL2ATqZyDQ@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4602dd11-ced2-c502-9ef8-f68c53461176@gmail.com>
Date: Wed, 28 Apr 2021 19:31:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqhVK=tKWja90Ss+kL1wh3vUMd59YBhBEWKGL2ATqZyDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/28/21 7:20 PM, Khem Raj wrote:
> On Wed, Apr 28, 2021 at 7:10 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 4/26/21 9:03 PM, Khem Raj wrote:
>>> On Mon, Apr 26, 2021 at 10:14 AM Armin Kuster <akuster808@gmail.com> w=
rote:
>>>> Hello,
>>>>
>>>> I just notice new fetch errors for nostromo
>>>> <https://git.openembedded.org/meta-openembedded/tree/meta-webserver/r=
ecipes-httpd/nostromo/nostromo_1.9.9.bb>
>>>> in meta-webservers.
>>>>
>>>> The hosting site is not responding. https://www.nazgul.ch/
>>>>
>>>> My limited search for an alt source is coming up empty.  Is anyone us=
ing
>>>> this app?
>>> If this site stays AWOL then I am willing to accept a patch to delete
>>> this recipe.
>> The site is still not responding.  I will send a patch for Master by th=
e
>> weekend if no change.
>>
>> It posses an odd problem for the stable branches.  Would adding this
>> recipes to that offensive exclusion list be acceptable?
> I think it should be available via sources.openembedded.org mirror but
> perhaps you can add PNBLACKLIST to such recipes may be
sources.oe.org only has 1.9.5 and 1.9.6 so I will double check the
stable branches.

hmm, am I seeing this correctly. I don't see any packages for 2020. Can
someone check if its being updated? do we update it??

Do we need sources.oe.org. I wounder what the community thinks....

-armin

>
>> - armin
>>>> -armin
>>>>
>>>>
>>>>=20
>>>>
>>


