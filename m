Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.10015.1592581733237097883
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 08:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q5M1cAZR;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id v11so4652570pgb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WMKxhj/TnpolKjgFcnbupImvR5YngWEtTXiHZrI+rXQ=;
        b=Q5M1cAZR5Mg7zv1MBXboJce4kpeod5vN//62TVn8p4tKpqak9UyJ89PwWr/ruDnHmP
         uiTjtU1jeWwYTGwfpqPHGvkd389hZtYuIIJA9lPXNbuPZ8a7qmcf+uwW035bfYFFL82a
         faB5xDLjyuJyuZpqchl8YuiM5eArrLsMwnmSI7EJXKKtyqZL5xGK6yqXQhr/ilEMFl6m
         JuervjMBPjnFxenk5j/DQI6Q/I8vdJukRSYlK6sDrvuPAhr7omn/FYTgbJ3dUioAFmWY
         JWO8wJFJPUc+qTTRIIzXFVI0DI+SR+3ahXP2Fg9YLLf9mFgfWWvCEgyt25t//yvgXMOp
         vBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WMKxhj/TnpolKjgFcnbupImvR5YngWEtTXiHZrI+rXQ=;
        b=Hc5gnxRKHPPIFpK1kW9PxyYQGj6uemOhqu43PNrG0GI2M/xKh3nI7cHhsFnGF1xV6b
         Os8+Jfu+FrUSesUlk3RXoy8nE7CaEv/QDtIcQ4TU9QfAg88WUoAYXnaFeS/yEbumcyPv
         klQXfs+awjntYbKe/+YWA4iLgYu8FNLoGfLySR+UtH266sL12frTKkq7JZ9YtvS8kERi
         S/wknsgvss3MPo3uZQlNXD07c2QH66xqVjOd+rBxlFSLSr62EpMiDqnUKcMTLtvGcfx/
         jwhVIM2INwErNTuUuW039rHm1Db+z6VQE9phseIOnKpqoMcqreXwmi75VK3EgqCfHQiE
         saSQ==
X-Gm-Message-State: AOAM5327n6icv/1ewba3qqvv/bfq8Wbk7dHd1xCibsrLC+FcE9vD2AGB
	FX990eKl2sA/lcg7lKkHpJZYTr3Dk20=
X-Google-Smtp-Source: ABdhPJzISHm+be1cXVNmI9CE0qpCUp6qTJ377U5OWgQ9p5ABv9fcZgF1WowkvbmiB5vOQnemMficxQ==
X-Received: by 2002:a63:9d87:: with SMTP id i129mr3620017pgd.412.1592581732101;
        Fri, 19 Jun 2020 08:48:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id h2sm6537265pfb.175.2020.06.19.08.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 08:48:51 -0700 (PDT)
Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
 <20200619113201.2811033-10-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
Date: Fri, 19 Jun 2020 08:48:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619113201.2811033-10-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/19/20 4:32 AM, Andreas Müller wrote:
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  .../libgit2/{libgit2_1.0.0.bb => libgit2_git.bb}               | 3 ++-

I think we have been preferring to use PV via recipe names if possible.
which this recipe is already doing, is there any benefit of renaming it
to _git ?

>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libgit2/{libgit2_1.0.0.bb => libgit2_git.bb} (89%)
> 
> diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb b/meta-oe/recipes-support/libgit2/libgit2_git.bb
> similarity index 89%
> rename from meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> rename to meta-oe/recipes-support/libgit2/libgit2_git.bb
> index 74343683f..5f6a38a89 100644
> --- a/meta-oe/recipes-support/libgit2/libgit2_1.0.0.bb
> +++ b/meta-oe/recipes-support/libgit2/libgit2_git.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
>  DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
>  
>  SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
> -SRCREV = "7d3c7057f0e774aecd6fc4ef8333e69e5c4873e0"
> +SRCREV = "0ced29612dacb67eefe0c562a5c1d3aab21cce96"
> +PV = "1.0.1"
>  
>  S = "${WORKDIR}/git"
>  
> 
> 
> 
> 
