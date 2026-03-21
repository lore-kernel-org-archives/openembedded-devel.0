Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F38108B8FF
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 02:26:54 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4616.1774060005741210217
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 19:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l04kT1FU;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad8435f46so1392359d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 19:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774060005; cv=none;
        d=google.com; s=arc-20240605;
        b=IL12OQy0mwM1+3ivWf8a0LOnz7iob9bux9DrFp1yUnL/REC6ps4AnKAA4uNZhmb9wO
         GuvPqNsQBZm0RMMF3SphdWY5E7TU+5nvWQV5mqFVK/0UdP5cdxtCtJnpwKd9Yx5MfF1m
         /ty7K2AhRFo7bO29RtrUASnZRnU+h6K5QvLCOBcvXiPpAOIfGr+lsFfa88XTlseR+oFG
         NVzH4cw5XVQz+ilVP+KsbIccqYlYWyjkN+iDuBy6evKmBIps1TeikHAiY2HXSN4N2Y6V
         hL/MaLSFTJXjIErN/l2UU0fG3PQJBZcsehGJi1PSh4oFSBVCmQV27l2fJrhpOYgoFoaz
         po4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FqD1EfdendKR65q/ZJxf5YK4e5sxeY0/ke94I2Dr4zo=;
        fh=BSkuUgjIc2Bb4WoHJZz3PP1EFmQPgT69KaVvxICSkAw=;
        b=PKA37Lh5ORzgT3GXBh+2bhq+A/+xwJ7LxWxxLS6nhduhjTop5IihIw7XTVdaU7DIKO
         Cs9J4INJUgymUNsv64QSMCFli+NpulPW79OCMPF71zx+CnJLjsJiOtTsDYAjgiZMHn83
         acaYvu5x6l7D7wNAY8XBFwnRSCpsP7nZadUJOkWas1lqbhhY81b7gs5XnD+esGqfbls/
         X1fy8MZiiSFahmh/cTxW0b0IuhPoBaIue1Z+OYDUSpPwy4DzsQK/G294td/1/GfUW2B5
         NtS7nwDaiXmjN1MM5BF1iPEVHkqNT7vKiiBvWkak8qRjrKwoaGsi281x35ZTwSPakZPz
         FDUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774060005; x=1774664805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FqD1EfdendKR65q/ZJxf5YK4e5sxeY0/ke94I2Dr4zo=;
        b=l04kT1FURHLE5VCMW8BdPjAwoJSKjVV8Ycu9VJ7q3Qi30y4JUYD7uVEwmNyxDT6xb9
         0ftVD60AD0uu9t5R/+bowyzjrHrMuy0vKBgJq3EJW05HNRZmCe0S7WlViacensK8ICpE
         euyyLNFDrYkoyo73tR3w3ozt8JWHWo9SfvDyBLgrrNVQi1p+S45SAAuvh03YR4a9U+fy
         xH97qXufXjib4hWPP6baTInzQGi50TMXUXrtnHIKFjQJG1wT6m7kEOe97pvoFNQp4Zve
         DbWdQworEtCTtt4YmJ6OFeOanRJauBjZQk+Bd95zEGjOQAI3+jL0VT7qfu6U0QMks0Fo
         mNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774060005; x=1774664805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqD1EfdendKR65q/ZJxf5YK4e5sxeY0/ke94I2Dr4zo=;
        b=Rm09XC5DWEFVazkbYWH7yjeH1bJHMcWlLuZmoQ7vBbdblG3dDXBFG8lL22BWr8ErHe
         KfaROHwLsScsqZ6rY2PoaMo0DYHtKkW6U05xoEHV87MttS8GMB/0dQJAzgCKn/QKsIcW
         EbApyAVX3ZKbpKAvWzdmV7Et8QmeBfP61R9o8Ed1T3P8bRAFaHdW0ZGNhbj7CNoCErbn
         SMMgoaXQIG//vtqxv+FYDAiuNo9G2fSOCd+W1qjokr0o+Zp9a5KnmedUQ/7ogFpgGv5j
         COIHt+7LgMx2BVXO7dczt7WOI2RxY6XbReSKG2ueSuUBT0+h0Mz9PpflOUCI3ESYqHt3
         UhfA==
X-Gm-Message-State: AOJu0YzA33PwodFEQ4w8hhZvwsHnNd9zm3e8V22xQX59f7z9oPRUp6bT
	Dx/NBnpEHRxapq41ZeR6dSKvJVL6KVZsAaCGT+PsKAmIcuf6jdrtQ5xUOIL8QM0wEeUIzbosCTv
	H/uljLcX23ypKmqtH2+IhS5p3biqa56A=
X-Gm-Gg: ATEYQzyMh3+6BIF+EtaWGPa+hA1MrDp6dsv3Saspf9e0j4tUQfXBp9Zu90tqkZeWH79
	XL0/KuPnFfGh5e2S7sd3clYduYi5O5lWK5V4a1Te5Jq2FJ2Be9HrvKKOBOIvB3aCr/o97Mex+EW
	PmDgjRwppNWCm+AMUsNKDfPXZMETNJ9JxdCzuzDvi6qUVFa2iTrWfC3uXoPHpvyJCi9CjGWo2Ab
	xzU9jCNgwX7gK40ya3v9xJ5FtwBlf0cX+sAqwiwUa22MgCo9htmUrvFuU8Qjr7RS69THkhFFEUV
	f4cSEB+dESu5qkRIsO/Dmw4hIMneY1dE/Os8sZXpz8u10Vrmpxmb5mR2LK9jK4CqcU1VpassJQF
	aYi0wzD8PaghvMJpNEXvG06FqxywemSkeyao=
X-Received: by 2002:a53:a58a:0:b0:64c:9ec3:d71a with SMTP id
 956f58d0204a3-64eaa7debd7mr4058643d50.48.1774060004702; Fri, 20 Mar 2026
 19:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
 <20260320170155.1413929-4-khem.raj@oss.qualcomm.com> <CADySD0G3Op8pxc8q7JzguP3t4ZhHTAJg+ej5p5Z=8RAUrqafhw@mail.gmail.com>
In-Reply-To: <CADySD0G3Op8pxc8q7JzguP3t4ZhHTAJg+ej5p5Z=8RAUrqafhw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Mar 2026 19:26:33 -0700
X-Gm-Features: AaiRm51-j90eQoFWmTH-Bk3EaLDrO-aSwREOiPfrBeevxacVdwKiHlDNtwgOW5A
Message-ID: <CAMKF1srbjng5uya-vRJ6gPWMQycMOWAszy-WvyLnHvBxUS6U+w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 4/8] libgedit-gfls: Add recipe
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000063ff27064d7f88be"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 02:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125457

--00000000000063ff27064d7f88be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026, 7:24=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.com>=
 wrote:

> On Sat, Mar 21, 2026 at 6:02=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-gnome/gedit/libgedit-gfls_0.3.1.bb   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >  create mode 100644 meta-gnome/recipes-gnome/gedit/
> libgedit-gfls_0.3.1.bb
> >
> > diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
> b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
> > new file mode 100644
> > index 0000000000..8b64661733
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gfls_0.3.1.bb
> > @@ -0,0 +1,16 @@
> > +SUMMARY =3D "Gedit Technology - File loading and saving"
> > +SECTION =3D "gnome"
> > +LICENSE =3D "LGPL-3.0-or-later"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3eef3be114124d11349ca0d7=
e117"
> > +
> > +DEPENDS =3D "glib-2.0 gtk+3"
> > +
> > +inherit gobject-introspection features_check gtk-doc gnomebase
> > +
> > +SRC_URI =3D "git://
> gitlab.gnome.org/World/gedit/libgedit-gfls.git;branch=3Dmain;protocol=3Dh=
ttps"
>
> can please also include tag=3D${PV} in the SRC_URI
>

It has to be a followup but good point thanks

>
> > +SRCREV =3D "0a0c8dd29ae2f9f4a99cbaaf1628d2352953e0bc"
> > +
> > +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> > +
> > +GIR_MESON_OPTION =3D "gobject_introspection"
> > +GTKDOC_MESON_OPTION =3D "gtk_doc"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#125445):
> https://lists.openembedded.org/g/openembedded-devel/message/125445
> > Mute This Topic: https://lists.openembedded.org/mt/118421466/3619737
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000063ff27064d7f88be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2026, 7:24=E2=80=
=AFPM Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyag=
i85@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sat, Mar 21, 2026 at 6:02=E2=80=AFAM Khem Raj via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-gnome/gedit/<a href=3D"http://libgedit-gfls_0.3.1.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">libgedit-gfls_0.3.1.bb</a=
>=C2=A0 =C2=A0| 16 ++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 16 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-gnome/recipes-gnome/gedit/<a href=3D"htt=
p://libgedit-gfls_0.3.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>libgedit-gfls_0.3.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/gedit/<a href=3D"http://libgedit=
-gfls_0.3.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgedit-gf=
ls_0.3.1.bb</a> b/meta-gnome/recipes-gnome/gedit/<a href=3D"http://libgedit=
-gfls_0.3.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgedit-gf=
ls_0.3.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8b64661733<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-gnome/recipes-gnome/gedit/<a href=3D"http://libgedit-gfls_0=
.3.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">libgedit-gfls_0.3.=
1.bb</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +SUMMARY =3D &quot;Gedit Technology - File loading and saving&quot;<br=
>
&gt; +SECTION =3D &quot;gnome&quot;<br>
&gt; +LICENSE =3D &quot;LGPL-3.0-or-later&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSES/LGPL-3.0-or-later.txt;md5=
=3Dc51d3eef3be114124d11349ca0d7e117&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;glib-2.0 gtk+3&quot;<br>
&gt; +<br>
&gt; +inherit gobject-introspection features_check gtk-doc gnomebase<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://gitlab.gnome.org/World/gedi=
t/libgedit-gfls.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer noref=
errer" target=3D"_blank">gitlab.gnome.org/World/gedit/libgedit-gfls.git;bra=
nch=3Dmain;protocol=3Dhttps</a>&quot;<br>
<br>
can please also include tag=3D${PV} in the SRC_URI<br></blockquote></div></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">It has to be a followup b=
ut good point thanks=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote=
 gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +SRCREV =3D &quot;0a0c8dd29ae2f9f4a99cbaaf1628d2352953e0bc&quot;<br>
&gt; +<br>
&gt; +ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
&gt; +<br>
&gt; +GIR_MESON_OPTION =3D &quot;gobject_introspection&quot;<br>
&gt; +GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#125445): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/125445" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/125=
445</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11842146=
6/3619737" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/118421466/3619737</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ankur.ty=
agi85@gmail.com" target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail.c=
om</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--00000000000063ff27064d7f88be--

