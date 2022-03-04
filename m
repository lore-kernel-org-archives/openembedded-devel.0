Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CFAC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:30:28 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.64.1646418628011302562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yy4LBWWl;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id s15so8118804qtk.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FXYZCQU+ZNquO7l5hNOYGwMyhJV82wboiYoTCuBS6Z4=;
        b=Yy4LBWWlHmTH76qh4un0bGdkHrPGXSSIwU7dMFOSb5jsNxWUogKvLEgtgafAIL05L/
         g+UpFf6BGXlBo5/rMG4EjQ5ovX6E+oX4yt4ZGk5oiYo/s0xCVB2i75uCB1xeeIA/r061
         pomKZILn/N2tgPWjVNfIP6nbSJfTKqd2SgO8JpMwYdu3BqYEQrRwEmEm8UEOlP03JH6b
         i9l8wrdiWlzChMggszUnWlmdzM6dNgby9L7ZFm88T/tveOPObChI7bOvvYBBLNwWLA1g
         isxJI3hOI0y4izEoDa2Uk2flZMbEBiAQTJykDEnozMZP3HKlXCkFJATHUT2DutvS+biX
         3dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FXYZCQU+ZNquO7l5hNOYGwMyhJV82wboiYoTCuBS6Z4=;
        b=g0YBj+ICQcXCGKyI3VHRy64hJ08eUh6fS95M8CgS332nRRwTqf1UWUNR4SpE000OCE
         nXF5TV4uuXLyMKKB0u9IDL2RO0j1h1Gapr4OEgtPxDL1U0/Yp0fNyH4iwcgSptVp1Lwb
         zCaeBUPIdUqMyp0BsDTuDY4DlO+MO4+oL3xzhSS1tQ72Z0C3GCOo7VJhH1QMlf/tbXW5
         heLB24RfsnPObIHJtvQJ6kD69iEBf09dvMvN5CzcTMpE/nzL8EMQHtxj02JPnlDrQF1k
         Ac4TmttgcREHKXrxFgqAtX6uDYb+qtN2KVhn2aSLgpIpqC1brkcD0Qo+AHlv+9y+uc9J
         NY7A==
X-Gm-Message-State: AOAM530jXapVVtSLk63sS6WepNP1e8mFI4SjCygYN86qWtf+4XJStgDT
	SE0XQt3g/Y/92r4/Od0y7YZ3tH3+f9jsDiIGDMQ=
X-Google-Smtp-Source: 
 ABdhPJxv05kwTXKZ63SA2BBCgQ0wbN5hyN81hwgiYALD0fLwRB0eu3uJOHZEb5l2jGal7U3xZ+cNqBGNlKSqNy4odSY=
X-Received: by 2002:ac8:584c:0:b0:2dd:aaa6:7865 with SMTP id
 h12-20020ac8584c000000b002ddaaa67865mr38899qth.330.1646418626911; Fri, 04 Mar
 2022 10:30:26 -0800 (PST)
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
In-Reply-To: 
 <CAMKF1sptk+EwYhQ9Ri5oh8oSh4T-x8Ox1j1wiLhs09WoDOVkOA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 10:30:01 -0800
Message-ID: 
 <CAMKF1spRNTUgpzQKG1QsUpmru33xq+0+2iN2866g27DUtU9Nvg@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Mar 2022 18:30:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95792

We have all recipes building now ( few with some warnings ) which
should get better with setuptools_legacy changes

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1482

Sincere gratitude to all those who stepped up in time and helped patching.

On Thu, Mar 3, 2022 at 2:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Mar 3, 2022 at 2:00 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > I've been having an interesting discussion with the PyPA about the
> > future of packaging Python.  It's illuminating, to say the least.  The
> > full thread is at
> > https://github.com/pypa/packaging-problems/issues/576 but the
> > highlights are:
> >
> > 1) Calling 'setup.py install' is deprecated, so anything which uses a
> > non-standard install class (ufw, for example) won't work in the
> > future.  With setuptool3.bbclass now doing bdist_wheel/pip the install
> > task is ran in a special environment, and non-standard install classes
> > break quite badly.
> >
>
> right, I was coming to same conclusion, as I was messing to get
> unattended-upgrades
> working with new world. I did realize the fact that we did not give any t=
ime
> to port recipes and has made this a breaking change.
>
> > 2) Python packaging is moving fast towards a world where the only
> > things packagable are pure modules with entry point scripts and data.
> > If you want to do more (e.g. install a systemd unit file), then use
> > something like Meson.
>
> I see, that limits the use from distro packaging point of view.
>
> >
> > This is going to be interesting.  My short-term plan is to bring back
> > the traditional setuptool3.bbclass code as setuptools3-legacy, for the
> > period between now and when "setup.py install" doesn't exist.
>
> yeah I think we need that. that will be an improvement.
>
> >
> > Ross
> >
> > On Thu, 3 Mar 2022 at 07:08, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> Here is latest failures we are down to 3
> > > >>
> > > >> https://errors.yoctoproject.org/Errors/Build/142145/
> > > >
> > > >
> > > > I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99t =
solve the problem.
> > > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3D=
timo/pyprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
> > > >
> > >
> > > I have addressed it. Right now we are effectively left with
> > >
> > > meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unatte=
nded-upgrades_2.6.bb
> > >
> > > It fails in weird ways
> > >
> > > | Installing collected packages: unattended-upgrades
> > > | ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme key us=
ed in
> > > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-upgra=
des/2.6-r0/git/dist/unattended_upgrades-0.1-py3-
> > > none-any.whl: etc (for file
> > > 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgrad=
es').
> > > .data directory contents should be in subdirectories named with a
> > > valid scheme key (d
> > > ata, headers, platlib, purelib, scripts)
> > > | Exception information:
> > > | Traceback (most recent call last):
> > > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unatte=
nded-upgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages=
/pip/_internal/operations/install/wheel.py",
> > > line 521, in make_data_scheme_file
> > > |     scheme_path =3D scheme_paths[scheme_key]
> > > | KeyError: 'etc'
> > > |
> > > | During handling of the above exception, another exception occurred:
> > > |
> > >
> > > >>
> > > >> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > >> >
> > > >> > Here is latest list which is significantly less so thanks for
> > > >> > contributions thus far.
> > > >> >
> > > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/p=
ython3-blivetgui_2.2.1.bb
> > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
aws-iot-device-sdk-python_1.4.9.bb
> > > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/p=
ython3-blivet_3.4.3.bb
> > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
slip-dbus_0.6.5.bb
> > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
keras-applications_1.0.8.bb
> > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
pymetno_0.9.0.bb
> > > >> >   meta-openembedded/meta-python/recipes-extended/python-cson/pyt=
hon3-cson_git.bb
> > > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-=
dbussy_1.3.bb
> > > >> >   meta-openembedded/meta-python/recipes-connectivity/python-txws=
/python3-txws_0.9.1.bb
> > > >> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades=
/unattended-upgrades_2.6.bb
> > > >> >
> > > >> >
> > > >> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wro=
te:
> > > >> > >
> > > >> > > We are making some progress. This is the latest ( 24 build fai=
lures )
> > > >> > > as of last night.
> > > >> > >
> > > >> > > https://errors.yoctoproject.org/Errors/Build/142052/
> > > >> > >
> > > >> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> =
wrote:
> > > >> > > >
> > > >> > > > Thanks for sending fixing everyone. Lets keep going. Here is=
 latest
> > > >> > > > list of failing recipes on master-next now
> > > >> > > >
> > > >> > > > Summary: 32 tasks failed:
> > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-bliv=
et/python3-blivet_3.4.0.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-crcmod_1.7.bb:do_compile
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-lrparsing_1.0.17.bb:do_compile
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-slip-dbus_0.6.5.bb:do_compile
> > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-bliv=
et/python3-blivetgui_2.2.1.bb:do_compile
> > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git=
.bb:do_compile
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-flask-versioned_0.9.4-20101221.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-ntplib_0.4.0.bb:do_install
> > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-=
circuitpython-register_1.9.4.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-behave_1.2.6.bb:do_install
> > > >> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pystache_0.5.4.bb:do_install
> > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-=
pureio_1.1.8.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pyscaffold_4.1.4.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-prctl_1.8.1.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pymetno_0.9.0.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-extended/python-cson=
/python3-cson_git.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pydbus-manager_git.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-pymisp_2.4.152.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-dbussy_1.3.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git=
.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-keras-applications_1.0.8.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-gcovr_5.0.bb:do_install
> > > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-=
platformdetect_3.1.1.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-configshell-fb_1.1.29.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/pyth=
on3-xmodem_0.4.6.bb:do_package
> > > >> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgr=
ades/unattended-upgrades_2.6.bb:do_install
> > > >> > > >   meta-openembedded/meta-python/recipes-connectivity/python-=
txws/python3-txws_0.9.1.bb:do_install
> > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4=
.16.3.bb:do_compile
> > > >> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulib=
re_2.2.3.bb:do_install
> > > >> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/onboa=
rd_1.4.1.bb:do_compile
> > > >> > > >
> > > >> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.co=
m> wrote:
> > > >> > > > >
> > > >> > > > > Hello All,
> > > >> > > > >
> > > >> > > > > We have PEP-517 packaging related infra changes merged int=
o oe-core,
> > > >> > > > > which obviously
> > > >> > > > > mean there are some failures on various python packages.
> > > >> > > > >
> > > >> > > > > I am posting the latest results (qemux86-64/glibc)
> > > >> > > > >
> > > >> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > > >> > > > >
> > > >> > > > > We have 57 recipes left, Tim has worked diligently on fixi=
ng the
> > > >> > > > > PEP-517 issues but we would
> > > >> > > > > need more hands. If you see any of
> > > >> > > > > these recipes that you can help fixing, please send patche=
s
> > > >> > > > >
> > > >> > > > > Since upcoming release is an LTS release, I would like to =
have these
> > > >> > > > > issues fixed for this
> > > >> > > > > release.
> > > >> > > > >
> > > >> > > > > Thank you for your help
> > > >> > > > >
> > > >> > > > > -Khem
> > > >>
> > > >>
> > > >>
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#95730): https://lists.openembedded.org/g/openembe=
dded-devel/message/95730
> > > Mute This Topic: https://lists.openembedded.org/mt/89416561/1676615
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [ross@burtonini.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

