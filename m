Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.1629.1631988477024128658
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 11:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esnyv2nK;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id g14so12345704pfm.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=WUSveU4ZBsOAiEZEYmHjaTvSyCdsboNUNe4TW3yeeMM=;
        b=esnyv2nK444ZVeALNf/hKiOcGLepy5o9XmK8reJ9nyoKBBG+O2HL+PMDjAGPFI9LFc
         nIqaCeTRqIdF75Wpo2JC70MmY7FCS6hJz7s4GirjG8tdoKhl94AWHgmFX6JxrrR0h4ns
         hMUj6h1JwhR8oxIAqIv+2vXep5zWN4Z1AQybduzLMGPEtAgZJwe7d0symIRKiDDQmmns
         rEzYuNhmMf/UmkMrl4J//OvLAEThLcIt6TmsI0Mb5l7O0WsDUDCo07R2MkFMvSA888Qi
         +QVSe0UycZfe2Vnkoc/Jz5VBqN25PyNaYvFDffQJULoIVxzS/8m6UkE5buzZHs5TdFdo
         /q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WUSveU4ZBsOAiEZEYmHjaTvSyCdsboNUNe4TW3yeeMM=;
        b=Ktft4KKPZlf+4GzQ5aWnjh7n/s36ZW+DBsS0RDhfs1yK8ZJpHZrTcMfGOJOeFCgJAe
         kimBXTwHUvGYzb3eywhHF78sdcfU0AaUxLWl/KcBnSoAiROuDlz3k60NOamsXYm/0kE9
         EwHszgcHEzQ93mcX7Fd2Kll8heTSB1xg7o3n5PfZFYQlBERIKGO7JdkRAdvHM8wiRTLo
         DO6SE6Xn7F0H5512sk2mN6kFgfyUd4iYx/cIAVF1f/OmAaO5p6jcy9//y/yG0XnT48Z/
         RT9R2fxG0OjgZ0/zF+3FfCtjomnJxSkWFN0srTvkCr7olPFohHgzW5zdPHnJYmvrluV5
         ke5Q==
X-Gm-Message-State: AOAM533xaAG34N4YZLjxKCpdMNQGiTAd9BD7lC+yMLpuHO8MAVWo0Zjf
	0xFdW3/upLJ7pMfb+tqp19MW/A9Y+hI=
X-Google-Smtp-Source: ABdhPJzIHKHStH8/Zc/ltIShau92PCI/WAsTY4P4c3GS2H7FpVKr4t08hb95HDXYwgVN88wSyVzyIw==
X-Received: by 2002:a05:6a00:2189:b0:414:22ae:eab9 with SMTP id h9-20020a056a00218900b0041422aeeab9mr17065313pfi.65.1631988476213;
        Sat, 18 Sep 2021 11:07:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:f923:d379:e6c9:abf7? ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id s38sm9386818pfw.209.2021.09.18.11.07.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Sep 2021 11:07:55 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 17/18] python-flask-bootstrap: Update LICENSES
To: openembedded-devel@lists.openembedded.org
References: <20210918165738.2581429-1-akuster808@gmail.com>
 <16A5F90CEDB7B375.24123@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <c379ce2e-848a-5607-5c5c-e7a308b12d6c@gmail.com>
Date: Sat, 18 Sep 2021 11:07:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <16A5F90CEDB7B375.24123@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ignore this one. Forgot to refresh. V2 out shortly



On 9/18/21 9:57 AM, Armin Kuster via lists.openembedded.org wrote:
> "BSD" is ambiguous, use the precise licenses BSD-3-Clause
>
> Missing MIT and Apache 2-0...
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-flask-bootstrap.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
> index 688622afa6..58b542dd16 100644
> --- a/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
> +++ b/meta-python/recipes-devtools/python/python-flask-bootstrap.inc
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
> -LICENSE = "BSD"
> +LICENSE = "Apache-2.0 && MIT && BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
>  
>  SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
>
> 
>

