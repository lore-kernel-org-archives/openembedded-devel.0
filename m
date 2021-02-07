Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.16147.1612669110113504620
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 19:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bCWranEr;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id v19so723376qvl.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 19:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98VlN60B3Goz6t08yWVmob2nnq+wa25E4SVmZ1fakJU=;
        b=bCWranErTWnYLy0/InZ6Vj4gdfBnN4xWwL/fSgTYxu1DO8CoCMNqZkpZRQfU9DxAGC
         Lnz4xFiqsd8yuHK/U8SdxuKYPOvxXTMqIe7RUGyAzBPmnR+zHsycUEXNbInJ8a3Xe2Rz
         D9xrbKsKD3goANEJ34Y+butEXNh1mh4LtZzrpEM1Z8Q3CmM9GDxuDXVRDzk+iR/Amln5
         hlUxltKwq+56k1ZQo8zC9u6UNbdh2cNZI18FL1IH5wOZ514RUdZ5gER/k9+BxfIbdwjq
         OfsPUx3JYF08n/2ATY/2WU1c60a4gBRGcBCM7PVtsrDHKebRy2OKPOq8wJNFPwBE4ot5
         AkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98VlN60B3Goz6t08yWVmob2nnq+wa25E4SVmZ1fakJU=;
        b=Nr0x5RnHpKTFnoseNMpk3A9HMg6NLJL1TSsZY0ER+hP8ddPEdRcQQ9VrQyOyy3tDss
         HuioXS3BaE5deZOu2OitBYqpz4Fbxolp4JQiWK1gmKT30Ef1DNhSfafTecJzdxHdAwXA
         pzi/rvueI4A4GM815MGZri/MuSDAzDubgUENqzJEeN0vcqVXY2BwZ+2ULsy1zkZlOdiZ
         PL6L5YIZXMALLG61yB6kD1zI4o98l2xOfcTkKLLyQTN+dQotaw0KXFM+51y6ujnH8OVw
         6W0VQAFvfb6ixJdYYH/2AeH8sBZ8gAIChgu3Pk+MxxBG4a7psjLMBBKcWqPuq3G3HHQn
         WHJQ==
X-Gm-Message-State: AOAM530fo20mVzhew7E0JVgS51Q2NXwXquVRjEDwauKy32jarKIZUZ2B
	lJPgnzjP+ov0CgMj6YH21+9bbRvkjPLr2ay7uodYncUHYAk=
X-Google-Smtp-Source: ABdhPJz3iVyHE0dtK3WN6/Lo5yP4O2r2G0QzjYhfwkg1QFd+GSZ9z3EQqA32hloMHDO3eJIkwrukm20uWNpv2RT0fs4=
X-Received: by 2002:a05:6214:571:: with SMTP id cj17mr10685948qvb.38.1612669109141;
 Sat, 06 Feb 2021 19:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20210206174155.2670243-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1sqmbanbwmvYMtff1R6N0P8TpjEHeyhiDPX4RbzXYiajuA@mail.gmail.com> <28cd3b22-fe90-17e2-cbf5-754114933c45@oleksandr-kravchuk.com>
In-Reply-To: <28cd3b22-fe90-17e2-cbf5-754114933c45@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 19:38:02 -0800
Message-ID: <CAMKF1sox+78HWYyaDqD5aJq_k9G4f+9vzb9QZcD7bf=ehkwsjA@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] cereal: update to 1.3.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

perhaps call it cereal

On Sat, Feb 6, 2021 at 6:55 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Absolutely. What should the recipe actually be called?
>
> On 06/02/2021 19:04, Khem Raj wrote:
>
> Thanks for patch we also have libcereal in meta-Oe can you merge changes from that recipe here as well and then delete the other libcereal recipe
>
> On Sat, Feb 6, 2021 at 9:42 AM Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com> wrote:
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../cereal/{cereal_1.0.bb => cereal_1.3.0.bb}                 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-devtools/cereal/{cereal_1.0.bb => cereal_1.3.0.bb} (92%)
>>
>> diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>> similarity index 92%
>> rename from meta-oe/recipes-devtools/cereal/cereal_1.0.bb
>> rename to meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>> index dd3dc189d..a4b7f3432 100644
>> --- a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
>> +++ b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>> @@ -18,7 +18,7 @@ SRC_URI = " \
>>      file://0001-add-license-files-for-components-of-cereal.patch \
>>  "
>>
>> -SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
>> +SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
>>
>>  EXTRA_OECMAKE += "\
>>      -DCEREAL_INSTALL=TRUE \
>> @@ -32,5 +32,5 @@ PROVIDES += "${PN}-dev"
>>  FILES_${PN}-dev = " \
>>      ${includedir} \
>>      ${libdir} \
>> +    ${datadir}/cmake \
>>  "
>> -
>> --
>> 2.25.1
>>
>>
>> 
>>
