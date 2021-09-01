Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.3074.1630534807455605110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 15:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qc3WCxEL;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so45317pjx.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=9jZTAW96lpr6e6JDWDWzxVD3PyCQeGggM+VSL+9Z3nk=;
        b=qc3WCxEL0T6qvpI6giLaLGGcGRA64jK57Kg+QQ0OzY8BipCPQg9KGmqitx/lOX9lav
         Tl7mg12jde9qa/V8ly7Rm9olFiupHEm5TN2116ZYiW2fM3j/XSGIQOADo5YdRVm2NLcs
         KqHoNEQ6AahE5VMPkVXlmeqjaRRdTccvMoxOPdMqMxg9nEu1H6QWE26PWrNewMo3y7Hr
         pyFeHaZD7hmT+pOc75pENaB9kEPnVDUQOes3OzW/Amq7j1vtwOGB2yE4E629Sgydz2LB
         x1sDb0h6ugPXLnJkawqNtM0biLgBav60buk3Z41PoEQFNV1IH34+k7qUTJmAYSQMUe9M
         5sQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=9jZTAW96lpr6e6JDWDWzxVD3PyCQeGggM+VSL+9Z3nk=;
        b=XUXE1YMn6BUFonAo27olQnrnsIOzU0GO343LqLASn+ul24h9BiQwiraieo/AJz/VAE
         j1Mq7EFtzpTMQEjQjkPdmqHVsq1+c4c3Xady/V7yW6wiGLZCJ2R93xD8bUF9exa3vKaK
         xPkrS8U4SnoUz5alP0/UPjSNsdhVGF4YjDd9Dc6/Q19Ol5R+XUemlDAw766i8sdsIfVM
         Q/TB2gAw5194BJiO66WvESdgQOiAmYt1dDxme28WpZjGr8nCs/aTPfOrJ8uNeWx55FR0
         cuF8EeCCLgFXjbmHgszmOToF0IZpRP9TzU+qiZHBoBGhfuBK8KKVzANnsxX0nl2ifzC+
         b+9w==
X-Gm-Message-State: AOAM5303nSnOAIjbwA7/GVbtKNHkqRveCHS2MHasL62n4B47a37zZoU+
	y4ZBn3ZVnS7vLdTrONQQCf4=
X-Google-Smtp-Source: ABdhPJzWqFi0U5ZEatvfZfKku3s+8PclMJNq1RU1UfLQXI8YEePQkyeumGnTE+mka4uAlEe6I8b0nQ==
X-Received: by 2002:a17:90b:2292:: with SMTP id kx18mr18876pjb.125.1630534806920;
        Wed, 01 Sep 2021 15:20:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:b8a1:30b2:f090:4fad? ([2601:646:9200:a0f0:b8a1:30b2:f090:4fad])
        by smtp.gmail.com with ESMTPSA id g26sm680219pgb.45.2021.09.01.15.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 15:20:06 -0700 (PDT)
Message-ID: <484ee11b-854f-093d-2827-b09849877816@gmail.com>
Date: Wed, 1 Sep 2021 15:20:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-gnome][PATCH] gjs: fix typo in RDEPENDS variable name
To: Patrick Williams <patrick@stwcx.xyz>,
 openembedded-devel@lists.openembedded.org
References: <20210901214822.3331260-1-patrick@stwcx.xyz>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210901214822.3331260-1-patrick@stwcx.xyz>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Same as last patch please apply it to upstream meta-openembedded repo 
clone and resend.

On 9/1/21 2:48 PM, Patrick Williams wrote:
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   recipes-gnome/gjs/gjs_1.58.8.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-gnome/gjs/gjs_1.58.8.bb b/recipes-gnome/gjs/gjs_1.58.8.bb
> index 75138125f..a16455bfd 100644
> --- a/recipes-gnome/gjs/gjs_1.58.8.bb
> +++ b/recipes-gnome/gjs/gjs_1.58.8.bb
> @@ -35,4 +35,4 @@ FILES:${PN} += "${datadir}/gjs-1.0/lsan"
>   
>   PACKAGES =+ "${PN}-valgrind"
>   FILES:${PN}-valgrind = "${datadir}/gjs-1.0/valgrind"
> -RSEPENDS_${PN}-valgrind += "valgrind"
> +RDEPENDS:${PN}-valgrind += "valgrind"
> 
> 
> 
> 
> 
