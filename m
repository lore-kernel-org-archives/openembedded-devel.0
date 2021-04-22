Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.1155.1619112740718324470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jCd8Vi7X;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id lr7so5538571pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Apr 2021 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UyPFsRy3T367S+dBDfzehl91Nmvn4BGfkdRVgAO7jrk=;
        b=jCd8Vi7XY14JgGCG9Ci5HPcYsusTsmOhTXa3Kdl77Ad5TO5sJDGBsHzvvL5t8pY/Yq
         IArPAyqkSKo2L6bGqldEmwJdX86nDJqSxFAj4SQ9cZUDc3ENnkvtCistJqZTXruNxYHk
         byq8paYA9mKEMzND+MESPKWsss3s03+p+K0CIDKhdpWehWwsTuJ5YJYnrhkkmYSAWRfU
         5FqWulJHoBxUN0j9TxYeTFRb8tOyYiPAepn9CglHFSNzhNgXUvI5BAv0JD490LXuK5yg
         VHOc+fTjaM2ypTnHjH/L1+lNt9u4L+29KSzcvrMTwRce/G3b3/JCS6T9M8AtpV+7yUbL
         PgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UyPFsRy3T367S+dBDfzehl91Nmvn4BGfkdRVgAO7jrk=;
        b=uY15KPCPVNZsdKhSnM0KYeicRVrZmBvbv1LO30SKN+9Kw+Dv5SHzLPjj1bQJ1TWv+P
         9+320Kxt2Q8K2TJcHdZ2OCPUECdst3//YnWYsDSqiPQOi7Bv5bysKbKliwPgJJh6cFb0
         eVm91YvN0+GB8e1qld5ut3llyA6bP6LQ5ITmk5drDEyq91e48D1UmFxD2FBtImoY/yax
         tAMeSEN14sJAp+gxt0rj3L1FczrN1FLshEVeIzFX1qiryz4g0137wDeRq+n+G7wl+k1M
         XebYEoTXSSPMV14GZhyxM1EEVSHlExH/xrbLp8E3oJwvhTTpkFuLaMnwSWeewQHGIgo/
         l1gQ==
X-Gm-Message-State: AOAM5328aqK+xVzomsp+XlsJJ30vX36d1RbplH9wGr7ahgFEN+9ldl4a
	LSWfveH44NIbRxIa8nMtPr8jg5GyXM5ZHQ==
X-Google-Smtp-Source: ABdhPJyb/fCG7A7nFg43Asn9zXxQmIZa++TOBiPVFXowUMF1BufORomZR3EblNKKxlJWD4MVyoXtew==
X-Received: by 2002:a17:903:4106:b029:e9:244f:9aca with SMTP id r6-20020a1709034106b02900e9244f9acamr4849978pld.58.1619112739951;
        Thu, 22 Apr 2021 10:32:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:68f4:e6f3:44c5:768e? ([2601:646:9200:a0f0:68f4:e6f3:44c5:768e])
        by smtp.gmail.com with ESMTPSA id o16sm2635359pfp.215.2021.04.22.10.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 10:32:19 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] nss: upgrade 3.63 -> 3.64
To: Armin Kuster <akuster808@gmail.com>, zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1619114328-5000-1-git-send-email-zangrc.fnst@fujitsu.com>
 <af4556d5-19ec-43b3-b820-390eed87db66@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <68d27254-8701-b3e4-6168-1b8a0fe5c38d@gmail.com>
Date: Thu, 22 Apr 2021 10:32:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <af4556d5-19ec-43b3-b820-390eed87db66@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/22/21 9:58 AM, Armin Kuster wrote:
> 
> 
> On 4/22/21 10:58 AM, zangrc wrote:
>> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
>> ---
>>   meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-oe/recipes-support/nss/{nss_3.63.bb => nss_3.64.bb} (99%)
> 
> I think the LICENSE needs to be updated to include 'MIT'
> 
> this update includes new files that contain that license.
> 
> see:
> https://github.com/nss-dev/nss/blob/NSS_3_64_BRANCH/lib/freebl/ecl/ecp_secp384r1.c
> 

yeah I agree. Also add it to checksums perhaps.

> - armin
>>
>> diff --git a/meta-oe/recipes-support/nss/nss_3.63.bb b/meta-oe/recipes-support/nss/nss_3.64.bb
>> similarity index 99%
>> rename from meta-oe/recipes-support/nss/nss_3.63.bb
>> rename to meta-oe/recipes-support/nss/nss_3.64.bb
>> index b7192a46d1..ff90d2caf9 100644
>> --- a/meta-oe/recipes-support/nss/nss_3.63.bb
>> +++ b/meta-oe/recipes-support/nss/nss_3.64.bb
>> @@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>>              file://nss-fix-nsinstall-build.patch \
>>              file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
>>              "
>> -SRC_URI[sha256sum] = "182d2fef629102ae9423aabf2c192242b565cf5098e82c5a26cf70c5e4ea2221"
>> +SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
>>   
>>   UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
>>   UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
>>
>>
>>
> 
> 
> 
> 
> 
