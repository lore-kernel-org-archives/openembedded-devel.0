Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7361A7F32C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:01:35 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d79so4911045qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BR/NfD73nKbN2RWjh6MK6ger5mYR/MNBhObBygG/PKQ=;
	b=jHrHKlOQlm67hX1rWG9dsxU+gKwWTq/A3GsFJ0mM1Nkkmyv9dBeoAVN0Z9vdJ2cbzq
	lMuC09voslfWdWZtaF5+Sxmx0d4ahgiZn2FPjFrlEp7WmmNKMhGzeBh8OmGWzVlnz+KY
	RB9WxmXOC26gE3F0qZJLvUBBz6ZrVPrQ2N9e+0wyTBtmWCPIYy5IrKB+ArGsz3CMFjkL
	FWoAqp3mTFgF4b4znfQcK+gig9/rUCeTADI+my0xqkytE0UpIckQnePYEQSYvrCCwRO+
	k7KZjeWBV2nsf5k/B2CyvAw+BYuYoCydNJ7Z8M++GESoC6YVEk9Yo/Stk9/y6HBYXwu2
	r4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BR/NfD73nKbN2RWjh6MK6ger5mYR/MNBhObBygG/PKQ=;
	b=cgpo304uC5PGTYTWrdWX3c2eI4Q2L8tqhWYfRbhDe7QoaDGCKvyjp3AeY1ovSD//+e
	NkOWi/attHKgqpC7a0QisA3tTCurtCYjnl9AGAe2feg7ozqRcewJ+UqsyAndDbuMMl61
	gnASCF+SNocz2jc8k1tNQofPvWPBfm7lYr5+/kOaDTsLnBY0w07Qx7/wz4tp6MReOuYU
	n+xB1HdIRO8Mhy3602XsZOyH4rdhAB5FapWBC+dAtJ9OBE1ADXCdsBtgj+TXjvNc+2z8
	vh46sh/5DxAou7663vZ6YCQru2Hva8z6r5WjfJ2PKFvpBtB/71XLXA/mSTryuHUlt/j6
	E9Og==
X-Gm-Message-State: APjAAAXXBXu5WegRb7tln45q1jfoPDYwtLjdMiXwMfOPqoUpr8Kaytrj
	BRXltGA2PiI5shLPPwxJf5Hpmz/XGLRfjS8H994=
X-Google-Smtp-Source: APXvYqxl+SCW0r1478ethQsau1kBSpxGjeGP2Bzg6hF2dBT/at4iH8NgXJxsntY7AdHAo788ElL7pmV1uQCayBbXOeE=
X-Received: by 2002:a37:ef1a:: with SMTP id j26mr9621206qkk.474.1565967696048; 
	Fri, 16 Aug 2019 08:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
	<20190815215605.19600-11-schnitzeltony@gmail.com>
	<c58bea78-1db2-ee2e-f26f-ec6c323018e3@windriver.com>
In-Reply-To: <c58bea78-1db2-ee2e-f26f-ec6c323018e3@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 08:01:09 -0700
Message-ID: <CAMKF1srFj5J3ASk0uK7z0a0pU0zCwyYEhZo8m=ptmy9OSG3nmQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 10/13] parole: upgrade 1.0.2 -> 1.0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 15:01:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2019 at 11:07 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/16 =E4=B8=8A=E5=8D=885:56, Andreas M=C3=BCller wrote:
> > Bufixe release
>
> A typo here. Others are fine with me.
>
> Acked-by: Kai Kang <kai.kang@windriver.com>
>

Thanks pulled into master-next.

> Regards,
> Kai
>
>
>
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >   .../parole/{parole_1.0.2.bb =3D> parole_1.0.4.bb}       | 11 ++++----=
---
> >   1 file changed, 4 insertions(+), 7 deletions(-)
> >   rename meta-xfce/recipes-multimedia/parole/{parole_1.0.2.bb =3D> paro=
le_1.0.4.bb} (72%)
> >
> > diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb b/meta=
-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> > similarity index 72%
> > rename from meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
> > rename to meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> > index a286a5adb..68556a2ab 100644
> > --- a/meta-xfce/recipes-multimedia/parole/parole_1.0.2.bb
> > +++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
> > @@ -1,15 +1,12 @@
> >   DESCRIPTION =3D "Parole is a modern simple media player based on the =
GStreamer framework"
> > -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/parole"
> > +HOMEPAGE =3D "https://docs.xfce.org/apps/parole/start"
> >   LICENSE =3D "GPLv2"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552"
> >
> >   inherit xfce-app gtk-doc mime
> >
> >   DEPENDS +=3D " \
> > -    glib-2.0 \
> >       dbus-glib \
> > -    gtk+3 \
> > -    \
> >       xfce4-dev-tools-native \
> >       libxfce4util \
> >       libxfce4ui \
> > @@ -19,8 +16,8 @@ DEPENDS +=3D " \
> >       taglib \
> >   "
> >
> > -SRC_URI[md5sum] =3D "cd22ab579470c5728db0aa6c0b9d4c7d"
> > -SRC_URI[sha256sum] =3D "bff0fc846d0d7b8f435ac5514976f1cd1d82b62dbf1b7d=
470e253a5b439407da"
> > +SRC_URI[md5sum] =3D "c23621eb44df292f828e86074d4e719d"
> > +SRC_URI[sha256sum] =3D "e92b8ec369e53d921b47d2473c2e2a1e9e04d3c5d536d4=
19abdff40e5e136dc1"
> >
> >   RDEPENDS_${PN} +=3D "gstreamer1.0-plugins-good"
> >
> > @@ -31,6 +28,6 @@ PACKAGECONFIG[clutter] =3D "--enable-clutter, --disab=
le-clutter, clutter"
> >   PACKAGECONFIG[notify] =3D "--enable-notify-plugin, --disable-notify-p=
lugin, libnotify"
> >
> >   FILES_${PN} +=3D " \
> > -    ${datadir}/appdata \
> > +    ${datadir}/metainfo \
> >       ${libdir}/parole-0/*.so \
> >   "
>
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

