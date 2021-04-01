Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.1157.1617290927591782782
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:28:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NoyrLf0/;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id y32so1728068pga.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8gSjp2bzWSLsmWZ1erYudYI37980RuIlBQBDOUU3MYM=;
        b=NoyrLf0/AByxhl3ZcE8sw0ks5NbDQK4RHRVJo4ZfCjEgdE9JW3NaKhDNOdyKHCq5WV
         WgifJRk+JtrWmxnN0TZY3SWgJpjB/2jYh+w6aNGOr3RGNifeEXVQ3drhF+UalNJTEh82
         w+HzmQcyKxGtcDSRl8bKTM3Vn6153x6KXD8Jp20XWBRWpf1kWcWd9BZLbG/49t1f10r4
         E2STft9qskMdDGzWszqMqbvq4PdX5iMeItFuwKSWD/5dYSz+JbUkhphhfcCBjbw2TPkq
         4X1hX5HsJw88p3Hj1gDZ85yMlCf/9hLjNVQGmxiqbjHbhKg9WK4JgLUF0gjfCFSjZW1V
         4m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8gSjp2bzWSLsmWZ1erYudYI37980RuIlBQBDOUU3MYM=;
        b=Z84hgpjH1lZK0lRT+MYAZlZT+K9TIRBwu0pCVB7y0kmJ20WRmpsofQxZPu4u5t9hCo
         V9v7sRHuM5eRO/pAAiWvQlIG9oMrPp7WPwThEd/eNco7abRbh04awJVYYFLBPOMKdDNU
         4Q1w+33quVwjLQMMBwybWM2ZmV6qvDLkGMarKFEW0CDvd04+e8YVPOXfJTg8gGprpeKb
         UBCO24GjZL4jfbqsyoSmVzTLwPjZ7mIFPmV7T1s/vaFlANVz8FVKo3DG32+Zjrz+TMHM
         d5zzDByj8zpmf8ybmot5RX6IVI3lDDd/EACCcuXob28M/OJofzkhbP5NE0oUFU9XmnWc
         QfWQ==
X-Gm-Message-State: AOAM532mvKUYRtKt0mZMc92mwLq+v+FD5BTFQvKbovFXJXnSPi+78gjq
	uc33ufVkPxevql49SFIWOst6T50SWaxK2Q==
X-Google-Smtp-Source: ABdhPJwYOhs1G5MpbqQQhbzNnvaFGqVnvRfjXCSy/k0jECGG3UiznU8b8WN9kXd2sw7hdVbY2U+v3w==
X-Received: by 2002:a63:508:: with SMTP id 8mr7936719pgf.220.1617290926666;
        Thu, 01 Apr 2021 08:28:46 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::bc1b? ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id t184sm6033593pgt.32.2021.04.01.08.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 08:28:46 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH v2] libxaw: upgrade 1.0.13 -> 1.0.14
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1617299668-4458-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <5b892a30-f3fb-2f47-fdbc-ef9391c61b34@gmail.com>
Date: Thu, 1 Apr 2021 08:28:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617299668-4458-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/1/21 10:54 AM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}         | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (82%)
> 
> diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> similarity index 82%
> rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
> rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> index cb1ffcd8c..773b24a50 100644
> --- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
> +++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
> @@ -5,10 +5,10 @@ DEPENDS += "xorgproto virtual/libx11 libxext libxt libxmu libxpm libxau xmlto-na
>   LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
>   
>   PE = "1"
> -PR = "r2"
> +PR = "r0"

r0 is default, so its not needed to be set at all.

>   
> -SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
> -SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
> +SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
> +SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
>   
>   do_install_append () {
>       ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
> 
> 
> 
> 
> 
