Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.14332.1621442252595167228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 09:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IK0jiqz3;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id q6so7103457qvb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 May 2021 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2K2vgt2o0zXFkWA3HBF8pV6qToSTNi3oIX7JD4BF2k=;
        b=IK0jiqz3RdnCJkjHIZQLie6gwtXiIE9zWHHmbYbzbQih0CfJ9N/vh+Tl/Ynl8ygY36
         Y9zV33nfgl+rVTO1yqBQB2FvZTep6pi6PhXXhCniLv2lAD8ulatYu5M8zu/MRzVOLjIt
         nIIxPuPo/nyn/kprwT8eGEA0TdAJhGx3U1wI+PZCwG1WU9TB9cb6h3MQHY56OO2wi2sx
         nRd9PVyW228MFGg1h7lpnaux90miJRPvSpfSJs0GP6+cszRvfQ4k5q2iF4PCB4W21O33
         CyKGKDeTaxH+LBJcqi5a2ZePCDoBhba7rLww0/PopjYBuvYmY15FUY9DJqsf3ayEjsDJ
         8H1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2K2vgt2o0zXFkWA3HBF8pV6qToSTNi3oIX7JD4BF2k=;
        b=JcpVkfD+9KpxLMnMoWNwJd0GxaA9NG3KlzS8HI+O12XbC9dY6LzmGLaUoL7M+3SpiT
         UcWvNa+mIWHASWQbSYITl9Z8jHXWeBb1JCaASW6maEesOhbVBMIs2Bho2YKeeFeaBZzk
         aY27IdL8D0QSQN5F5RSZCNkN2Dopc1hLGp0X3FBgwX8luPZxcmJdcGOBL72YvfHtbLVf
         a+ov8CITtSuhuy9ybdGJ0eRMd6DhAP1PekcvSR/Mpo0Qr6xYkDEIdGHRq4gKrPhtLeWA
         VBuAk/bPt/g90+yLhky6a/BSqOlTS5FArkyL9eQMkKohS/WTaE/BmKFPo1iPuwgD6uu+
         sT8w==
X-Gm-Message-State: AOAM533Mj9qnvmPQI9SCtrW3WNO6ia9P75e6XKWEKCvVdDGvcK7ohjZW
	Ob5w4IT0eanJt60cW/EiqhGHVDfjOfjy8DwPhdU=
X-Google-Smtp-Source: ABdhPJx11qEG9rfnhlYDZ54qMvGgshjU4KjeJjl4cqXE0ZeelvdPey3rCYgYcu56cG/4an0xD7u1KNLUEfIWH/isksY=
X-Received: by 2002:ad4:4e91:: with SMTP id dy17mr323899qvb.55.1621442251499;
 Wed, 19 May 2021 09:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210519060041.9004-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20210519060041.9004-1-nicolas.dechesne@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 19 May 2021 09:37:05 -0700
Message-ID: <CAMKF1spip2JaKp4EM7mvgYJ-a7joLSmQe6hff8bB_HEtMrx2kw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sysbench: upgrade to 1.0.20
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing this failure

https://errors.yoctoproject.org/Errors/Details/584952/

On Tue, May 18, 2021 at 11:01 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> * Upstream moved to Github, let's use it for SRC_URI
> * COPYING file was changed, but with no impact on license
> * sysbench includes a copy of luajit project and it's compiled by
>   default. However the internal copy of luajit won't cross compile
>   properly, without patching it (it uses 'gcc'). So instead use the
>   'system' luajit, e.g. the one package from OE (which is what most
>   distro do anyways)
> * Does not compile with different built folder. Lua generated files
>   have things like that:
> unsigned char __/__/__/__/sysbench-1_0_20/src/lua/internal/sysbench_lua[] =
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  ...{sysbench_0.4.12.bb => sysbench_1.0.20.bb} | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-benchmark/sysbench/{sysbench_0.4.12.bb => sysbench_1.0.20.bb} (56%)
>
> diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> similarity index 56%
> rename from meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
> rename to meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> index 708c71f4f..555477ab0 100644
> --- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
> +++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
> @@ -2,16 +2,17 @@ SUMMARY = "System performance benchmark"
>  HOMEPAGE = "http://github.com/akopytov/sysbench"
>  SECTION = "console/tests"
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -inherit autotools
> +DEPENDS = "luajit"
>
> -# The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
> -# Launchpad until the next release is available from Github.
> -SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz"
> +inherit autotools pkgconfig
>
> -SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
> -SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
> +SRC_URI = "git://github.com/akopytov/${BPN}.git"
> +
> +SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
> +
> +S = "${WORKDIR}/git"
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)}"
>  PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> @@ -21,6 +22,12 @@ PACKAGECONFIG[mysql] = "--with-mysql \
>                          --with-mysql-libs=${STAGING_LIBDIR}, \
>                          --without-mysql,mysql5"
>
> +# the internal luajit won't cross compile
> +EXTRA_OECONF += "--with-system-luajit"
> +
> +# lua.h generated files are bogus when using B != S
> +B = "${S}"
> +
>  do_configure_prepend() {
>      touch ${S}/NEWS ${S}/AUTHORS
>  }
> --
> 2.29.2
>
>
> 
>
