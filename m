Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.6660.1632412336455315084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 08:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=boDQ7E+U;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id r2so6764002pgl.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 08:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=kQyVy000HlnZvoHh5RI6R42n0ZCyp9dxJvegl64SkBs=;
        b=boDQ7E+UqDLZylhmszXJNCrk5uCpsjFx9yJ1FCcEC6+hLcghkYrWK1db5gozVOfCRL
         leMHTtkbjDrRd7nxiNYFb9Ojt7WXA00G0el1aSk7RtPJ3cdrxJ5+tJMT+Ul2KJY+C2q8
         EwS4GH9o+aPB5bczdFh6R1fn0T1Oym+jiqmjOUBmNysFP6AF1bQI7u90WCTp4it08FOd
         aUL1AU3E6iUjljXAMAQCRq1A+nymESqC2DPdpR4wuZfCrBIAyCHBLQwtxD57k1sljOh8
         IfxAu1avcX/knjCpjMlwUd0gi2mbvkUHFUmbcwnl1q9zrJaHtdDMkxDnOgMi+c9UmhJY
         e/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=kQyVy000HlnZvoHh5RI6R42n0ZCyp9dxJvegl64SkBs=;
        b=EaGr/qIVs7MDFHtok4CcTufi1j1+y0XhSj2apMuxFtjE47v60auxO4hJQCMM4SnelE
         d3WpH/Ead3OFYAziyfCFI/E+1CNGE+7KyqfvSELcxPpObOud5SXwi81UyKm3+txdSZpt
         CcZ6NotKYYBk3M/5l++jTRFQZGBFVVqWurYFse+bIfaUhSyvSCCPD0n7rIcZeSBJMjKd
         IcZfyCMT/RAcxLtY4sifPNnhFgZTVWeupzitvD8ikcZJSyZiZxOGmCrQyBlw7OlncvsI
         aagGmLqgnLWhHkCVA9lGREUoIoTZ+xzx6gOHeMkg6D8TtgHyMsvktldHa7uKR9mFKQXy
         hd1w==
X-Gm-Message-State: AOAM530StN7jeSNo+y7PPmjSEG6Ib1KAMGSUu7vP41MCg7T4bN01u9S5
	2ONshuqqZT9iNEwtNyfuSZ0=
X-Google-Smtp-Source: ABdhPJyxZd3dHoMyZneOjEfy6+5mFeKwxTCX8GboD00kc2Al/LwEuBSuCI6ijnUFfjv3nEWGEpL20g==
X-Received: by 2002:aa7:9499:0:b0:445:1c9c:3c1b with SMTP id z25-20020aa79499000000b004451c9c3c1bmr5257463pfk.8.1632412335736;
        Thu, 23 Sep 2021 08:52:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:1dda:37cf:b1d6:5d51? ([2601:646:9200:a0f0:1dda:37cf:b1d6:5d51])
        by smtp.gmail.com with ESMTPSA id w18sm6468716pff.39.2021.09.23.08.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 08:52:15 -0700 (PDT)
Message-ID: <941bb5b8-3729-2240-5cf5-2230efefa7b7@gmail.com>
Date: Thu, 23 Sep 2021 08:52:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [oe] [meta-oe][PATCH] vk-gl-cts: allow the user to specify the target
To: Trevor Woerner <twoerner@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210923150040.39332-1-twoerner@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210923150040.39332-1-twoerner@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/23/21 8:00 AM, Trevor Woerner wrote:
> When building opengl-es-cts (for example), allow the user to pick which
> target to build instead of hard-coding the 'surfaceless' target.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   .../recipes-graphics/vk-gl-cts/khronos-cts.inc  | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> index f61921473..a9c41f1f7 100644
> --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> @@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
>   
>   inherit pkgconfig cmake features_check
>   
> -REQUIRED_DISTRO_FEATURES += "opengl"
> +ANY_OF_DISTRO_FEATURES += "opengl wayland"
>   
> -DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
> +DEPENDS += "libpng zlib virtual/libgles2"
>   
>   SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
>               file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
> @@ -36,7 +36,18 @@ SRC_URI:append:toolchain-clang = "\
>   	file://fix-clang-private-operator.patch \
>   "
>   
> -EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,"
> +PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland"
> +PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl"
> +PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11"
> +PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl"
> +
> +python __anonymous() {
> +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> +    if len(packageconfig) > 1:
> +        bb.fatal("only one PACKAGECONFIG of 'surfaceless wayland x11_egl x11_glx x11_egl_glx' can be specified at a time")
> +}
>   

Looks an improvement, but there is no default now, so what will happen 
by default, and can be make some intelligent defaults based on 
wayland/x11 distro features etc.

>   CTSDIR = "/usr/lib/${BPN}"
>   
> 
> 
> 
> 
> 
