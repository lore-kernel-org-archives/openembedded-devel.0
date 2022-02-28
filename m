Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10F1C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 23:22:17 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web09.2156.1646090537140111036
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mo7NQNyP;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id d3so15318348qvb.5
        for <Openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 15:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=CyG+AxKi3fbdVWDJVGfrXTPxC8ihcCtpT/GOdYC8axQ=;
        b=Mo7NQNyP9+s5p9jFBDd2Fk5n1V0GhwZDUXIvfL3yCi9rP6IfvNL2REvm2yDbA3iupq
         m7TXkm7KuTXsaY4kAV8NRnGH7pvSoQ/AZfq1dxwwVHghqBl+5cFnef9WmnQbSAwWL2pk
         ajw1bL1KV0IiXUDBY33iOc8yl6OU1ZXVrMvRgJHGScaORc/9KieeHfsbBKQb+jxcTGql
         kOm41KVSQlwbqsgTrW40v08HJ04VirySpG67a5Z0PuhD6ZpdxScyfaZl8kgWEQErkt9w
         g1+ylK847rr8Nklz9ZP47Ayvqu5ZeMhlqpsI6mRne66sdCwyd78CO0fsL0GuZWqwE9hc
         GbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=CyG+AxKi3fbdVWDJVGfrXTPxC8ihcCtpT/GOdYC8axQ=;
        b=TAOcDpIVZz0Lx4hsvkVsNb1znBo3V+BZ8TLtQnbx8PgkZm/Xq8VRyA+pAD6EvkpZYP
         ovX24P7ec8g0jUXE0PhRJLB4DGPHXgvmDJefKDbIGN6DyMLsy0dH7sceBHjciPSmbN1z
         xpySgdX+PsSEPuKZzt52Xc90h6MN8wfwBZUtWgzVjtrE/07ZQxjJGhSlaYV+a46vsIF2
         8XQ8FTA4Z3RamFflbrd7kF32Jrug7MhNoi1OQfzrZ6hZrwV8T32gwHtWV55viNeWSxvs
         NV2K8O74ILQgOTE9W4PnTiBFuC41t9t6QrPCack1ERaMwjtDfwwv+Zd9BWG/S8Yy6uC8
         RQvg==
X-Gm-Message-State: AOAM530buYUS5lRZfCZ92l3hi/SV3Rkn3CkmCU+fzuiMo1JFwUZstd9T
	7AfuHa1zeMV71I1Tydy/gDAhtk0NlLUBMlHk3l4zfKPaM1wtJw==
X-Google-Smtp-Source: 
 ABdhPJwdJ2IKPmWVijEzyG6flBqUkTYv8PTNPNdEMoMvmY8yPUA2oshroLXu4LxK+hlPF1NJW1QRaSsPLk6hbiohrco=
X-Received: by 2002:a0c:cb0a:0:b0:432:6f02:e2d6 with SMTP id
 o10-20020a0ccb0a000000b004326f02e2d6mr15364601qvk.110.1646090535901; Mon, 28
 Feb 2022 15:22:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 15:21:49 -0800
Message-ID: 
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
Subject: Re: PEP-517 packaging fixes needed in meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 23:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95610

Thanks for sending fixing everyone. Lets keep going. Here is latest
list of failing recipes on master-next now

Summary: 32 tasks failed:
  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
  meta-openembedded/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb:do_compile
  meta-openembedded/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb:do_compile
  meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb:do_compile
  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb:do_compile
  meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:do_compile
  meta-openembedded/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb:do_install
  meta-raspberrypi/recipes-devtools/python/python3-adafruit-circuitpython-register_1.9.4.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb:do_install
  meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb:do_install
  meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio_1.1.8.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb:do_install
  meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb:do_install
  meta-raspberrypi/recipes-devtools/python/python3-adafruit-platformdetect_3.1.1.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb:do_install
  meta-openembedded/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb:do_package
  meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb:do_install
  meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb:do_install
  meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb:do_compile
  meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
  meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb:do_compile

On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hello All,
>
> We have PEP-517 packaging related infra changes merged into oe-core,
> which obviously
> mean there are some failures on various python packages.
>
> I am posting the latest results (qemux86-64/glibc)
>
> https://errors.yoctoproject.org/Errors/Build/141804/
>
> We have 57 recipes left, Tim has worked diligently on fixing the
> PEP-517 issues but we would
> need more hands. If you see any of
> these recipes that you can help fixing, please send patches
>
> Since upcoming release is an LTS release, I would like to have these
> issues fixed for this
> release.
>
> Thank you for your help
>
> -Khem

