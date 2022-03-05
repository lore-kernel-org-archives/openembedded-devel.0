Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D055C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 17:47:53 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.7453.1646502472271676742
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 09:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0nRyEJ4;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id j78so8884823qke.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 09:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EhW6c7KFvlE9lAOR2HEVOXEOANN45omrgkDHJWeulz4=;
        b=F0nRyEJ4c9/ZH4KjLn4pgsLctxr0iJpufV6XyBgjLtzrluavado7ptsurrF2E5HSoF
         IiGHyJwRgEXQrFMVDlG3kgS5qWZZL+hDEKSUXhITQPNGN45trl21MABnwDOblSeRBYjA
         5/oq8ZWN9SvzyUKhOXFz90K6Rd5wLvX5V4fLRKAvtOxNhdNRGcIJbWFrpiG/3Rn8RIMb
         HHEUKaNPMet/xeKMYPbeI6rd9JzyFjIeAjMTSAu0TRwCV3xGiqBzESfoS5h5dHIkOQ6x
         6kNH4Z+PH4sSJWlzZOLpyCFOWW3qndRH7QyyQ8ZVwTntFNGEXd8lL/NlKve5cDJ3dNys
         yUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EhW6c7KFvlE9lAOR2HEVOXEOANN45omrgkDHJWeulz4=;
        b=Q7uXh8DAJU+IVqxSg2p9fOBYpIkV+ukFZyfSM84SAByfzgIp0j6pmC+CKqG45MSt0g
         F/lmeM7blhPPBOdYTUc3ECK5kIgznwNVjYrTaDoM8n9ORlbm1E9lnjzxE/Bxjs0uTMGF
         R3FRwUMT7hEn6XOLWxk6ICgui8Ym2kaLRTDxflNk2I58mTWAizsM9y6w/g0dlpxZhXPc
         0+HOEyMubMPjsAR+raporGNrC1RbaJS6yDvXZMdd407gMtOB5pgcWSOB/zyEEhJ9y2jw
         5UosCfGuXqDgtknxEd1xtJlBg6/dHnpKHmhlsy2+XXmNvXLZLXPgNGeN7bfyIdvqQZNL
         l4TQ==
X-Gm-Message-State: AOAM530JTNi2yi6MQgpJnIEXp/dHxcprfiC9ELBEC0gyo/55z44NUS9F
	EcmUN79dTLnvagWn59Vb8IGEPeXwXc2MCbEUh2iIb0Rp2naIiA==
X-Google-Smtp-Source: 
 ABdhPJyqtkxd92DXrrTV+A9L3INNh6pFxNG3ISydVOS/pCBolgd376Ox1zSncq5BzmkISeLR5Z/eNLGw+14hu0sb3Yo=
X-Received: by 2002:a05:620a:16d5:b0:60d:d3a7:af9e with SMTP id
 a21-20020a05620a16d500b0060dd3a7af9emr2493217qkn.463.1646502471096; Sat, 05
 Mar 2022 09:47:51 -0800 (PST)
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
 <CAAnfSTt+xv5-9QCeU75sJhmuGJnjLLZdocmfbk5X-o8A4tzTJA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTt+xv5-9QCeU75sJhmuGJnjLLZdocmfbk5X-o8A4tzTJA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Mar 2022 09:47:24 -0800
Message-ID: 
 <CAMKF1sqwMncevHKD05EzDxN7pFs74U+gu_1och6ubGytqfKTfg@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 17:47:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95800

indeed !! Finally we have a green build for meta-oe AB job

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1485

On Sat, Mar 5, 2022 at 3:14 AM Ross Burton <ross@burtonini.com> wrote:
>
> setuptools_legacy is now in oe-core master, so those changes can be merge=
d now.
>
> Ross
>
> On Fri, 4 Mar 2022 at 18:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > We have all recipes building now ( few with some warnings ) which
> > should get better with setuptools_legacy changes
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1482
> >
> > Sincere gratitude to all those who stepped up in time and helped patchi=
ng.
> >
> > On Thu, Mar 3, 2022 at 2:12 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Thu, Mar 3, 2022 at 2:00 PM Ross Burton <ross@burtonini.com> wrote=
:
> > > >
> > > > I've been having an interesting discussion with the PyPA about the
> > > > future of packaging Python.  It's illuminating, to say the least.  =
The
> > > > full thread is at
> > > > https://github.com/pypa/packaging-problems/issues/576 but the
> > > > highlights are:
> > > >
> > > > 1) Calling 'setup.py install' is deprecated, so anything which uses=
 a
> > > > non-standard install class (ufw, for example) won't work in the
> > > > future.  With setuptool3.bbclass now doing bdist_wheel/pip the inst=
all
> > > > task is ran in a special environment, and non-standard install clas=
ses
> > > > break quite badly.
> > > >
> > >
> > > right, I was coming to same conclusion, as I was messing to get
> > > unattended-upgrades
> > > working with new world. I did realize the fact that we did not give a=
ny time
> > > to port recipes and has made this a breaking change.
> > >
> > > > 2) Python packaging is moving fast towards a world where the only
> > > > things packagable are pure modules with entry point scripts and dat=
a.
> > > > If you want to do more (e.g. install a systemd unit file), then use
> > > > something like Meson.
> > >
> > > I see, that limits the use from distro packaging point of view.
> > >
> > > >
> > > > This is going to be interesting.  My short-term plan is to bring ba=
ck
> > > > the traditional setuptool3.bbclass code as setuptools3-legacy, for =
the
> > > > period between now and when "setup.py install" doesn't exist.
> > >
> > > yeah I think we need that. that will be an improvement.
> > >
> > > >
> > > > Ross
> > > >
> > > > On Thu, 3 Mar 2022 at 07:08, Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wr=
ote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > > > > >>
> > > > > >> Here is latest failures we are down to 3
> > > > > >>
> > > > > >> https://errors.yoctoproject.org/Errors/Build/142145/
> > > > > >
> > > > > >
> > > > > > I have a partial fix for python3-slip-dbus, but it doesn=E2=80=
=99t solve the problem.
> > > > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?=
h=3Dtimo/pyprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
> > > > > >
> > > > >
> > > > > I have addressed it. Right now we are effectively left with
> > > > >
> > > > > meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/un=
attended-upgrades_2.6.bb
> > > > >
> > > > > It fails in weird ways
> > > > >
> > > > > | Installing collected packages: unattended-upgrades
> > > > > | ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme ke=
y used in
> > > > > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-u=
pgrades/2.6-r0/git/dist/unattended_upgrades-0.1-py3-
> > > > > none-any.whl: etc (for file
> > > > > 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-up=
grades').
> > > > > .data directory contents should be in subdirectories named with a
> > > > > valid scheme key (d
> > > > > ata, headers, platlib, purelib, scripts)
> > > > > | Exception information:
> > > > > | Traceback (most recent call last):
> > > > > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/un=
attended-upgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-pack=
ages/pip/_internal/operations/install/wheel.py",
> > > > > line 521, in make_data_scheme_file
> > > > > |     scheme_path =3D scheme_paths[scheme_key]
> > > > > | KeyError: 'etc'
> > > > > |
> > > > > | During handling of the above exception, another exception occur=
red:
> > > > > |
> > > > >
> > > > > >>
> > > > > >> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> =
wrote:
> > > > > >> >
> > > > > >> > Here is latest list which is significantly less so thanks fo=
r
> > > > > >> > contributions thus far.
> > > > > >> >
> > > > > >> >   meta-openembedded/meta-python/recipes-extended/python-bliv=
et/python3-blivetgui_2.2.1.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-aws-iot-device-sdk-python_1.4.9.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-extended/python-bliv=
et/python3-blivet_3.4.3.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-slip-dbus_0.6.5.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-keras-applications_1.0.8.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pymetno_0.9.0.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-extended/python-cson=
/python3-cson_git.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-dbussy_1.3.bb
> > > > > >> >   meta-openembedded/meta-python/recipes-connectivity/python-=
txws/python3-txws_0.9.1.bb
> > > > > >> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgr=
ades/unattended-upgrades_2.6.bb
> > > > > >> >
> > > > > >> >
> > > > > >> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > > > >> > >
> > > > > >> > > We are making some progress. This is the latest ( 24 build=
 failures )
> > > > > >> > > as of last night.
> > > > > >> > >
> > > > > >> > > https://errors.yoctoproject.org/Errors/Build/142052/
> > > > > >> > >
> > > > > >> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.c=
om> wrote:
> > > > > >> > > >
> > > > > >> > > > Thanks for sending fixing everyone. Lets keep going. Her=
e is latest
> > > > > >> > > > list of failing recipes on master-next now
> > > > > >> > > >
> > > > > >> > > > Summary: 32 tasks failed:
> > > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-=
blivet/python3-blivet_3.4.0.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-crcmod_1.7.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-lrparsing_1.0.17.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-slip-dbus_0.6.5.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-=
blivet/python3-blivetgui_2.2.1.bb:do_compile
> > > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu=
_git.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-flask-versioned_0.9.4-20101221.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-ntplib_0.4.0.bb:do_install
> > > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafr=
uit-circuitpython-register_1.9.4.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-behave_1.2.6.bb:do_install
> > > > > >> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-pystache_0.5.4.bb:do_install
> > > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafr=
uit-pureio_1.1.8.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-pyscaffold_4.1.4.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-prctl_1.8.1.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-pymetno_0.9.0.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-=
cson/python3-cson_git.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-pydbus-manager_git.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-pymisp_2.4.152.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-dbussy_1.3.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp=
_git.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-keras-applications_1.0.8.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-gcovr_5.0.bb:do_install
> > > > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafr=
uit-platformdetect_3.1.1.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-configshell-fb_1.1.29.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/=
python3-xmodem_0.4.6.bb:do_package
> > > > > >> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-=
upgrades/unattended-upgrades_2.6.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-python/recipes-connectivity/pyt=
hon-txws/python3-txws_0.9.1.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfi=
sh_4.16.3.bb:do_compile
> > > > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/men=
ulibre_2.2.3.bb:do_install
> > > > > >> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/o=
nboard_1.4.1.bb:do_compile
> > > > > >> > > >
> > > > > >> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmai=
l.com> wrote:
> > > > > >> > > > >
> > > > > >> > > > > Hello All,
> > > > > >> > > > >
> > > > > >> > > > > We have PEP-517 packaging related infra changes merged=
 into oe-core,
> > > > > >> > > > > which obviously
> > > > > >> > > > > mean there are some failures on various python package=
s.
> > > > > >> > > > >
> > > > > >> > > > > I am posting the latest results (qemux86-64/glibc)
> > > > > >> > > > >
> > > > > >> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > > > > >> > > > >
> > > > > >> > > > > We have 57 recipes left, Tim has worked diligently on =
fixing the
> > > > > >> > > > > PEP-517 issues but we would
> > > > > >> > > > > need more hands. If you see any of
> > > > > >> > > > > these recipes that you can help fixing, please send pa=
tches
> > > > > >> > > > >
> > > > > >> > > > > Since upcoming release is an LTS release, I would like=
 to have these
> > > > > >> > > > > issues fixed for this
> > > > > >> > > > > release.
> > > > > >> > > > >
> > > > > >> > > > > Thank you for your help
> > > > > >> > > > >
> > > > > >> > > > > -Khem
> > > > > >>
> > > > > >>
> > > > > >>
> > > > >
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#95730): https://lists.openembedded.org/g/open=
embedded-devel/message/95730
> > > > > Mute This Topic: https://lists.openembedded.org/mt/89416561/16766=
15
> > > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/=
unsub [ross@burtonini.com]
> > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > >

