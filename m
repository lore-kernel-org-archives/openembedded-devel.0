Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC246C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 03:03:12 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.5257.1714100590307253397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Apr 2024 20:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iUgumiXC;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-222a9eae9a7so847923fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Apr 2024 20:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714100589; x=1714705389; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od7Nb7CFlIIbCAnkMqdSRxKprgx0Kb00Vsc6Laatqi0=;
        b=iUgumiXC/pEznH7pvjtGUsQLMbFfqnQhgG9y13SwMlZJ2ZiE3Mnknv1TzMdcT+ySlw
         OFKvDgZZEotDPI2KR047qoJa7jhKxDuE6av8WbOiOhsDHHSKRiWHvDA0lfAV/Age/Qxd
         BIpKH+Qs5z0bUaEl+G0bup1nKGdop1J+qr2H6kIfnBkL+lCrNk6QOum9o394XI95eyZh
         3uQwC4sZerceAr8pUqkNbIXVMDKQzpN5NdpzzMhnRXUJzzUTQa4LWlvqZclxwtdMa/t1
         NT8v+USwDk3yIyT9kW4gmLHRjxaOq/yUovb9lE0P0v5l85m7W0jQgQsLRFoXHyiTcKNe
         BwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714100589; x=1714705389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=od7Nb7CFlIIbCAnkMqdSRxKprgx0Kb00Vsc6Laatqi0=;
        b=j8iOQm6qmahbAWM6CWIUKUaCbVNoAyaaZ1eN6RxnQZXGFaZBYYvhLlQNhAKhHz2xg1
         ta0AUY4ks9wJL8wxxpk1hvp0W5J1nyQo9ZnQ3KxopIDtnXj0Ph3q1dPKkPPYcmJTEfHk
         rA+5O4hJOjx/ncSaRScv8PZWOVyClr+YpmwmEmdgL3BhddHMjIy1HI8BRFIfcpRuRUpg
         Glf1pmHQs/LfRrxI/fQedLwdkIgEVxkn0COAhj3MdLeyy+Dt+/iTOKD+pfrD76hCWS6h
         j9rbt0JAKEoegLwYG39mrh3Zk4Et9n+c2O08Ag6cMzzt/MZVc4og4V15M+RhR6dFDW6l
         WHSQ==
X-Gm-Message-State: AOJu0YwO4JkaLKj2wsUy7439MEUktwQR+gNwaOqTnYAZegp7VHFxbgTs
	Dl4GaiFQmf3d29qHhzgSixH5PwDH7nuuBUbrA1Vokz41yu/kqhBYQwnTt2lvhwg6tQv2uZxyR/X
	I/XX39ey73uXBJmr1+AZ3sBY651s=
X-Google-Smtp-Source: AGHT+IFxoE/tJJ2DsblcIqBGvWUqE+g/EyieC/NjZDNQMpiHzkfZKmEMmjpTpYHXvBiEyBf/CfV2AuymLpsXm4WG6I4=
X-Received: by 2002:a05:6870:fe94:b0:238:dd2e:b3ef with SMTP id
 qm20-20020a056870fe9400b00238dd2eb3efmr1324392oab.59.1714100589378; Thu, 25
 Apr 2024 20:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
 <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com> <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
 <17C885AD767F090E.10861@lists.openembedded.org> <CA+chaQcSCyv_Yh8z7zQLMjB+AHL5CLzi5L5yviLddoYTkjBbcg@mail.gmail.com>
 <17C976F30B799D6D.19690@lists.openembedded.org> <CAC=Bj8jy5oTy88dmA5v7WNN16=r4ogGBPER+Q3OLD_N2VYRkoA@mail.gmail.com>
In-Reply-To: <CAC=Bj8jy5oTy88dmA5v7WNN16=r4ogGBPER+Q3OLD_N2VYRkoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Apr 2024 20:02:42 -0700
Message-ID: <CAMKF1sqyyNxrd87du7_dhEF92H31koic7ke_zXU2C_OvLQw9=A@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] aravis: new recipe aravis is a
 vision library for genicam based cameras. aravis project allows to stream
 from genicam and GigE cameras
To: perceval.arenou@ptxtrimble.com
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>, 
	Perceval Arenou <perceval.arenou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Apr 2024 03:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110154

Can you rebase it on top of master?

On Thu, Apr 25, 2024 at 1:04=E2=80=AFAM Perceval via lists.openembedded.org
<perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>
> From ab87595034d27dd836ee7bbb1200490fda1dce64 Mon Sep 17 00:00:00 2001
> From: Perceval Arenou <perceval.arenou@gmail.com>
> Date: Wed, 17 Apr 2024 15:06:14 +0200
> Subject: [PATCH] aravis: build GUI only if gtk+3 distro feature is enable=
d
>
> ---
> .../recipes-multimedia/aravis/aravis_0.8.31.bb | 10 +++++++---
> 1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b=
/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> index b5d7772e7..38f10e6d1 100644
> --- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> @@ -6,7 +6,7 @@ DESCRIPTION =3D "\
> "
> AUTHOR =3D "Emmanuel Pacaud"
> HOMEPAGE =3D "https://github.com/AravisProject/aravis"
> -LICENSE =3D "LGPL-2.1"
> +LICENSE =3D "LGPL-2.0-or-later"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b36451=
6c"
> DEPENDS +=3D "\
> @@ -29,8 +29,12 @@ GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> inherit meson pkgconfig gi-docgen gobject-introspection
> -PACKAGECONFIG ?=3D "gstreamer usb viewer"
> -PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddis=
abled,gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG ?=3D "\
> + gstreamer \
> + usb \
> + ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'v=
iewer', '', d)} \
> +"
> +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddis=
abled, gstreamer1.0 gstreamer1.0-plugins-base,"
> PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
> PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+3=
 gstreamer1.0-plugins-base,"
> --
> 2.39.2
>
>
>
> On Thu, Apr 25, 2024 at 10:01=E2=80=AFAM Perceval via lists.openembedded.=
org <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>>
>> From ef4194a2f128439eaeba731080dd13e934e5ec01 Mon Sep 17 00:00:00 2001
>> From: Perceval Arenou <perceval.arenou@gmail.com>
>> Date: Wed, 17 Apr 2024 15:06:14 +0200
>> Subject: [PATCH] aravis: new recipe aravis is a vision library for genic=
am
>> based cameras. aravis project allows to stream from genicam and GigE cam=
eras
>>
>> ---
>> .../aravis/aravis_0.8.31.bb | 44 +++++++++++++++++++
>> 1 file changed, 44 insertions(+)
>> create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.=
31.bb
>>
>> diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb =
b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>> new file mode 100644
>> index 000000000..38f10e6d1
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>> @@ -0,0 +1,44 @@
>> +SUMMARY =3D "A vision library for genicam based cameras"
>> +DESCRIPTION =3D "\
>> + Aravis is a glib/gobject based library for video acquisition using Gen=
icam cameras.\
>> + It currently implements the gigabit ethernet and USB3 protocols used b=
y industrial cameras.\
>> + It also provides a basic ethernet camera simulator and a simple video =
viewer.\
>> +"
>> +AUTHOR =3D "Emmanuel Pacaud"
>> +HOMEPAGE =3D "https://github.com/AravisProject/aravis"
>> +LICENSE =3D "LGPL-2.0-or-later"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364=
516c"
>> +
>> +DEPENDS +=3D "\
>> + glib-2.0 \
>> + glib-2.0-native \
>> + libxml2 \
>> + zlib \
>> +"
>> +
>> +SRC_URI =3D "https://github.com/AravisProject/aravis/releases/download/=
${PV}/${BPN}-${PV}.tar.xz"
>> +SRC_URI[sha256sum] =3D "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43=
fa0212c4311a084da"
>> +
>> +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>> +
>> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
>> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
>> +GIDOCGEN_MESON_OPTION =3D "documentation"
>> +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
>> +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
>> +
>> +inherit meson pkgconfig gi-docgen gobject-introspection
>> +
>> +PACKAGECONFIG ?=3D "\
>> + gstreamer \
>> + usb \
>> + ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', '=
viewer', '', d)} \
>> +"
>> +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddi=
sabled, gstreamer1.0 gstreamer1.0-plugins-base,"
>> +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
>> +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk=
+3 gstreamer1.0-plugins-base,"
>> +
>> +FILES:${PN} +=3D "\
>> + ${datadir} \
>> + ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
>> +"
>> --
>> 2.39.2
>>
>>
>>
>> On Mon, Apr 22, 2024 at 9:06=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com> wrote:
>>>
>>> There is also:
>>>
>>> ERROR: Nothing PROVIDES 'gtk+3' (but
>>> meta-oe/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>>> DEPENDS on or otherwise requires it)
>>> gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES
>>>
>>> so this recipe should have REQUIRED_DISTRO_FEATURES matching gtk+3 or
>>> enable viewer PACKAGECONFIG only when wayland or x11 is in
>>> DISTRO_FEATURES.
>>>
>>> On Mon, Apr 22, 2024 at 8:17=E2=80=AFAM Martin Jansa via
>>> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org=
>
>>> wrote:
>>> >
>>> > This is now triggering:
>>> > ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1
>>> > [obsolete-license]
>>> >
>>> > Looks like it should be LGPL-2.1-only, please send follow-up fix.
>>> >
>>> > On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via lists.openembedd=
ed.org
>>> > <perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>>> > >
>>> > > From: Perceval Arenou <perceval.arenou@gmail.com>
>>> > >
>>> > >
>>> > > ---
>>> > > .../aravis/aravis_0.8.31.bb | 40 +++++++++++++++++++
>>> > > 1 file changed, 40 insertions(+)
>>> > > create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis=
_0.8.31.bb
>>> > >
>>> > > diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.3=
1.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>>> > > new file mode 100644
>>> > > index 000000000..52e276c7b
>>> > > --- /dev/null
>>> > > +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
>>> > > @@ -0,0 +1,40 @@
>>> > > +SUMMARY =3D "A vision library for genicam based cameras"
>>> > > +DESCRIPTION =3D "\
>>> > > + Aravis is a glib/gobject based library for video acquisition usin=
g Genicam cameras.\
>>> > > + It currently implements the gigabit ethernet and USB3 protocols u=
sed by industrial cameras.\
>>> > > + It also provides a basic ethernet camera simulator and a simple v=
ideo viewer.\
>>> > > +"
>>> > > +AUTHOR =3D "Emmanuel Pacaud"
>>> > > +HOMEPAGE =3D "https://github.com/AravisProject/aravis"
>>> > > +LICENSE =3D "LGPL-2.1"
>>> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25595107900=
8b364516c"
>>> > > +
>>> > > +DEPENDS +=3D "\
>>> > > + glib-2.0 \
>>> > > + glib-2.0-native \
>>> > > + libxml2 \
>>> > > + zlib \
>>> > > +"
>>> > > +
>>> > > +SRC_URI =3D "https://github.com/AravisProject/aravis/releases/down=
load/${PV}/${BPN}-${PV}.tar.xz"
>>> > > +SRC_URI[sha256sum] =3D "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a929=
8ca43fa0212c4311a084da"
>>> > > +
>>> > > +EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
>>> > > +
>>> > > +GIR_MESON_ENABLE_FLAG =3D 'enabled'
>>> > > +GIR_MESON_DISABLE_FLAG =3D 'disabled'
>>> > > +GIDOCGEN_MESON_OPTION =3D "documentation"
>>> > > +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
>>> > > +GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
>>> > > +
>>> > > +inherit meson pkgconfig gi-docgen gobject-introspection
>>> > > +
>>> > > +PACKAGECONFIG ?=3D "gstreamer usb viewer"
>>> > > +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=
=3Ddisabled, gstreamer1.0 gstreamer1.0-plugins-base,"
>>> > > +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1=
,"
>>> > > +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled=
, gtk+3 gstreamer1.0-plugins-base,"
>>> > > +
>>> > > +FILES:${PN} +=3D "\
>>> > > + ${datadir} \
>>> > > + ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
>>> > > +"
>>> > > --
>>> > > 2.43.0
>>> > >
>>> > >
>>> > > On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@ar=
m.com> wrote:
>>> > >>
>>> > >> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org <per=
ceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>>> > >> > +# These options are found in AravisProject/aravis meson_options=
.txt
>>> > >>
>>> > >> No need to comment where they came from, this is the only place th=
ey can be defined.
>>> > >>
>>> > >> > +EXTRA_OEMESON +=3D "\
>>> > >> > + -Ddocumentation=3Ddisabled \
>>> > >>
>>> > >> If would be good to use the gi-docgen class and respect the api-do=
cumentation DISTRO_FEATURE instead of just turning this off.
>>> > >>
>>> > >> > + -Dfast-heartbeat=3Dfalse \
>>> > >>
>>> > >> Default value, remove.
>>> > >>
>>> > >> > + -Dpacket-socket=3Denabled \
>>> > >>
>>> > >> Can=E2=80=99t you leave this as the default and let Meson detect?
>>> > >>
>>> > >> > +inherit_defer meson pkgconfig ${@bb.utils.contains('PACKAGECONF=
IG', 'introspection', 'gobject-introspection', '', d)}
>>> > >>
>>> > >> Only defer gobject-introspection, not the others.
>>> > >>
>>> > >> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled, -D=
introspection=3Ddisabled, gobject-introspection,=E2=80=9D
>>> > >>
>>> > >> The gobject-introspection class will do this for you, remove this =
line.
>>> > >>
>>> > >> Ross
>>> > >
>>> > >
>>> > >
>>> > > --
>>> > > Perceval ARENOU
>>> > > Embedded Operating System Engineer
>>> > > PTxTrimble formerly Bilberry
>>> > >
>>> > >
>>> > >
>>> > >
>>> > >
>>> > >
>>> > >
>>> >
>>> >
>>> >
>>
>>
>>
>> --
>> Perceval ARENOU
>> Embedded Operating System Engineer
>> PTxTrimble formerly Bilberry
>>
>>
>>
>>
>>
>>
>>
>
>
> --
> Perceval ARENOU
> Embedded Operating System Engineer
> PTxTrimble formerly Bilberry
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110149): https://lists.openembedded.org/g/openembedde=
d-devel/message/110149
> Mute This Topic: https://lists.openembedded.org/mt/105577746/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

