Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1505.1631205208301010947
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 09:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ek83hGbN;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id w19-20020a17090aaf9300b00191e6d10a19so1863620pjq.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 09:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=D8ZMpqaGDZ+Nm7Jxk20HkApsI/HPaFk3N9o5uibUq7s=;
        b=ek83hGbNx4c3wrMbXWWBr6pVXQ8Yvk0TZtt+CyR1UgDIi0g5Q3qgXsp9CYpO4eqwXE
         FGpUo92VenkWzrJyHQULjJHUJIIiHOJFLKwFc3Y4THTAtegFUyme/FBUgCLQdlcZJGwM
         IDYBrQQAfzt3zDgtHi8Xd76WRDOtf5rWolK1PxVAr1Ac0T3Z1AKek5sU1nj6sboKBddI
         a4u8biBFBzdYwyLi3FJJRpUXUjOKhntZsuqZN+BFWrGlXiCFRH15s0vuSGJWJcZTIIYO
         xCVSJRMiHrjJdj99R4XXuz/pPPh75QYOL3EWx/TwefeHmq19xCeHowFQZbcLCEkEUqCF
         jKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=D8ZMpqaGDZ+Nm7Jxk20HkApsI/HPaFk3N9o5uibUq7s=;
        b=z4S2m7gfQC9K6gm7A1Ah5N+a9efTBoAOQy3ulYBkJ5dG+Vw0LjTMODe2JOy91BBKnK
         FAaN2S8A/1pCjl8r7GaP/9cgakzceIlJt3fl25P2pTRQqjI9JCr4K3CuyqcRX4+oCbcH
         RsBU0XaZccw1hy7Bb7FAd3vp69ok4mhE4oT32kbuczPfaenMXwdyIY5I7CWl5PaXqMSM
         Tsksw4YLxL+OqlGMLEe9t3jNJKwdAumukwfEmpmZkCR2acVDRnV3/PUykua6k7Wn4r88
         kw5xkd3g8Y4yaGcOJg6z9yTsqxuoeZv4qKX2mbuEyQhgBiieBqImwKTsPS9fS2aao+s/
         F6pw==
X-Gm-Message-State: AOAM533kvdrFZkekimK5K6nUgRnOjLjjG9tYjXXkmpGOoaEgAzcOlUUX
	XsMdDobc3pnc2uyfNvoYn+zktvyEte/21w==
X-Google-Smtp-Source: ABdhPJxz5F9SNet2FctySauJaMfYeBI1BCUJNqnfUcCB3LWL9KKNV+/pmOUZk4Hr4GLXM11LekSARg==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id mi15mr4491936pjb.120.1631205207347;
        Thu, 09 Sep 2021 09:33:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:889e:9651:ed1e:11b0? ([2601:646:9200:a0f0:889e:9651:ed1e:11b0])
        by smtp.gmail.com with ESMTPSA id k190sm2926518pfd.211.2021.09.09.09.33.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:33:27 -0700 (PDT)
Message-ID: <81929f04-e362-d8b8-8672-f263be3384c0@gmail.com>
Date: Thu, 9 Sep 2021 09:33:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.0
Subject: Re: [oe] [meta-python] [PATCH] python3-pillow: upgrade 8.3.1 -> 8.3.2
To: openembedded-devel@lists.openembedded.org
References: <1631224609-4581-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1631224609-4581-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/9/21 2:56 PM, zangrc wrote:
> 8.3.2 (2021-09-02)
> ------------------
> - CVE-2021-23437 Raise ValueError if color specifier is too long
>    [hugovk, radarhere]
> - Fix 6-byte OOB read in FliDecode
>    [wiredfool]
> - Add support for Python 3.10 #5569, #5570
>    [hugovk, radarhere]
> - Ensure TIFF ``RowsPerStrip`` is multiple of 8 for JPEG compression #5588
>    [kmilos, radarhere]
> - Updates for ``ImagePalette`` channel order #5599
>    [radarhere]
> - Hide FriBiDi shim symbols to avoid conflict with real FriBiDi library #5651
>    [nulano]
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../python/{python3-pillow_8.3.1.bb => python3-pillow_8.3.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_8.3.1.bb => python3-pillow_8.3.2.bb} (93%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
> index d0a17cb1ac..68b80a7392 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
> @@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
>              file://0001-support-cross-compiling.patch \
>              file://0001-explicitly-set-compile-options.patch \
>   "
> -SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
> +SRCREV ?= "8013f130a5077b238a4346b73e149432b180a8ea"
>   
>   inherit setuptools3
>   
> 

Trevor has already send similar patch, I have picked that one into 
master-next already
> 
> 
> 
> 
