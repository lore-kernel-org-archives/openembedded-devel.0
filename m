Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.26757.1605716620962229625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 08:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F0sTbit7;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id w4so1500597pgg.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2020 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/1GIT7dONjarIkATctrYH3xwFxcrOmmB4euZOLwuDuQ=;
        b=F0sTbit7UO/dtw8MQSZqukt4l5yiXS2w320WUy8LBL2SFy28NgXHvDgfkGisJrhWw1
         hbprq8tEUwniPDcZELoX7L06v5tmB7bfoD7HtmPLy+bEU8nwN4PDjxVBw0a+OgruzDcv
         AWiYGPYfae5Xs8jle7iz46TleEwL5lWhCGzRG7FkxhFX5p3UVLYJX6joLCAd5i2VmXVi
         8Na4B0Ak5+sPO1MtWopP6Y5dsgvUCd3XWxaiVX1+COgzZIm2837618gECCFIks8RR5up
         S3+tfVWlCA0iqE5C29C1dXUErK2rIia2gOtOGKLxjTxVl1Fw2FAR9ZH3Wl0HthxcMXkp
         P21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/1GIT7dONjarIkATctrYH3xwFxcrOmmB4euZOLwuDuQ=;
        b=PDDetAqhq4HdMNYAzfT+GcQhdRSTlqFR6YXFa7y6+1N2GMNrbwwfAExJEWGfNLLaE9
         l6yCMABgrN3mMXshA4An/p/JYHyiU0ETO0yYaufrOz80Nzt3/72aGEuuTiKoPL2jUH/v
         7cUizheQ7tMyAsCsnw9qNO2KZEdA6AP002TrYoEXCFVLV5Xg+iT/Ewx5SRkK421XxtME
         7k8nrJ9V+FrNAxI4JaZylkP5/SSsCII+rHXhg+FrqSrXgyjjWxRVlkKRbjOE9JbEdpBz
         M8VwZf3MFp9Me5euzZI3dMe8SKRQS/5NIYbGMXY3ieUbY9oxmnSXSI7Y8WiivqJiSW6X
         fCIw==
X-Gm-Message-State: AOAM530cdW08WT0RLSeqH6es+8owXLVfsMWL0toux+l5vVBzR82fj/vs
	wr9xJbqc7yE8rhZAqnNBWK4Kz/I7m1DhkQ==
X-Google-Smtp-Source: ABdhPJwDDzgkzs6+YU/4ZtaJvlVKRjikvdvdINTz55JJtzTfXpgoSG3aGFJU4M0dpj5WJCW9P7q/GA==
X-Received: by 2002:a62:293:0:b029:197:96c2:bef6 with SMTP id 141-20020a6202930000b029019796c2bef6mr1700025pfc.62.1605716620109;
        Wed, 18 Nov 2020 08:23:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::4611? ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id t6sm4666175pfb.45.2020.11.18.08.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:23:39 -0800 (PST)
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-gmqtt: Upgrade 0.6.7 -> 0.6.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201118140220.29364-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <e8484d75-c240-6c45-7343-eda505e9aedf@gmail.com>
Date: Wed, 18 Nov 2020 08:23:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118140220.29364-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/18/20 6:02 AM, Leon Anavi wrote:
> Upgrade to release 0.6.8:
> 
> - Fix encode str to bytes
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   .../python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} (73%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> index 70527e026c..6219d20093 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>   
> -SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
> -SRC_URI[sha256sum] = "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
> +SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
> +SRC_URI[sha256sum] = "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
>   

you can drop md5sum from recipes and keep only sha256sum when you upgrade

>   inherit pypi setuptools3
>   
> 
> 
> 
> 
> 
