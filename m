Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B48C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 06:17:20 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.12187.1713766637854373745
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Apr 2024 23:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wiu+Vzfz;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d2600569so5006420e87.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Apr 2024 23:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713766636; x=1714371436; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv+H36X0qYbNASzD4MmOkjLuFoyazz6d994EfydPUXw=;
        b=Wiu+Vzfz6ZvW3XgrDjveHU8QhwkUIcAVdK6/8TA2yWtEf9wmH9p0OVPQpZX3Qzciof
         UGbMVQ9YdMp0NrrROJ64SRNWLzj25BF4PJ7r9f3gPt0Vjz+cQQ3hEURpbczKIwrMbNkH
         nwaacJoWc02bNpjm2ydi6J9wOHDvDXn7df81OLH6llSM87NFyj6W3NVrX4ucOA/GOWRS
         e8fYUd97slqy3bUUYn5Gv73gla77ov2OmZaDnNDYev7hDFnjuaTBS+owWn/vgwEU7jNR
         bmcCzkw05oO0IAP83YAs6CsDMWDkPQyDsaVl3n5+dEWxtaECpxeQlBZuzL0hf4TE9vU9
         9iMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713766636; x=1714371436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv+H36X0qYbNASzD4MmOkjLuFoyazz6d994EfydPUXw=;
        b=qoqpPbFzzpMgPOBMMtHTqvrq/RCNpkBITRxb5hcz1yNu9bimrUhKPY0vvjUmr9joa6
         x83iV/jcnbQRdJcww0JtogHmquR3qyhQwrBtV/+AYYcE+hT1kCRsvPm0VKgEw//tsC+0
         Zo/LeKUM3AkTEzspeUDov033JibhHwLbJXeeJyhmodDwjmybD30Jmd2fhPafntsGYS8C
         cCWrZe3NmCqAul7peQOEMA595Pa9hpGV5zfTWM+wGbXGK6wIZWkuos93INqJXtH/d6PJ
         8Wl6Oj2BpQ+qp4R+bzHlYegyK+aZ6kiJHgGwiGz676XXCANkyKgSKax2baenviC+VBBg
         t+6g==
X-Gm-Message-State: AOJu0YyagSRlvhLjQFhVPLEg8oPjEEt/YE75c28a/lzZm99DiEFV6dGp
	arwSbIvx0jhwpElYw9IlFtQ0TGf7aAdg2A9y0eUvIqO7u4d9Ey0fsvB1dwKo3Zt+F+kHDIo1KNw
	0ZH0jQBTwv5as2BfM+q37J9oy/ng=
X-Google-Smtp-Source: AGHT+IHWT+B2kPrjMSV27EkLHK48sQjR86WXEw2vF+d6EN6V4McJNGq0fj9hEPGktCkx+IOwO69e7jCUxg6Ocl1U/As=
X-Received: by 2002:ac2:4344:0:b0:51a:fac3:416d with SMTP id
 o4-20020ac24344000000b0051afac3416dmr2619853lfl.43.1713766635573; Sun, 21 Apr
 2024 23:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <17C71645B7063D93.20815@lists.openembedded.org>
 <CAC=Bj8jjRVm_6DkhJN15ikuVobP+N0eN9QwKM_d9ZQ5yo6QWzg@mail.gmail.com>
 <CA0E3994-47F0-424B-8116-445FE9A13982@arm.com> <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
In-Reply-To: <CAC=Bj8iMNBDdUVuZZWYd_JT-BgwuLHt2iGEDcrHjTe59_fH8AA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 22 Apr 2024 08:17:03 +0200
Message-ID: <CA+chaQcm+oUS8gkn8UjdmC6N6BRQ9NhXtsxefn50RkYc+xZxzw@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110080

This is now triggering:
ERROR: QA Issue: Recipe LICENSE includes obsolete licenses LGPL-2.1
[obsolete-license]

Looks like it should be LGPL-2.1-only, please send follow-up fix.

On Fri, Apr 19, 2024 at 7:21=E2=80=AFPM Perceval via lists.openembedded.org
<perceval.arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>
> From: Perceval Arenou <perceval.arenou@gmail.com>
>
>
> ---
>  .../aravis/aravis_0.8.31.bb                   | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.=
31.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb b=
/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> new file mode 100644
> index 000000000..52e276c7b
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.31.bb
> @@ -0,0 +1,40 @@
> +SUMMARY =3D "A vision library for genicam based cameras"
> +DESCRIPTION =3D "\
> +    Aravis is a glib/gobject based library for video acquisition using G=
enicam cameras.\
> +    It currently implements the gigabit ethernet and USB3 protocols used=
 by industrial cameras.\
> +    It also provides a basic ethernet camera simulator and a simple vide=
o viewer.\
> +"
> +AUTHOR =3D "Emmanuel Pacaud"
> +HOMEPAGE =3D "https://github.com/AravisProject/aravis"
> +LICENSE =3D "LGPL-2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS +=3D "\
> +    glib-2.0 \
> +    glib-2.0-native \
> +    libxml2 \
> +    zlib \
> +"
> +
> +SRC_URI =3D "https://github.com/AravisProject/aravis/releases/download/$=
{PV}/${BPN}-${PV}.tar.xz"
> +SRC_URI[sha256sum] =3D "9c4ebe6273ed3abe466cb6ed8fa5c132bdd7e9a9298ca43f=
a0212c4311a084da"
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
> +PACKAGECONFIG ?=3D "gstreamer usb viewer"
> +PACKAGECONFIG[gstreamer] =3D "-Dgst-plugin=3Denabled, -Dgst-plugin=3Ddis=
abled, gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG[usb] =3D "-Dusb=3Denabled, -Dusb=3Ddisabled, libusb1,"
> +PACKAGECONFIG[viewer] =3D "-Dviewer=3Denabled, -Dviewer=3Ddisabled, gtk+=
3 gstreamer1.0-plugins-base,"
> +
> +FILES:${PN} +=3D "\
> +    ${datadir} \
> +    ${libdir}/gstreamer-1.0/libgstaravis.0.8.so \
> +"
> --
> 2.43.0
>
>
> On Fri, Apr 19, 2024 at 5:40=E2=80=AFPM Ross Burton <Ross.Burton@arm.com>=
 wrote:
>>
>> On 19 Apr 2024, at 15:58, Perceval via lists.openembedded.org <perceval.=
arenou=3Dptxtrimble.com@lists.openembedded.org> wrote:
>> > +# These options are found in AravisProject/aravis meson_options.txt
>>
>> No need to comment where they came from, this is the only place they can=
 be defined.
>>
>> > +EXTRA_OEMESON +=3D "\
>> > +    -Ddocumentation=3Ddisabled \
>>
>> If would be good to use the gi-docgen class and respect the api-document=
ation DISTRO_FEATURE instead of just turning this off.
>>
>> > +    -Dfast-heartbeat=3Dfalse \
>>
>> Default value, remove.
>>
>> > +    -Dpacket-socket=3Denabled \
>>
>> Can=E2=80=99t you leave this as the default and let Meson detect?
>>
>> > +inherit_defer meson pkgconfig ${@bb.utils.contains('PACKAGECONFIG', '=
introspection', 'gobject-introspection', '', d)}
>>
>> Only defer gobject-introspection, not the others.
>>
>> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled, -Dintros=
pection=3Ddisabled, gobject-introspection,=E2=80=9D
>>
>> The gobject-introspection class will do this for you, remove this line.
>>
>> Ross
>
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
> View/Reply Online (#110064): https://lists.openembedded.org/g/openembedde=
d-devel/message/110064
> Mute This Topic: https://lists.openembedded.org/mt/105577746/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

