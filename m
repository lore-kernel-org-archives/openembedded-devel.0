Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6026BC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 15:42:04 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.19420.1668699716450681177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 07:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O2SNTQl4;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id r76so2224568oie.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 07:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GOWu+8LIu1JhBd3Zo/zrQouZBylhLeLa3SiFHasZbVg=;
        b=O2SNTQl4yldRrR42f1pEdQVyl6oYjJiN2mADUES6tO+uSPZmPF+5zRJq9zYxRuk+2g
         X4ky7+z+JbnvOewb3APZ/laKBCzPKi+cCptJ7hxhqrjDpd0mLh4QfQZGSxdVdVgVXI5J
         jhvyrJ3hghoJyIl0BNXXCM/3VvHYJbxDcHciC+O2J5vrwSe0Ki36Edasa0iuXuVzY98d
         Fu7zqaeUEq0U1aENpsqabXnPsaq0jvWLF/YYRqOT1er4ufl5Qk3JvfPmxA1kn3XLmDAX
         g8qlnAwNuv+rOzn+hxKz8ZTy4rCU7XKji9xS96sxsYnDPotlzJ9RYu2OXd4Ibb2LgGMo
         /yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOWu+8LIu1JhBd3Zo/zrQouZBylhLeLa3SiFHasZbVg=;
        b=VV7oVibB2aWl2q1plztvpTlzILWNIr6WmaL2QFUYYArCFwgDnd9qJi8oykjPhTevBS
         KraA0rmDVF1QgfUowxbtUkUUmW3/Pbw9sEhRMQLRqODwTfEr97EKGDU00Rl1etNiEzi8
         tXqqTmFFv3V52jTqfvCtOT+PP/9zV5UYmaPEeMfBeb7bQNrbmUcfHZoxm1Cz597UaT9J
         /D+5sWLyEGBqUAJZe9hG56Ko8kY2UuOihNgi1//dLQZTBbEhmPe+Xr0HAR6RP9bSKy5O
         K8xW4clNdmmtyujwUCzG2TBmhEJq5y3UzWiEo613YZ6sTt8dx68fMBv7ZhjIYz1+Nv8/
         Ourw==
X-Gm-Message-State: ANoB5pkXfEBm8ZpUVHHqfPaMN0H+ZVmvSkCdq4cuSNIUWxQcjJuV2XJ0
	FvOU5g3v3fGnaVG/rasF4H+R5A1guyNnKPJoGnNYI2u1
X-Google-Smtp-Source: AA0mqf4M1vlFH5sQGyVb25C31e5GC2F5eW5ccdak82S6oK6J2vYv8nE+fEoCNANpZgd4ECvSfVx0L67WSlz7CUPYfrA=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr4143388oiv.55.1668699714737; Thu, 17
 Nov 2022 07:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20221115094410.22736-1-peron.clem@gmail.com> <CAMKF1spy2D7ceKAPOSODVck=6Ph-92N-dtzRVF_6xL-D1LKtaA@mail.gmail.com>
 <CAJiuCccZSi87tEiQADZW6nJ6tr1=-K+u0KiJVmLDQuRzHEuy6w@mail.gmail.com>
In-Reply-To: <CAJiuCccZSi87tEiQADZW6nJ6tr1=-K+u0KiJVmLDQuRzHEuy6w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Nov 2022 07:41:43 -0800
Message-ID: <CAMKF1spF1ufa=OmVN6bAfdupgv+f2NB=KpxvX6aFq27tWQsm-w@mail.gmail.com>
Subject: Re: [oe] [PATCH] navigation: bump proj to 9.1.0 library
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bbe36105edac6d20"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 15:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99610

--000000000000bbe36105edac6d20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 6:00 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:

> Hi Khem,
>
> On Tue, 15 Nov 2022 at 22:03, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > seeing build failures
> > https://errors.yoctoproject.org/Errors/Details/677151/
> > https://errors.yoctoproject.org/Errors/Details/677156/
> >
> > i think the cmake downloading under the nose in do_configure needs to
> > be addressed.
>
> Does an
> EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
>
> Would be acceptable?
>

Since we do not have tests enabled it should be ok


> Thanks
>
> >
> > On Tue, Nov 15, 2022 at 1:44 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com>
> wrote:
> > >
> > > Proj has moved to CMake build system.
> > >
> > > Update the recipe and make more PACKAGECONFIG available following
> > > the ./contrib/oe-stylize.py output.
> > >
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  .../proj/{proj_8.2.1.bb =3D> proj_9.1.0.bb}      | 18
> ++++++++----------
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > >  rename meta-oe/recipes-navigation/proj/{proj_8.2.1.bb =3D>
> proj_9.1.0.bb} (50%)
> > >
> > > diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> > > similarity index 50%
> > > rename from meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> > > rename to meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> > > index 0c1104926..bc3523ec8 100644
> > > --- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> > > +++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> > > @@ -1,22 +1,20 @@
> > >  SUMMARY =3D "PROJ.4 - Cartographic Projections library"
> > >  HOMEPAGE =3D "http://trac.osgeo.org/proj/"
> > >  SECTION =3D "libs"
> > > -
> > >  LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Df27445198ba1500f508fce2b183ce0ff"
> > > +DEPENDS =3D "sqlite3 sqlite3-native"
> > >
> > >  SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> > > +SRC_URI[sha256sum] =3D
> "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553db2315"
> > >
> > > -SRC_URI[sha256sum] =3D
> "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb96d9f12f7e068b1cf"
> > > -
> > > -DEPENDS =3D "sqlite3 sqlite3-native tiff"
> > > -
> > > -inherit autotools pkgconfig lib_package
> > > -
> > > -PACKAGECONFIG ?=3D "curl"
> > > -
> > > -PACKAGECONFIG[curl] =3D ",--without-curl,curl"
> > > +inherit cmake lib_package
> > >
> > >  FILES:${PN} +=3D "${datadir}/proj"
> > >
> > >  BBCLASSEXTEND =3D "native"
> > > +
> > > +PACKAGECONFIG ?=3D "curl"
> > > +PACKAGECONFIG[apps] =3D "-DBUILD_APPS=3DON, -DBUILD_APPS=3DOFF"
> > > +PACKAGECONFIG[curl] =3D "-DENABLE_CURL=3DON,-DENABLE_CURL=3DOFF,curl=
"
> > > +PACKAGECONFIG[tiff] =3D "-DENABLE_TIFF=3DON,-DENABLE_TIFF=3DOFF,tiff=
"
> > > --
> > > 2.34.1
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99607):
> https://lists.openembedded.org/g/openembedded-devel/message/99607
> Mute This Topic: https://lists.openembedded.org/mt/95039613/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bbe36105edac6d20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 17, 2022 at 6:00 AM Cl=C3=A9ment P=C3=A9ron &lt=
;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Khem,<br>
<br>
On Tue, 15 Nov 2022 at 22:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; seeing build failures<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/677151/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/677151/</a><br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/677156/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/677156/</a><br>
&gt;<br>
&gt; i think the cmake downloading under the nose in do_configure needs to<=
br>
&gt; be addressed.<br>
<br>
Does an<br>
EXTRA_OECMAKE =3D &quot;-DBUILD_TESTING=3DOFF&quot;<br>
<br>
Would be acceptable?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Since we do not =
have tests enabled it should be ok</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Thanks<br>
<br>
&gt;<br>
&gt; On Tue, Nov 15, 2022 at 1:44 AM Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D=
"mailto:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt=
; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Proj has moved to CMake build system.<br>
&gt; &gt;<br>
&gt; &gt; Update the recipe and make more PACKAGECONFIG available following=
<br>
&gt; &gt; the ./contrib/oe-stylize.py output.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:pero=
n.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../proj/{<a href=3D"http://proj_8.2.1.bb" rel=3D"noreferre=
r" target=3D"_blank">proj_8.2.1.bb</a> =3D&gt; <a href=3D"http://proj_9.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">proj_9.1.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 | 18 ++++++++----------<br>
&gt; &gt;=C2=A0 1 file changed, 8 insertions(+), 10 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-navigation/proj/{<a href=3D"http://p=
roj_8.2.1.bb" rel=3D"noreferrer" target=3D"_blank">proj_8.2.1.bb</a> =3D&gt=
; <a href=3D"http://proj_9.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pro=
j_9.1.0.bb</a>} (50%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-navigation/proj/<a href=3D"http://pr=
oj_8.2.1.bb" rel=3D"noreferrer" target=3D"_blank">proj_8.2.1.bb</a> b/meta-=
oe/recipes-navigation/proj/<a href=3D"http://proj_9.1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">proj_9.1.0.bb</a><br>
&gt; &gt; similarity index 50%<br>
&gt; &gt; rename from meta-oe/recipes-navigation/proj/<a href=3D"http://pro=
j_8.2.1.bb" rel=3D"noreferrer" target=3D"_blank">proj_8.2.1.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-navigation/proj/<a href=3D"http://proj_=
9.1.0.bb" rel=3D"noreferrer" target=3D"_blank">proj_9.1.0.bb</a><br>
&gt; &gt; index 0c1104926..bc3523ec8 100644<br>
&gt; &gt; --- a/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_8.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">proj_8.2.1.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">proj_9.1.0.bb</a><br>
&gt; &gt; @@ -1,22 +1,20 @@<br>
&gt; &gt;=C2=A0 SUMMARY =3D &quot;PROJ.4 - Cartographic Projections library=
&quot;<br>
&gt; &gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://trac.osgeo.org/proj/" =
rel=3D"noreferrer" target=3D"_blank">http://trac.osgeo.org/proj/</a>&quot;<=
br>
&gt; &gt;=C2=A0 SECTION =3D &quot;libs&quot;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Df27445198ba=
1500f508fce2b183ce0ff&quot;<br>
&gt; &gt; +DEPENDS =3D &quot;sqlite3 sqlite3-native&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://download.osgeo.org/$%7B=
BPN%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downlo=
ad.osgeo.org/${BPN}/${BP}.tar.gz</a>&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;81b2239b94cad0886222cde4f53cb49d349=
05aad2a1317244a0c30a553db2315&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;76ed3d0c3a348a6693dfae535e5658bbfd4=
7f71cb7ff7eb96d9f12f7e068b1cf&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -DEPENDS =3D &quot;sqlite3 sqlite3-native tiff&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -inherit autotools pkgconfig lib_package<br>
&gt; &gt; -<br>
&gt; &gt; -PACKAGECONFIG ?=3D &quot;curl&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -PACKAGECONFIG[curl] =3D &quot;,--without-curl,curl&quot;<br>
&gt; &gt; +inherit cmake lib_package<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 FILES:${PN} +=3D &quot;${datadir}/proj&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG ?=3D &quot;curl&quot;<br>
&gt; &gt; +PACKAGECONFIG[apps] =3D &quot;-DBUILD_APPS=3DON, -DBUILD_APPS=3D=
OFF&quot;<br>
&gt; &gt; +PACKAGECONFIG[curl] =3D &quot;-DENABLE_CURL=3DON,-DENABLE_CURL=
=3DOFF,curl&quot;<br>
&gt; &gt; +PACKAGECONFIG[tiff] =3D &quot;-DENABLE_TIFF=3DON,-DENABLE_TIFF=
=3DOFF,tiff&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99607): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99607" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99607</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95039613/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95039613/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bbe36105edac6d20--

