Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.2607.1587582870001522758
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 12:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IdsCLjEm;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id o10so1577969pgb.6
        for <Openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2020 12:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=uYUVHwx2SETv04FJSQOxdEdZ4jVjzHU5WxUDoox72SE=;
        b=IdsCLjEmbHvYo3JRdkMeCCz1z6fnylZzp0EQdO2sKdotllqMzjwLSKLBuS8JuhPHCx
         5XkbngLeLLXY3YAsCy3Beri/epKresIonUTGp9p92FlU1prjuP07ueyC2E1o/fWFVAHX
         Wstc8//T8Uy42+TDNgxwQUUW7oywAGpOI6fqagcModngz/QO+5vDyLkLBana1s2Eev93
         Z7J3l7qr8BznGj5k2aM8m0V0yeSEPieddJYJLFxch/JHzag/wZP1Pw7fvgkY+VsdTaE+
         +Qi+jHpice3yln8BLOfKeBymWV799AZTefJbiqvJT3X7qetpEOIPDoVudvHuMW9yk/Hk
         Fv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uYUVHwx2SETv04FJSQOxdEdZ4jVjzHU5WxUDoox72SE=;
        b=Ls+SXyH3MTHvNoLkVCL53QaqhkNAq3EQ00jJkvQ1BKx1mVn9wSlF1DPL2e/pVNiiho
         84ztIrVVrwZXuR0y0HZfwAyNXjnKJmD+Etd2nJO43YVY+EbevkHm2/EFo5581XC9e5Zk
         jy6Qmc3e7FJubZJwKrq2hOqrZT2Cl6ej7FqTEInk3SFESRVQC6UEWC4UybcHwyOBBc80
         1zTtzQARZeyslMlfRO8dT553KSHCif5M0L3imgzdAUNeo/fZv0NRjzG7tVLamhJ3sati
         3jSuWgzVstequlfSPRuGlwQiRtNANpRnMAv8KhXbWFzqLta1qh97/cf1t66nEiEQqn7Q
         Iihw==
X-Gm-Message-State: AGi0PuaraqgMMSKmFtPR3gDM7DQatGlaqO+Ivck9vSAgJv26dQAiOCcL
	HNT/kLUMemqkFKeAMN8KiZz+XqWVlgs=
X-Google-Smtp-Source: APiQypJHw+F2damwxFnkBPXPK/NlGV9jhCN9OP2/78bQecNb0k/pvQeROcxRKsxvpIAh8WZ0V6Is8g==
X-Received: by 2002:a63:dd0a:: with SMTP id t10mr558442pgg.50.1587582868978;
        Wed, 22 Apr 2020 12:14:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:286e:813e:f95f:531d? ([2601:646:9200:4e0:286e:813e:f95f:531d])
        by smtp.gmail.com with ESMTPSA id i15sm5811856pgj.30.2020.04.22.12.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 12:14:28 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH] sdbus-c++-tools: add nativesdk
To: Matt Campbell <Mcampbell@izotope.com>,
 Openembedded-devel@lists.openembedded.org
References: <CAMDowVWHvQB2HwanmKkvtrpDPG4ghzqkjHZckDuqX-LtLUC3oQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <d13de68f-554a-1681-fc05-55b22e1516b3@gmail.com>
Date: Wed, 22 Apr 2020 12:14:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMDowVWHvQB2HwanmKkvtrpDPG4ghzqkjHZckDuqX-LtLUC3oQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

This seems to be badly formatted patch. Neither patchwork nor my email 
reader can download a proper mbox for it. Please use git format-patch
to generate it and resend.

On 4/22/20 11:21 AM, Matt Campbell wrote:
> 
> Signed-off-by: Matthew Campbell <mcampbell@izotope.com 
> <mailto:mcampbell@izotope.com>>
> ---
>   ...bus-c++-tools-native_0.8.1.bb <http://tools-native_0.8.1.bb> => 
> sdbus-c++-tools_0.8.1.bb <http://tools_0.8.1.bb>} | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>   rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools-native_0.8.1.bb 
> <http://tools-native_0.8.1.bb> => sdbus-c++-tools_0.8.1.bb 
> <http://tools_0.8.1.bb>} (89%)
> 
> diff --git 
> a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb 
> <http://tools-native_0.8.1.bb> 
> b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb 
> <http://tools_0.8.1.bb>
> similarity index 89%
> rename from 
> meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb 
> <http://tools-native_0.8.1.bb>
> rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb 
> <http://tools_0.8.1.bb>
> index e18b9903d..9eaec0f2a 100644
> --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools-native_0.8.1.bb 
> <http://tools-native_0.8.1.bb>
> +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb 
> <http://tools_0.8.1.bb>
> @@ -4,7 +4,7 @@ DESCRIPTION = "Native interface code generator for 
> development with sdbus-c++"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = 
> "file://${S}/COPYING;md5=1803fa9c2c3ce8cb06b4861d75310742"
> 
> -inherit cmake native
> +inherit cmake
> 
>   DEPENDS += "expat"
> 
> @@ -12,3 +12,5 @@ SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
>   SRC_URI = 
> "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools 
> <http://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools>"
> 
>   S = "${WORKDIR}/tools"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.20.1
> 
> 
> 
> 
