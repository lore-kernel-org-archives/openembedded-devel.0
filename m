Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6E4C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 07:06:30 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.12688.1713769582920446639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 00:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDaKIRdp;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34b3ef55a86so107715f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713769581; x=1714374381; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igvklns+kchq2kq3ZRcdCi2jdZ+BwfHn+AULJxjb49c=;
        b=lDaKIRdpYDchvgXlDhhNESEMK2qCq3sO338gLwCJA3AqARrokZa+FzWj1+9yW8rs9i
         gw2z9GHqGy7v6pqv1gGrvUWQXNgA1UiwVcduTMngZUirCB+YJWYDz0bnHJcy2gMIBydO
         PnAalUixvZUYEl418YrDcEPjJFG0mZhAZ+rND21BmjtJQ7yjf18mV4VRvyPdEcwN27N/
         OnCqBWyC5CN72CObyPIyrTbmVdz5M5ZizAYPy+ogoejhKKiXHR2zHMh59TEztqg80X3U
         Afa+9QvzeryClH2uRTvecD7U99pj5ja/dsiQkH2yHa7A8UURns6wsITvl9OANS7NiU3K
         uuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713769581; x=1714374381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igvklns+kchq2kq3ZRcdCi2jdZ+BwfHn+AULJxjb49c=;
        b=Q9puWqucN5+yJCIwguqo/Yzg8VZ+MX/HSKMtkmaBtBf+/qkf2EG9AUVyhyib2Cw47s
         /PtKEYGbhwXlZ0tGiO5ymxrwdm1PGjaAxgMeb39M9L8lD4RuMjFSAfVLHuelJcmzoaC0
         R8/kUF+Yp1cIeCcz4dJRiUzK8/3sa3eFUlf//c1Rc96mZsB3MFAQ9wtRzQqNOxzGErmQ
         OeheGqPzmA48fh6sHCfScEidcnKQFqjh7YCwfFv1v80T2DnZfPRm176F3MzL0dHizy8l
         AJEAQJ5IeI+b7RsvvO/hGYHyVFIoDpDXkAe36RG+Vyhnzeg5twAn8+iF4OVsf4VQn/yj
         n/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVsQ184o2uWN9eKDtd6z4k0Jy2z7HmQ0IRLPNfuGAEdu5ITXImenogDM7cXQs2eNHZDdU2XDGcYQsNrrtuSm57JeSDW3GRieTOI+tpHY1lpOKhIPj7+IV1iYg==
X-Gm-Message-State: AOJu0YyT+G4Yljpi9zCQ2b3qQIPE6xZArB6mcwnQljHX+1+x0iLZ8feQ
	lbJCNeq7PTqhghoz5RJKu0/ermY1HFH2itJ2+sr3ZxcSbeIlqpadu3s9by+5ZfrNulBMkEjUHMR
	0AoMdivoHN+qZAFsarJSlSfsYi7s=
X-Google-Smtp-Source: AGHT+IEXpPrP7BOuCbpYjhWYNr8xbNkoWuUXfQMbuQP+KPwe6OwHOACAO0JOctG4chcZ6bzHcPM50c+0bHfRr6emZZQ=
X-Received: by 2002:a05:6000:1212:b0:349:c76f:c737 with SMTP id
 e18-20020a056000121200b00349c76fc737mr5542644wrx.47.1713769581123; Mon, 22
 Apr 2024 00:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
 <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com> <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
 <17C885AD767F090E.10861@lists.openembedded.org>
In-Reply-To: <17C885AD767F090E.10861@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Apr 2024 09:06:08 +0200
Message-ID: <CA+chaQcSCyv_Yh8z7zQLMjB+AHL5CLzi5L5yviLddoYTkjBbcg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
To: martin.jansa@gmail.com
Cc: perceval.arenou@ptxtrimble.com, 
	OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>, 
	Perceval Arenou <perceval.arenou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 07:06:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110081

There is also:

ERROR: Nothing PROVIDES 'gtk+3' (but
meta-oe/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
DEPENDS on or otherwise requires it)
gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or
enable viewer PACKAGECONFIG only when wayland or x11 is in
DISTRO_FEATURES.

On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This is now triggering:
> ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1
> [obsolete-license]
>
> Looks like it should be LGPL-2.1-only, please send follow-up fix.
>
> On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via lists.openembedded.o=
rg
> <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
> >
> > From: Perceval Arenou <perceval.arenou@gmail.com>
> >
> >
> > ---
> >  .../aravis/aravis_0.8.31.bb                   | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis_0.=
8.31.bb
> >
> > diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb=
 b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> > new file mode 100644
> > index 000000000..52e276c7b
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> > @@ -0,0 +1,40 @@
> > +SUMMARY =3D "A vision library for genicam based cameras"
> > +DESCRIPTION =3D "\
> > +    Aravis is a glib/gobject based library for video acquisition using=
 Genicam cameras.\
> > +    It currently implements the gigabit ethernet and USB3 protocols us=
ed by industrial cameras.\
> > +    It also provides a basic ethernet camera simulator and a simple vi=
deo viewer.\
> > +"
> > +AUTHOR =3D "Emmanuel Pacaud"
> > +HOMEPAGE =3D "https://github.com/AravisProject/aravis"
> > +LICENSE =3D "LGPL-2.1"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36=
4516c"
> > +
> > +DEPENDS +=3D "\
> > +    glib-2.0 \
> > +    glib-2.0-native \
> > +    libxml2 \
> > +    zlib \
> > +"
> > +
> > +SRC_URI =3D "https://github.com/AravisProject/aravis/releases/download=
/${PV}/${BPN}-${PV}.tar.xz"
> > +SRC_URI[sha256sum] =3D "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca4=
3fa0212c4311a084da"
> > +
> > +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
> > +
> > +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> > +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> > +GIDOCGEN_MESON_OPTION =3D "documentation"
> > +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> > +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> > +
> > +inherit meson pkgconfig gi-docgen gobject-introspection
> > +
> > +PACKAGECONFIG ?=3D "gstreamer usb viewer"
> > +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Dd=
isabled, gstreamer1.0 gstreamer1.0-plugins-base,"
> > +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
> > +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gt=
k+3 gstreamer1.0-plugins-base,"
> > +
> > +FILES:${PN} +=3D "\
> > +    ${datadir} \
> > +    ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
> > +"
> > --
> > 2.43.0
> >
> >
> > On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@arm.co=
m> wrote:
> >>
> >> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org <perceva=
l.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
> >> > +# These options are found in AravisProject/aravis meson_options.txt
> >>
> >> No need to comment where they came from, this is the only place they c=
an be defined.
> >>
> >> > +EXTRA_OEMESON +=3D "\
> >> > +    -Ddocumentation=3Ddisabled \
> >>
> >> If would be good to use the gi-docgen class and respect the api-docume=
ntation DISTRO_FEATURE instead of just turning this off.
> >>
> >> > +    -Dfast-heartbeat=3Dfalse \
> >>
> >> Default value, remove.
> >>
> >> > +    -Dpacket-socket=3Denabled \
> >>
> >> Can=E2=80=99t you leave this as the default and let Meson detect?
> >>
> >> > +inherit_defer meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG',=
 'introspection', 'gobject-introspection', '', d)}
> >>
> >> Only defer gobject-introspection, not the others.
> >>
> >> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled, -Dintr=
ospection=3Ddisabled, gobject-introspection,=E2=80=9D
> >>
> >> The gobject-introspection class will do this for you, remove this line=
.
> >>
> >> Ross
> >
> >
> >
> > --
> > Perceval ARENOU
> > Embedded Operating System Engineer
> > PTxTrimble formerly Bilberry
> >
> >
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110080): https://lists.openembedded.org/g/openembedde=
d-devel/message/110080
> Mute This Topic: https://lists.openembedded.org/mt/105577746/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

