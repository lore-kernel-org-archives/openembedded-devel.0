Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.3603.1611883491445819417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 17:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eVuLSHY4;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id g3so4379754plp.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 17:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=+PuB0on9tVetO1pI/wrHQIALAgEYfihzj+B9cd8/VkI=;
        b=eVuLSHY4WIxieoA9xX9RkrNCLnpsvO5Mpn/zwWCDio0fcHvSum1tbVESlWe1aZVXaZ
         LLrOnAW6IaQFaSgL7P7lW8uT2nt4T+EWnSkSX10WmK83s52KcqKaspqmRmikcykau8pq
         IuLsTqlEL1M7sHW/9N9ZQsBfyFx0cSwkJOH0LtfEoy6KvpIe7KCX+rZp0xToWAiQYtif
         3cDUFMvL7k8TiYm2F2mO/iW+JJBQ+hkFq5kHD0EctuzGZB24/RyvIGut9yV7pqPG6Emx
         ectsFa1ZX7CE5Uv/XUjAPwgnspsrbCAaV4gilSSFmHiBMhlD0g0kAr/zLbEXP7KO4zrD
         V2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=+PuB0on9tVetO1pI/wrHQIALAgEYfihzj+B9cd8/VkI=;
        b=mV7zZvfW9t5f3NeulrtrAN9XXkxf9avbOgy00K3vW9/w2xfX2t7WcJKg0FCapz8DwU
         DuFpVsNTuwzPSOEyU7d1p4Ty4VQWx1Um/9P7VyjoufaHHF4kLdnF5vrfmTwRac1840PO
         xmlPoCbtFexLtBtYcpw2qIH8TJt4s7yqvYGowyCR41ms81G+yIOmIfJhCoVxAvuyhqqn
         v7cp+7pouf7WRJ8H0wJZj25PJDMr4EX4hxDQLjl84nHhS/BPMRGN7OD+xU5epqAK8BRc
         BGdCa4yic9SNwhW9NVbqX5pUQ1MAZ4lUhuqIi09aSM65zs02vdgsHUyEtofWZzuAjcVF
         BCPQ==
X-Gm-Message-State: AOAM532yy7Q22j5MIu1ri/nfB2nEEJ8ZuOtrG7O4vX+o/HcJnGFtiufl
	g2m4q/998RTzJuoc3h7k5Xs=
X-Google-Smtp-Source: ABdhPJzLb8iA5CWsq7s0ti6OCl8hh7r+lpVj/xa7onDs8oTmiquLiJ2yyoYlRQfRckb2RT6iKQcWNQ==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ec4 with SMTP id n14-20020a170902e54eb02900de8c702ec4mr1917303plf.56.1611883491012;
        Thu, 28 Jan 2021 17:24:51 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:41d5:7688:5129:bafc? ([2601:202:4180:a5c0:41d5:7688:5129:bafc])
        by smtp.gmail.com with ESMTPSA id j17sm6681381pfh.183.2021.01.28.17.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 17:24:50 -0800 (PST)
Subject: Re: [oe] [meta-oe][gatesgarth][PATCH] zram: fix sourcing of zram parameters
To: Ulrich ?lmann <u.oelmann@pengutronix.de>,
 openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?Q?S=c3=b8ren_Andersen?= <san@skov.dk>,
 Khem Raj <raj.khem@gmail.com>
References: <165C3A4E85357A25.14278@lists.openembedded.org>
 <6rsg6llh8g.fsf@pengutronix.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3eb6e2f3-b8ab-784e-3550-51e81ac2efb6@gmail.com>
Date: Thu, 28 Jan 2021 17:24:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6rsg6llh8g.fsf@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/27/21 10:15 PM, Ulrich ?lmann wrote:
> Gentle ping!
running is a build now. May take a few days to finish.

-armin
>
> On Thu, Jan 21 2021 at 12:01 +0100, Ulrich ?lmann <u.oelmann@pengutronix.de> wrote:
>> From: Søren Andersen <san@skov.dk>
>>
>> Signed-off-by: Søren Andersen <san@skov.dk>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
>> Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
>> ---
>>  meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
>> index 0643dbca2341..ccc3aafe3a6f 100755
>> --- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
>> +++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
>> @@ -14,7 +14,7 @@ fi
>>  ZRAM_SIZE_PERCENT=100
>>  ZRAM_ALGORITHM=lz4
>>  
>> -[ -f /etc/default/zram ] && ./etc/default/zram || true
>> +[ -f /etc/default/zram ] && . /etc/default/zram || true
>>  
>>  memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
>>  memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
>>
>> 
>>

