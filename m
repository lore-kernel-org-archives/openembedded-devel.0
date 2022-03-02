Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6226BC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:40:52 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.1312.1646246451759443078
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GDH1Zvre;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id bc10so2486323qtb.5
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+XM3fF9rqgz+zWAu4kQ5/PZDc7TgDl9CWn9YiMcBQSs=;
        b=GDH1ZvreZlVgfxy7/F+3bMqvj168eJz17afJ5sKkA3qCrneMXTbqYlY6tXqzO6TKvY
         x55u+eENhrq0xtkoCz5ygewUUwmccu4XV35Qiz2Nwkv9z02iX9dRDqnjNhzJNaBBQQUF
         31XGe1A9h0FI+UwM3sd1jARpYyRe10JXphNb/Y2JOeD0tl8/haC8K8SLwOEQeqCBRqSc
         kekosH25+GcEH3IeiibzPITyoy3bkZLgGY4GpViiOuq51PAy6B1tGdP7FaYzKy8U+9pc
         xxcjg792DmwZGXB7fo5MQZbslqiv0Tw7hVKz7/kKpuu9ae+6bFzoqHaSR52kBZ7n6UfT
         GZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+XM3fF9rqgz+zWAu4kQ5/PZDc7TgDl9CWn9YiMcBQSs=;
        b=DEKmBOD8LAhiTzmincxzbyRacd0tfsUM1ud5OMqX7Rl7vyz27b5EBOl0LJ6Kzx1uHL
         wDibKO81droEWiiaXOKCv3sH/yohB8qlffAJOB9unUZ/Yxh1mSPmBGNBqdQyVYLFN2ap
         PiDHxzpKexBaBFcZGd6s89e6zDXR4E8J1xwtotxDYJiOVbX+GCm2F1Kpq0I1cPRyANUA
         v3jCT73UQgmCzUG8uiTAbHuERCXFkqCaZFCQduez2KVi9eSGA7ltazZbrT1YD0RA+RmF
         V9t7jimsc6nE0nC1LJ1rAygF7UGR5Ula7iyShWCX2NUZBxGwcdpvNrpkCrqWJ6AR9/CO
         C3cQ==
X-Gm-Message-State: AOAM530T9saFQoDqi8eqrkXk4da2vSBS6BotLy9c4x0Ak9oXIPKcEd/L
	69xgXJ4w7fuG5OIN85brTu8oSCtVTqXBoFsIiEkZxibWaCAKHA==
X-Google-Smtp-Source: 
 ABdhPJxs+0O61ijiCRLdqe+K5Vci138+/KHSyi5oGH+wtprJ5f3kixYWMt4uWZo4dL+GKtX56AIqiFLzG7Nt0Vsrp4s=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr25822995qth.330.1646246450478; Wed, 02
 Mar 2022 10:40:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 10:40:24 -0800
Message-ID: 
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
Subject: Re: PEP-517 packaging fixes needed in meta-openembedded
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95698

Here is latest list which is significantly less so thanks for
contributions thus far.

  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb
  meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb
  meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.3.bb
  meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
  meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
  meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
  meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb
  meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
  meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
  meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb


On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> We are making some progress. This is the latest ( 24 build failures )
> as of last night.
>
> https://errors.yoctoproject.org/Errors/Build/142052/
>
> On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Thanks for sending fixing everyone. Lets keep going. Here is latest
> > list of failing recipes on master-next now
> >
> > Summary: 32 tasks failed:
> >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivet_3.4.0.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-crcmod_1.7.bb:do_compile
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb:do_compile
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb:do_compile
> >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.2.1.bb:do_compile
> >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:do_compile
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-flask-versioned_0.9.4-20101221.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb:do_install
> >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-circuitpython-register_1.9.4.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-behave_1.2.6.bb:do_install
> >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pystache_0.5.4.bb:do_install
> >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio_1.1.8.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb:do_install
> >   meta-openembedded/meta-python/recipes-extended/python-cson/python3-cson_git.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pymisp_2.4.152.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb:do_install
> >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-platformdetect_3.1.1.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.29.bb:do_install
> >   meta-openembedded/meta-python/recipes-devtools/python/python3-xmodem_0.4.6.bb:do_package
> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb:do_install
> >   meta-openembedded/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb:do_install
> >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.bb:do_compile
> >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2.3.bb:do_install
> >   meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb:do_compile
> >
> > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Hello All,
> > >
> > > We have PEP-517 packaging related infra changes merged into oe-core,
> > > which obviously
> > > mean there are some failures on various python packages.
> > >
> > > I am posting the latest results (qemux86-64/glibc)
> > >
> > > https://errors.yoctoproject.org/Errors/Build/141804/
> > >
> > > We have 57 recipes left, Tim has worked diligently on fixing the
> > > PEP-517 issues but we would
> > > need more hands. If you see any of
> > > these recipes that you can help fixing, please send patches
> > >
> > > Since upcoming release is an LTS release, I would like to have these
> > > issues fixed for this
> > > release.
> > >
> > > Thank you for your help
> > >
> > > -Khem

