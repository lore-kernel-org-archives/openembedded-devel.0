Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.330.1627687092858969500
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 16:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OgQkIRe3;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so5905266pjb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 16:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=WICMPGqdZtRSAcLxpRqmVNfI/FFDJrv7cBns1N3dFk8=;
        b=OgQkIRe3Ka0m5C/rPQU/ysSd3kQQhaxIWpwikGAlBM7Y4wBY7Ly675Rndbk2k1qid1
         S0RXHlyMoI2nciN5cSwoueLBmUhSRgNZ5wfWUGxo22zomwdwsNDf3C+bsNCJF3EuCdly
         vyWEHo8KLuoWByffH27XOr4ZO2lRqXiOwmZdmUQ7ChcM7GqM8rvPbPL9a3PS2v5GsLn5
         JCRoO+gAZOoWqdx0wSen2CXeyHP+3qjTkGYRaIMRIkUHMAZnebdpQIO11zSmmM42hN+3
         NMqHHQnF34UrLBQCwemv/CbeuOdRWLOAKAtUoj+PjJr1z/RCeAjSMAKKBKOIPVlw9M4X
         KTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WICMPGqdZtRSAcLxpRqmVNfI/FFDJrv7cBns1N3dFk8=;
        b=JA6sT4kbD/lU5NA8iDLZEqW2gu1IfyvTvGI5UZ4nS+JC+yTKWWH79UbwpFOJ209A51
         97AZcmXELDvt+nTMbkrpWBLw72C0RGJC+JMIzplVHAVin+wu6w4xV7dbx2EEYU1O+qRk
         Yf1FwrBM/XiKoDDIwblA21smcNgj8xY3gApmHGkAMC9+em4BeijlZ2wofxsvXc/Bi31D
         VW9wB7fAp7fUZDt2n2z/bb7bPdI4/u/RzZvnHL2uhsr4HO86ajVqF1w4t+6IxQJnJKMT
         oqKPGjnSJ63qyOY0Umg8KVcY7Np7WojICKmpzXXgupBBcBRTzNrJLjwDThndj62Je6qK
         4IvQ==
X-Gm-Message-State: AOAM53223Ewh5mDznLuGhz7CHSe4SZ0CzrjiZsJRHIo1InSkVnhsGcSV
	TBb4hPyDwrPUZOqMadPanDhLTGpMQDZkoA==
X-Google-Smtp-Source: ABdhPJybpS1L0MTReRTmvR1JaGwOuzHWN1tlH9NtSkS7Id5IdFPzOPq5uZRHxvbQmGroZFlQ10Z6qg==
X-Received: by 2002:a63:3113:: with SMTP id x19mr1124736pgx.260.1627687092011;
        Fri, 30 Jul 2021 16:18:12 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ca91:39d9:9a60:f69f? ([2601:202:4180:a5c0:ca91:39d9:9a60:f69f])
        by smtp.gmail.com with ESMTPSA id n11sm3488983pfj.158.2021.07.30.16.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 16:18:11 -0700 (PDT)
Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-urllib3: Upgrade 1.26.4 -> 1.26.5
To: Randy MacLeod <randy.macleod@windriver.com>,
 Joe Slater <joe.slater@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210720185352.134342-1-joe.slater@windriver.com>
 <36590d9a-37b4-d42c-123e-dfac19c88cdb@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <60a79408-9f15-4eb3-f964-f8d10b91f2d3@gmail.com>
Date: Fri, 30 Jul 2021 16:18:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <36590d9a-37b4-d42c-123e-dfac19c88cdb@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/30/21 8:36 AM, Randy MacLeod wrote:
> On 2021-07-20 2:53 p.m., Joe Slater wrote:
>> From: Leon Anavi <leon.anavi@konsulko.com>
>>
>> Upgrade to release 1.26.5:
>
> Armin,
>
> Did you miss this one, I don't see it in:
Most likely got confused with the other pkg update that had abi
implications. Thanks for the reminder.

-armin
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut
>
>
> Thanks,
>
> ../Randy
>>
>> - Fixed deprecation warnings emitted in Python 3.10.
>> - Updated vendored six library to 1.16.0.
>> - Improved performance of URL parser when splitting the authority
>>    component.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>>
>> Fixes CVE 2021-33503.
>>
>> (cherry picked from commit bb39c29a46e44fcc082aed0ce8772f4267a41d2d)
>>
>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>> ---
>>   .../{python3-urllib3_1.26.4.bb => python3-urllib3_1.26.5.bb}    | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename
>> meta-python/recipes-devtools/python/{python3-urllib3_1.26.4.bb =>
>> python3-urllib3_1.26.5.bb} (86%)
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
>> b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
>> similarity index 86%
>> rename from
>> meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
>> rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
>> index 0a31fb1e2..f2fb33c6d 100644
>> --- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.4.bb
>> +++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.5.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
>>   -SRC_URI[sha256sum] =
>> "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
>> +SRC_URI[sha256sum] =
>> "a7acd0977125325f516bda9735fa7142b909a8d01e8b2e4c8108d0984e6e0098"
>>     inherit pypi setuptools3
>>  
>
>

