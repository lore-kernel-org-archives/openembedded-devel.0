Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.6688.1632020705596491999
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 20:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=edhmUSZZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n18so8803524plp.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 20:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5/7lnwpQDJY2wpu/32JIF7nXaiYp+ubPuRDs4VJNbTk=;
        b=edhmUSZZ7t9GnksADFmXGKkxNWCINUinyv0OrbsfW8h6FKBM/HTXZqupj9lgL9ocQv
         paUOVv7NGg0LJUSb53K1HNRHWI3rd8yJNiaTBL69XgewOVZrBRLzU98G6pzq6AVT6o5o
         toVGBjEeFfYX9eZTytNEQksI5s2k04987QGRYwuKtKBkVKWMnAaq9kwrlT9+b7m+UQMc
         Cj03OB1GryogTrWknt5J+ASOGxiTAr9qVtoco48HD9CZbT9OPZpuiFdHdXTiWvCfCg/f
         K6nPunno2YJvkz60Q2NP9PxfSvxyVm+S9qV4DNeXjGNmAWk4B13viapSY1eVCmFZlfAn
         DgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5/7lnwpQDJY2wpu/32JIF7nXaiYp+ubPuRDs4VJNbTk=;
        b=RjhI+8jZ/ptGKY9R6RkcOwn9XHPLB8yy9CXzmVLHwyeYrGT/9yZQ0j9GMYYXmDSKgH
         M+ez+htr6rDKXp5PkSI5HuDThxZ6DAwWi2Sa/e3Ek9l3gvVe1/TsQDMZB8r8NqcA5+Bs
         0p+r/meUGOnBYmqRPfZjY2e+muVjqE6LtPkri6nF1P2+P4t8f7i2vTu2qMFJz5o2k0N5
         cbqZKszhapwAzWM/azTXCkMxNDDRlm5l2GPU9YndWcJQNSucs+0Ots1mMqW4iFx+k52J
         VbMz4d6JaUTnPK1t8Nzf6K6YgxxHrVUWg9JA+hq3hmj7GOZpdWWMrWTtEC6P2nKSc498
         yaxw==
X-Gm-Message-State: AOAM5309OicofMtv6QW0zkMxMvCJ7CIOK/0sIFL07m95iZO0Y9c3jPlg
	GsIDawGIOvp2O0RpGdzOUjXDwIKgP7w=
X-Google-Smtp-Source: ABdhPJwh6pIpZ8+y4cip58rGOF7lgpwmQI46CRcFKrtBwMiqd3bTl7lMwcP+zLEvMcTS8GSY/yhOkg==
X-Received: by 2002:a17:902:dac2:b0:13d:1db4:dcc2 with SMTP id q2-20020a170902dac200b0013d1db4dcc2mr10780773plx.77.1632020704748;
        Sat, 18 Sep 2021 20:05:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cf26:fc5a:d6c7:2fa? ([2601:202:4180:a5c0:cf26:fc5a:d6c7:2fa])
        by smtp.gmail.com with ESMTPSA id c9sm1706219pjg.9.2021.09.18.20.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 20:05:04 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 12/18] python3-geojson: set precise BSD license
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210918165738.2581429-1-akuster808@gmail.com>
 <20210918165738.2581429-12-akuster808@gmail.com>
 <CAMKF1srmqAz0im-MQTnudb+bmg3yghwyiVJEj=D0a0dn+5bQaw@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <297ed8da-90ca-2cb2-5a04-79cfd549c021@gmail.com>
Date: Sat, 18 Sep 2021 20:05:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srmqAz0im-MQTnudb+bmg3yghwyiVJEj=D0a0dn+5bQaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/18/21 12:53 PM, Khem Raj wrote:
> On Sat, Sep 18, 2021 at 9:57 AM Armin Kuster <akuster808@gmail.com> wrote:
>> "BSD" is ambiguous, use the precise licenses BSD-3-Clause
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
>> index 1a21230113..5c60673af4 100644
>> --- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
>> @@ -1,6 +1,6 @@
>>  SUMMARY = "Python bindings and utilities for GeoJSON"
>>  HOMEPAGE = "https://pypi.org/project/geojson/"
>> -LICENSE = "BSD"
>> +LICENSE = "BSD-3-clause"
> it should be 'Clause' this comes with warning on AB see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1551
I see you fixed it. Thanks.

-armin
>
>>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745"
>>
>>  SRC_URI[md5sum] = "14753ed28678828b1de73f68b04e2324"
>> --
>> 2.25.1
>>
>>
>> 
>>

