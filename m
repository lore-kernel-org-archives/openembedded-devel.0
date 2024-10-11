Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E1AD0D7BC
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:34:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.14897.1728660852589637512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QVMmT5kr;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4311c575172so10392175e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728660851; x=1729265651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oqlydo+m4obdtMlwpXXX+zvLZqXecH7M0pyFlLNisvE=;
        b=QVMmT5krLOkCeD7xcsgtoQJWd2hpY1NUhYNz0cAXRKk5sxgvihffcHroPNhdSvReO5
         rcTWTLCF4+0eSoMhQNFFefC8Sz0jG+iU12FYI9pJBhCBDr6i4uzCuT/pI09M58NOWI7n
         CCICTI5GJnnPfWHRMIIkX5Esga+q7wWShgBQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728660851; x=1729265651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqlydo+m4obdtMlwpXXX+zvLZqXecH7M0pyFlLNisvE=;
        b=NVYkb5X5YVzKlMtiRoWvSfjxU6mdPUAMTrMhK8geLxM7wbbL2PuQ+rZwi6u43eguw1
         xfk0WnCIQRVykNNR66wzzogh6B08vj0MAtdOxXqzdLGTHuIsGMktOQSxTxmIm25AE7sY
         9BEhkMjT+mp6Qn151EYoeKdOV/iPyGU7ycHuE3xofvFIYNcHpEn0nTZYDd74KrRJQ22P
         rWYfGR3BJJaNG2Hu81lUTAT0P3fYGN0Yh90htNyKiwXGlcHplkQRNGeHMOltKsyfM5vK
         SQOuRliq3GoHNchrHBEVkByCqRR75ieGRIoXsDWzlN8eJCEDjX1ObVM+QcWLeFnasDF8
         l3Ew==
X-Gm-Message-State: AOJu0YwWUWzkpqbdElsZnP6MZ8MB5Co8/6KvDkZ3ye6K5igY8XnBWHQn
	6OKaN7UEiNeP0lktro1wFLXWviLsU4B3U5/neviriBk8WVlU73u5NP3Sm6Z0WDzt7Mj/lXFaLu5
	Zokfu1v/a78uxoxwv2AtOW0xqt4HKHPdsSaMypA==
X-Google-Smtp-Source: AGHT+IEXDa9K0+wYLQNaaEfERBtN7Ijef5UkCA6bfClKwpXY87/MXDRSrlRjuz1vT1ApnwsZlcWvYQude1H918Oq0/8=
X-Received: by 2002:a05:600c:3b92:b0:426:61e8:fb3b with SMTP id
 5b1f17b1804b1-4311df56f30mr22735755e9.27.1728660850917; Fri, 11 Oct 2024
 08:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241011151023.1516957-1-yoann.congal@smile.fr> <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
In-Reply-To: <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 11 Oct 2024 17:33:44 +0200
Message-ID: <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f4de4d06243537ee"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112809

--000000000000f4de4d06243537ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 11 oct. 2024 =C3=A0 17:15, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > gimptool can be used in GIMP plugin compilation. It would make more
> > sense as a native tool. It also contains the sysroot path which break
> > build with buildpaths QA error. Remove it from target packages.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> > index a17e03b103..8755af94a9 100644
> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> > @@ -70,6 +70,13 @@ do_compile:prepend() {
> >      export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -nam=
e
> 'gegl-*'`
> >  }
> >
> > +do_install:append:class-target() {
> > +    # gimptool can be used in GIMP plugin compilation. It would make
> more sense
> > +    # as a native tool. It also contains the sysroot path which break
> build
> > +    # with buildpaths QA error. Remove it from target packages.
> > +    rm ${D}/${bindir}/gimptool-2.0
> > +}
>
> it does mean we can't build plugins in a usecase where an on-device
> SDK is being used, even though it is a rare usecase.
> Can we explore a way to omit the sysroot from being emitted into the
> target version of gimptool ?
>

Sure!

Right now, Host CC is embedded in the target binary as a last-resort
default to make gimptool output a reasonable CC for gimp plugins
compilation.
I don't see how to provide a good value to put there unless I can get the
CC that will be used in the target SDK? (I don't think I can)

What do you think about removing this last-resort default with a patch?
That would make gimptool dependent on a correct CC being provided to it
(but the target SDK should already do that)


> > +
> >  FILES:${PN}  +=3D "${datadir}/metainfo"
> >
> >  RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112807):
> https://lists.openembedded.org/g/openembedded-devel/message/112807
> > Mute This Topic: https://lists.openembedded.org/mt/108950447/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000f4de4d06243537ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 11 oct. 2024 =C3=A0=C2=
=A017:15, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via<b=
r>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.f=
r@lists.openembedded.org" target=3D"_blank">smile.fr@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; gimptool can be used in GIMP plugin compilation. It would make more<br=
>
&gt; sense as a native tool. It also contains the sysroot path which break<=
br>
&gt; build with buildpaths QA error. Remove it from target packages.<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" =
rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a> | 7 +++++++<br>
&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.=
38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a> b/meta-gnom=
e/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gimp_2.10.38.bb</a><br>
&gt; index a17e03b103..8755af94a9 100644<br>
&gt; --- a/meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" =
rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a><br>
&gt; +++ b/meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" =
rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a><br>
&gt; @@ -70,6 +70,13 @@ do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} =
-maxdepth 1 -name &#39;gegl-*&#39;`<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +do_install:append:class-target() {<br>
&gt; +=C2=A0 =C2=A0 # gimptool can be used in GIMP plugin compilation. It w=
ould make more sense<br>
&gt; +=C2=A0 =C2=A0 # as a native tool. It also contains the sysroot path w=
hich break build<br>
&gt; +=C2=A0 =C2=A0 # with buildpaths QA error. Remove it from target packa=
ges.<br>
&gt; +=C2=A0 =C2=A0 rm ${D}/${bindir}/gimptool-2.0<br>
&gt; +}<br>
<br>
it does mean we can&#39;t build plugins in a usecase where an on-device<br>
SDK is being used, even though it is a rare usecase.<br>
Can we explore a way to omit the sysroot from being emitted into the<br>
target version of gimptool ?<br></blockquote><div><br></div><div>Sure!</div=
><div><br></div><div>Right now, Host CC is embedded in the target binary as=
 a last-resort default to make gimptool output a reasonable CC for gimp plu=
gins compilation.</div><div>I don&#39;t see how to provide a good value to =
put there unless I can get the CC that will be used in the target SDK? (I d=
on&#39;t think I can)</div><div><br></div><div>What do you think about remo=
ving this last-resort default with a patch? That would make gimptool depend=
ent on a correct CC being provided to it (but the target SDK should already=
 do that)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">

&gt; +<br>
&gt;=C2=A0 FILES:${PN}=C2=A0 +=3D &quot;${datadir}/metainfo&quot;<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;mypaint-brushes-1.0&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#112807): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/112807" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/112807</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10895044=
7/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/108950447/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000f4de4d06243537ee--

