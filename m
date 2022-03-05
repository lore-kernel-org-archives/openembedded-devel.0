Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBEAC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 11:14:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.4305.1646478883080873341
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 03:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=6n9aOUNQ;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id b5so16233889wrr.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DVD/hbSRtaOTThkbf4iA4+zH9I1PCMZHDXIy/9bTjZg=;
        b=6n9aOUNQ4QpqLqmNiuHdsbKSzV9chIDYUuMa+f5IGqLNb6ofvuCMGwswYPHLdMc7Ew
         UfJWvcg/AWXmzVfwLgkY3k/2SoqXdqeqxoa5mAd8ZTp90EFNLxVuPIpVAy4e051EcGKv
         Bz0DdtusUdUu2BFsG1tFbbqsiXevJ/I+8AYHugK0kQ+wxrUWvxUCBueOcSEBfFCwlIpU
         +VUiBVRHEXurh916DXXv5zzFJSMdXDQ4Z/xYLbk9YaPJFhA104cLffYqa3J9GT1sdvR6
         IL8kYbzfVt+aTSU3VTkzRsQZPuv+O26diczGzBqcJXlrIvSNz1m2MWIKxN0RPoc+ubXd
         mpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DVD/hbSRtaOTThkbf4iA4+zH9I1PCMZHDXIy/9bTjZg=;
        b=XbzGkx4ObrWDwQiKD7fXOTHJmWg5Du0BinGr2Ms51acYezZ/InG8wgFDS/nOFKF7JP
         ESVw9ahlBonKsZWOCWTBfMl5enOAGrawHIqlaKA8UnkN+VWbxvgNmF4bZIomAvmhBcwp
         yE3dYDSwcLv/u1eMQZToTuHZjZz5Db4joeoMS9Irf8UxktXHaUDPY88kYhkaaHvNOvlz
         FRByozlkjU2Jff7b5M0NwM4GNzEe7xsxPULncXINrzin/ITXYsPMEMFokJg+H80GA30r
         25l7rBeGjOulHJg/SgEIAy9LjlUic0irfsKow/GrbgcrSBypxokcZ8IWZvHEf44d/tS6
         XLOA==
X-Gm-Message-State: AOAM530hdj56pdeFNNS+k3jKLf1RMxxhC78f9HrJ5quhgy13mGA5N8J/
	CC6JYhY8i01x0PjXFIi/iLHzNPeg1MkeHlb6PobWnQ==
X-Google-Smtp-Source: 
 ABdhPJws4FG+HWfseyVWhXl2HG/5KlNnqmyAGpYhVF+a44YrixajDBS9ZJaFmP807xcSHXpzqxQMfWcsx6XYxNgm5sU=
X-Received: by 2002:a5d:6506:0:b0:1f1:da5e:e077 with SMTP id
 x6-20020a5d6506000000b001f1da5ee077mr2100849wru.405.1646478881342; Sat, 05
 Mar 2022 03:14:41 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
 <CANx9H-CtXBXECQUK98wyfruz7n2+rRC_X0CgFsPDhxDKCw1gdw@mail.gmail.com>
 <CAMKF1sqzPuN6dZch0LPhG-WGYSBX+z4nk9HjQ1KR-9BiKcQGCA@mail.gmail.com>
 <CAAnfSTvjPeyJHjd-FiYoXmxPMaXM0AH9KMXm6n5ooJNfQp80Sw@mail.gmail.com>
 <CAMKF1sptk+EwYhQ9Ri5oh8oSh4T-x8Ox1j1wiLhs09WoDOVkOA@mail.gmail.com>
 <CAMKF1spRNTUgpzQKG1QsUpmru33xq+0+2iN2866g27DUtU9Nvg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spRNTUgpzQKG1QsUpmru33xq+0+2iN2866g27DUtU9Nvg@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Sat, 5 Mar 2022 11:14:30 +0000
Message-ID: 
 <CAAnfSTt+xv5-9QCeU75sJhmuGJnjLLZdocmfbk5X-o8A4tzTJA@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 11:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95798

setuptools_legacy is now in oe-core master, so those changes can be merged =
now.

Ross

On Fri, 4 Mar 2022 at 18:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> We have all recipes building now ( few with some warnings ) which
> should get better with setuptools_legacy changes
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1482
>
> Sincere gratitude to all those who stepped up in time and helped patching=
.
>
> On Thu, Mar 3, 2022 at 2:12 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 3, 2022 at 2:00 PM Ross Burton <ross@burtonini.com> wrote:
> > >
> > > I've been having an interesting discussion with the PyPA about the
> > > future of packaging Python.  It's illuminating, to say the least.  Th=
e
> > > full thread is at
> > > https://github.com/pypa/packaging-problems/issues/576 but the
> > > highlights are:
> > >
> > > 1) Calling 'setup.py install' is deprecated, so anything which uses a
> > > non-standard install class (ufw, for example) won't work in the
> > > future.  With setuptool3.bbclass now doing bdist_wheel/pip the instal=
l
> > > task is ran in a special environment, and non-standard install classe=
s
> > > break quite badly.
> > >
> >
> > right, I was coming to same conclusion, as I was messing to get
> > unattended-upgrades
> > working with new world. I did realize the fact that we did not give any=
 time
> > to port recipes and has made this a breaking change.
> >
> > > 2) Python packaging is moving fast towards a world where the only
> > > things packagable are pure modules with entry point scripts and data.
> > > If you want to do more (e.g. install a systemd unit file), then use
> > > something like Meson.
> >
> > I see, that limits the use from distro packaging point of view.
> >
> > >
> > > This is going to be interesting.  My short-term plan is to bring back
> > > the traditional setuptool3.bbclass code as setuptools3-legacy, for th=
e
> > > period between now and when "setup.py install" doesn't exist.
> >
> > yeah I think we need that. that will be an improvement.
> >
> > >
> > > Ross
> > >
> > > On Thu, 3 Mar 2022 at 07:08, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrot=
e:
> > > > >
> > > > >
> > > > >
> > > > > On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > > >>
> > > > >> Here is latest failures we are down to 3
> > > > >>
> > > > >> https://errors.yoctoproject.org/Errors/Build/142145/
> > > > >
> > > > >
> > > > > I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99=
t solve the problem.
> > > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=
=3Dtimo/pyprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
> > > > >
> > > >
> > > > I have addressed it. Right now we are effectively left with
> > > >
> > > > meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unat=
tended-upgrades_2.6.bb
> > > >
> > > > It fails in weird ways
> > > >
> > > > | Installing collected packages: unattended-upgrades
> > > > | ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme key =
used in
> > > > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-upg=
rades/2.6-r0/git/dist/unattended_upgrades-0.1-py3-
> > > > none-any.whl: etc (for file
> > > > 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgr=
ades').
> > > > .data directory contents should be in subdirectories named with a
> > > > valid scheme key (d
> > > > ata, headers, platlib, purelib, scripts)
> > > > | Exception information:
> > > > | Traceback (most recent call last):
> > > > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unat=
tended-upgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packag=
es/pip/_internal/operations/install/wheel.py",
> > > > line 521, in make_data_scheme_file
> > > > |     scheme_path =3D scheme_paths[scheme_key]
> > > > | KeyError: 'etc'
> > > > |
> > > > | During handling of the above exception, another exception occurre=
d:
> > > > |
> > > >
> > > > >>
> > > > >> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > > > >> >
> > > > >> > Here is latest list which is significantly less so thanks for
> > > > >> > contributions thus far.
> > > > >> >
> > > > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet=
/python3-blivetgui_2.2.1.bb
> > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-aws-iot-device-sdk-python_1.4.9.bb
> > > > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet=
/python3-blivet_3.4.3.bb
> > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-slip-dbus_0.6.5.bb
> > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-keras-applications_1.0.8.bb
> > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pymetno_0.9.0.bb
> > > > >> >   meta-openembedded/meta-python/recipes-extended/python-cson/p=
ython3-cson_git.bb
> > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-dbussy_1.3.bb
> > > > >> >   meta-openembedded/meta-python/recipes-connectivity/python-tx=
ws/python3-txws_0.9.1.bb
> > > > >> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrad=
es/unattended-upgrades_2.6.bb
> > > > >> >
> > > > >> >
> > > > >> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> w=
rote:
> > > > >> > >
> > > > >> > > We are making some progress. This is the latest ( 24 build f=
ailures )
> > > > >> > > as of last night.
> > > > >> > >
> > > > >> > > https://errors.yoctoproject.org/Errors/Build/142052/
> > > > >> > >
> > > > >> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com=
> wrote:
> > > > >> > > >
> > > > >> > > > Thanks for sending fixing everyone. Lets keep going. Here =
is latest
> > > > >> > > > list of failing recipes on master-next now
> > > > >> > > >
> > > > >> > > > Summary: 32 tasks failed:
> > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-bl=
ivet/python3-blivet_3.4.0.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-crcmod_1.7.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-lrparsing_1.0.17.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-slip-dbus_0.6.5.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-bl=
ivet/python3-blivetgui_2.2.1.bb:do_compile
> > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_g=
it.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-flask-versioned_0.9.4-20101221.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-ntplib_0.4.0.bb:do_install
> > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafrui=
t-circuitpython-register_1.9.4.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-behave_1.2.6.bb:do_install
> > > > >> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-pystache_0.5.4.bb:do_install
> > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafrui=
t-pureio_1.1.8.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-pyscaffold_4.1.4.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-prctl_1.8.1.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-pymetno_0.9.0.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-cs=
on/python3-cson_git.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-pydbus-manager_git.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-pymisp_2.4.152.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-dbussy_1.3.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_g=
it.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-keras-applications_1.0.8.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-gcovr_5.0.bb:do_install
> > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafrui=
t-platformdetect_3.1.1.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-configshell-fb_1.1.29.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/py=
thon3-xmodem_0.4.6.bb:do_package
> > > > >> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-up=
grades/unattended-upgrades_2.6.bb:do_install
> > > > >> > > >   meta-openembedded/meta-python/recipes-connectivity/pytho=
n-txws/python3-txws_0.9.1.bb:do_install
> > > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish=
_4.16.3.bb:do_compile
> > > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menul=
ibre_2.2.3.bb:do_install
> > > > >> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/onb=
oard_1.4.1.bb:do_compile
> > > > >> > > >
> > > > >> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.=
com> wrote:
> > > > >> > > > >
> > > > >> > > > > Hello All,
> > > > >> > > > >
> > > > >> > > > > We have PEP-517 packaging related infra changes merged i=
nto oe-core,
> > > > >> > > > > which obviously
> > > > >> > > > > mean there are some failures on various python packages.
> > > > >> > > > >
> > > > >> > > > > I am posting the latest results (qemux86-64/glibc)
> > > > >> > > > >
> > > > >> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > > > >> > > > >
> > > > >> > > > > We have 57 recipes left, Tim has worked diligently on fi=
xing the
> > > > >> > > > > PEP-517 issues but we would
> > > > >> > > > > need more hands. If you see any of
> > > > >> > > > > these recipes that you can help fixing, please send patc=
hes
> > > > >> > > > >
> > > > >> > > > > Since upcoming release is an LTS release, I would like t=
o have these
> > > > >> > > > > issues fixed for this
> > > > >> > > > > release.
> > > > >> > > > >
> > > > >> > > > > Thank you for your help
> > > > >> > > > >
> > > > >> > > > > -Khem
> > > > >>
> > > > >>
> > > > >>
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#95730): https://lists.openembedded.org/g/openem=
bedded-devel/message/95730
> > > > Mute This Topic: https://lists.openembedded.org/mt/89416561/1676615
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [ross@burtonini.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

