Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2138.1596086376399405394
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2020 22:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=St/ZqMoc;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id kr4so1361971pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2020 22:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=AVLk3llBXdg4h/6KNGR/6dycW3AjSPbzykw1D0zjwY0=;
        b=St/ZqMocL1OM7f4l2n769Lrt6CU8P7ir7cL8PRVPuX/cEwd8V9a0LyAh3so5LxBWpT
         Mk307cg+LPtmikERZXCXoM3H+ELTm+KkbgC0XUdLmFbcn/olVObXkxQNoL2Jw6aPcmMY
         McRpcimXEGIwqSTRSQKHnUjuqmUfZsLHRQT8UUN/KlFnQ1UqJe3EqpSoEaogql3pAJ96
         hsoEEcQ3wGIZEmCJOt3VdIpyC4+wUII/AptJOwH4WXCcNyVkTiKndm8JsydildlNgRx/
         OtxxUDSHFgvdtipsU5EYpAHEvqSNrIzA0d1xDI86xwpfhtJ6BDgTgtexoCEL6SB+y5uU
         AlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AVLk3llBXdg4h/6KNGR/6dycW3AjSPbzykw1D0zjwY0=;
        b=RVFG0zxT2TjFoBBgR1IiHqUUXF8JcLpY8yIUzCO0/15jC+ELKHyvhoXie+fcJtXDqt
         bBsHh3rXkfkvh0oO6a8iHGN6e3Q8mWNu52fp/racQsSuHINQZBNoBLOR4Su7PS0fchOf
         aIX7xIBtns/dkiyRujABkqDF7bg77gB1uLh5pC58967F/RW+/2vyuR+g7WtW0EmvlDgk
         ZWc1fWPpaZur+BSccmXJGnHp3MLO4KqoRCQAFvCpkxpLCDdl+DMWxmh5swlwnvKAok8B
         Pp/dPaHkuHaCpgbmBrfGzFuTTJV+o8wcFijcyS6Vn/oR6iAiGocwxRdHkxniBVFJfezX
         wDew==
X-Gm-Message-State: AOAM532nNO2szfLu544a5nKOZGCoE8rcaRvTkkrRcd84x1RdiAevulWV
	WAEBmZpVHAwmRdklV0ibrsj9i4q57EA=
X-Google-Smtp-Source: ABdhPJwdQ1pl8paGA61JZASjukdUpqM5Heitcs5lYCTtowIAXo8GTUsnwwOnuVEW7E1TCFtHcuWt/w==
X-Received: by 2002:a17:90a:be17:: with SMTP id a23mr10376318pjs.84.1596086375562;
        Wed, 29 Jul 2020 22:19:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5ba:2655:68eb:112e? ([2601:646:9200:4e0:5ba:2655:68eb:112e])
        by smtp.gmail.com with ESMTPSA id v2sm3873905pje.19.2020.07.29.22.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 22:19:34 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-networking] kronosnet: update to 1.18
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20200726122050.18769-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <21531571-e5c7-6bb5-1017-73356063eca8@gmail.com>
Date: Wed, 29 Jul 2020 22:19:34 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200726122050.18769-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/26/20 5:20 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../{kronosnet_1.15.bb => kronosnet_1.18.bb}          | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>   rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.15.bb => kronosnet_1.18.bb} (67%)
> 
> diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
> similarity index 67%
> rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
> rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
> index 6bf268da9d..7b1dfc2411 100644
> --- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
> +++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.18.bb
> @@ -1,7 +1,9 @@
>   # Copyright (C) 2020 Khem Raj <raj.khem@gmail.com>
>   # Released under the MIT license (see COPYING.MIT for the terms)
>   
> -SUMMARY = " Kronosnet, often referred to as knet, is a network abstraction layer designed for High Availability use cases, where redundancy, security, fault tolerance and fast fail-over are the core requirements of your application."
> +SUMMARY = "Kronosnet, often referred to as knet, is a network abstraction layer \
> +           designed for High Availability use cases, where redundancy, security, \
> +           fault tolerance and fast fail-over are the core requirements of your application."
>   HOMEPAGE = "https://kronosnet.org/"
>   LICENSE = "GPL-2.0+ & LGPL-2.1"
>   LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa882bbe \
> @@ -9,9 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
>   SECTION = "libs"
>   DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
>   
> -SRCREV = "0ba5985c3ddec8429b989f0e7bd3324f53e0a9b0"
> +SRCREV = "e1f3d4fb4906a26bf155a0e3fff2b6cb02be4dd2"
>   SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
>   
> +UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
> +
>   inherit autotools
>   
>   S = "${WORKDIR}/git"
> @@ -21,3 +25,6 @@ S = "${WORKDIR}/git"
>   #                                                             ^~~~~~~~~~~~~~~~~~~~~~~
>   CFLAGS_append_toolchain-clang = " -Wno-sign-compare"
>   
> +PACKAGECONFIG[man] = "enable_man="yes", --disable-man, "
> +

Perhaps it can inherit manpage class ?

> +PACKAGECONFIG_remove = "man"

remove will override any other operation, which means there is no way to 
enable the manpages via bappends or so,

> 
> 
> 
> 
