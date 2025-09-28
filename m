Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC120CAC5B0
	for <webhook@archiver.kernel.org>; Sun, 28 Sep 2025 01:00:22 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.24263.1759021213558881073
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 18:00:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPmDQb2X;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7a76561c291so2061586a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 18:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759021213; x=1759626013; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVRBHReWxVStDNbu8YoQ5hX9ObxUf7F/A6AFsO7yyQw=;
        b=QPmDQb2XnLtkjuiJgck8ekRpKvVhbd7RQR1bWHH4+WwnIb57SZibeZ9rRgDoH6TyPO
         uxOEHWkfkVE6v0bjkI933WufXZirgh/26u0DOntpy4hD2x/KU9tIj+wItaBZBkti58il
         A8ylUWLyMHgMemE2Up3wNdFkTpqHyxuyCA9xlX1VoY6mBjGtbbi/bnSyLwtBQvqP7yPO
         dX2YJHXUbm2t5yHO7hM0KTlYrSMCC/udfeD8WBOP1FFEGCNzQCXvMk1g/cr5lrzL2TcQ
         ETLB8GIBuj2ryf4d/CzH3aYnIy3a6JernoHlDQbJmVKaw/FwJ5M8rAdHEyWUBAngsdX4
         b3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759021213; x=1759626013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVRBHReWxVStDNbu8YoQ5hX9ObxUf7F/A6AFsO7yyQw=;
        b=Fo2I7pdEwVSIdKQZC87QCyU/79m7RSP4V0JYy2X3CldFtVwsPIkJJhsCVm2bFSEaRi
         /QiXnglYwwvyZujOGzGJGMe7cyw++FD3/1KJvc8Faj1iw3WOIv+WHuT6cuN/YjaMocPr
         ZrPumPyMnQw+lpP2jRBxraQ3e/CBZQoqoJLmWU4wZraeH/wOhlzb7wVQ5hy+dRl1Lxp3
         CyOkY+aD4O4HMz/Od/EJjtDLnhVjSVPU2IOs9EDoh6G1hISbrxQHSfkSZtA6pjUe3oYR
         dPwtGeR2OR5ugFWzokKNhmWWyxLRdHgaPUB8VJfAq06zMmLVKiO4A2GNacBl3UucwH1Q
         dQtQ==
X-Gm-Message-State: AOJu0YzEioqq7TuphO4EoXiVzPJZOFXMWdFFoyMcsGXMHqxX38m8gy/v
	mh8rSe7LQctjY4arVy6VIzlL6HowIq5uel3WQf1FQDHOhjKTIZhRS5rJX64r2Q5kWnM0WwT+6DU
	ON6sw3g29qLD3cMYg2Q3+bBrWQ3TzZo8=
X-Gm-Gg: ASbGncs3t5ae6VYQTbSD+zU0wfGF0lCXOnhpFgYvDZKazmKVTHB+uEsOduUmDDDPkQo
	yewtcw8rK65Ii8JJNk1PW4K9kh9r//2ZNZ81oh/tWIPJ3zp7I++7qrhuAttbaeIxaJ4SRq8XhEt
	opuZTQGjhwg881U1QRehcTxE+CXhWjhT79BzDT/vLAAhOsX9dR5qhj+l1XQ41ADH8lmtYQD0dP7
	IRLWsh/
X-Google-Smtp-Source: AGHT+IHXoEOHEWnmIPDLKefQJ4mRvfp4wGOtTnP6Sd+b318PbAmoYlBmbIDPXiWsCr76LpiqA5F6zLjuVkTH8hkpU84=
X-Received: by 2002:a05:6808:f88:b0:439:b9b4:2d77 with SMTP id
 5614622812f47-43f4ce618camr5589223b6e.34.1759021212626; Sat, 27 Sep 2025
 18:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com> <b882b222-eeaa-4f10-997a-2d281f09e4d6@gmail.com>
In-Reply-To: <b882b222-eeaa-4f10-997a-2d281f09e4d6@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 28 Sep 2025 14:00:00 +1300
X-Gm-Features: AS18NWDBCcct73f8gSbUYPrpxlHP4pJnlL8xggk99nMwJThs4-9PWl5jA-YO3bI
Message-ID: <CADySD0EppQKCAP-m2d2Wq838c-rqCpSca6JzzfnHMAwkqj3okw@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 00/21] Trying to keep recipes in
 the walnascar branch updated with useful fixes from the master branch.
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 01:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119996

On Sun, Sep 28, 2025 at 6:53=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> I have notes about two patches:
>
> 02/21: I wouldn't change defconfig in a stable branch.

The base version of hostapd is unchanged and I thought these defconfig
changes will be a good improvement.
But understand this is a change in behavior.

If we decide to keep this change then I will also include the
following as well in v2 otherwise drop it.
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-conne=
ctivity/hostapd?id=3Dc9922073e4fab54b5b743947b68bda75dc72b064

> 17/21: Despite the semver-like versioning, this looks like a full
> fledged feature release, with over a 1.3k commits and a long list of new
> features and changes.
>

It was not intended to be included, I need to fix my workflow. Sorry for th=
at.

> Otherwise I plan to test the rest (assuming no other objections arise),
> thanks a lot.
>

Thanks for the review, I have another batch ready but will wait for
this batch to be validated first.

> On 9/27/25 08:31, Ankur Tyagi via lists.openembedded.org wrote:
> > I have tried to carefully review the change logs and commit logs while =
updating
> > recipe versions.
> >
> > Did basic validation by building against qemux86-64 and qemuarm64
> > machine targets.
> >
> > Ankur Tyagi (1):
> >   lsscsi: fix versioning
> >
> > Changqing Li (1):
> >   pahole: fix a Segmentation fault error
> >
> > Jason Schonberg (1):
> >   Remove the use of http://ftp.gnome.org/pub/gnome
> >
> > Jeroen Hofstee (1):
> >   php: ignore CVE-2024-3566
> >
> > Khem Raj (2):
> >   tomlplusplus: Fix test failures with clang/libcxx
> >   safec: Pass Qunused-arguments when using clang
> >
> > Leon Anavi (1):
> >   ssd1306: Update to newer version
> >
> > Miaoqing Pan (1):
> >   hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support
> >
> > Nitin Wankhade (1):
> >   iperf3: Fix CVE-2025-54350
> >
> > Peace Lee (1):
> >   guider: Upgrade 3.9.8 -> 3.9.9
> >
> > Peter Kjellerstedt (1):
> >   hostapd: Backport a patch to build SAE-PK correctly
> >
> > Wang Mingyu (9):
> >   gensio: upgrade 2.8.7 -> 2.8.15
> >   libimobiledevice-glue: upgrade 1.3.1 -> 1.3.2
> >   ser2net: upgrade 4.6.4 -> 4.6.5
> >   mm-common: upgrade 1.0.6 -> 1.0.7
> >   valijson: upgrade 1.0.4 -> 1.0.5
> >   valijson: upgrade 1.0.5 -> 1.0.6
> >   tk: upgrade 9.0.1 -> 9.0.2
> >   sexpect: upgrade 2.3.14 -> 2.3.15
> >   iptraf-ng: upgrade 1.2.1 -> 1.2.2
> >
> > Yi Zhao (1):
> >   tk8: upgrade 8.6.15 -> 8.6.17
> >
> >  .../iperf3/iperf3/CVE-2025-54350.patch        | 24 +++++++++
> >  .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  3 +-
> >  meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb      |  2 +
> >  .../{gensio_2.8.7.bb =3D> gensio_2.8.15.bb}     |  4 +-
> >  ...e64-for-hostapd-CONFIG_SAE_PK-builds.patch | 40 ++++++++++++++
> >  .../hostapd/hostapd/defconfig                 | 28 ++++++++++
> >  .../hostapd/hostapd_2.11.bb                   |  1 +
> >  ....3.1.bb =3D> libimobiledevice-glue_1.3.2.bb} |  2 +-
> >  .../{ser2net_4.6.4.bb =3D> ser2net_4.6.5.bb}    |  2 +-
> >  .../libsigc++-2.0/libsigc++-2.0_2.12.1.bb     |  2 +-
> >  .../libsigc++-2.0/libsigc++-3_3.6.0.bb        |  2 +-
> >  ...{mm-common_1.0.6.bb =3D> mm-common_1.0.7.bb} |  4 +-
> >  .../proxy-libintl/proxy-libintl_20100902.bb   |  4 +-
> >  meta-oe/recipes-core/safec/safec_3.7.1.bb     |  3 ++
> >  .../recipes-devtools/glade/glade_3.36.0.bb    |  2 +-
> >  .../{guider_3.9.8.bb =3D> guider_3.9.9.bb}      |  8 +--
> >  ...{iptraf-ng_1.2.1.bb =3D> iptraf-ng_1.2.2.bb} |  4 +-
> >  ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
> >  .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
> >  meta-oe/recipes-devtools/php/php_8.4.10.bb    |  1 +
> >  .../{sexpect_2.3.14.bb =3D> sexpect_2.3.15.bb}  |  4 +-
> >  .../recipes-devtools/ssd1306/ssd1306_git.bb   |  2 +-
> >  .../tcltk/{tk8_8.6.15.bb =3D> tk8_8.6.17.bb}    |  2 +-
> >  .../tcltk/{tk_9.0.1.bb =3D> tk_9.0.2.bb}        |  2 +-
> >  .../tomlplusplus/tomlplusplus_git.bb          |  4 ++
> >  .../{valijson_1.0.4.bb =3D> valijson_1.0.6.bb}  |  4 +-
> >  .../gnome-themes/gnome-themes-extra_3.28.bb   |  2 +-
> >  meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  2 +-
> >  28 files changed, 187 insertions(+), 28 deletions(-)
> >  create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54=
350.patch
> >  rename meta-oe/recipes-connectivity/gensio/{gensio_2.8.7.bb =3D> gensi=
o_2.8.15.bb} (92%)
> >  create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/0001-I=
nclude-base64-for-hostapd-CONFIG_SAE_PK-builds.patch
> >  rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiled=
evice-glue_1.3.1.bb =3D> libimobiledevice-glue_1.3.2.bb} (89%)
> >  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.4.bb =3D> ser=
2net_4.6.5.bb} (91%)
> >  rename meta-oe/recipes-core/mm-common/{mm-common_1.0.6.bb =3D> mm-comm=
on_1.0.7.bb} (78%)
> >  rename meta-oe/recipes-devtools/guider/{guider_3.9.8.bb =3D> guider_3.=
9.9.bb} (75%)
> >  rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb =3D> iptraf=
-ng_1.2.2.bb} (89%)
> >  create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_enco=
der-Fix-elf_functions-cleanup-on-error.patch
> >  rename meta-oe/recipes-devtools/sexpect/{sexpect_2.3.14.bb =3D> sexpec=
t_2.3.15.bb} (82%)
> >  rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb =3D> tk8_8.6.17.b=
b} (97%)
> >  rename meta-oe/recipes-devtools/tcltk/{tk_9.0.1.bb =3D> tk_9.0.2.bb} (=
97%)
> >  rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb =3D> valij=
son_1.0.6.bb} (90%)
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119954): https://lists.openembedded.org/g/openembed=
ded-devel/message/119954
> > Mute This Topic: https://lists.openembedded.org/mt/115461658/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

