Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web09.3159.1605943264613670279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 23:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vDmFbe6n;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id g17so8996298qts.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2020 23:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/ibfrjAkr+FrvJUzX8dvdxFvTViXLYYhx7ol7qEolY=;
        b=vDmFbe6nAI05i0ivgFSN712na0fOvDrt5iT5Z+hHsX84fE0wwY41Kw+JDAiqo84ZIx
         PanhW9zOHq8x338zCptrjT8kjBWbWa4aTCNeYTdGA32y0ie5wo2nWWc0xrkolLTP6IV3
         g2NgGDYhJYrU7sRpjIpfM1QdyKxDEq7bOq2r88ivW5KgD2b4NbUqERztPv2QTTTsudFW
         SzI8E3G1WBIm2tiEc553BtqinxnBbzPyc2W6fiqqWPO1dixhdC5oBa/z5nUIaMJ/mGvp
         TJ0Dybl/GHED8Ux1eLcgi/UPpwV1kkEdoe691HgIIM5eiP919wYSWcSkMyFRcow3BBps
         Q1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/ibfrjAkr+FrvJUzX8dvdxFvTViXLYYhx7ol7qEolY=;
        b=CkI/caZVcgj3AERtn1Wqv77QU9aMc6A8nYfLYRpy00aySMEOvUlJXP4Sw5gM6EG5ek
         ykbOpdajo3B758pM4FURj427H7ZSUC/9qzSUZk++Dz2NCzNkBve5orUqcInpd9ScH8BH
         Jp9/K+QSnuTabEdQ9ujf93IhuL/Wnf3JLkEnj1qOC1QlWB8826b7CBb/EVCd0mbZeO0o
         qoVwta0FYM4C5dxV5QDN8jsT6ChQh6K5PG9r5teVGJRCFdubrCPWFcTOdJBIJVKQfUde
         Uk8u/AynpHCeg95sTuOrV16EwCXS7wxyHFrlMT5zNOxF7MKLflXPvhXaXMxluG/P7Ojt
         aVfg==
X-Gm-Message-State: AOAM531OYNWWA7/YKDVa/RdrkhbZXmG1XTaZVco369gSij66fP0Gh+9L
	rat9pgmkrZFCUx3D2iwft4MClerRUYKyZ68Z+AQ=
X-Google-Smtp-Source: ABdhPJwJjjeb48zKN2qV8vXOHHU1s03lB3PbFEcjWvIdOaVpmflWACRao0cfGO/MeDJp7l99wH3dIqpDmuePHa9e0fc=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr18685317qtb.80.1605943263642;
 Fri, 20 Nov 2020 23:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20201121032832.21540-1-okaya@kernel.org>
In-Reply-To: <20201121032832.21540-1-okaya@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 20 Nov 2020 23:20:36 -0800
Message-ID: <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cpp-netlib: add bitbake recipe
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

can we add it to testing packagegroup too please ?

On Fri, Nov 20, 2020 at 7:28 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> Adding recipe for cpp-net library.
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../cpp-netlib/cpp-netlib_git.bb              | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
>
> diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> new file mode 100644
> index 0000000000..472b72fc2e
> --- /dev/null
> +++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "Modern C++ network programming libraries."
> +
> +# This library provides general purpose network functionality such as
> +# socket communication to agent libraries. It was designed to be merged
> +# into boost at some point and follows similar header library approach
> +# for most functionality.
> +
> +SECTION = "libs"
> +LICENSE = "BSL-1.0 & MIT & Python-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
> +
> +SRC_URI = "\
> +    git://github.com/cpp-netlib/cpp-netlib.git;protocol=https;branch=0.13-release  \
> +"
> +SRC_URI[sha256sum] = "0b9255bb0668d89867a1f367d770f12d7038db4f5b6111774ef032f669cccad4"
> +
> +SRCREV = "ca95f04d140acf619892ee02a82e930dd91ff7d4"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS = "zlib boost openssl"
> +
> +EXTRA_OECMAKE_append = " -DCPP-NETLIB_BUILD_TESTS=OFF -DCPP-NETLIB_BUILD_EXAMPLES=OFF"
> +
> --
> 2.17.1
>
>
> 
>
