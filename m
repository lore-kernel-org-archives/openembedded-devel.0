Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16951CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 17:52:20 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.20812.1758736330787136317
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 10:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mstXHWPz;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74526ca79c2so33449a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758736330; x=1759341130; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G77xleC2Z1o9zrlwnHW/0NZQuItLDIh6AvrkNnHpRvU=;
        b=mstXHWPz3CRse5S0aD75TRv8oGEQ3CsathbWE4Q4/frSQPcq9PI9gpB5RI5Ba/vNgv
         +oZCzsqM0n24XzeJB5kEI6HatmBJIvgkyoVLWmguGQLkJqs6NfrVjqVfrs5kvrlAVFZE
         IhQksQZaVlH8ibtUe7TMBiZOVdzo+Vj//+5jt7AB0irS7Abs1VVQLzAjgjMMlKIpod8x
         sfWZ7sJk54VP0IAKPVItlBIJxFQt1wuBYbkVXrulyWK8feh5lWtrIhIfMxU3MJGzKBm6
         NSH/cIkho3W+roZ7X9cZwtEuAIZadcSw47uPRAxXOcETAHiOgpxa2bom1wRQZ47CcHKP
         poBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758736330; x=1759341130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G77xleC2Z1o9zrlwnHW/0NZQuItLDIh6AvrkNnHpRvU=;
        b=Jnw4iwQ/UxYm2HzsqCnEu88h1/0VD4hpNh7sUby8NFjyupgkgneNV3pZmrwuKLbAL6
         oA/1ZSZ9GlaL5ad8E6Nx4kVYltHOwfZdN9TUSYHZ4ZtCV5+5U1L1VfNbsykEZaERzisS
         mDb+PF6s2pP3QwUSBC5XO5w49YOiFjhUvJH27mL1B4MvSICH5QQjJvWIH8ejI5EWf4it
         y84uqy1847AW5max+FvUyb/Qe4O01EBpwbIB2qpR3284ooNhw8d6ae+cj7/1GYU3KYKe
         QKeKR8jbQsz7tOkY/Hyq0JfQpfuH0p7WSafPar+9QpcTh0N1abPlvFbBT1CHaUhP4Zbf
         Grrg==
X-Gm-Message-State: AOJu0YwU8Oti5MTj0OMWMtLHiAeukOekVeo/mJusgny+ZwI7kzJHUc0E
	C0hP1z0OjNgHSuyIShRlhNQ1RY0sOlph3JN4xoJODAHzm41QvbggXwFMmYBos7PbyNL5/f/t0yB
	a6+qTkErdmPhe05vlQmgfw7Dyba1/Alg=
X-Gm-Gg: ASbGncsQoWHwQpIqEAwNt9C0WgU6iQ6Y026ygcEULajkgzvrtmqO4sShky07qtdWY+d
	0C+Geof+l40X9Hebz381CPWIxHNWx/8u1tZ0OucYhMxzB+EHfp3QU40aojvJSzKpgp9ljENA/Du
	ZmUboZiORr6qajTvjYCZsaLW8K533tPBCmDNVgx3V70/F2Ju0FJUsfggQ5GCQhZ4VMrhNsNMHjT
	B8Bfx/qVg==
X-Google-Smtp-Source: AGHT+IHqnR6/vu4cXgpqP116jzfid55UP8+WGI3jUfXxsbB1LV/i0h2K+1cSwSiPkt6BkLa7N4YBJOl9onceMtG7YPE=
X-Received: by 2002:a05:6808:1487:b0:438:1f1b:dd22 with SMTP id
 5614622812f47-43f4cf30f83mr437602b6e.23.1758736329767; Wed, 24 Sep 2025
 10:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250924075643.2047506-1-ankur.tyagi85@gmail.com>
 <d09b1bc7-3c18-47f8-a7eb-3cc6e88b5bb1@windriver.com> <CADySD0EG7dt841cwvcbd5BLyBh39Yq81kn2XBRb_2qjkyJvaFA@mail.gmail.com>
 <1555c67c61416e1d242c8e79e48018be008cc0bf.camel@intel.com>
In-Reply-To: <1555c67c61416e1d242c8e79e48018be008cc0bf.camel@intel.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 25 Sep 2025 05:51:57 +1200
X-Gm-Features: AS18NWBfsU1zm3E6wCMBo9Of7-YYye17_neaAD9JC_wQv7-3-VZ5IYchhzCpZck
Message-ID: <CADySD0HRX57aQadbJyUVuDyu6tSwAs6MA0vgrutshk+5A=Mhyg@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 0/6] cherry-picks from master branch
To: anuj.mittal@intel.com
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 17:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119826

On Thu, Sep 25, 2025 at 12:37=E2=80=AFAM Anuj Mittal via
lists.openembedded.org <anuj.mittal=3Dintel.com@lists.openembedded.org>
wrote:
>
> On Wed, 2025-09-24 at 21:30 +1200, Ankur Tyagi via
> lists.openembedded.org wrote:
> > On Wed, Sep 24, 2025 at 8:02=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> =
wrote:
> > >
> > > There are a few major version upgrades in this series.
> > >
> >
> > Correct but I found no concern from the respective changelog.
> > But if you (and others) think it can cause any issue then please let
> > me know
> > and I'll do some more validation otherwise drop that patch.
>
> General guidelines and things to look out for:
>
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patc=
h_Acceptance_Policies
>

Thank you Anuj

>
> >
> > > Regards,
> > > Qi
> >
> > cheers
> > Ankur
> >
> > >
> > > On 9/24/25 15:56, Ankur Tyagi via lists.openembedded.org wrote:
> > > > Trying to keep recipes in the walnascar branch updated with
> > > > useful fixes
> > > > from the master branch.
> > > >
> > > > I intend to submit patch series for each sub-folder, this series
> > > > is for
> > > > the recipes inside "meta-oe/recipes-bsp".
> > > >
> > > > I have tried to carefully review the change logs and commit logs
> > > > while updating
> > > > recipe versions.
> > > >
> > > > Did basic validation by building against qemux86-64 and qemuarm64
> > > > machine targets.
> > > >
> > > > Changqing Li (1):
> > > >    lsscsi: upgrade to version 0.32
> > > >
> > > > Gyorgy Sarvari (1):
> > > >    ledmon: upgrade 0.97 -> 1.1.0
> > > >
> > > > Mikko Rapeli (2):
> > > >    fwupd: update to 2.0.12
> > > >    fwupd-efi: update from 1.6 to 1.7
> > > >
> > > > Wang Mingyu (2):
> > > >    bolt: upgrade 0.9.6 -> 0.9.10
> > > >    flashrom: upgrade 1.5.1 -> 1.6.0
> > > >
> > > >   .../bolt/{bolt_0.9.6.bb =3D> bolt_0.9.10.bb}    |   2 +-
> > > >   ...-meson-Add-options-pciutils-ftdi-usb.patch |  17 ++-
> > > >   .../{flashrom_1.5.1.bb =3D> flashrom_1.6.0.bb}  |   2 +-
> > > >   ..._binary.py-Use-env-to-detect-python3.patch |  23 ---
> > > >   .../{fwupd-efi_1.6.bb =3D> fwupd-efi_1.7.bb}    |   5 +-
> > > >   ...certs.py-use-usr-bin-env-for-python3.patch |  28 ++++
> > > >   ...-reduce-lzma-compression-level-from-.patch |  47 ++++++
> > > >   meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb     | 134 -----------
> > > > -------
> > > >   meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb     |  93
> > > > ++++++++++++
> > > >   .../ledmon/0001-fix-build-with-clang.patch    |  90 -----------
> > > > -
> > > >   ...nclude-sys-select.h-and-sys-types.h.patch} |  27 ++--
> > > >   .../{ledmon_0.97.bb =3D> ledmon_1.1.0.bb}       |  10 +-
> > > >   .../lsscsi/{lsscsi_030.bb =3D> lsscsi_0.32.bb}  |   6 +-
> > > >   13 files changed, 197 insertions(+), 287 deletions(-)
> > > >   rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb =3D>
> > > > bolt_0.9.10.bb} (92%)
> > > >   rename meta-oe/recipes-bsp/flashrom/{flashrom_1.5.1.bb =3D>
> > > > flashrom_1.6.0.bb} (89%)
> > > >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/0001-
> > > > efi-generate_binary.py-Use-env-to-detect-python3.patch
> > > >   rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.6.bb =3D> fwupd-
> > > > efi_1.7.bb} (90%)
> > > >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-build-
> > > > certs.py-use-usr-bin-env-for-python3.patch
> > > >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd/0001-fu-
> > > > lzma-common.c-reduce-lzma-compression-level-from-.patch
> > > >   delete mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
> > > >   create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
> > > >   delete mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-fix-
> > > > build-with-clang.patch
> > > >   rename meta-oe/recipes-bsp/ledmon/ledmon/{0002-include-sys-
> > > > select.h-and-sys-types.h.patch =3D> 0001-include-sys-select.h-and-
> > > > sys-types.h.patch} (56%)
> > > >   rename meta-oe/recipes-bsp/ledmon/{ledmon_0.97.bb =3D>
> > > > ledmon_1.1.0.bb} (79%)
> > > >   rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb =3D>
> > > > lsscsi_0.32.bb} (63%)
> > > >
> > > >
> > > >
> > > >
> > >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119824): https://lists.openembedded.org/g/openembedde=
d-devel/message/119824
> Mute This Topic: https://lists.openembedded.org/mt/115408371/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

