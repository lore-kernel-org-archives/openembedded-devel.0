Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.6312.1605774966178498031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2020 00:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n9+FplO4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f45.google.com with SMTP id cq7so4948172edb.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2020 00:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=wCeVOTfN0kD7ublefZgH0x5LonGur9ivesOnFcrzzpE=;
        b=n9+FplO4aOBNyTe+1hehER7CD/yrffW8AuNH9h6MUgRAbLvdZ0BdF8V/AhFETfZYPM
         2POsUqSkZoFkQDTTdXva9e+fAkq3Pzd/Wu0odyiIYQgYa1AxaqOxfwyf2PbEEwaNdAjC
         x6MP1KlpsVCPWZ/1+HKG0jBV4xjFcpXmI7EWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wCeVOTfN0kD7ublefZgH0x5LonGur9ivesOnFcrzzpE=;
        b=NCSjYq9BB3hHT7feRT8B/ilA/+FBjZg+0AvQnKzcC6Q+BpoXbkBLrOJCdM5eVZ3Whd
         nhfrWAFcK0mVsY1TAi9C/MOPBkxVbXaaNoxaHq2mFJ5KeUuHec44H4UY/E317C9rximo
         VpnuMsYSN4Gto6Bjt/q+XzfGTBH/i1tERhr74s64SlBU0NkGlPrvyG2AFfoHeTAui7bD
         G35GVOU9Sj4ahZ22rrRI+3nn7L/F9KmO/n77DNNKjay3A5WjBMaT8pW04BC3rnzr9oAk
         06K/gwpVLB8E/errYk9zkGhzI2Mu3Euaujb+mAz5cdQ73ecRLOpeAxS5miPOekwrf/VN
         exsQ==
X-Gm-Message-State: AOAM532JW8iHXkYL7vfby3KcpQoL/t75EI8zyH9yb39ix8Sre5l68Jcr
	+/YKgt52Ill1T1ksS6b9NXOMN5H0E1xwMQ==
X-Google-Smtp-Source: ABdhPJyrH0QB1+1PBjYLzpVieWH85Sw0oztwnYRLwXMTZKxIDmdodEf26AMOgeS1F0XTxD34USW8Zg==
X-Received: by 2002:a50:fc85:: with SMTP id f5mr609126edq.225.1605774963911;
        Thu, 19 Nov 2020 00:36:03 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from [192.168.4.166] ([78.130.197.211])
        by smtp.gmail.com with ESMTPSA id m26sm14025830ejb.45.2020.11.19.00.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 00:36:03 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-gmqtt: Upgrade 0.6.7 -> 0.6.8
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
 <e8484d75-c240-6c45-7343-eda505e9aedf@gmail.com>
From: "Leon Anavi" <leon.anavi@konsulko.com>
Message-ID: <5332a697-6c3f-2d8c-7cac-645e0c232806@konsulko.com>
Date: Thu, 19 Nov 2020 10:36:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8484d75-c240-6c45-7343-eda505e9aedf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Khem,

On 18.11.20 г. 18:23 ч., Khem Raj wrote:
>
>
> On 11/18/20 6:02 AM, Leon Anavi wrote:
>> Upgrade to release 0.6.8:
>>
>> - Fix encode str to bytes
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>   .../python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.7.bb 
>> => python3-gmqtt_0.6.8.bb} (73%)
>>
>> diff --git 
>> a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb 
>> b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
>> similarity index 73%
>> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
>> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
>> index 70527e026c..6219d20093 100644
>> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
>> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
>> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM = 
>> "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>>   -SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
>> -SRC_URI[sha256sum] = 
>> "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
>> +SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
>> +SRC_URI[sha256sum] = 
>> "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
>
> you can drop md5sum from recipes and keep only sha256sum when you upgrade

OK, thank you. Noted and for new upgrade in future I will drop md5sum.

Thanks,
Leon

>
>>   inherit pypi setuptools3
>>
>>
>>
>> 
>>
-- 
Leon Anavi
Software Engineer
konsulko.com

