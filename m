Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.16531.1604948135677844020
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rg/D/3rG;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id m65so6737742qte.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 10:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gl/Uj81SLkKSlNYVY/OcntXZYCiEZQ/f3J9eXqVmYU0=;
        b=rg/D/3rGT5zJICCFpB38FvmIFgWowOpaFcEJcUdwp9urnVkfre65WkjYBa6tIH1jQ6
         wzhjef0X6QeiG756qyxztD3IaI/fqMWGEraXRkfv9jlnqxPYrO9Z18cKQ5ohkhNDv+U7
         XosYzrDPiUvZlzydmQpG4eO0tSog/V9NAmD1VRN9JEc8nQMqCJ27PJZDL2YtvAK90Y+Z
         h8hTnwZBMpliMpGK/gR5u/Mg75dR7NgIioKiX+Q596N3/XWCuTSDSF9+cgk0Pc+E34yp
         gh61j6EZwSmqXEtKdNKuyM1N/L43zH3EDQWWkbsktfzKfenLXvzV3Lr2Msg8AW3f2W0q
         tIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gl/Uj81SLkKSlNYVY/OcntXZYCiEZQ/f3J9eXqVmYU0=;
        b=ISQXJJYStlXPVNJvE2aEH1whQ+TeeuLhOpizY9Ntc9Jshcx9NgLuzGcC/KQsTTvhGy
         CyG34Zxtpn6sbwnydk4OULn1qAdrwbTmrvM8713qtVVUk9sSU8cR9SXHHQ6jtjDUnpyJ
         MLQ7VGrUJqpVb5Xgy2saO8iwDqkuGphcniz3mxpT2Mdc7zunK1hsd3ILoskPbC3z6QAu
         uWv6winmZr03v3pHy4D/cbse5/5MNXyu90mJyHAlzxhRdSGHMn1lC13aGyU1PvS4Ew9Y
         W65wbVtHNw7XYo0mGmXle2KWdyuxb0YM/Aqr7tmfn0ZeNvqXfrb8X/pBHnmbqLzLXqJX
         CAnw==
X-Gm-Message-State: AOAM531nwuymviV8ql8dXjpbKfWxs4PRZpC4eQaj+EbrnP1MjOqt7Hbf
	AGZG7i+Pd8RZtXK56IwcsPY0eJwHtrmakxc99h0SXjsGOZs=
X-Google-Smtp-Source: ABdhPJxW5sG2xyWcSt7tBqDm5wTO0MY4QqigWSehqh6xGylkIxoYqpyHgBDn/pziWmuxGQVLzTnmcAiGeCmIpO+IBxo=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr14713801qte.88.1604948134754;
 Mon, 09 Nov 2020 10:55:34 -0800 (PST)
MIME-Version: 1.0
References: <16417565E85E3454.9771@lists.openembedded.org> <6rsg9j6m6z.fsf@pengutronix.de>
In-Reply-To: <6rsg9j6m6z.fsf@pengutronix.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 10:55:08 -0800
Message-ID: <CAMKF1sqVaWSCOD-gf+AcPLWXkGikWQ1bO0=iJixorsGJbrOdMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] usb-modeswitch, usb-modeswitch-data: fix usrmerge
To: "Ulrich ?lmann" <u.oelmann@pengutronix.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It already in master,

Armin, we need this for dunfell/gatesgarth as well.

On Sun, Nov 8, 2020 at 11:09 PM Ulrich ?lmann <u.oelmann@pengutronix.de> w=
rote:
>
> Gentle ping!
>
> On Mon, Oct 26 2020 at 07:00 +0100, Ulrich ?lmann <u.oelmann@pengutronix=
.de> wrote:
> > Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 50a487fc0b0123b154db73f79bbb18b23eb234f0)
> > Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> > ---
> >  .../usb-modeswitch/usb-modeswitch-data_20191128.bb            | 4 ++-=
-
> >  .../recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb    | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-dat=
a_20191128.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_=
20191128.bb
> > index 938c0f9c26bd..ca970e59bb3a 100644
> > --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191=
128.bb
> > +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20191=
128.bb
> > @@ -11,9 +11,9 @@ SRC_URI[md5sum] =3D "e8fce7eb949cbe16c61fb71bade4cc1=
7"
> >  SRC_URI[sha256sum] =3D "3f039b60791c21c7cb15c7986cac89650f076dc274798=
fa242231b910785eaf9"
> >
> >  do_install() {
> > -    oe_runmake install DESTDIR=3D${D}
> > +    oe_runmake install DESTDIR=3D${D} RULESDIR=3D${D}/${nonarch_base_=
libdir}/udev/rules.d
> >  }
> >
> >  RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.4.0)"
> > -FILES_${PN} +=3D "${base_libdir}/udev/rules.d/ \
> > +FILES_${PN} +=3D "${nonarch_base_libdir}/udev/rules.d/ \
> >                  ${datadir}/usb_modeswitch"
> > diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6=
.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> > index baad340908ac..6a5287af4959 100644
> > --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> > +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.0.bb
> > @@ -19,7 +19,7 @@ RDEPENDS_${PN} =3D "tcl"
> >  RRECOMMENDS_${PN} =3D "usb-modeswitch-data"
> >
> >  do_install() {
> > -    oe_runmake DESTDIR=3D${D} install
> > +    oe_runmake DESTDIR=3D${D} UDEVDIR=3D${D}/${nonarch_base_libdir}/u=
dev install
> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)}; then
> >          install -d ${D}/${systemd_unitdir}/system
> >          install -m 644 ${S}/usb_modeswitch@.service ${D}/${systemd_un=
itdir}/system
> --
> Pengutronix e.K.                           | Ulrich =C3=96lmann         =
      |
> Industrial Linux Solutions                 | http://www.pengutronix.de/ =
 |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0   =
 |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555=
 |
>
>=20
>
