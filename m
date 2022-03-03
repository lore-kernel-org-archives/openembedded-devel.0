Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050E0C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:00:06 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.187.1646344804176001435
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=zeZnYO4H;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id ay10so9861720wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B0YZXeo5f+A63Ma9ujiOT6hDNbL0B0eGH7F/XbcYJyw=;
        b=zeZnYO4Hm2eCU5Qsiga5UgMYuwoXyJ6rC3+TWd9cNjgqX77UbVxTarfKkXVF6ffZiY
         JHsO0Y450ZI8kU0eImLuBZLgEgcRkT/XqjlY2HyEbIv/UnlDOd5oYk0wS3dW5oUaM+sf
         TYmOeq2IhhsDYigUHXXRr0pvpmN3E8eTvpBoZjtASeRSMV47EUzGPk+f9cKWTF4875Dx
         J/+TAoG3YZANBRKRvTTqzdVpNH7Iq7LcTig4tnO9MuJc8o95lE8PIavxZ7/pDo4vJtb/
         syNzqsw+eGKB2/pI9fxGnRALdy5MrO6mqKQ+VzQxs0ZtthrlWYzg4J148kBLgdKonsE5
         CuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B0YZXeo5f+A63Ma9ujiOT6hDNbL0B0eGH7F/XbcYJyw=;
        b=uiDmslelrM13uDIE6feMpi4+lt7kxi5In0sL2LvQa5iW/kyGMrWzVrj0l2cezlCSLF
         eVup0fZtKAMViagKi8OkFSlN0TSpA1CqBLJRVHz2zSE7yTqdVRNCradKNjmZP1ktixO0
         3PZhS+Fye8jnPne5At4PVB7FISKOr4lZfXDOH8mfhfBEo6c45VD1ztAylscx55j+V+7l
         llVQrJoAjx5QkIWb+W/jQpo5ccuLzDzzyihYTvtbeIgFTL34P3UOt6n9Wt2oGfEkprMe
         lGd133cdPpmuuhB/VT1PT4e62NAQO5+p4uaQS3h8EtzWM+3tWPQ1N9SOUZD3UtIrrRsh
         Xkaw==
X-Gm-Message-State: AOAM531tlGz9Pdc9KzJJq9OAzV/etyivNv3V3qIz/adHwnm/jXCTLAWP
	cjBIzq57g8OKO6aILY9ghPRwbVdiSlr4AuJsZ5BqiA==
X-Google-Smtp-Source: 
 ABdhPJxgCWXHg4NixsJMmNzs2jG4SIYg0wPrx/UvNoL+cDh9XOSOuhkNhtuE1mYxZKBwFU7rC3P9S+hNszd7BNsBofQ=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr4925976wro.497.1646344802256; Thu, 03
 Mar 2022 14:00:02 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
 <CANx9H-CtXBXECQUK98wyfruz7n2+rRC_X0CgFsPDhxDKCw1gdw@mail.gmail.com>
 <CAMKF1sqzPuN6dZch0LPhG-WGYSBX+z4nk9HjQ1KR-9BiKcQGCA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqzPuN6dZch0LPhG-WGYSBX+z4nk9HjQ1KR-9BiKcQGCA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 3 Mar 2022 21:59:51 +0000
Message-ID: 
 <CAAnfSTvjPeyJHjd-FiYoXmxPMaXM0AH9KMXm6n5ooJNfQp80Sw@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 22:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95761

I've been having an interesting discussion with the PyPA about the
future of packaging Python.  It's illuminating, to say the least.  The
full thread is at
https://github.com/pypa/packaging-problems/issues/576 but the
highlights are:

1) Calling 'setup.py install' is deprecated, so anything which uses a
non-standard install class (ufw, for example) won't work in the
future.  With setuptool3.bbclass now doing bdist_wheel/pip the install
task is ran in a special environment, and non-standard install classes
break quite badly.

2) Python packaging is moving fast towards a world where the only
things packagable are pure modules with entry point scripts and data.
If you want to do more (e.g. install a systemd unit file), then use
something like Meson.

This is going to be interesting.  My short-term plan is to bring back
the traditional setuptool3.bbclass code as setuptools3-legacy, for the
period between now and when "setup.py install" doesn't exist.

Ross

On Thu, 3 Mar 2022 at 07:08, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> >
> >
> > On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Here is latest failures we are down to 3
> >>
> >> https://errors.yoctoproject.org/Errors/Build/142145/
> >
> >
> > I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99t solv=
e the problem.
> > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo=
/pyprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
> >
>
> I have addressed it. Right now we are effectively left with
>
> meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended=
-upgrades_2.6.bb
>
> It fails in weird ways
>
> | Installing collected packages: unattended-upgrades
> | ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme key used i=
n
> /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-upgrades/=
2.6-r0/git/dist/unattended_upgrades-0.1-py3-
> none-any.whl: etc (for file
> 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgrades')=
.
> .data directory contents should be in subdirectories named with a
> valid scheme key (d
> ata, headers, platlib, purelib, scripts)
> | Exception information:
> | Traceback (most recent call last):
> |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended=
-upgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pip=
/_internal/operations/install/wheel.py",
> line 521, in make_data_scheme_file
> |     scheme_path =3D scheme_paths[scheme_key]
> | KeyError: 'etc'
> |
> | During handling of the above exception, another exception occurred:
> |
>
> >>
> >> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > Here is latest list which is significantly less so thanks for
> >> > contributions thus far.
> >> >
> >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/pytho=
n3-blivetgui_2.2.1.bb
> >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-=
iot-device-sdk-python_1.4.9.bb
> >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/pytho=
n3-blivet_3.4.3.bb
> >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-slip=
-dbus_0.6.5.bb
> >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-kera=
s-applications_1.0.8.bb
> >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pyme=
tno_0.9.0.bb
> >> >   meta-openembedded/meta-python/recipes-extended/python-cson/python3=
-cson_git.bb
> >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-dbus=
sy_1.3.bb
> >> >   meta-openembedded/meta-python/recipes-connectivity/python-txws/pyt=
hon3-txws_0.9.1.bb
> >> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/una=
ttended-upgrades_2.6.bb
> >> >
> >> >
> >> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> > >
> >> > > We are making some progress. This is the latest ( 24 build failure=
s )
> >> > > as of last night.
> >> > >
> >> > > https://errors.yoctoproject.org/Errors/Build/142052/
> >> > >
> >> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >> > > >
> >> > > > Thanks for sending fixing everyone. Lets keep going. Here is lat=
est
> >> > > > list of failing recipes on master-next now
> >> > > >
> >> > > > Summary: 32 tasks failed:
> >> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet/p=
ython3-blivet_3.4.0.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
aws-iot-device-sdk-python_1.4.9.bb:do_compile
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
crcmod_1.7.bb:do_compile
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
lrparsing_1.0.17.bb:do_compile
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
slip-dbus_0.6.5.bb:do_compile
> >> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet/p=
ython3-blivetgui_2.2.1.bb:do_compile
> >> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:=
do_compile
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
flask-versioned_0.9.4-20101221.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
ntplib_0.4.0.bb:do_install
> >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-circ=
uitpython-register_1.9.4.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
behave_1.2.6.bb:do_install
> >> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pystache_0.5.4.bb:do_install
> >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pure=
io_1.1.8.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pyscaffold_4.1.4.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
prctl_1.8.1.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pymetno_0.9.0.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-extended/python-cson/pyt=
hon3-cson_git.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pydbus-manager_git.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pymisp_2.4.152.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
dbussy_1.3.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:=
do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
keras-applications_1.0.8.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
gcovr_5.0.bb:do_install
> >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-plat=
formdetect_3.1.1.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
configshell-fb_1.1.29.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
xmodem_0.4.6.bb:do_package
> >> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades=
/unattended-upgrades_2.6.bb:do_install
> >> > > >   meta-openembedded/meta-python/recipes-connectivity/python-txws=
/python3-txws_0.9.1.bb:do_install
> >> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.=
3.bb:do_compile
> >> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2=
.2.3.bb:do_install
> >> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1=
.4.1.bb:do_compile
> >> > > >
> >> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> w=
rote:
> >> > > > >
> >> > > > > Hello All,
> >> > > > >
> >> > > > > We have PEP-517 packaging related infra changes merged into oe=
-core,
> >> > > > > which obviously
> >> > > > > mean there are some failures on various python packages.
> >> > > > >
> >> > > > > I am posting the latest results (qemux86-64/glibc)
> >> > > > >
> >> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> >> > > > >
> >> > > > > We have 57 recipes left, Tim has worked diligently on fixing t=
he
> >> > > > > PEP-517 issues but we would
> >> > > > > need more hands. If you see any of
> >> > > > > these recipes that you can help fixing, please send patches
> >> > > > >
> >> > > > > Since upcoming release is an LTS release, I would like to have=
 these
> >> > > > > issues fixed for this
> >> > > > > release.
> >> > > > >
> >> > > > > Thank you for your help
> >> > > > >
> >> > > > > -Khem
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95730): https://lists.openembedded.org/g/openembedded=
-devel/message/95730
> Mute This Topic: https://lists.openembedded.org/mt/89416561/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
oss@burtonini.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

