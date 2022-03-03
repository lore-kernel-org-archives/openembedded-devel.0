Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9981CC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:13:17 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.376.1646345596130368243
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=euES74/P;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id jv12so5243987qvb.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9pszYTPWuQiNvjaCgZmMp+XXswkx1C2by+lE7SdRCFE=;
        b=euES74/PIe64BUkCoin/oxnTwC2M6O7uBR/1losIxpYJPrIMjB5M/vH/wrs1KbFVPp
         OrPJuSNd0WPyZaszpym4yiWJ2smWdYEyOy9V4KSElm/9hvWmfE1ogCAOQq8oYpKOBgQ6
         5Hi8U9poRlI3NbluKaOiG9ndcUrmzk2Lii+QZbomQ4qMMO1hm95jji6ohyVeDYvOArK9
         47Vqoe8GAXcPAEQlXXAO/vgjGOZsFhFswLy8VTIKR7UD/ZVjZVwUAPjHV7LJB5RN/hBG
         aDaSfwZt6IpWav1VoWweuT+Qqphzfr2b+kXHe3ZdliQtK44mD9NF0WLlhDYb4hQAp+61
         Tlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9pszYTPWuQiNvjaCgZmMp+XXswkx1C2by+lE7SdRCFE=;
        b=GWmHzRPgl4CB4QX4CJHx6jA31swq60c23Yh45W/q94Spi8x1a/PzviAB0RGNOqbJXZ
         5BMo1Ckiz2G+Og2Oe+Fg5ClvQ6TN9llrOoExpKMbXHAZlmqM9mh5BZCTbo/MNjjNW5R1
         6KS4z45MyGAr1GX4BFnKa4U64Ushv8Txw8/6buHMVqsQYkjp5mVwAqISyYjS34SZt3pU
         M0VpMXzjLQNLkAiubPk5K88btgM8uDSA5SF8WHdPOJuRY6Ky7U28wSggDEHPudERswqq
         2fX6lbzDyRKPpll0fdGOkglAmcPKLFTyxDTOhcfE9KfzNfzqFDt0pEXHW1i7/jkmllII
         PQ9A==
X-Gm-Message-State: AOAM533TcC0JV5cKP+bfobBjc95gYVRyuucCWg/ifBPgsQUZrpaNypPc
	efZIgnsq7ALhZmPkMQkEUKLotHj4wPRp3iQWxw3zWGF/Jtivyg==
X-Google-Smtp-Source: 
 ABdhPJx9Su6x7HxFqCWETnhXgL/hOTQpImrP3mo0cx4DdPHMD270gaomMfaQEB6r+BbOSqtE3cdYCxIpjM7/skYdOYo=
X-Received: by 2002:ad4:596b:0:b0:434:ea08:d2ee with SMTP id
 eq11-20020ad4596b000000b00434ea08d2eemr11660071qvb.24.1646345595053; Thu, 03
 Mar 2022 14:13:15 -0800 (PST)
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
In-Reply-To: 
 <CAAnfSTvjPeyJHjd-FiYoXmxPMaXM0AH9KMXm6n5ooJNfQp80Sw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2022 14:12:49 -0800
Message-ID: 
 <CAMKF1sptk+EwYhQ9Ri5oh8oSh4T-x8Ox1j1wiLhs09WoDOVkOA@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Ross Burton <ross@burtonini.com>
Cc: Tim Orling <ticotimo@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 22:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95764

On Thu, Mar 3, 2022 at 2:00 PM Ross Burton <ross@burtonini.com> wrote:
>
> I've been having an interesting discussion with the PyPA about the
> future of packaging Python.  It's illuminating, to say the least.  The
> full thread is at
> https://github.com/pypa/packaging-problems/issues/576 but the
> highlights are:
>
> 1) Calling 'setup.py install' is deprecated, so anything which uses a
> non-standard install class (ufw, for example) won't work in the
> future.  With setuptool3.bbclass now doing bdist_wheel/pip the install
> task is ran in a special environment, and non-standard install classes
> break quite badly.
>

right, I was coming to same conclusion, as I was messing to get
unattended-upgrades
working with new world. I did realize the fact that we did not give any tim=
e
to port recipes and has made this a breaking change.

> 2) Python packaging is moving fast towards a world where the only
> things packagable are pure modules with entry point scripts and data.
> If you want to do more (e.g. install a systemd unit file), then use
> something like Meson.

I see, that limits the use from distro packaging point of view.

>
> This is going to be interesting.  My short-term plan is to bring back
> the traditional setuptool3.bbclass code as setuptools3-legacy, for the
> period between now and when "setup.py install" doesn't exist.

yeah I think we need that. that will be an improvement.

>
> Ross
>
> On Thu, 3 Mar 2022 at 07:08, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrote:
> > >
> > >
> > >
> > > On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >>
> > >> Here is latest failures we are down to 3
> > >>
> > >> https://errors.yoctoproject.org/Errors/Build/142145/
> > >
> > >
> > > I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99t so=
lve the problem.
> > > https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dti=
mo/pyprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
> > >
> >
> > I have addressed it. Right now we are effectively left with
> >
> > meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattend=
ed-upgrades_2.6.bb
> >
> > It fails in weird ways
> >
> > | Installing collected packages: unattended-upgrades
> > | ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme key used=
 in
> > /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-upgrade=
s/2.6-r0/git/dist/unattended_upgrades-0.1-py3-
> > none-any.whl: etc (for file
> > 'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgrades=
').
> > .data directory contents should be in subdirectories named with a
> > valid scheme key (d
> > ata, headers, platlib, purelib, scripts)
> > | Exception information:
> > | Traceback (most recent call last):
> > |   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattend=
ed-upgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/p=
ip/_internal/operations/install/wheel.py",
> > line 521, in make_data_scheme_file
> > |     scheme_path =3D scheme_paths[scheme_key]
> > | KeyError: 'etc'
> > |
> > | During handling of the above exception, another exception occurred:
> > |
> >
> > >>
> > >> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >> >
> > >> > Here is latest list which is significantly less so thanks for
> > >> > contributions thus far.
> > >> >
> > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/pyt=
hon3-blivetgui_2.2.1.bb
> > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-aw=
s-iot-device-sdk-python_1.4.9.bb
> > >> >   meta-openembedded/meta-python/recipes-extended/python-blivet/pyt=
hon3-blivet_3.4.3.bb
> > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-sl=
ip-dbus_0.6.5.bb
> > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-ke=
ras-applications_1.0.8.bb
> > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
metno_0.9.0.bb
> > >> >   meta-openembedded/meta-python/recipes-extended/python-cson/pytho=
n3-cson_git.bb
> > >> >   meta-openembedded/meta-python/recipes-devtools/python/python3-db=
ussy_1.3.bb
> > >> >   meta-openembedded/meta-python/recipes-connectivity/python-txws/p=
ython3-txws_0.9.1.bb
> > >> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/u=
nattended-upgrades_2.6.bb
> > >> >
> > >> >
> > >> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote=
:
> > >> > >
> > >> > > We are making some progress. This is the latest ( 24 build failu=
res )
> > >> > > as of last night.
> > >> > >
> > >> > > https://errors.yoctoproject.org/Errors/Build/142052/
> > >> > >
> > >> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >> > > >
> > >> > > > Thanks for sending fixing everyone. Lets keep going. Here is l=
atest
> > >> > > > list of failing recipes on master-next now
> > >> > > >
> > >> > > > Summary: 32 tasks failed:
> > >> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet=
/python3-blivet_3.4.0.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-aws-iot-device-sdk-python_1.4.9.bb:do_compile
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-crcmod_1.7.bb:do_compile
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-lrparsing_1.0.17.bb:do_compile
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-slip-dbus_0.6.5.bb:do_compile
> > >> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet=
/python3-blivetgui_2.2.1.bb:do_compile
> > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.b=
b:do_compile
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-flask-versioned_0.9.4-20101221.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-ntplib_0.4.0.bb:do_install
> > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-ci=
rcuitpython-register_1.9.4.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-behave_1.2.6.bb:do_install
> > >> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pystache_0.5.4.bb:do_install
> > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pu=
reio_1.1.8.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pyscaffold_4.1.4.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-prctl_1.8.1.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pymetno_0.9.0.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-extended/python-cson/p=
ython3-cson_git.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pydbus-manager_git.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-pymisp_2.4.152.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-dbussy_1.3.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.b=
b:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-keras-applications_1.0.8.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-gcovr_5.0.bb:do_install
> > >> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pl=
atformdetect_3.1.1.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-configshell-fb_1.1.29.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-devtools/python/python=
3-xmodem_0.4.6.bb:do_package
> > >> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrad=
es/unattended-upgrades_2.6.bb:do_install
> > >> > > >   meta-openembedded/meta-python/recipes-connectivity/python-tx=
ws/python3-txws_0.9.1.bb:do_install
> > >> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.1=
6.3.bb:do_compile
> > >> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre=
_2.2.3.bb:do_install
> > >> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/onboard=
_1.4.1.bb:do_compile
> > >> > > >
> > >> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > >> > > > >
> > >> > > > > Hello All,
> > >> > > > >
> > >> > > > > We have PEP-517 packaging related infra changes merged into =
oe-core,
> > >> > > > > which obviously
> > >> > > > > mean there are some failures on various python packages.
> > >> > > > >
> > >> > > > > I am posting the latest results (qemux86-64/glibc)
> > >> > > > >
> > >> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
> > >> > > > >
> > >> > > > > We have 57 recipes left, Tim has worked diligently on fixing=
 the
> > >> > > > > PEP-517 issues but we would
> > >> > > > > need more hands. If you see any of
> > >> > > > > these recipes that you can help fixing, please send patches
> > >> > > > >
> > >> > > > > Since upcoming release is an LTS release, I would like to ha=
ve these
> > >> > > > > issues fixed for this
> > >> > > > > release.
> > >> > > > >
> > >> > > > > Thank you for your help
> > >> > > > >
> > >> > > > > -Khem
> > >>
> > >>
> > >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#95730): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95730
> > Mute This Topic: https://lists.openembedded.org/mt/89416561/1676615
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ross@burtonini.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

