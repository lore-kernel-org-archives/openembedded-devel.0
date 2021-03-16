Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3513.1615864119531508566
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qQhjpjij;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id s21so9873079pjq.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Mar 2021 20:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IiicCgd1SVUXghRhltdRkYeMz1SjyJ9FY87A1Rti+mA=;
        b=qQhjpjijy9EGbRQLonScHIyqBQLJGvcPVe7hoKmFRej2AcdWjxTXC13D8NNIwEJ9YX
         FBwBxR/DQ3x43bSoOXkKPu8/wt2JnGU28YKrfZDMsf2T+bKlBGxJBxEWIs4gtq4sxBEo
         ZT88MmfbhpVzTfBlaYqm/5UjfbPyTkljcYvxhOH9SVpVczODDEcUtdcK9u086qdTgRlm
         BKPTYMQBef5yL64gGc6uE5SR25cCgbxoqPTtYbbaLRZzJKYD1OqWSH/nfp1EVzzgbWnA
         R/VmLmPa5DoWgco2dJcLMi14F4XXyjWpF1LzSMkcPqT0dkHCLo1dp7qE0iX5WrIgq68x
         QpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IiicCgd1SVUXghRhltdRkYeMz1SjyJ9FY87A1Rti+mA=;
        b=KSb80xLcEJAuOofP7IfKBKW/8jq14MLq2aE7tyA+fa0RdgaW6e/+jEjg3qFEF5+HwU
         7dmsgt7yICR1qMUAibNzZTu3w17Vd+XVpkWT5muVo1uH7sJhOHMwBhzVRVDVVIw3YXeM
         U6/1MkDa+4mZ6y7EDkaNontRdAdfqkakOkqygTHmzg/iGxP4eaKMQClJkjJXL9CkNy1c
         fzeJt11oW2eGyLKZO7G97IRKd1Cldpgf0UVkjig+1xU0LvlA88NrUJ8ELGC/54dKkyq9
         CIXATyb6TkBceeNRnkiT2wfyYbv1/gvnXKhS1/IacY696nm5g880GT2ewAfVVtalshKJ
         xftw==
X-Gm-Message-State: AOAM530+ukvBm9b4zMqWKN9ij/z3+/bJy14X4BYrDMUPvPA91arQGqf1
	tRZeeJTN/p9pOKYUpTU1yfuKKR4mdECIvw==
X-Google-Smtp-Source: ABdhPJxFxuhXRr7pthSPLyDvGLSbZKoX+3cZGDge2ihHr48NcLkSykRD3RKwmdoEemiN8alwk4e4bg==
X-Received: by 2002:a17:90a:fa89:: with SMTP id cu9mr2512655pjb.204.1615864118573;
        Mon, 15 Mar 2021 20:08:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2062:74c9:d9c8:4e75? ([2601:646:9200:a0f0:2062:74c9:d9c8:4e75])
        by smtp.gmail.com with ESMTPSA id b9sm14213483pgn.42.2021.03.15.20.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 20:08:38 -0700 (PDT)
Subject: Re: [oe] [meta-perl] [PATCH] libcrypt-openssl-guess-perl: upgrade 0.11 -> 0.12
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1615891402-3519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <91bfbfb7-cc35-5d85-f293-89723cd08074@gmail.com>
Date: Mon, 15 Mar 2021 20:08:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1615891402-3519-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/16/21 3:43 AM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   ...guess-perl_0.11.bb => libcrypt-openssl-guess-perl_0.12.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.11.bb => libcrypt-openssl-guess-perl_0.12.bb} (86%)
> 
> diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
> similarity index 86%
> rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
> rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
> index 57df78b4e1..6f35e39bf3 100644
> --- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.11.bb
> +++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.12.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
>   
>   SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
>   
> -SRC_URI[md5sum] = "e768fe2c07826b0ac9ea604c79f93032"
> -SRC_URI[sha256sum] = "aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167"
> +SRC_URI[md5sum] = "9e86baf96828a38c967003a5e66f0c39"

you can drop md5sum in future upgrades

> +SRC_URI[sha256sum] = "0a18d18768cf42b49b15c9dea626199dc74346bbbc76acd3d817b9c1d2bd471d"
>   
>   DEPENDS += "openssl"
>   
> 
> 
> 
> 
> 
