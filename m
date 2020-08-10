Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
 by mx.groups.io with SMTP id smtpd.web10.52568.1597086965224197820
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 12:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tforejbw;
 spf=pass (domain: gmail.com, ip: 209.85.221.193, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f193.google.com with SMTP id r197so2093206vkf.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2020 12:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LKqk1R31Ofc4zjJWJRsGGew5MIyJHIesDVEuKheEZC4=;
        b=tforejbw0MbsnqmWI/Hweu+18HD9NREF5vvSi1Tl29n0xrmhJAV28PcyzEl+ejEtnl
         JHC4E4Coq5FLNUMdB6R2TxIknU29EzxP6AO4Pj/ysSnBtQK8Yu5h/SvEiBOmL47UELRe
         PZOycFm6jwO8wdpQ9jlltJO9edlYJUEijFxBzzoZiPQoAvNDTLvvebElwPEu8FXY6+OR
         dY3o8spfSTyesSXejjgbTQ0jYonnX9Z7Ms/PigbJWkt+tFxeBvCsJjiyqpk29u3MwKyE
         Xryh271PEA7KnwgSbvUgSjKv6ULVW1sK/krTWBvraLh4FEGlgYOrOM7k/NoYpACZW1oP
         Bp9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LKqk1R31Ofc4zjJWJRsGGew5MIyJHIesDVEuKheEZC4=;
        b=OTXdx/vNIJZXzS/L0/zsI/q1QyyzBAOhkBi5vhhtECdrEn3djVND6aJjE28Px10joP
         /EOW8/o+XAOexPlrgPgAJPt+2LrpOQwCp4rD6sKD9fI/hNpJZfkZLL8tZB2GimyM3T6+
         F2Ap+ETHvtvtglZNW5/tE35bmKEWWrA1JdIvHQYqUMTg1iQ0zh2Eg426yyC1x0ArLIV9
         lHzwWHxZnISNTCmAxEwrd59Bt3VQTKg4YIILmoJsunpvDqoTTsNlc5ZLCPnEbzpB1uZi
         7+RcCauBQYRn24Tycg9ja33QijDZa/g9YhfHQoDYs5ePaIgo9R+7XayD9MbHmjDtooVj
         TWFg==
X-Gm-Message-State: AOAM530724b0eEhm133wzL5seXZqwapimllG1uAosmubgUed2YAoBsjn
	SQ7viFQNQKRbEfkgcbydzIMl3NHJsXehudmn1Us=
X-Google-Smtp-Source: ABdhPJyB/kEGeaN34aVCD/ozyQ0nfTjXh6i8/nN4kV72xATWKStohqQK/TXTrWHy2IHkWvtbU10rvH6tcdOm0qccl7o=
X-Received: by 2002:a1f:36c2:: with SMTP id d185mr22748946vka.9.1597086964418;
 Mon, 10 Aug 2020 12:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200808125351.17467-1-bunk@stusta.de> <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
In-Reply-To: <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 10 Aug 2020 21:15:53 +0200
Message-ID: <CANNYZj-uxf=uyDw9-gV_jTKJLN6TA51-B=oREDfxtwMnLH4C2w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
To: Khem Raj <raj.khem@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000308dfd05ac8ac913"

--000000000000308dfd05ac8ac913
Content-Type: text/plain; charset="UTF-8"

I had a look at this, the failure is in unit tests which do not honour the
meson option to switch introspection off - can be easily patched out I
think.

Alex

On Mon, 10 Aug 2020 at 21:08, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Aug 8, 2020 at 5:54 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR:
> Unknown variable "libpeas_gir".
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > index 881751008..1b754343a 100644
> > --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
> > @@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION = "gtk_doc"
> >
> >  inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache
> features_check
> >
> > +# gobject-introspection is mandatory and cannot be configured
> > +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> > +UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection
> --disable-introspection"
>
> these are autotools options but since dunfell we use meson to build
> libpeas so I wonder how this is happening
> perhaps some bbappends need to catch up may be ?
>
> > +
> >  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> >
> >  SRC_URI += " \
> > --
> > 2.17.1
> >
> >
> 
>

--000000000000308dfd05ac8ac913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I had a look at this, the failure is in unit tests wh=
ich do not honour the meson option to switch introspection off - can be eas=
ily patched out I think.</div><div><br></div><div>Alex<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 10 =
Aug 2020 at 21:08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.k=
hem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Sat, Aug 8, 2020 at 5:54 AM Adrian Bunk &lt;<a href=3D"mail=
to:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt;<br>
&gt; ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR=
: Unknown variable &quot;libpeas_gir&quot;.<br>
&gt;<br>
&gt; Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" targ=
et=3D"_blank">bunk@stusta.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a> | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_=
1.26.0.bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a> b/met=
a-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">libpeas_1.26.0.bb</a><br>
&gt; index 881751008..1b754343a 100644<br>
&gt; --- a/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-gnome/libpeas/<a href=3D"http://libpeas_1.26.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libpeas_1.26.0.bb</a><br>
&gt; @@ -10,6 +10,10 @@ GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache =
features_check<br>
&gt;<br>
&gt; +# gobject-introspection is mandatory and cannot be configured<br>
&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<=
br>
&gt; +UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; --enable-introspection=
 --disable-introspection&quot;<br>
<br>
these are autotools options but since dunfell we use meson to build<br>
libpeas so I wonder how this is happening<br>
perhaps some bbappends need to catch up may be ?<br>
<br>
&gt; +<br>
&gt;=C2=A0 ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br=
>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000308dfd05ac8ac913--
