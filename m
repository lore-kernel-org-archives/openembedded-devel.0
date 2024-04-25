Return-Path: <perceval.arenou@ptxtrimble.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE827C4345F
	for <webhook@archiver.kernel.org>; Thu, 25 Apr 2024 08:04:58 +0000 (UTC)
Received: from us-smtp-delivery-109.mimecast.com (us-smtp-delivery-109.mimecast.com [170.10.129.109])
 by mx.groups.io with SMTP id smtpd.web10.11796.1714032289484584894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 01:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ptxtrimble.com header.s=mimecast20240319 header.b=o6oDk5v8;
 spf=pass (domain: ptxtrimble.com, ip: 170.10.129.109, mailfrom: perceval.arenou@ptxtrimble.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ptxtrimble.com;
	s=mimecast20240319; t=1714032288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFNq/JWJxAhnau1MFbIwulfibkY+j3L0jRtdYO4mjW0=;
	b=o6oDk5v8uNmvZ073RUjVAktkz8dzfiG6t6XtXZR1aTj1A9jRdAGLr7wkbgW8eWNOTZExZ3
	8+P23HqsPM7l2gjKmQjsU4EqlgPERGzEwMjSd9fzbbgv1WdT+wEWoMRj1D+LLMTP4WAbqa
	y+gM9DF84dtSUakEa55+UhJFZQ4P3mk=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-pQTmzYhAOjS_NI1fGRN9Xw-1; Thu, 25 Apr 2024 04:04:45 -0400
X-MC-Unique: pQTmzYhAOjS_NI1fGRN9Xw-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-22ecbd9432aso668402fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 01:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714032285; x=1714637085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Swm3WmS4KOFHmucwLganVsaC8wDopteFwbrrZ+cJBI=;
        b=pOMnz6ckLvS4p5Mbuh5PQzGtzJWGRoy+YTYx4hwW4qKt5YLjvcVLFUBW9eHO7jaF2F
         JshpBhnC1s+4yUuFhIk5L70FNWebnlNfc3nPvzt9cdJoACwG26d75VovCdI3TWPN3OyK
         3yOJbH0U/2ZGUcbSS1GHmFFYhLSlV9rrJq+32TSxzlbvhtZdNMBX56tIjE6rMRFck3z9
         chFCGirkMgSxbsb0g55kQMX3aJkKrPFZCmY4a1qHWx0LtFP6NHWUAFhZyd9RTRZ9YTPm
         QdYOKwnQ72dTiVFBlJNvZGo4AGGji8CK8Xln7W5rzMV7YEkm8EKcteNLDU1WYuw1GiY0
         +05g==
X-Gm-Message-State: AOJu0Ywu5kHvsvk+iJKcE5j8cLUi8SpeEAeRlypbUjSjVcC9e4n+yEBk
	gXe5j0Cw8hCENHXBWYts+r2dTWDC1nYlITl2QuW2KWcsDri+ve9Vq7WlHUWP86w21t2UaJ+6GFq
	D47Kyd25y2dBpZ1OdZDEamJI699hYZwRKCC4F1OYdJYFGvwCqSBbMvu7a1/IkbvCdpD24hygsaZ
	PmetCXHupR450IprD7psSsjCXCVt6TR2bs4YyG92LQ3D7Fm5wByp8/x/BJMJNUpzZy9t6HAO8G8
	ystqAPX
X-Received: by 2002:a05:6870:c6a4:b0:22e:9e53:3fd2 with SMTP id cv36-20020a056870c6a400b0022e9e533fd2mr5722813oab.28.1714032284838;
        Thu, 25 Apr 2024 01:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnldncA9Chb1+nQBMVZ4g3UjkdTv5F+UrL9UysA9X5O2My8PwfM2/j8aCcnZvY4f9WZbBrQH/XVNKeZs9RZlk=
X-Received: by 2002:a05:6870:c6a4:b0:22e:9e53:3fd2 with SMTP id
 cv36-20020a056870c6a400b0022e9e533fd2mr5722798oab.28.1714032284515; Thu, 25
 Apr 2024 01:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
 <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com> <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
 <17C885AD767F090E.10861@lists.openembedded.org> <CA+chaQcSCyv_Yh8z7zQLMjB+AHL5CLzi5L5yviLddoYTkjBbcg@mail.gmail.com>
 <17C976F30B799D6D.19690@lists.openembedded.org>
In-Reply-To: <17C976F30B799D6D.19690@lists.openembedded.org>
From: Perceval Arenou <perceval.arenou@ptxtrimble.com>
Date: Thu, 25 Apr 2024 10:04:33 +0200
Message-ID: <CAC=Bj8jy5oTy88dmA5v7WNN16=r4ogGBPER+Q3OLD_N2VYRkoA@mail.gmail.com>
Subject: Re: [External] Re: [oe] [meta-multimedia][PATCH] aravis: new recipe
 aravis is a vision library for genicam based cameras. aravis project allows
 to stream from genicam and GigE cameras
To: perceval.arenou@ptxtrimble.com
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>, 
	Perceval Arenou <perceval.arenou@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: ptxtrimble.com
Content-Type: multipart/alternative; boundary="00000000000073dc020616e73dde"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 08:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110149

--00000000000073dc020616e73dde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From ab87595034d27dd836ee7bbb1200490fda1dce64 Mon Sep 17 00:00:00 2001
From: Perceval Arenou <perceval.arenou@gmail.com>
Date: Wed, 17 Apr 2024 15:06:14 +0200
Subject: [PATCH] aravis: build GUI only if gtk+3 distro feature is enabled

---
.../recipes-multimedia/aravis/aravis_0.8.31.bb | 10 +++++++---
1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
index b5d7772e7..38f10e6d1 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
@@ -6,7 +6,7 @@ DESCRIPTION =3D "\
"
AUTHOR =3D "Emmanuel Pacaud"
HOMEPAGE =3D "https://github.com/AravisProject/aravis"
-LICENSE =3D "LGPL-2.1"
+LICENSE =3D "LGPL-2.0-or-later"
LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c=
"
DEPENDS +=3D "\
@@ -29,8 +29,12 @@ GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
inherit meson pkgconfig gi-docgen gobject-introspection
-PACKAGECONFIG ?=3D "gstreamer usb viewer"
-PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled,
-Dgst-plugin=3Ddisabled,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG ?=3D "\
+ gstreamer \
+ usb \
+ ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',
'viewer', '', d)} \
+"
+PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisab=
led,
gstreamer1.0 gstreamer1.0-plugins-base,"
PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3
gstreamer1.0-plugins-base,"
--=20
2.39.2



On Thu, Apr 25, 2024 at 10:01=E2=80=AFAM Perceval via lists.openembedded.or=
g
<perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:

> From ef4194a2f128439eaeba731080dd13e934e5ec01 Mon Sep 17 00:00:00 2001
> From: Perceval Arenou <perceval.arenou@gmail.com>
> Date: Wed, 17 Apr 2024 15:06:14 +0200
> Subject: [PATCH] aravis: new recipe aravis is a vision library for genica=
m
> based cameras. aravis project allows to stream from genicam and GigE
> cameras
>
> ---
> .../aravis/aravis_0.8.31.bb | 44 +++++++++++++++++++
> 1 file changed, 44 insertions(+)
> create mode 100644 meta-multimedia/recipes-multimedia/aravis/
> aravis_0.8.31.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> new file mode 100644
> index 000000000..38f10e6d1
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> @@ -0,0 +1,44 @@
> +SUMMARY =3D "A vision library for genicam based cameras"
> +DESCRIPTION =3D "\
> + Aravis is a glib/gobject based library for video acquisition using
> Genicam cameras.\
> + It currently implements the gigabit ethernet and USB3 protocols used by
> industrial cameras.\
> + It also provides a basic ethernet camera simulator and a simple video
> viewer.\
> +"
> +AUTHOR =3D "Emmanuel Pacaud"
> +HOMEPAGE =3D "https://github.com/AravisProject/aravis
> <https://github.com/AravisProject/aravis>
> "
> +LICENSE =3D "LGPL-2.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS +=3D "\
> + glib-2.0 \
> + glib-2.0-native \
> + libxml2 \
> + zlib \
> +"
> +
> +SRC_URI =3D "
> https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${=
PV}.tar.xz
> <https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-$=
{PV}.tar.xz>
> "
> +SRC_URI[sha256sum] =3D
> "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da"
> +
> +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GIDOCGEN_MESON_OPTION =3D "documentation"
> +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> +
> +inherit meson pkgconfig gi-docgen gobject-introspection
> +
> +PACKAGECONFIG ?=3D "\
> + gstreamer \
> + usb \
> + ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}',
> 'viewer', '', d)} \
> +"
> +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddis=
abled,
> gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
> +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+=
3
> gstreamer1.0-plugins-base,"
> +
> +FILES:${PN} +=3D "\
> + ${datadir} \
> + ${libdir}/gstreamer-1.0/libgstaravis.0.8.so
> <http://libgstaravis.0.8.so>
> \
> +"
> --
> 2.39.2
>
>
>
> On Mon, Apr 22, 2024 at 9:06=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
>
>> There is also:
>>
>> ERROR: Nothing PROVIDES 'gtk+3' (but
>> meta-oe/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>> DEPENDS on or otherwise requires it)
>> gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES
>>
>> so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or
>> enable viewer PACKAGECONFIG only when wayland or x11 is in
>> DISTRO_FEATURES.
>>
>> On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via
>> lists.openembedded.org
>> <http://lists.openembedded.org>
>> <martin.jansa=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > This is now triggering:
>> > ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1
>> > [obsolete-license]
>> >
>> > Looks like it should be LGPL-2.1-only, please send follow-up fix.
>> >
>> > On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via lists.openembedde=
d.org
>> <http://lists.openembedded.org>
>> > <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>> > >
>> > > From: Perceval Arenou <perceval.arenou@gmail.com>
>> > >
>> > >
>> > > ---
>> > > .../aravis/aravis_0.8.31.bb | 40 +++++++++++++++++++
>> > > 1 file changed, 40 insertions(+)
>> > > create mode 100644 meta-multimedia/recipes-multimedia/aravis/
>> aravis_0.8.31.bb
>> > >
>> > > diff --git a/meta-multimedia/recipes-multimedia/aravis/
>> aravis_0.8.31.bb b/meta-multimedia/recipes-multimedia/aravis/
>> aravis_0.8.31.bb
>> > > new file mode 100644
>> > > index 000000000..52e276c7b
>> > > --- /dev/null
>> > > +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>> > > @@ -0,0 +1,40 @@
>> > > +SUMMARY =3D "A vision library for genicam based cameras"
>> > > +DESCRIPTION =3D "\
>> > > + Aravis is a glib/gobject based library for video acquisition using
>> Genicam cameras.\
>> > > + It currently implements the gigabit ethernet and USB3 protocols
>> used by industrial cameras.\
>> > > + It also provides a basic ethernet camera simulator and a simple
>> video viewer.\
>> > > +"
>> > > +AUTHOR =3D "Emmanuel Pacaud"
>> > > +HOMEPAGE =3D "https://github.com/AravisProject/aravis
>> <https://github.com/AravisProject/aravis>
>> "
>> > > +LICENSE =3D "LGPL-2.1"
>> > > +LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D4fbd65380cdd255951079008b364516c"
>> > > +
>> > > +DEPENDS +=3D "\
>> > > + glib-2.0 \
>> > > + glib-2.0-native \
>> > > + libxml2 \
>> > > + zlib \
>> > > +"
>> > > +
>> > > +SRC_URI =3D "
>> https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-$=
{PV}.tar.xz
>> <https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-=
${PV}.tar.xz>
>> "
>> > > +SRC_URI[sha256sum] =3D
>> "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c4311a084da"
>> > > +
>> > > +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>> > > +
>> > > +GIR_MESON_ENABLE_FLAG =3D 'enabled'
>> > > +GIR_MESON_DISABLE_FLAG =3D 'disabled'
>> > > +GIDOCGEN_MESON_OPTION =3D "documentation"
>> > > +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
>> > > +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
>> > > +
>> > > +inherit meson pkgconfig gi-docgen gobject-introspection
>> > > +
>> > > +PACKAGECONFIG ?=3D "gstreamer usb viewer"
>> > > +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled,
>> -Dgst-plugin=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,"
>> > > +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,=
"
>> > > +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled,=
 gtk+3
>> gstreamer1.0-plugins-base,"
>> > > +
>> > > +FILES:${PN} +=3D "\
>> > > + ${datadir} \
>> > > + ${libdir}/gstreamer-1.0/libgstaravis.0.8.so
>> <http://libgstaravis.0.8.so>
>> \
>> > > +"
>> > > --
>> > > 2.43.0
>> > >
>> > >
>> > > On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@arm=
.com>
>> wrote:
>> > >>
>> > >> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org
>> <http://lists.openembedded.org>
>> <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>> > >> > +# These options are found in AravisProject/aravis
>> meson_options.txt
>> > >>
>> > >> No need to comment where they came from, this is the only place the=
y
>> can be defined.
>> > >>
>> > >> > +EXTRA_OEMESON +=3D "\
>> > >> > + -Ddocumentation=3Ddisabled \
>> > >>
>> > >> If would be good to use the gi-docgen class and respect the
>> api-documentation DISTRO_FEATURE instead of just turning this off.
>> > >>
>> > >> > + -Dfast-heartbeat=3Dfalse \
>> > >>
>> > >> Default value, remove.
>> > >>
>> > >> > + -Dpacket-socket=3Denabled \
>> > >>
>> > >> Can=E2=80=99t you leave this as the default and let Meson detect?
>> > >>
>> > >> > +inherit_defer meson pkgconfig
>> ${@bb.utils.contains('PACKAGECONFIG', 'introspection',
>> 'gobject-introspection', '', d)}
>> > >>
>> > >> Only defer gobject-introspection, not the others.
>> > >>
>> > >> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,
>> -Dintrospection=3Ddisabled, gobject-introspection,=E2=80=9D
>> > >>
>> > >> The gobject-introspection class will do this for you, remove this
>> line.
>> > >>
>> > >> Ross
>> > >
>> > >
>> > >
>> > > --
>> > > Perceval ARENOU
>> > > Embedded Operating System Engineer
>> > > PTxTrimble formerly Bilberry
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> >
>> >
>> >
>>
>
>
> --
>
> *Perceval ARENOU*
> Embedded Operating System Engineer
> *PTxTrimble* formerly Bilberry
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110148):
> https://lists.openembedded.org/g/openembedded-devel/message/110148
> Mute This Topic:
> https://lists.openembedded.org/mt/105577746/8242248
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub
> [perceval.arenou@ptxtrimble.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20

*Perceval ARENOU*
Embedded Operating System Engineer
*PTxTrimble* formerly Bilberry



--00000000000073dc020616e73dde
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body><div dir=3D"ltr"><div class=3D"gmail_default" style=
=3D"color:#000000"><div style=3D"color:rgb(59,59,59);font-family:&quot;Droi=
d Sans Mono&quot;,&quot;monospace&quot;,monospace;font-size:14px;line-heigh=
t:19px;white-space:pre"><div>From ab87595034d27dd836ee7bbb1200490fda1dce64 =
Mon Sep 17 00:00:00 2001</div><div>From: Perceval Arenou &lt;<a href=3D"mai=
lto:perceval.arenou@gmail.com">perceval.arenou@gmail.com</a>&gt;</div><div>=
Date: Wed, 17 Apr 2024 15:06:14 +0200</div><div>Subject: [PATCH] aravis: bu=
ild GUI only if gtk+3 distro feature is enabled</div><br><div>---</div><div=
> .../recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb">aravis_=
0.8.31.bb</a>         | 10 +++++++---</div><div> 1 file changed, 7 insertio=
ns(+), 3 deletions(-)</div><br><div><span style=3D"color:rgb(0,0,128)">diff=
 --git a/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis=
_0.8.31.bb">aravis_0.8.31.bb</a> b/meta-multimedia/recipes-multimedia/aravi=
s/<a href=3D"http://aravis_0.8.31.bb">aravis_0.8.31.bb</a></span></div><div=
>index b5d7772e7..38f10e6d1 100644</div><div><span style=3D"color:rgb(0,0,1=
28)">--- a/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://arav=
is_0.8.31.bb">aravis_0.8.31.bb</a></span></div><div><span style=3D"color:rg=
b(0,0,128)">+++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http=
://aravis_0.8.31.bb">aravis_0.8.31.bb</a></span></div><div>@@ -6,7 +6,7 @@ =
DESCRIPTION =3D &quot;\</div><div> &quot;</div><div> AUTHOR =3D &quot;Emman=
uel Pacaud&quot;</div><div> HOMEPAGE =3D &quot;<a href=3D"https://github.co=
m/AravisProject/aravis">https://github.com/AravisProject/aravis</a>&quot;</=
div><div><span style=3D"color:rgb(163,21,21)">-LICENSE =3D &quot;LGPL-2.1&q=
uot;</span></div><div><span style=3D"color:rgb(9,134,88)">+LICENSE =3D &quo=
t;LGPL-2.0-or-later&quot;</span></div><div> LIC_FILES_CHKSUM =3D &quot;file=
://COPYING;md5=3D4fbd65380cdd255951079008b364516c&quot;</div><div> </div><d=
iv> DEPENDS +=3D &quot;\</div><div>@@ -29,8 +29,12 @@ GIDOCGEN_MESON_DISABL=
E_FLAG =3D &quot;disabled&quot;</div><div> </div><div> inherit meson pkgcon=
fig gi-docgen gobject-introspection</div><div> </div><div><span style=3D"co=
lor:rgb(163,21,21)">-PACKAGECONFIG ?=3D &quot;gstreamer usb viewer&quot;</s=
pan></div><div><span style=3D"color:rgb(163,21,21)">-PACKAGECONFIG[gstreame=
r] =3D &quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisabled,gstreamer1.0 g=
streamer1.0-plugins-base,&quot;</span></div><div><span style=3D"color:rgb(9=
,134,88)">+PACKAGECONFIG ?=3D &quot;\</span></div><div><span style=3D"color=
:rgb(9,134,88)">+    gstreamer \</span></div><div><span style=3D"color:rgb(=
9,134,88)">+    usb \</span></div><div><span style=3D"color:rgb(9,134,88)">=
+    ${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, &#39;${GTK3DISTROF=
EATURES}&#39;, &#39;viewer&#39;, &#39;&#39;, d)} \</span></div><div><span s=
tyle=3D"color:rgb(9,134,88)">+&quot;</span></div><div><span style=3D"color:=
rgb(9,134,88)">+PACKAGECONFIG[gstreamer] =3D &quot;-Dgst-plugin=3Denabled, =
-Dgst-plugin=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,&quot;</spa=
n></div><div> PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisable=
d, libusb1,&quot;</div><div> PACKAGECONFIG[viewer] =3D &quot;-Dviewer=3Dena=
bled, -Dviewer=3Ddisabled, gtk+3 gstreamer1.0-plugins-base,&quot;</div><div=
> </div><div><span style=3D"color:rgb(163,21,21)">-- </span></div><div>2.39=
.2</div><br><br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Apr 25, 2024 at 10:01=E2=80=AFAM Perc=
eval via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</=
a> &lt;perceval.arenou=3D<a href=3D"mailto:ptxtrimble.com@lists.openembedde=
d.org">ptxtrimble.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-8804852657643=
288785"><div><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"color:r=
gb(0,0,0)"><div style=3D"color:rgb(59,59,59);font-family:&quot;Droid Sans M=
ono&quot;,&quot;monospace&quot;,monospace;font-size:14px;line-height:19px;w=
hite-space:pre-wrap"><div>From ef4194a2f128439eaeba731080dd13e934e5ec01 Mon=
 Sep 17 00:00:00 2001<br></div><div>From: Perceval Arenou &lt;<a href=3D"ma=
ilto:perceval.arenou@gmail.com" target=3D"_blank">perceval.arenou@gmail.com=
</a>&gt;</div><div>Date: Wed, 17 Apr 2024 15:06:14 +0200</div><div>Subject:=
 [PATCH] aravis: new recipe aravis is a vision library for genicam</div><di=
v> based cameras. aravis project allows to stream from genicam and GigE cam=
eras</div><br><div>---</div><div> .../aravis/<a href=3D"http://aravis_0.8.3=
1.bb" target=3D"_blank">aravis_0.8.31.bb</a>                   | 44 +++++++=
++++++++++++</div><div> 1 file changed, 44 insertions(+)</div><div> create =
mode 100644 meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://ara=
vis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a></div><br><div><span s=
tyle=3D"color:rgb(0,0,128)">diff --git a/meta-multimedia/recipes-multimedia=
/aravis/<a href=3D"http://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31=
.bb</a> b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravi=
s_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a></span></div><div>new fi=
le mode 100644</div><div>index 000000000..38f10e6d1</div><div><span style=
=3D"color:rgb(0,0,128)">--- /dev/null</span></div><div><span style=3D"color=
:rgb(0,0,128)">+++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"h=
ttp://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a></span></div>=
<div>@@ -0,0 +1,44 @@</div><div><span style=3D"color:rgb(9,134,88)">+SUMMAR=
Y =3D &quot;A vision library for genicam based cameras&quot;</span></div><d=
iv><span style=3D"color:rgb(9,134,88)">+DESCRIPTION =3D &quot;\</span></div=
><div><span style=3D"color:rgb(9,134,88)">+    Aravis is a glib/gobject bas=
ed library for video acquisition using Genicam cameras.\</span></div><div><=
span style=3D"color:rgb(9,134,88)">+    It currently implements the gigabit=
 ethernet and USB3 protocols used by industrial cameras.\</span></div><div>=
<span style=3D"color:rgb(9,134,88)">+    It also provides a basic ethernet =
camera simulator and a simple video viewer.\</span></div><div><span style=
=3D"color:rgb(9,134,88)">+&quot;</span></div><div><span style=3D"color:rgb(=
9,134,88)">+AUTHOR =3D &quot;Emmanuel Pacaud&quot;</span></div><div><span s=
tyle=3D"color:rgb(9,134,88)">+HOMEPAGE =3D &quot;<a href=3D"https://github.=
com/AravisProject/aravis" target=3D"_blank">https://github.com/AravisProjec=
t/aravis</a>&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+LI=
CENSE =3D &quot;LGPL-2.0-or-later&quot;</span></div><div><span style=3D"col=
or:rgb(9,134,88)">+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd6538=
0cdd255951079008b364516c&quot;</span></div><div><span style=3D"color:rgb(9,=
134,88)">+</span></div><div><span style=3D"color:rgb(9,134,88)">+DEPENDS +=
=3D &quot;\</span></div><div><span style=3D"color:rgb(9,134,88)">+    glib-=
2.0 \</span></div><div><span style=3D"color:rgb(9,134,88)">+    glib-2.0-na=
tive \</span></div><div><span style=3D"color:rgb(9,134,88)">+    libxml2 \<=
/span></div><div><span style=3D"color:rgb(9,134,88)">+    zlib \</span></di=
v><div><span style=3D"color:rgb(9,134,88)">+&quot;</span></div><div><span s=
tyle=3D"color:rgb(9,134,88)">+</span></div><div><span style=3D"color:rgb(9,=
134,88)">+SRC_URI =3D &quot;<a href=3D"https://github.com/AravisProject/ara=
vis/releases/download/${PV}/${BPN}-${PV}.tar.xz" target=3D"_blank">https://=
github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.xz=
</a>&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+SRC_URI[sh=
a256sum] =3D &quot;9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43fa0212c43=
11a084da&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+</span=
></div><div><span style=3D"color:rgb(9,134,88)">+EXTRA_OEMESON +=3D &quot;-=
Dtests=3Dfalse&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+=
</span></div><div><span style=3D"color:rgb(9,134,88)">+GIR_MESON_ENABLE_FLA=
G =3D &#39;enabled&#39;</span></div><div><span style=3D"color:rgb(9,134,88)=
">+GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;</span></div><div><span sty=
le=3D"color:rgb(9,134,88)">+GIDOCGEN_MESON_OPTION =3D &quot;documentation&q=
uot;</span></div><div><span style=3D"color:rgb(9,134,88)">+GIDOCGEN_MESON_E=
NABLE_FLAG =3D &quot;enabled&quot;</span></div><div><span style=3D"color:rg=
b(9,134,88)">+GIDOCGEN_MESON_DISABLE_FLAG =3D &quot;disabled&quot;</span></=
div><div><span style=3D"color:rgb(9,134,88)">+</span></div><div><span style=
=3D"color:rgb(9,134,88)">+inherit meson pkgconfig gi-docgen gobject-introsp=
ection</span></div><div><span style=3D"color:rgb(9,134,88)">+</span></div><=
div><span style=3D"color:rgb(9,134,88)">+PACKAGECONFIG ?=3D &quot;\</span><=
/div><div><span style=3D"color:rgb(9,134,88)">+    gstreamer \</span></div>=
<div><span style=3D"color:rgb(9,134,88)">+    usb \</span></div><div><span =
style=3D"color:rgb(9,134,88)">+    ${@bb.utils.contains_any(&#39;DISTRO_FEA=
TURES&#39;, &#39;${GTK3DISTROFEATURES}&#39;, &#39;viewer&#39;, &#39;&#39;, =
d)} \</span></div><div><span style=3D"color:rgb(9,134,88)">+&quot;</span></=
div><div><span style=3D"color:rgb(9,134,88)">+PACKAGECONFIG[gstreamer] =3D =
&quot;-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddisabled, gstreamer1.0 gstream=
er1.0-plugins-base,&quot;</span></div><div><span style=3D"color:rgb(9,134,8=
8)">+PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, libusb=
1,&quot;</span></div><div><span style=3D"color:rgb(9,134,88)">+PACKAGECONFI=
G[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3 gstreame=
r1.0-plugins-base,&quot;</span></div><div><span style=3D"color:rgb(9,134,88=
)">+</span></div><div><span style=3D"color:rgb(9,134,88)">+FILES:${PN} +=3D=
 &quot;\</span></div><div><span style=3D"color:rgb(9,134,88)">+    ${datadi=
r} \</span></div><div><span style=3D"color:rgb(9,134,88)">+    ${libdir}/gs=
treamer-1.0/<a href=3D"http://libgstaravis.0.8.so" target=3D"_blank">libgst=
aravis.0.8.so</a> \</span></div><div><span style=3D"color:rgb(9,134,88)">+&=
quot;</span></div><div><span style=3D"color:rgb(163,21,21)">-- </span></div=
><div>2.39.2</div><br><br></div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 22, 2024 at 9:06=E2=80=AF=
AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bl=
ank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div>There is also:<br>
<br>
ERROR: Nothing PROVIDES &#39;gtk+3&#39; (but<br>
meta-oe/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http://aravis_=
0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
DEPENDS on or otherwise requires it)<br>
gtk+3 was skipped: one of &#39;wayland x11&#39; needs to be in DISTRO_FEATU=
RES<br>
<br>
so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or<br>
enable viewer PACKAGECONFIG only when wayland or x11 is in<br>
DISTRO_FEATURES.<br>
<br>
On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via<br>
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; This is now triggering:<br>
&gt; ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1<br=
>
&gt; [obsolete-license]<br>
&gt;<br>
&gt; Looks like it should be LGPL-2.1-only, please send follow-up fix.<br>
&gt;<br>
&gt; On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via <a href=3D"http:/=
/lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;perceval.arenou=3D<a href=3D"mailto:ptxtrimble.com@lists.openembed=
ded.org" target=3D"_blank">ptxtrimble.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; From: Perceval Arenou &lt;<a href=3D"mailto:perceval.arenou@gmail=
.com" target=3D"_blank">perceval.arenou@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;  .../aravis/<a href=3D"http://aravis_0.8.31.bb" target=3D"_blank"=
>aravis_0.8.31.bb</a>                   | 40 +++++++++++++++++++<br>
&gt; &gt;  1 file changed, 40 insertions(+)<br>
&gt; &gt;  create mode 100644 meta-multimedia/recipes-multimedia/aravis/<a =
href=3D"http://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-multimedia/recipes-multimedia/aravis/<a href=3D=
"http://aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a> b/meta-mul=
timedia/recipes-multimedia/aravis/<a href=3D"http://aravis_0.8.31.bb" targe=
t=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..52e276c7b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-multimedia/recipes-multimedia/aravis/<a href=3D"http:/=
/aravis_0.8.31.bb" target=3D"_blank">aravis_0.8.31.bb</a><br>
&gt; &gt; @@ -0,0 +1,40 @@<br>
&gt; &gt; +SUMMARY =3D &quot;A vision library for genicam based cameras&quo=
t;<br>
&gt; &gt; +DESCRIPTION =3D &quot;\<br>
&gt; &gt; +    Aravis is a glib/gobject based library for video acquisition=
 using Genicam cameras.\<br>
&gt; &gt; +    It currently implements the gigabit ethernet and USB3 protoc=
ols used by industrial cameras.\<br>
&gt; &gt; +    It also provides a basic ethernet camera simulator and a sim=
ple video viewer.\<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +AUTHOR =3D &quot;Emmanuel Pacaud&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/AravisProject/a=
ravis" target=3D"_blank">https://github.com/AravisProject/aravis</a>&quot;<=
br>
&gt; &gt; +LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4fbd65380cdd2559=
51079008b364516c&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;\<br>
&gt; &gt; +    glib-2.0 \<br>
&gt; &gt; +    glib-2.0-native \<br>
&gt; &gt; +    libxml2 \<br>
&gt; &gt; +    zlib \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/AravisProject/ar=
avis/releases/download/${PV}/${BPN}-${PV}.tar.xz" target=3D"_blank">https:/=
/github.com/AravisProject/aravis/releases/download/${PV}/${BPN}-${PV}.tar.x=
z</a>&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;9c4ebe6273ed3abe466cb6ed8fa5c132bdd=
7e9a9298ca43fa0212c4311a084da&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
&gt; &gt; +GIR_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
&gt; &gt; +GIDOCGEN_MESON_OPTION =3D &quot;documentation&quot;<br>
&gt; &gt; +GIDOCGEN_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
&gt; &gt; +GIDOCGEN_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson pkgconfig gi-docgen gobject-introspection<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG ?=3D &quot;gstreamer usb viewer&quot;<br>
&gt; &gt; +PACKAGECONFIG[gstreamer] =3D &quot;-Dgst-plugin=3Denabled, -Dgst=
-plugin=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,&quot;<br>
&gt; &gt; +PACKAGECONFIG[usb] =3D &quot;-Dusb=3Denabled, -Dusb=3Ddisabled, =
libusb1,&quot;<br>
&gt; &gt; +PACKAGECONFIG[viewer] =3D &quot;-Dviewer=3Denabled, -Dviewer=3Dd=
isabled, gtk+3 gstreamer1.0-plugins-base,&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +FILES:${PN} +=3D &quot;\<br>
&gt; &gt; +    ${datadir} \<br>
&gt; &gt; +    ${libdir}/gstreamer-1.0/<a href=3D"http://libgstaravis.0.8.s=
o" target=3D"_blank">libgstaravis.0.8.so</a> \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton &lt;<a href=
=3D"mailto:Ross.Burton@arm.com" target=3D"_blank">Ross.Burton@arm.com</a>&g=
t; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 19 Apr 2024, at 15:58, Perceval via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;percev=
al.arenou=3D<a href=3D"mailto:ptxtrimble.com@lists.openembedded.org" target=
=3D"_blank">ptxtrimble.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; +# These options are found in AravisProject/aravis meson=
_options.txt<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; No need to comment where they came from, this is the only pla=
ce they can be defined.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +EXTRA_OEMESON +=3D &quot;\<br>
&gt; &gt;&gt; &gt; +    -Ddocumentation=3Ddisabled \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If would be good to use the gi-docgen class and respect the a=
pi-documentation DISTRO_FEATURE instead of just turning this off.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +    -Dfast-heartbeat=3Dfalse \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Default value, remove.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +    -Dpacket-socket=3Denabled \<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Can=E2=80=99t you leave this as the default and let Meson det=
ect?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +inherit_defer meson pkgconfig ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;introspection&#39;, &#39;gobject-introspection&#3=
9;, &#39;&#39;, d)}<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Only defer gobject-introspection, not the others.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; +PACKAGECONFIG[introspection] =3D &quot;-Dintrospection=
=3Denabled, -Dintrospection=3Ddisabled, gobject-introspection,=E2=80=9D<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The gobject-introspection class will do this for you, remove =
this line.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Ross<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Perceval ARENOU<br>
&gt; &gt; Embedded Operating System Engineer<br>
&gt; &gt; PTxTrimble formerly Bilberry<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font color=3D"#444444" face=3D"arial, sans-serif"><b>Percev=
al ARENOU<br></b></font><div><font color=3D"#444444" face=3D"arial, sans-se=
rif">Embedded Operating System Engineer</font></div><div><span style=3D"col=
or:rgb(68,68,68)"><font face=3D"arial, sans-serif"><b>PTxTrimble</b> former=
ly Bilberry</font></span><br></div></div></div>
<br><br><p style=3D"font-family:Verdana;font-size:10pt;color:rgb(102,102,10=
2)"><b>   </b></p><p style=3D"font-family:Verdana;font-size:8pt;color:rgb(1=
02,102,102)"><br><br> </p></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#110148): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110148" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/110148</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105577746/824=
2248" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105577746/8242248</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:perceval.arenou@ptxtrimb=
le.com" target=3D"_blank">perceval.arenou@ptxtrimble.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font color=3D"#444444" face=3D"arial, sans-serif"><b>=
Perceval ARENOU<br></b></font><div><font color=3D"#444444" face=3D"arial, s=
ans-serif">Embedded Operating System Engineer</font></div><div><span style=
=3D"color:rgb(68,68,68)"><font face=3D"arial, sans-serif"><b>PTxTrimble</b>=
 formerly Bilberry</font></span><br></div></div></div>
<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>   </b></p><p style=3D"font-family: Verdana; font-size:8pt; color:#666666=
;"><br><br> </p></body></html>

--00000000000073dc020616e73dde--


