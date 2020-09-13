Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web11.31319.1599963681091417457
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2020 19:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BaUDyJpW;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id b17so12518483ilh.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2020 19:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=duRG9aB95uzamNaW1bFpRGmnBpG29MDIL0RgXUFoI4o=;
        b=BaUDyJpWxjDfP1Cxa0NEbE2Sla3kL0kpRRUWYT+DheJNZN8yZR833g9ZCzuQy441zH
         HFrx4cw6evrm5GTZplpUqHgfSfHEITkyTGExmRabLKcQmithMXt9CPu5pl+hk5fM3dLu
         UrS/nb0cFtmD9L0jh6V2aJN/nxRaKeykkRr+8uL6r/7O/+WMnur1YPO7dScKS/QKvlyS
         yMBtZxvCWptdxERZhVOAvYGpzjT8vTR5fzPyztRVnD/xdZsQ9MasGlT6EbrsOM0iSpm5
         2SeswK6Y3tznjSUzy/qE7seS52d8sao/jZpk4uAAxANZnWJqxsRM9wn0Fp+j8/Be33O5
         3Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=duRG9aB95uzamNaW1bFpRGmnBpG29MDIL0RgXUFoI4o=;
        b=qdRw75Bf9JSofwY2KjgmzFOPEGZbqlXGPCSQLLJvmV0j1HWPDiTWDbt80SlvEpU8ff
         TUPT68qtyrkVZZC6jKDfpQ2/dz2RWaFSK2oyBNXZmhdgTM6PN3hqRHwOY2nUgNXUl+eV
         oUCPknR/LSOfQMQUFMlG6mLxAOUWphGmiwk5lvW3ou3WGCMISUPSNJ66WnkcZsPuWHgX
         dgrpyS9JKQl6EooeHdG/4a7moAi78ZKQJlJIryq7bXOrHTwghHKIHUb6gL6hdGOKr40i
         xGMdxpk3J5Y5QBgysV3CEKFOidgobcNmQn+wBX4vSxbIbS7Kvq15mzoyfcTGsT+9Xv9J
         PILg==
X-Gm-Message-State: AOAM531rhBrmLFVnPQ11mt5g7rOkIRCsE40YTX3DNQONoHR2cnXaHBXJ
	QtGKmoa4V8cMZlvi6vxjSZSVEhkgeJHZoR/7hHlVpQnGKF2sAA==
X-Google-Smtp-Source: ABdhPJzF/0zGnT6gOwe4xN6yQxa6tXZ5FwxdwgvLtMt1KcGv5M3CkuuoEC7VMBpBv0atH2DGbuaiz/Ab27vk8erKIow=
X-Received: by 2002:a92:d188:: with SMTP id z8mr7332970ilz.292.1599963680328;
 Sat, 12 Sep 2020 19:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200913021142.1262266-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20200913021142.1262266-1-robert.joslyn@redrectangle.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 12 Sep 2020 19:20:54 -0700
Message-ID: <CAMKF1srObQgDZQ_M8Kot_Bj0gFLO1m38MA-3bTsvi_n3_fbATg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] consolation: Add recipe
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 12, 2020 at 7:12 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> Consolation is a daemon that provide copy-paste and scrolling support to
> the Linux console.
>
> It is based on the libinput library and supports all pointer devices and
> settings provided by this library,
>
> Similar software include gpm and jamd.
>

Can you also add to to appropriate packagegroup in /packagegroup-meta-oe.bb

> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../consolation/consolation_0.0.8.bb          | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-support/consolation/consolation_0.0.8.bb
>
> diff --git a/meta-oe/recipes-support/consolation/consolation_0.0.8.bb b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
> new file mode 100644
> index 000000000..90bd560c4
> --- /dev/null
> +++ b/meta-oe/recipes-support/consolation/consolation_0.0.8.bb
> @@ -0,0 +1,29 @@
> +SUMMARY = "copy-paste for the Linux console"
> +DESCRIPTION = "Consolation is a daemon that provides copy-paste and scrolling \
> +support to the Linux console. It is based on the libinput library and \
> +supports all pointer devices and settings provided by this library. Similar \
> +software include gpm and jamd."
> +HOMEPAGE = "https://salsa.debian.org/consolation-team/consolation"
> +SECTION = "console/utils"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=73ca626e1d9048abfc7d599370650827"
> +
> +DEPENDS = " \
> +    libevdev \
> +    libinput \
> +    udev \
> +"
> +
> +SRC_URI = "git://salsa.debian.org/consolation-team/consolation.git"
> +SRCREV = "4581eaece6e49fa2b687efbdbe23b2de452e7902"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig systemd
> +
> +do_install_append() {
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 644 ${B}/consolation.service ${D}${systemd_system_unitdir}
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "consolation.service"
> --
> 2.26.2
>
> 
