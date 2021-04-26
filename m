Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.8688.1619451729127341915
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 08:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R2bcP/gB;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id p17so3245182plf.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rS2hYo6YizAaK7yELyb/u3UtLRfpzt/ByifRmgOgt7Y=;
        b=R2bcP/gBhscgV190jhsSY2CilQ1B2esqH+qcL6I58Cws7nyYA51Lt/GpKu//hNowI8
         KU3i8s/QGbCugjPSL5zFPlzxHuhjVahiuTuA6BKP+kaqDfVp8P+854A7PwXtkgza+IHH
         Yk9sKawPfUsxeoOfTk+llhgG4yGK085NRtkl1qDvKr1PLLJwwq7dFkgVyqITJvrI6dQU
         6F9eNEhrJl91gGsHVnu17tl6pmkJFYN4nxRDg2JYlz2MkAzxKBNBo7KqHHfYaygBjXGH
         OgcGrRWun5B/eX6zMZb23RJhoqYHgPO0tOt6YEHN5rG3UNAhEvr1p3YURbaDcq+xz+A2
         l0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rS2hYo6YizAaK7yELyb/u3UtLRfpzt/ByifRmgOgt7Y=;
        b=st45yt/QKRJXr88jWVbQscHfetS+vqzQBrRk/Q8vMAktpUUZPXYUnIdWVUc+pLHZfw
         3yudvYvtzwI5hc3LTVAYURWrxdjvLjizcajgY4Min8/5w0cPlB+09LBYlytWuCWlyN1n
         NbS0NxN/ICKMnnIFnifT9Fp6JqqWesrjB4bdrkNSROxeDf4FioM61/UqzkROeEyI772o
         TRUXQ6zZr6Qi3SQkqR+4JlJG1Ce1bysfhWcBhi9f8Ro7R4J7XIeENqaF7KWtexqGs0Ah
         dYmTafoAJDD41xXbsWn2WsQwJQ4vH7KtLqAActSjcwIy1diWsTrY78y40xgvSuMqwbG8
         +nag==
X-Gm-Message-State: AOAM531NcLKbis4aNn3JMFZ0q5ZmbsrQUjmeJhU0yS+3P8V8rKgPmuR5
	gipZuQJKoDAZPuAklcm2Z2/X8IIbLjynZg==
X-Google-Smtp-Source: ABdhPJwL5bvRIbWeTLhJaHOMZ9zrJY7cxrp9oF/0CacH92R81yMRm/wRbDHwVy0W50Z0ktVxUgjErw==
X-Received: by 2002:a17:902:e809:b029:ed:258e:77d0 with SMTP id u9-20020a170902e809b02900ed258e77d0mr7067268plg.55.1619451728269;
        Mon, 26 Apr 2021 08:42:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:d536:2704:195a:eaf4? ([2601:646:9200:a0f0:d536:2704:195a:eaf4])
        by smtp.gmail.com with ESMTPSA id e14sm11342427pga.14.2021.04.26.08.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 08:42:07 -0700 (PDT)
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Ross Burton <ross@burtonini.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210424102451.885867-1-peron.clem@gmail.com>
 <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
 <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
 <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
 <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com>
 <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
 <CAAnfSTvonCSuKcUWamEBx+2SV1vsDuHEVNUx1D=9V3R4Cwe-VA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <408498aa-ec5a-7aa3-928e-d20da9918fca@gmail.com>
Date: Mon, 26 Apr 2021 08:42:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTvonCSuKcUWamEBx+2SV1vsDuHEVNUx1D=9V3R4Cwe-VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/26/21 4:18 AM, Ross Burton wrote:
> On Sat, 24 Apr 2021 at 23:12, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sat, Apr 24, 2021 at 2:48 PM Ross Burton <ross@burtonini.com> wrote:
>>>
>>> To be honest, as this is Arm-specific I'd encourage adding it to
>>> meta-arm instead of meta-oe.
>>
>> I would tend to agree, although there is something to consider it also
>> means all arm SOCs will have to depend on meta-arm for this recipe
>> which may not be a bad thing but some BSP layers for ARM based SOCs
>> are independent
> 
> The meta-arm layer itself doesn't have any machine-specific recipes
> and is simply a repository of common recipes.  There should be no
> barriers to an Arm BSP using meta-arm.

sounds good to me.

> 
> Ross
> 
