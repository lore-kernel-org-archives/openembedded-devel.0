Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C01C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:19:13 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.10115.1646151552657602340
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a3MClSqc;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id bt3so10340933qtb.0
        for <Openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qREVVIX2VpvlZExQjlU2lJGZ91mhTq7UkcQ3AWAgHDM=;
        b=a3MClSqcyGupJXvE7OyfMUKi/AL9op3z6NNp2N9ibPKuCKUlWl/ibyZscfK5gjgxTd
         WTwzWVUIa5k3DsFNQr/wbamlnJXi+P7zU2F0IolLn51/HT6mxvRNjZZbBoT8DHs1Lv5b
         arRD5YdHdg/NDQO7whMDGX/zeJTOJia5js1XYhzcGVFkxnwHWg8XYJcBniNiEpjMzQQK
         b73dmwlX0YXdcFjL+S6susHDzYnOGelQoyWl/IcSokMwKE4BWFzu3Dkbjirpe98w/42U
         ZE3i7rlD38qtuCg0bhzBiKAV/7PocF2H0DO742dRmI6rWIaa1ZVyI04d7tqB+k/8qnv9
         2brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qREVVIX2VpvlZExQjlU2lJGZ91mhTq7UkcQ3AWAgHDM=;
        b=xC/snjPlCpbs5K9zpLZYYpCyew8NZd5Ayn4Ok1eEYAMwSvPk19k6Egwwg1cOxnDFXO
         ovzqUzh3U3rh8AHV3jaoVFUQS1BAFpEAYwg/IzMv6qXjBPNnzE6HA7vOMnVCwNUeBi6f
         CcLxsyVH87YsIAAebM1rfn/jLVHaP0ZFtW9LK4XZYk3U7QUQoYM7SKZm2KBZQGT4rLS8
         vV9h9Ja7k6ygN7iZpe3u7/FGaSOPc04aSLV3ZwO7Gy1wvcHtsToEl5G2atsBTD0VmUdM
         kUCpuYQIyfo6ucEa8e3V4wer11l4A9Jbp0HTpEYBV25nysCK1Swd8LL20tKLPBxz2GPg
         R+hA==
X-Gm-Message-State: AOAM53361ch4ZLaQhgLUnRGIbHSsMMqDEJUuewmnDF6FbvURqs8rMNNg
	tXbC5U5Z/fcPVdsQHBemCDEUeJfitywyLlTEeYa1kEvticwxMQ==
X-Google-Smtp-Source: 
 ABdhPJw1TP0ABc4liR11eMTivSZZaBeXyCRpdcpJQ4q9Alf5O/0w23kTX/jHUAFUGF6Hyi+kC9cN7t3rob73OL4GDZY=
X-Received: by 2002:a05:622a:104c:b0:2de:377e:25d9 with SMTP id
 f12-20020a05622a104c00b002de377e25d9mr20578456qte.229.1646151551488; Tue, 01
 Mar 2022 08:19:11 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2022 08:18:45 -0800
Message-ID: 
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
Subject: Re: PEP-517 packaging fixes needed in meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 16:19:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95638

We are making some progress. This is the latest ( 24 build failures )
as of last night.

https://errors.yoctoproject.org/Errors/Build/142052/

On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks for sending fixing everyone. Lets keep going. Here is latest
> list of failing recipes on master-next now
>
> Summary: 32 tasks failed:
>   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
>   meta-openembedded/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb:do_compile
>   meta-openembedded/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb:do_compile
>   meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb:do_compile
>   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb:do_compile
>   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:do_compile
>   meta-openembedded/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb:do_install
>   meta-raspberrypi/recipes-devtools/python/python3-adafruit-circuitpython-register_1.9.4.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb:do_install
>   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb:do_install
>   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio_1.1.8.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb:do_install
>   meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb:do_install
>   meta-raspberrypi/recipes-devtools/python/python3-adafruit-platformdetect_3.1.1.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb:do_install
>   meta-openembedded/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb:do_package
>   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb:do_install
>   meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb:do_install
>   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb:do_compile
>   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
>   meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb:do_compile
>
> On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hello All,
> >
> > We have PEP-517 packaging related infra changes merged into oe-core,
> > which obviously
> > mean there are some failures on various python packages.
> >
> > I am posting the latest results (qemux86-64/glibc)
> >
> > https://errors.yoctoproject.org/Errors/Build/141804/
> >
> > We have 57 recipes left, Tim has worked diligently on fixing the
> > PEP-517 issues but we would
> > need more hands. If you see any of
> > these recipes that you can help fixing, please send patches
> >
> > Since upcoming release is an LTS release, I would like to have these
> > issues fixed for this
> > release.
> >
> > Thank you for your help
> >
> > -Khem

