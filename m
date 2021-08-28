Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.3965.1630160146229140076
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 07:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uxKFCzQ6;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id r2so8704526pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Aug 2021 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=qF+53bynv84Fpc7AItNWAV9/kHOEjkTwA7jRA0JvOHw=;
        b=uxKFCzQ6AqvP8PcSUhxk+7E668bheWR0aWp0em9WMeGiKFe8nnP3DifTh3Nk1ZQWCP
         Ar3jN+gh/6cRBp1iRz4i25f1BEfVCKAoedagEH6bm4Whpzdll7Yz9hxu+Mp02ah07fyI
         Yjl2POTAOU+JmOOSngwGlYbcU9J50++/T2HN7xIQ7mgFupMBIG+CARVHdHiWgL47ZRS/
         KqxwWhQyPoUk5jQnw3THyZguLCmT6+nc+dRasRe8Xb0KGSSWEUI9AczFokPiL/hkY7wC
         pI789++R6JydVtnVclwYNYOkL0EdHlqZZ2GMejHIjA1h2aqW9CoRIiV/EwpFQhMSYSm+
         SOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qF+53bynv84Fpc7AItNWAV9/kHOEjkTwA7jRA0JvOHw=;
        b=UfWDJWnfXCUKJmvx+poLYvDGGgBVu5ZkuX4YlzCqfSzfMi2xjMnbW+xV5Lf8o1Ty2t
         g3qAtb1dvw9p8G7OpxmZOFZ7gmeR1a7rMqchlZR3XDpa7G6Zptf8nfons1xRSMO+TJeb
         j6Oi16+i8J6Md2SLo+t7nOGa99NvFDNSVhGBc8w+q8C+J14JP3dh6/LYVHJyHsxtUvIL
         5Rhtlnsw4/C9ekZZqq5Kx2M5Yxq9/20he/PmaCtqQ6TJPg/TCB49xw6rWvpSxX5kNNsd
         uLEfG9yJpeU6SL+Y90Dus3bUBzsiLtKj5m4K6lU1gQ5sPlVG4StOz4F10J9UoEBcRbjN
         2S+g==
X-Gm-Message-State: AOAM531d+vmBGehjndayTo7oixYDzM/A8Unvtgh4Z9FkKhFGDa9CiKSz
	1SfSffo2ljGSFxUA02aOPYc=
X-Google-Smtp-Source: ABdhPJzZ9eebV7s++CqI//T9IOcglubCCIJp5saEHiE/SBOhavUetFpnCLIUbBrEaqA6nOmlgZY6Ow==
X-Received: by 2002:a62:55c2:0:b0:3ec:c066:495c with SMTP id j185-20020a6255c2000000b003ecc066495cmr14134761pfb.38.1630160145475;
        Sat, 28 Aug 2021 07:15:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:718a:f86b:7e24:3a01? ([2601:646:9200:a0f0:718a:f86b:7e24:3a01])
        by smtp.gmail.com with ESMTPSA id f5sm9813892pjo.23.2021.08.28.07.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Aug 2021 07:15:45 -0700 (PDT)
Message-ID: <dc1dc48f-2fa8-cf4c-02fa-7d727e83ad19@gmail.com>
Date: Sat, 28 Aug 2021 07:15:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-oe][PATCH] opensc: Upgrade to 0.22.0
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>,
 openembedded-devel@lists.openembedded.org
References: <20210828112458.247264-1-vesa.jaaskelainen@vaisala.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210828112458.247264-1-vesa.jaaskelainen@vaisala.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

its already updated to 0.22.0 with
https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/opensc/opensc_0.22.0.bb?id=6a0c9ea9d3d91a5d2125f335922d1956b7d81f3e

On 8/28/21 4:24 AM, Vesa Jääskeläinen wrote:
> Signed-off-by: Vesa Jääskeläinen <vesa.jaaskelainen@vaisala.com>
> ---
>   .../opensc/{opensc_0.21.0.bb => opensc_0.22.0.bb}             | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/opensc/{opensc_0.21.0.bb => opensc_0.22.0.bb} (95%)
> 
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> similarity index 95%
> rename from meta-oe/recipes-support/opensc/opensc_0.21.0.bb
> rename to meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> index ea832ec0f..c17850d7b 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.21.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> @@ -11,8 +11,8 @@ SECTION = "System Environment/Libraries"
>   LICENSE = "LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
>   
> -#v0.21.0
> -SRCREV = "30180986a08cf71fe4af4b50251a8bb5b1ab95af"
> +#v0.22.0
> +SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
>   SRC_URI = "git://github.com/OpenSC/OpenSC \
>             "
>   DEPENDS = "virtual/libiconv openssl"
> 
> 
> 
> 
> 
