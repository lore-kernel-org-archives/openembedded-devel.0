Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.16668.1608946892435406454
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eS4/HDV1;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id s15so2921583plr.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vn5W6Mqd+hOZZZ9gUucXpWtiXQ3xmp7VEvq8LCdYJEs=;
        b=eS4/HDV1IhA2qBJTigTkziLCnIidT3SXhpjDN9OGLnnNEyiheL0LO13chcd4YYCe0u
         j975HggQPql9zbNTyoNY+osUToQEBrYUiRQrfOrLxf3G9zgz5UtyDQuQBCMj+5HJ0n8V
         BSotJbOK4vGQzPkp7/GP07pWSi6jC0dXAPWEMdN6uncVLO7phqfpm0w/4X8vI+W1U3qE
         3Z5w1czm+jO/uFqHjw0y4E+5X3SIYS00IvTs2+CUj94K95Y380s2DPrd9f6/9KyfRSoE
         n2GzS8TP4vilJyRJ4WlRv2IWFY5ucEmzBiQVDPD7K+Hzc0E25cUJMSbvBjYb+e7suqOf
         BuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vn5W6Mqd+hOZZZ9gUucXpWtiXQ3xmp7VEvq8LCdYJEs=;
        b=OiZ7Gz5H+OW+XBMZ6nXA6baBkRxynw4nir8IRVKOrszu7yu81kjatU0uO0cXa5sVaA
         Xh+Y5LlXOWmum0wHFfULV1BIkbIEaIozArGvOkIygsffi5OK2W5AdNt9PemaMMAEvbYB
         /2jvOV2hFkr/sghGqNEfqGbTYdPDrJuxtrOcUcVyUQZkJr/4nkLrR8+75RDlCDYYYYHV
         LSSQJWpUCHIQgOpkOsLMwp6OFxHC1dFBbQPyEUVXoeThEHZ2DaWiauGpSMY+ogpUOiEG
         gIkgxgN/rKs2oJgLUUzEeQQCilLNz1POay7wkFkYSKmeMhr8SPUanzlFcKGjPuoK6apT
         VyWw==
X-Gm-Message-State: AOAM532Xe5PBv/DE9kkQFiVyrDyHFfJEtEzFvuOydjITaKHgCAR8P0wL
	VuDpu06BJKtxukKwMbKf4yIT3HoPeDOw+A==
X-Google-Smtp-Source: ABdhPJxwrlkLvzMYfn24y16O0nZHyG+1oEje86B+g/JH4SiEFnN4nckA5r+8dcEXaAswoSGlOoPgLw==
X-Received: by 2002:a17:902:7596:b029:da:b7a3:cdd0 with SMTP id j22-20020a1709027596b02900dab7a3cdd0mr35021748pll.14.1608946891517;
        Fri, 25 Dec 2020 17:41:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b0c9:252c:272f:4617? ([2601:646:9200:a0f0:b0c9:252c:272f:4617])
        by smtp.gmail.com with ESMTPSA id s33sm6490398pjj.56.2020.12.25.17.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Dec 2020 17:41:30 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH 1/7] imlib2: add image manipulation libray from englightenment project
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <d66d930a-63ca-8f57-9e4d-d3d107cf8d4b@gmail.com>
Date: Fri, 25 Dec 2020 17:41:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Please add new recipes to test packagegroups in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

On 12/25/20 5:20 PM, Dmitry Baryshkov wrote:
> Restore and update old imlib2 recipe from meta-efl.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> 
> diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> new file mode 100644
> index 000000000000..b44b03ce8e78
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
> @@ -0,0 +1,39 @@
> +SUMMARY = "A graphic library for file loading, saving, rendering, and manipulation"
> +
> +HOMEPAGE = "https://sourceforge.net/projects/enlightenment/"
> +SECTION = "libs"
> +LICENSE = "MIT & BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
> +
> +DEPENDS = "freetype "
> +PROVIDES = "virtual/imlib2"
> +PV = "1.7.1"
> +SRCREV = "v1.7.1"
> +
> +inherit autotools pkgconfig lib_package
> +
> +AUTO_LIBNAME_PKGS = ""
> +
> +SRC_URI = "git://git.enlightenment.org/legacy/${BPN}.git;protocol=https"
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= "jpeg png zlib ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +
> +X11_DEPS = "virtual/libx11 libxext libice"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,${X11_DEPS}"
> +
> +PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
> +PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
> +PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
> +PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
> +PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
> +
> +PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> +
> +PACKAGECONFIG[id3] = "--with-id3,--without-id3,libid3tag"
> +
> +PACKAGES =+ "${BPN}-loaders ${BPN}-filters ${BPN}-data"
> +FILES_${PN}-data = "${datadir}"
> +FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
> +FILES_imlib2-filters = "${libdir}/imlib2/filters/*.so"
> 
> 
> 
> 
> 
