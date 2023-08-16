Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC8C04A6A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 14:19:19 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.162017.1692195558213022163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CHkBPob/;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1c4de3b9069so2343589fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692195557; x=1692800357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCsKpSlJJBM8jmwfiHO/wBoNQXJa7ctN7ppI5EVd3qc=;
        b=CHkBPob/iMjfP23dFU/s3T15fp4yN5cXWkuLefd938XwtXqLFSMp4+4iIKTmzADzEX
         PCX2mSUpjymBeAO2FgyT59qPdo6Nuw7wVwzytzbn7XQNCdllqNorlGbxGD2sT71ElR/E
         LfHZTQ/K036BZ95wi8FckvpGafJi/HWZ5GoYp2HpXH/NkejEWcmbKQFmwU1jaJ2+IJ4a
         5cWSaf+Hgq1ug7pUn8lwSCSKkBzGBbI4fSgzNvLTmrBs5dIP8mwiFvrgbvzEjoaJ9/9f
         7yRxhd2IWtcn8JKN7TSNeEgaJCDlDu92I21XFlAj8ZCG1MsQgJzH6ACUgo4PC0EjMxlh
         clDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692195557; x=1692800357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCsKpSlJJBM8jmwfiHO/wBoNQXJa7ctN7ppI5EVd3qc=;
        b=euDR2s8z4BcH+uXCCJjlFUN+C7HBCynBKOmerWOSAdkQGJrc41cUIFjHX5qvbZbeUC
         Uq22vr0wYqawGQeKEE32mxGcNthGNx0X4HiuhRMuwBcbiuQbh6NJsFk/8tMtRZ3IV5nj
         21wJ81gk3YBo270t4RKkMExw/zyDzXpk5YlEWGd6K2h0x9l5+JAzb9esv0ornRLe5icu
         im3XwKHbk/v5UE7XEuhysgEFwHBgz7BA3kl+tvtdmws+iukKp55Ob35q7HjTalcR4KSK
         +3tFJpUhk5ylbQOYnOl0NQuDaSJ3kLscaHTVgsCuEY+Z4jTzFw8Na0fDApFjnAKsCHw2
         ZGnw==
X-Gm-Message-State: AOJu0YyvGNy7Jf4ZQvhmrEmf9ExkTUlJOYar0buCezXnPKeKyC/ssN+U
	HJVxNuBLTcfmQ1i+OBFShTi20D6rPXsZye8HgM4=
X-Google-Smtp-Source: AGHT+IHwbxPPP1r4yeWgGtzfGwtlx6m6JRaSXxw+b9urcz6K/sYd7NC9FBncfXL9861iEcNjmLcoaznu+SD/LmYHaos=
X-Received: by 2002:a05:6870:6111:b0:1ba:9e70:a1d4 with SMTP id
 s17-20020a056870611100b001ba9e70a1d4mr2471835oae.54.1692195557407; Wed, 16
 Aug 2023 07:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144304.2395362-1-m.vovard@phytec.de> <20230814144304.2395362-2-m.vovard@phytec.de>
 <CAMKF1spwnmK54urhY_=Pq_TjGXJjoNfd9PFoy6gjcQ6wcSDnQw@mail.gmail.com> <f6312bf8408ddf1c16b006842c6f32fc0535880e.camel@phytec.de>
In-Reply-To: <f6312bf8408ddf1c16b006842c6f32fc0535880e.camel@phytec.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Aug 2023 07:19:06 -0700
Message-ID: <CAMKF1srNSXZ6OWhoYfDnCxYGAkeW0mGHgPWT-9D8aD89LGPKwA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/1] python3-kivy: Remove X11 from REQUIRED_DISTRO_FEATURES
To: Marine Vovard <M.Vovard@phytec.de>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000017010706030afba5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 14:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104428

--00000000000017010706030afba5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 1:29 AM Marine Vovard <M.Vovard@phytec.de> wrote:

> On Mon, 2023-08-14 at 08:17 -0700, Khem Raj wrote:
> > On Mon, Aug 14, 2023 at 7:43=E2=80=AFAM Marine Vovard <M.Vovard@phytec.=
de>
> > wrote:
> > >
> > > We can use pure Wayland and therefore X11 is not required all the
> > > time.
> > >
> >
> > Would it also build when x11 or wayland neither are in
> > DISTRO_FEATURES ?
> > If not then I guess a check should be made to check such that atleast
> > one of these distro
> > features are present.
> >
>
> Indeed, from what I understood you need wayland or x11 (or both)
> to make it work. I'm thinking about adding the following line:
>
> ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
>
> I will send a new patch with this modification if it seems ok.


Sounds good


>
> > > Signed-off-by: Marine Vovard <m.vovard@phytec.de>
> > > ---
> > >  meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-
> > > kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-
> > > kivy_2.1.0..bb
> > > index ca1fc5f96..93894c860 100644
> > > --- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> > > +++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
> > > @@ -43,7 +43,7 @@ export KIVY_GRAPHICS
> > >  KIVY_CROSS_SYSROOT=3D"${RECIPE_SYSROOT}"
> > >  export KIVY_CROSS_SYSROOT
> > >
> > > -REQUIRED_DISTRO_FEATURES +=3D "x11 opengl gobject-introspection-
> > > data"
> > > +REQUIRED_DISTRO_FEATURES +=3D "opengl gobject-introspection-data"
> > >
> > >  DEPENDS +=3D " \
> > >      gstreamer1.0 \
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#104350):
> > > https://lists.openembedded.org/g/openembedded-devel/message/104350
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/100737871/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > > raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>

--00000000000017010706030afba5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Aug 16, 2023 at 1:29 AM Marine Vovard &lt;<a href=
=3D"mailto:M.Vovard@phytec.de">M.Vovard@phytec.de</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Mon, 2023-08-14 at 08:17 -0700, Khem Raj w=
rote:<br>
&gt; On Mon, Aug 14, 2023 at 7:43=E2=80=AFAM Marine Vovard &lt;<a href=3D"m=
ailto:M.Vovard@phytec.de" target=3D"_blank">M.Vovard@phytec.de</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; We can use pure Wayland and therefore X11 is not required all the=
<br>
&gt; &gt; time.<br>
&gt; &gt; <br>
&gt; <br>
&gt; Would it also build when x11 or wayland neither are in<br>
&gt; DISTRO_FEATURES ?<br>
&gt; If not then I guess a check should be made to check such that atleast<=
br>
&gt; one of these distro<br>
&gt; features are present.<br>
&gt; <br>
<br>
Indeed, from what I understood you need wayland or x11 (or both)=C2=A0<br>
to make it work. I&#39;m thinking about adding the following line:<br>
<br>
ANY_OF_DISTRO_FEATURES =3D &quot;x11 wayland&quot;<br>
<br>
I will send a new patch with this modification if it seems ok.</blockquote>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Sounds good=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
&gt; &gt; Signed-off-by: Marine Vovard &lt;<a href=3D"mailto:m.vovard@phyte=
c.de" target=3D"_blank">m.vovard@phytec.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb =
| 2 +-<br>
&gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/python3-<br>
&gt; &gt; kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-<br>
&gt; &gt; kivy_2.1.0..bb<br>
&gt; &gt; index ca1fc5f96..93894c860 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb<=
br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb<=
br>
&gt; &gt; @@ -43,7 +43,7 @@ export KIVY_GRAPHICS<br>
&gt; &gt; =C2=A0KIVY_CROSS_SYSROOT=3D&quot;${RECIPE_SYSROOT}&quot;<br>
&gt; &gt; =C2=A0export KIVY_CROSS_SYSROOT<br>
&gt; &gt; <br>
&gt; &gt; -REQUIRED_DISTRO_FEATURES +=3D &quot;x11 opengl gobject-introspec=
tion-<br>
&gt; &gt; data&quot;<br>
&gt; &gt; +REQUIRED_DISTRO_FEATURES +=3D &quot;opengl gobject-introspection=
-data&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0DEPENDS +=3D &quot; \<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 gstreamer1.0 \<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#104350):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/104350" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/104350</a><br>
&gt; &gt; Mute This Topic:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/mt/100737871/1997914" r=
el=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/10073=
7871/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/un=
sub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/=
openembedded-devel/unsub</a>=C2=A0[<br>
&gt; &gt; <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--00000000000017010706030afba5--

