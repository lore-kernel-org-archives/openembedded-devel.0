Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681BAC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 12:55:41 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.46717.1744030535342010164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 05:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3eTWoO4;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6040465b9e2so2330090eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744030534; x=1744635334; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/p5hsox8npoPW6JMDzHrKtr+rptMAzxTsiMtcHqGqm0=;
        b=e3eTWoO4M/4Xe7JApX/Vtt8i9xqjFg0R0hZB9CGX+E3vcmJkzmtroWOIht3+//ExCC
         IeiVqnRFb7Eaaa5apYtF675OvTPOIIipnBbjbeYwnpdSWYnC90NKjGW8Kwt7fX7v1kzX
         VbHDqdYeklzKYyvMksOcsbcfXIaga6+YAx3gz2cB8KQgJgapbKutGf2fGshYZSrqhku3
         xT17xyMb+dqBC3m23E4DyJ6nZ6XrOcK3Npy1ozpy1g9de7pZQW2hiTiDkdEe4yGEXz+4
         KJJf4WphK1YBZSv6j7k0phbGyYhRPxv6EwQydfDJj1DyFS5zwjU3yqb8asFfYoGKzBLQ
         KMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030534; x=1744635334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p5hsox8npoPW6JMDzHrKtr+rptMAzxTsiMtcHqGqm0=;
        b=jFhLWPmXJeyNXTdRsbLvTJstm8gag8/nNRhX1OvpeyPvpjKv2/g73TMUcXISknBVPi
         fx46fRCTLUN35XVVg4177R4p+LkLt0OQshUysNIAXo0MWXPwlHwMJpwV+Rnk7f+/Tzu1
         eL6o8ItKupzyc1vNyte5nbvoHzBwP8Mbw6A+ZdAWkwnyXn82OWDy589icHDJnie2tzHt
         zJUoos0bgzg4udAPcVzoMjrXvW87Qg6ic0Wh3+BOGZ0vYcIRFMuTBmFgs+czxTFYSF8m
         LdbSVTUTxReUH9VB0y1thrD/ixvl61shNaBcV1jGJ6LHaSppwJmtp3CBz7yIn4CUpxdR
         OBmg==
X-Gm-Message-State: AOJu0Yw6enlndLJeAMqKgDb7xH/XqwNFovtX1WYoO1W1Pe1vL55FWFay
	JlRE0IepYlUcbZKEj/o8Bv6Jm4NtgrKG58WMQzK9Jx028evaauAVcnur9BgfP7cimsFi5CyJQZJ
	G8szuZ2OQ8ogZQob5uqcCrExTULBE7eKz
X-Gm-Gg: ASbGncsOcFdZvd0+C0qMkbfIcfe6n2ghgR3zyu+t4GBGUjctWk79uoS2hkSxoQt6yRT
	TmV5ks1PZB9p1HzXoD1G5Xy3zSyXX5Y3FwEmMY/Bx9n0b2buQ7fQT+tn1XCybuLfaW47WQGxn23
	fdD9xob9O3dhunUAb5Cyxv8KpGmBauGbdvldwhsOjQ6RjAYtCR336ufUeGbA==
X-Google-Smtp-Source: AGHT+IHKcRz7+pT7GM0nvObxHzpZz1iAD+Vh0UW/47Fdki2GINRPwVHk2huQ3YCc88rpUsc3UKr+nZIb/UeFaThvpJM=
X-Received: by 2002:a05:6820:811a:b0:604:2ac:840a with SMTP id
 006d021491bc7-604166fd0e3mr6547403eaf.6.1744030534394; Mon, 07 Apr 2025
 05:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250406072310.862374-1-raj.khem@gmail.com> <20250406072310.862374-2-raj.khem@gmail.com>
 <CA+chaQfcWbx0-6NGXD8HZ9C6_kfj5wm=tc9-X+3HS0cyGE_AtQ@mail.gmail.com>
In-Reply-To: <CA+chaQfcWbx0-6NGXD8HZ9C6_kfj5wm=tc9-X+3HS0cyGE_AtQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Apr 2025 05:55:22 -0700
X-Gm-Features: ATxdqUEZ5j6eJWboNVRgQAekhyI7LwODv99nYAn8jGIRmdvmqIktYpLfbjIFaaE
Message-ID: <CAMKF1sqBMWURUZck6n7ZOE3HJ3ZH+RuoazWM9pTPmjTAU70+rg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/5] icon-slicer: Fix hotspot y coordinates
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007aea3706322fc02b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 12:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116668

--0000000000007aea3706322fc02b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 2:44=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> xcursorgen is available only with x11 in DISTRO_FEATURES, so this should
> get
>
> inherit features_check
> REQUIRED_DISTRO_FEATURES =3D "x11"


Right although I wonder about native version since that is what is used

>
>
> as well, do you want me to send patch with this (and


> packagegroup-meta-oe adjustment)?
>

Please do


> On Sun, Apr 6, 2025 at 9:23=E2=80=AFAM Khem Raj via lists.openembedded.or=
g
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../icon-slicer/files/hotspotfix.patch        | 27 +++++++++++++++++++
> >  .../icon-slicer/icon-slicer_0.3.bb            |  6 +++--
> >  2 files changed, 31 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
> >
> > diff --git a/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patc=
h
> b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
> > new file mode 100644
> > index 0000000000..1f8730aba0
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch
> > @@ -0,0 +1,27 @@
> > +Description: Fix hotspot y coordinate
> > +Author: Tim Swast <tswast@gmail.com>
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +--- a/src/main.c
> > ++++ b/src/main.c
> > +@@ -103,7 +103,7 @@
> > +   if (n_channels =3D=3D 3)
> > +     {
> > +       out->x =3D start_x;
> > +-      out->y =3D start_x;
> > ++      out->y =3D start_y;
> > +       out->width =3D source->gridsize;
> > +       out->height =3D source->gridsize;
> > +
> > +@@ -137,8 +137,8 @@
> > +                   {
> > +                     min_x =3D start_x + i;
> > +                     max_x =3D start_x + i + 1;
> > +-                    min_y =3D start_y + i;
> > +-                    max_y =3D start_y + i + 1;
> > ++                    min_y =3D start_y + j;
> > ++                    max_y =3D start_y + j + 1;
> > +
> > +                     found =3D TRUE;
> > +                   }
> > diff --git a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> > index 991133185f..8079f871d1 100644
> > --- a/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> > +++ b/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb
> > @@ -1,10 +1,12 @@
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079b=
ae19f"
> >
> > -DEPENDS =3D "gdk-pixbuf popt"
> > +DEPENDS =3D "gdk-pixbuf popt xcursorgen"
> >
> >  SRC_URI =3D "
> http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz \
> > -           file://0001-Makefile.am-no-examples.patch"
> > +           file://0001-Makefile.am-no-examples.patch \
> > +           file://hotspotfix.patch \
> > +           "
> >  SRC_URI[sha256sum] =3D
> "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
> >
> >  inherit autotools pkgconfig
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116606):
> https://lists.openembedded.org/g/openembedded-devel/message/116606
> > Mute This Topic: https://lists.openembedded.org/mt/112112278/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000007aea3706322fc02b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 7, 2025 at 2:44=E2=80=AFAM =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">xcursorgen is available onl=
y with x11 in DISTRO_FEATURES, so this should get<br>
<br>
inherit features_check<br>
REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Right although I wonder about native version si=
nce that is what is used=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
as well, do you want me to send patch with this (and</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)" dir=3D"auto"><br>
packagegroup-meta-oe adjustment)?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Please do</div><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-l=
eft:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
On Sun, Apr 6, 2025 at 9:23=E2=80=AFAM Khem Raj via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../icon-slicer/files/hotspotfix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 27 +++++++++++++++++++<br>
&gt;=C2=A0 .../icon-slicer/<a href=3D"http://icon-slicer_0.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">icon-slicer_0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++--<br>
&gt;=C2=A0 2 files changed, 31 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/icon-slicer/files/ho=
tspotfix.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.pat=
ch b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1f8730aba0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/icon-slicer/files/hotspotfix.patch<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +Description: Fix hotspot y coordinate<br>
&gt; +Author: Tim Swast &lt;<a href=3D"mailto:tswast@gmail.com" target=3D"_=
blank">tswast@gmail.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +--- a/src/main.c<br>
&gt; ++++ b/src/main.c<br>
&gt; +@@ -103,7 +103,7 @@<br>
&gt; +=C2=A0 =C2=A0if (n_channels =3D=3D 3)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out-&gt;x =3D start_x;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 out-&gt;y =3D start_x;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 out-&gt;y =3D start_y;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out-&gt;width =3D source-&gt;gridsize;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0out-&gt;height =3D source-&gt;gridsize;<br=
>
&gt; +<br>
&gt; +@@ -137,8 +137,8 @@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0min_x =3D start_x + i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0max_x =3D start_x + i + 1;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 min_y =3D start_y + i;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 max_y =3D start_y + i + 1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 min_y =3D start_y + j;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 max_y =3D start_y + j + 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0found =3D TRUE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
}<br>
&gt; diff --git a/meta-oe/recipes-devtools/icon-slicer/<a href=3D"http://ic=
on-slicer_0.3.bb" rel=3D"noreferrer" target=3D"_blank">icon-slicer_0.3.bb</=
a> b/meta-oe/recipes-devtools/icon-slicer/<a href=3D"http://icon-slicer_0.3=
.bb" rel=3D"noreferrer" target=3D"_blank">icon-slicer_0.3.bb</a><br>
&gt; index 991133185f..8079f871d1 100644<br>
&gt; --- a/meta-oe/recipes-devtools/icon-slicer/<a href=3D"http://icon-slic=
er_0.3.bb" rel=3D"noreferrer" target=3D"_blank">icon-slicer_0.3.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/icon-slicer/<a href=3D"http://icon-slic=
er_0.3.bb" rel=3D"noreferrer" target=3D"_blank">icon-slicer_0.3.bb</a><br>
&gt; @@ -1,10 +1,12 @@<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36c=
aa9b7df079bae19f&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;gdk-pixbuf popt&quot;<br>
&gt; +DEPENDS =3D &quot;gdk-pixbuf popt xcursorgen&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://freedesktop.org/software/$%7=
BBPN%7D/releases/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"=
_blank">http://freedesktop.org/software/${BPN}/releases/${BPN}-${PV}.tar.gz=
</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-no-e=
xamples.patch&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-no-e=
xamples.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hotspotfix.patch \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;05f0216dd0c25a17859de66357f64da5033=
375b6fbf5f31ca54867311160b64d&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#116606): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/116606" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/116606</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11211227=
8/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/112112278/3617156</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000007aea3706322fc02b--

