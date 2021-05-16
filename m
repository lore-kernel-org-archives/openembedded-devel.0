Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.3784.1621153600938584136
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 01:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y/l8LhlX;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id v18so1714001qvx.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0+VcTy17yT1br5JHXpEdZq1hLp9uapiWj+VqICj6uf4=;
        b=Y/l8LhlXK3Pmyn+X6ECRqpRUZx3gKi88ntEVWEQJzZwhtVuK+d0FCOjcf1uwIcKtZT
         d9AYX6acMkPkoYWSKS7DbKDntTrb4V282aWygsbiZlUCLx/FbCsofjENNm2GAbqef+7t
         8YoeTBC0zAPl/SLjLzIUOqVRoesYUUETsfOLuGWi2gSYWZQSyFPvDmUlKoWLeT6pMc1c
         0X4p2MxaoyQoBRItA3GRC7KdnPwpz233QCdaYB0S8thjltGP3vzTNIGfSwaYsZpJ+rAt
         4UUnr3dfKBPa8bgpMxZHcvN8npJ8KG8wzNR7JL09g6MGFycTpjpOj4eDfZl4UOenUbor
         QS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0+VcTy17yT1br5JHXpEdZq1hLp9uapiWj+VqICj6uf4=;
        b=NDRNQlnG8EfjUEzjua7fOCm4u4ZR6Oi/859lDxdr4QMcitrOMVQVVAfovprLdCOdai
         b9JkVrtdfwgHoeDRx+Aes/U2BEAHX2gI+sppNJ6OYPh7sttM6yPgc4xEI7CbNi5WDpcp
         OxESbzeHhyHLJpb4xAcrc9OIWFWWk+w854sv/9sxLS3H2FrX55MxgKD81ZAu65/KNKtd
         a9drVsluO77hQFGzgKdGZ68WFBGPaZ03LBIGCOLrYGfMPpRc4XFnaNmosbx9gv0AcjGd
         syD0itg0Rw8gtaubMn7b0KFc2la/ft2sutQu8PuVvL8MyyQJF3LefyGSz16NKn6yVOjh
         UXag==
X-Gm-Message-State: AOAM532sp+KvwxxxC3Q7bQR+bG3BWHoek4IQkFoWVXXhHCUAITXj5uUM
	YIhDNof45DnOgRjd1+AjGSZvRwQJPVjWsqRlxx0=
X-Google-Smtp-Source: ABdhPJxq1BvCTYF1HadLTr4dMhU3AOE6JkXYpe/DGUhCMoOd2WXolW52IoVZikg+Hi7wy/lD6Rg7o6v/5Zx4BpueE38=
X-Received: by 2002:a0c:ee23:: with SMTP id l3mr54504328qvs.55.1621153599979;
 Sun, 16 May 2021 01:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-15-schnitzeltony@gmail.com> <104112c6-ce22-ce7f-1d35-73bde2ca6e38@gmail.com>
 <CALbNGRR3i9-6aPmAShi+GKMObDB_F3N5rgGCS7y=pWYwWv2=0Q@mail.gmail.com>
In-Reply-To: <CALbNGRR3i9-6aPmAShi+GKMObDB_F3N5rgGCS7y=pWYwWv2=0Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 16 May 2021 01:26:29 -0700
Message-ID: <CAMKF1soSf6tBdAMof7VbWokEjiNx17SS2ajSqPm-MSV9yTwK6w@mail.gmail.com>
Subject: Re: [oe] [PATCH 15/20] gegl: add PACKAGECONFIG libraw and enable it by default
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000074023805c26e3c00"

--00000000000074023805c26e3c00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 16, 2021 at 12:57 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om>
wrote:

> On Sun, May 16, 2021 at 3:07 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On 5/15/21 4:38 PM, Andreas M=C3=BCller wrote:
> > > Without gnome-photos fails to start and complains:
> > > | (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.154:
> Unable to find GEGL operation gegl:raw-load: Check your GEGL install
> > > | (org.gnome.Photos:952): gnome-photos-CRITICAL **: 08:02:54.154:
> photos_application_create_window: assertion 'gegl_sanity_checked' failed
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >   meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> > > index d08a3a3c9..06abf799e 100644
> > > --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> > > +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> > > @@ -28,7 +28,7 @@ SRC_URI =3D " \
> > >   "
> > >   SRC_URI[sha256sum] =3D
> "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
> > >
> > > -PACKAGECONFIG ??=3D "gexiv2 jpeg libpng librsvg sdl2"
> > > +PACKAGECONFIG ??=3D "gexiv2 jpeg libpng libraw librsvg sdl2"
> > >   PACKAGECONFIG_class-native =3D "libpng librsvg"
> > >
> > >   PACKAGECONFIG[jasper] =3D "-Djasper=3Denabled,-Djasper=3Ddisabled,j=
asper"
> > > @@ -38,6 +38,7 @@ PACKAGECONFIG[jpeg] =3D
> "-Dlibjpeg=3Denabled,-Dlibjpeg=3Ddisabled,jpeg"
> > >   PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
> > >   PACKAGECONFIG[libav] =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,liba=
v"
> > >   PACKAGECONFIG[libpng] =3D "-Dlibpng=3Denabled,-Dlibpng=3Ddisabled,l=
ibpng"
> > > +PACKAGECONFIG[libraw] =3D "-Dlibraw=3Denabled,-Dlibraw=3Ddisabled,li=
braw"
> >
> > there is no libraw recipe in core or meta-oe or meta-gnome we only have
> > libraw1394
> >
> I did not check properly - it is in meta-qt5-extra. Will send V2 adding
> libraw
>

I already sent a patch


> Cheers
>
> Andreas
>

--00000000000074023805c26e3c00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 16, 2021 at 12:57 AM Andreas M=C3=BCller &lt;<a=
 href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;borde=
r-left-color:rgb(204,204,204)">On Sun, May 16, 2021 at 3:07 AM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 5/15/21 4:38 PM, Andreas M=C3=BCller wrote:<br>
&gt; &gt; Without gnome-photos fails to start and complains:<br>
&gt; &gt; | (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.154: =
Unable to find GEGL operation gegl:raw-load: Check your GEGL install<br>
&gt; &gt; | (org.gnome.Photos:952): gnome-photos-CRITICAL **: 08:02:54.154:=
 photos_application_create_window: assertion &#39;gegl_sanity_checked&#39; =
failed<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitze=
ltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0=
.4.30.bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.30.bb</a> | 3 ++-<b=
r>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_=
0.4.30.bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.30.bb</a> b/meta-g=
nome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.30.bb" rel=3D"noreferrer"=
 target=3D"_blank">gegl_0.4.30.bb</a><br>
&gt; &gt; index d08a3a3c9..06abf799e 100644<br>
&gt; &gt; --- a/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.30.=
bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.30.bb</a><br>
&gt; &gt; +++ b/meta-gnome/recipes-gimp/gegl/<a href=3D"http://gegl_0.4.30.=
bb" rel=3D"noreferrer" target=3D"_blank">gegl_0.4.30.bb</a><br>
&gt; &gt; @@ -28,7 +28,7 @@ SRC_URI =3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;c112782cf4096969e23217cc=
dfabe42284e35d5435ff0c43d40e4c70faeca8dd&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PACKAGECONFIG ??=3D &quot;gexiv2 jpeg libpng librsvg sdl2&quot;<=
br>
&gt; &gt; +PACKAGECONFIG ??=3D &quot;gexiv2 jpeg libpng libraw librsvg sdl2=
&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG_class-native =3D &quot;libpng librsvg&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[jasper] =3D &quot;-Djasper=3Denabled,-D=
jasper=3Ddisabled,jasper&quot;<br>
&gt; &gt; @@ -38,6 +38,7 @@ PACKAGECONFIG[jpeg] =3D &quot;-Dlibjpeg=3Denabl=
ed,-Dlibjpeg=3Ddisabled,jpeg&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[lcms] =3D &quot;-Dlcms=3Denabled,-Dlcms=
=3Ddisabled,lcms&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[libav] =3D &quot;-Dlibav=3Denabled,-Dli=
bav=3Ddisabled,libav&quot;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[libpng] =3D &quot;-Dlibpng=3Denabled,-D=
libpng=3Ddisabled,libpng&quot;<br>
&gt; &gt; +PACKAGECONFIG[libraw] =3D &quot;-Dlibraw=3Denabled,-Dlibraw=3Ddi=
sabled,libraw&quot;<br>
&gt;<br>
&gt; there is no libraw recipe in core or meta-oe or meta-gnome we only hav=
e<br>
&gt; libraw1394<br>
&gt;<br>
I did not check properly - it is in meta-qt5-extra. Will send V2 adding lib=
raw<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I already sent a=
 patch=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-st=
yle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Cheers<br>
<br>
Andreas<br>
</blockquote></div></div>

--00000000000074023805c26e3c00--
