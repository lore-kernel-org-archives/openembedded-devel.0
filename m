Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.45091.1622472375853414431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 07:46:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G/VkTbQM;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c10so8039703qtx.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H2Kl79sG+FKWpa31SxEj4bQPZO/vdu8KiCsfosI1L4c=;
        b=G/VkTbQMJQLI2yGjrXOvBUMRBw4ZvRhKnW61wvfTdVHCnW/vkGjJ3vR2STQTKNGKkI
         3wTB5EY4CpuHgOyxGrPykxFtz4SZNdk7iH2TZNPDcyqJFFMedcb6JWB+F195mRkVg6e6
         +83zLIUzlbq9SdOKTbhWXmOZRxRdLriozvCK8bpL1uJfp7ZaEe9kXby+RXEp9SEpFx0h
         TuBik0mjNAceTknXdKVybx+ZPq8nwprLsr4kaJd5EZLRIBuQhZqU6+MkspneRBPY/okG
         goz8kOFDmjAW3ASEVngd8oyl9QfOJV2GQgRld7EFAcE5QoTDBr77IlQ6+yQpRnH1Y2nc
         ACSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H2Kl79sG+FKWpa31SxEj4bQPZO/vdu8KiCsfosI1L4c=;
        b=oL3DlXlPjf9s2B3dDtlBJYComUcwwrphgOusqEWZt57bH65jr1sLxvHRxNcAxFhI6A
         2U8zc89YYJy1MREvX+mhjyeazJxiQF81fyIGo573Ou7IOj+GUjqxKjbe3UkQ07mRBhci
         v3bZ2V2pZjCvfl9AAvqdjIEJPkdUcoi39dx26i0oUCT60+vZ7SLvQM3FErIlt40NnHTm
         z5MEyLrsDukHHcFVMljuR4t9rltSDmoOP2vL2lG6BEBroXvFNQl5p500ucMDlM8MtIXr
         6KjQmfF9L3k3yqE4r5G0uRlvKI49NmVdfFb1qiC78OuJbAwEIrDX6QnQkVa5UkvfafJy
         HYBQ==
X-Gm-Message-State: AOAM531k/9bHhOzJ0GZiFN56zVU1vSibByfucUREOU1zib2Gu88R8kpx
	3xG0Npe7nTMOCfPUGnzNd1+kRHK7U1o3aq2AhRio9Y5ojE8=
X-Google-Smtp-Source: ABdhPJxP8tKnl+0zvBo5so/9kAcezpUdW9ja4d6fz9WrZ9oOSh0oEJGcGRVLZDY3faEkycoGkRuaYk45cMWabFQsVVA=
X-Received: by 2002:a05:622a:148a:: with SMTP id t10mr15067216qtx.214.1622472374826;
 Mon, 31 May 2021 07:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210530172125.16258-1-ayoub.zaki@embexus.com>
In-Reply-To: <20210530172125.16258-1-ayoub.zaki@embexus.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 31 May 2021 07:45:48 -0700
Message-ID: <CAMKF1sq56JqYJ6+R8On3zc_HnUO4VwvAP91QNASS8y_P7AZCgw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] evemu-tools: Add initial recipe
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 10:21 AM Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>
> ---
>  .../evemu-tools/evemu-tools_git.bb            | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
>
> diff --git a/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> new file mode 100644
> index 000000000..f1172b0ef
> --- /dev/null
> +++ b/meta-oe/recipes-support/evemu-tools/evemu-tools_git.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Kernel evdev device emulation"
> +DESCRIPTION = "The evemu library and tools are used to describe devices, record data, create devices and replay data from kernel evdev devices."
> +HOMEPAGE = "https://www.freedesktop.org/wiki/Evemu"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +
> +DEPENDS = "libevdev"
> +
> +SRCREV = "86a5627dbeac8d9d9bc34326a758d6a477e876e4"
> +SRC_URI = "git://git@gitlab.freedesktop.org/libevdev/evemu.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +PV = "gitr${SRCPV}"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF_append = " --prefix=/usr"

why do we need this

> +
> +PACKAGES =+ "${PN}-python"
> +FILES_${PN}-python = "${libdir}/python*/site-packages/*"
> +RDEPENDS_${PN}-python = "python3"
> +
> --
> 2.17.1
>
>
> 
>
