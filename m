Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web08.1066.1619662241465781612
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Apr 2021 19:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ji94X/2J;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: akuster808@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id i22so922735ila.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Apr 2021 19:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MlZgohfPF4ZWJqfXHRYvFmvUJjCmIrPd8w9yofSElc8=;
        b=ji94X/2JhBdNtqjD3GpoKvhxI2TqR7bUDCdfXE+zuJtLHiB+qG6zrntqAy/pVecnLQ
         pdo8zAVo4ZIWtNmWUFs+7XI3A19NYQ9Vx/iMvKxQz2GDgTh3Bkts15kBdVbDiuTk1a0v
         coDI504jQncmSKQu1cTvCrenSjkuRBxKxrTLZVGMDA5SvUtcoPVKJPwl5Qs1x4I7/546
         JOdiun29qxHVuDRFQvvoWLGf0+4Hff+FBJR9fMRPvvMUjQ73ZxDacIgQhnS6Z3OiyJgd
         TuZCtUjWzQ9VXPyNMNgt06iGz1VMfsD89+S6eROljE7pvFn6Sgq3DyLy9jTU8x867TGC
         Fyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=MlZgohfPF4ZWJqfXHRYvFmvUJjCmIrPd8w9yofSElc8=;
        b=eNRdwOKI5DPoceM0tMi+GSAYHyJRgvvgVSybb9kWqLUgSQE9x5DJQXt7sRLIxqZjIQ
         aLhJKGydrUynjbm1ZWIVcqxWqprdobSIbTfDcaG4sW2EfNZX9goX/y/raVgHxuhYxuZJ
         9eMyAD+UIORwJa96jAH3dyxwN3kTTDWow9kDW7IF9FLVeXy62J5S9aSfp2+/N8eA4h4P
         pntt/KVQVKqSp4PQVS254pvkxShRepoo6hont3PW+N+I45rk/jeNtl1tdFOocWf2mWFp
         Fj6KHrF+F1doun6RJHZ5VWJyD1g4d21RFbDLwOhKQy9ojpxf2PtfM4Wd/6qB5K3LYOy2
         3/Tw==
X-Gm-Message-State: AOAM533N7lDn1OWr1MxS/GyXQHxl+jHmCEN/Ym+GgjZ2ANTYFx5LgKuQ
	hEituiaTA/YkuiM07Tkrc+4W1bP6jk+98g==
X-Google-Smtp-Source: ABdhPJzE1TYekO8TbeBUbf0lJpI0ynvCtHcM0bfQwOBY35UcniDa4iM9We2tc27N6uG+MEqCf0hb5A==
X-Received: by 2002:a05:6e02:1be7:: with SMTP id y7mr25800104ilv.300.1619662240635;
        Wed, 28 Apr 2021 19:10:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:a9ac:3dd7:2c01:881? ([2601:202:4180:a5c0:a9ac:3dd7:2c01:881])
        by smtp.gmail.com with ESMTPSA id n11sm712548ioa.34.2021.04.28.19.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 19:10:40 -0700 (PDT)
Subject: Re: [oe] nostromo fetch error on master/hardknott
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <3d3b4f06-859a-86cd-e0ed-0934c673e76e@gmail.com>
 <CAMKF1srqFHxSdOspdBTuj-i8dqTDfTUsYgErq3yT=9p7+k33+w@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <2775537c-e217-bb3a-f82b-699c987993cb@gmail.com>
Date: Wed, 28 Apr 2021 19:10:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srqFHxSdOspdBTuj-i8dqTDfTUsYgErq3yT=9p7+k33+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/26/21 9:03 PM, Khem Raj wrote:
> On Mon, Apr 26, 2021 at 10:14 AM Armin Kuster <akuster808@gmail.com> wro=
te:
>> Hello,
>>
>> I just notice new fetch errors for nostromo
>> <https://git.openembedded.org/meta-openembedded/tree/meta-webserver/rec=
ipes-httpd/nostromo/nostromo_1.9.9.bb>
>> in meta-webservers.
>>
>> The hosting site is not responding. https://www.nazgul.ch/
>>
>> My limited search for an alt source is coming up empty.  Is anyone usin=
g
>> this app?
> If this site stays AWOL then I am willing to accept a patch to delete
> this recipe.

The site is still not responding.=C2=A0 I will send a patch for Master by =
the
weekend if no change.

It posses an odd problem for the stable branches.=C2=A0 Would adding this
recipes to that offensive exclusion list be acceptable?

- armin
>> -armin
>>
>>
>>=20
>>


