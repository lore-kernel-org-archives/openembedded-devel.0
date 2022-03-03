Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68395C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 02:45:11 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.6858.1646275510599817409
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 18:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GwsT/7KS;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id bc10so3509404qtb.5
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 18:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=N23clBqMqYD/kidc9qtgRvqJEJk0M7hns/rHBTSUhjY=;
        b=GwsT/7KSPXWO/uXscagXuXPGxeSTj25zBQTwRthitJqmm9YbcU5mkzsEFaxqpaVgv7
         +ifCUUboTwhHZU69ua4JbD9Q3MVvC6AYW8WTzd5JZzCyLx80RCDK1zMcsx6Cp9qi5gV5
         YbPRdh5EhVGxJgkcQGVfCAGzxgTbUed8FEVCFWFKd110lx2vm7DP8LsHCRGm4Wnt4BpV
         OF+zgxrCatNzpVvedKOFyhgCKkHPoQuBLLRjSnwO6/u9tB4OxPKEH+UXQGJNdcvyXqpJ
         Y5eCKOPZf6KGYyrCr0ldoMlF/SNpWVvTeBcImIzrOUGHhE0lASUhQ5lcYFjdvXWNN9yA
         YzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=N23clBqMqYD/kidc9qtgRvqJEJk0M7hns/rHBTSUhjY=;
        b=du8ja+m/tkoVD+1pCInEphyvs/SuiJWYUUolExm3KmQI5vuGhfaw9Jlicwfcn9YHF0
         t09Ln5O3x5DivEus+00JhA6PNJJ8YBYuI4I5pTZnhL8EyNK0Ikpq73r5x4Fnyk0tTPKm
         3F7M+foHd6ei1soC4s//xwymyt4oJg5yCu6r8Lx5BjSl5BSW1NTT9ruECL2kiFmOZ7p8
         F4DHuNNIaPgOVxGhKqGmWDwJZphIuGjWxlamCDfr/JOBoJiZNxtsoMd66aT2oTsMtCAw
         Yhu484Acv7lTcgURSOiwf8HObh+yEGj/ME9zucrqeUDuQmNoMpu6JF3zht95+ckzu/N4
         lBAg==
X-Gm-Message-State: AOAM5331yt9nE7ZAG47ZvU9HNHoAGPQ2rTv5h/3XRUPxihlZOr7bo3E4
	VkCKyKCYAwdpIDHf1kOfGQ8Gpkw2aWjTR+uJAl/xMIse4AghMg==
X-Google-Smtp-Source: 
 ABdhPJzS7G4mVbAXqMhaJntFEW5QL/sDrAeNOC9qV28DQVnJLl+8lb/fM/OiSu93mpWWpNzZ7Sw9O3oNVbNpXkPfUHs=
X-Received: by 2002:ac8:7dd1:0:b0:2de:600:a5ab with SMTP id
 c17-20020ac87dd1000000b002de0600a5abmr25809261qte.532.1646275509497; Wed, 02
 Mar 2022 18:45:09 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 18:44:43 -0800
Message-ID: 
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
Subject: Re: PEP-517 packaging fixes needed in meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 02:45:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95721

Here is latest failures we are down to 3

https://errors.yoctoproject.org/Errors/Build/142145/

On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Here is latest list which is significantly less so thanks for
> contributions thus far.
>
>   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
>   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
>   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
>   meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
>   meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
>   meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
>   meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb
>   meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
>   meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
>   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
>
>
> On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > We are making some progress. This is the latest ( 24 build failures )
> > as of last night.
> >
> > https://errors.yoctoproject.org/Errors/Build/142052/
> >
> > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Thanks for sending fixing everyone. Lets keep going. Here is latest
> > > list of failing recipes on master-next now
> > >
> > > Summary: 32 tasks failed:
> > >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb:do_compile
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb:do_compile
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb:do_compile
> > >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb:do_compile
> > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:do_compile
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb:do_install
> > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-circuitpython-register_1.9.4.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb:do_install
> > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb:do_install
> > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio_1.1.8.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb:do_install
> > >   meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb:do_install
> > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-platformdetect_3.1.1.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb:do_install
> > >   meta-openembedded/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb:do_package
> > >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb:do_install
> > >   meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb:do_install
> > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb:do_compile
> > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
> > >   meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb:do_compile
> > >
> > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Hello All,
> > > >
> > > > We have PEP-517 packaging related infra changes merged into oe-core,
> > > > which obviously
> > > > mean there are some failures on various python packages.
> > > >
> > > > I am posting the latest results (qemux86-64/glibc)
> > > >
> > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > > >
> > > > We have 57 recipes left, Tim has worked diligently on fixing the
> > > > PEP-517 issues but we would
> > > > need more hands. If you see any of
> > > > these recipes that you can help fixing, please send patches
> > > >
> > > > Since upcoming release is an LTS release, I would like to have these
> > > > issues fixed for this
> > > > release.
> > > >
> > > > Thank you for your help
> > > >
> > > > -Khem

