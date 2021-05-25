Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.7895.1621939606344150887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 03:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KFYzQxVb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso11218939pjb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 May 2021 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3ChT4BZ6FS9FrE5qJOuAZc9J6eSkAdACDyPdcqjwJUs=;
        b=KFYzQxVbAakY1CmsD3d6ottv0n9uAR7Q9xtag6dVjn38HLYzZMoVK5AS5l+AsZgtn1
         kPGClRM9FtyHQafL8zFok+avPp+F9L+Y0IHf86lwuoQYufReuXM0anQWeQ0OxBk545S8
         9RkJHyIvioB4lcmz74e1boaq6SwAWGkaOatbKAxZwL/7QICSyN3L2UhNEIq6DoCTzfnm
         uiegMDoEIJdeifFssdTedjVL5OsxXF0qyXJJ2a68LhjXfXx3EA/XO67KUwg8PwL930Ni
         n9F9OJx7ixwrQ2rLb47mNp3J9HimBf36KBXaJmf+w0ayr7ZP/7MgCC/aFdxcN1Y7L1Pi
         mLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3ChT4BZ6FS9FrE5qJOuAZc9J6eSkAdACDyPdcqjwJUs=;
        b=guVPAW8xJyG5hTcNE0404jwfyPakRsMWi/vKtzIwwUim3vXtcRNaUbIjKKGlw9y58U
         xnSLRRXEgKK7bCKtqEC+bEcML9qTDPM87e379id59fjXOxms113ER2UNK0InvKM+Fk/5
         PzrMUPCwyUBHzNecdLeqTYu/AJdSSrgQPDnPEkEbaG7XDBjwk6KXZKmuIwaou1QRpn+T
         WUgA1jHu94Aensx1+nQbjsktOk+HIYhG3xV2lreNYYVVZ5ZsXBlXgMTPdy5LineXBCWO
         Tcn86kT1kOMPvmtdYODFngxmtOFmgL5hIqQewNQkS3BI7rD0/h6edIv47Ixd/uuIhAPT
         KQoA==
X-Gm-Message-State: AOAM532TTfi0dNQVrQU/yHeE9qrpyWiWQzfNj3dkR25nNTB/K1xrZaDf
	djIZMwtCmHht/rs5gH0qDj4=
X-Google-Smtp-Source: ABdhPJwxpDdi6Ujm0kHDEXt9KNGmg6OLvITI3NIfJ+T9M6hMRMEDflHxaZOJ/poVXi8woD6RMoLJ3Q==
X-Received: by 2002:a17:90a:e606:: with SMTP id j6mr29698367pjy.134.1621939605807;
        Tue, 25 May 2021 03:46:45 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:9834:cb1a:11fd:affb? ([2601:202:4180:a5c0:9834:cb1a:11fd:affb])
        by smtp.gmail.com with ESMTPSA id h76sm14324290pfe.161.2021.05.25.03.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 03:46:45 -0700 (PDT)
Subject: Re: [meta-oe][hardknott 1/2] opencv: remove tbb packageconfig for powerpc
To: Saul Wold <saul.wold@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20210524152923.3299258-1-saul.wold@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <ee9c3370-1888-8260-0a60-9059878dd48d@gmail.com>
Date: Tue, 25 May 2021 03:46:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210524152923.3299258-1-saul.wold@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/24/21 8:29 AM, Saul Wold wrote:
> From: Saul Wold <Saul.Wold@windriver.com>
>
> Since tbb does not build for powerpc remove it from the enabled list

thanks. Got this in hardlkknott-nut already.

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/hardknott-nut&id=c7c0a292cf5089dcbd7840b01027d636fb29c831
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> index 311355bd7..1dcd8586c 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> @@ -106,6 +106,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
>      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
>      ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
>  
> +# TBB does not build for powerpc so disable that package config
> +PACKAGECONFIG_remove_powerpc = "tbb"
> +
>  PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
>  PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
>  PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"

