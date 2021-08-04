Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.9222.1628085532982039227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 06:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Eiq3USLi;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id dw2-20020a17090b0942b0290177cb475142so8850309pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=8oGyKSLFIbRJad9lc4ZTELlARwLh9o5Vc7uiajrUSGk=;
        b=Eiq3USLi4vLjCCL8pK+WHk311vxC6rn7/KdvL2WOLLAlJGrPFhqTp8tZdeZCn3o7NC
         hqN9tNUMSVwZimtv8NkRTLs3+Nrlu+tLSUR2E/jILrg8UcL8tER2y9QqJZhkOa3HiloS
         a+6zG9epaSpzHa1QqTycg1UtZb3tPFfkOBVjBgTZ4aMH7CTHCeEsCExgPP8hKGhia5In
         qgB9Fg1WfwZTQ6Q9ZrpuLCeGUaT9ablVK9sCiSSIzx00vb2Uh/lqpQZSQWe39UKdnEbL
         AxqMp34Q0P5ZhNkX24ihI+zWt/ArXf2/uccXiHmf+Jq47CaNzsKinMsMBy13ceKOtxaW
         YTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8oGyKSLFIbRJad9lc4ZTELlARwLh9o5Vc7uiajrUSGk=;
        b=ZJXBxUxDBYcqHAOqBWoZJSROXI4xIlUFdBOOmZQqerEUBlqq92094uzw7o5Q1SoR2l
         MinzI7oD/Bw+dUWwHS/P9AorC/alYpHDh4PWtBIdvEUk9Fhbcccp3puckrPMUNpkYXof
         rMSyCCtpDB4UX+XivbWbz+4ujgTkQ2lR/uOsPdoN+PAtuA903FTrAn3rW649GHNdvePb
         ivPR6jHqijXi0NE0d67MXvMfzj8t4NI9MDpu22te4JoGH2+U4mE2X8IrHjhuJdQolnpS
         OlMNh2RbYXL3+9rxntfsf2DQTfPo4cir71Iof9Zx6VYTLkhwbS7blEmr7CBEs1QLvVlW
         rc/Q==
X-Gm-Message-State: AOAM530IXp5Bvxd+mSyQgaxLJEExqEZDUsT8HFUAbF4QDpu1X3p/ovhZ
	16Kd4xRFoASwPq4uvT6sT2LpAdBw+ZT01A==
X-Google-Smtp-Source: ABdhPJy6AqN2YalirH8j3xsMVCfjjHBra8GsVX92SCHChl+N8pbPBDNOX6mLjaTNFF6vEdk5X7a1ag==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr79821pgm.175.1628085532340;
        Wed, 04 Aug 2021 06:58:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:484:f8e6:e2bc:be7? ([2601:202:4180:a5c0:484:f8e6:e2bc:be7])
        by smtp.gmail.com with ESMTPSA id ls16sm2635205pjb.49.2021.08.04.06.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 06:58:51 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Update SRC_URI
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <16959244EFE5AD42.32573@lists.openembedded.org>
 <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <19a36bf6-c3fb-bd5f-a95b-4c1adb4ec9df@gmail.com>
Date: Wed, 4 Aug 2021 06:58:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7df92ec1-743d-7b45-2bff-807ad3314c13@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 8/3/21 10:43 PM, Yu, Mingli wrote:
> Ping.
>
> Thanks,
>
> On 7/27/21 2:32 PM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Fixes:
>> WARNING: mariadb-10.5.9-r0 do_fetch: Failed to fetch URL
>> https://downloads.mariadb.org/interstitial/mariadb-10.5.9/source/mariadb-10.5.9.tar.gz,
>> attempting MIRRORS if available

Mariadb has been updated to 10.5.11. Are you still seeing a d/l issue?

-armin
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 2974341bf..e8ff41461 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -4,7 +4,7 @@ SECTION = "libs"
>>   LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b1becf0cfa3366e0f4d854d1d264f311"
>>   -SRC_URI =
>> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz \
>> +SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://my.cnf \
>>              file://mysqld.service \
>>              file://install_db.service \
>>
>>
>>
>> 
>>

