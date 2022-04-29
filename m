Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9510C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 02:59:43 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web09.5871.1651201178894924571
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 19:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: aehs29@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id hf18so4908780qtb.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 19:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TpMsPKlH+qOkTVY1ZWVeB/JAjE3IbPlp5KSyS18Q9c=;
        b=w6D9gxhttHa1jXoGY+qiZbyTlEW2l9Wvy1dMMk3xuKC8VDuimbPY3PRIBcNtJz6wnY
         WrKGPV/g8FtwcHVQelW+I3zThoYKobpJmEcv2HP2awa9ZVxz6PMp4yyLT+Ve28F2KTX5
         rRsITjkF4ec3/fqa7A824QR8nrQ8GzYGuP86wSsNCJ9R/kItHHV6dqakzffCqIgV/mmC
         tRmRN94A/mh2Ai856LEkM77LOtgEGxsrAk46WxJQLp5975KyZDVxRm2xtg2sl/Yqeeli
         GYg/aq0a0tlJOxNiPy4FjqBOdFNIlrqx9N6hsr/+mYb7ioNOvvxAaqFwxXDLdIzqJD/y
         Q34Q==
X-Gm-Message-State: AOAM5303HuXKp2WA1jWIrcrz9aK5JGAsgedLrpxIW5kVbt8ozOLw2a7H
	RrApfmUOn+7POlTypGR92JGuCrVVXMyKkQ==
X-Google-Smtp-Source: 
 ABdhPJwMMOcL59h82F12Hik7aFJPSj8XTvZNyPx5OjsdDlztz3mi+nlovjrhGrNWuupKT+uEw1wgpw==
X-Received: by 2002:a05:622a:14cd:b0:2e1:d83a:6fdd with SMTP id
 u13-20020a05622a14cd00b002e1d83a6fddmr25249537qtx.401.1651201177839;
        Thu, 28 Apr 2022 19:59:37 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id
 p4-20020ae9f304000000b0069f92b78b16sm814352qkg.58.2022.04.28.19.59.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 19:59:37 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id x77so4250619qkb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 19:59:37 -0700 (PDT)
X-Received: by 2002:a05:620a:40d6:b0:69f:2d4b:4236 with SMTP id
 g22-20020a05620a40d600b0069f2d4b4236mr18176976qko.197.1651201177244; Thu, 28
 Apr 2022 19:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220428230012.3467800-1-alejandro@enedino.org>
 <66219d6d-9a8e-e4c9-5d88-a4a37ca9115e@gmail.com>
 <CAHMutrb-XosSSouvUQenKdcOd_Bcbeg9nLd89=BPX7Pj5shEMA@mail.gmail.com>
 <CAMKF1srQgTo6Up6DD3VAvkA1MTqF147gP0y+V1qeerWqqn_0ZA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srQgTo6Up6DD3VAvkA1MTqF147gP0y+V1qeerWqqn_0ZA@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 28 Apr 2022 20:59:25 -0600
X-Gmail-Original-Message-ID: 
 <CAHMutrZ5ESsE_93qH0SO_8CViewmh9b5_5wP8jU=KnHJf+CywA@mail.gmail.com>
Message-ID: 
 <CAHMutrZ5ESsE_93qH0SO_8CViewmh9b5_5wP8jU=KnHJf+CywA@mail.gmail.com>
Subject: Re: [oe] [PATCH] cryptsetup: Add luks2 related PACKAGECONFIGs
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009f5b4b05ddc23bf1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 02:59:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96854

--0000000000009f5b4b05ddc23bf1
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022, 6:52 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Apr 28, 2022 at 5:39 PM Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> >
> >
> > On Thu, Apr 28, 2022, 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:
> >> > Cryptsetup allows for certain luks2 related defaults to be
> >> > set for libcryptsetup, these include the default PBKDF
> >> > algorithm, memory limit for PBKDF2, parallel threads and
> >> > iteration time.
> >> >
> >> > Add these options as PACKAGECONFIGs to cryptsetup while
> >> > setting variables defined as the current cryptsetup
> >> > defaults, making this change transparent for the user but
> >> > allow these knobs to be customized.
> >> >
> >> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> >> > ---
> >> >   .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12
> ++++++++++++
> >> >   1 file changed, 12 insertions(+)
> >> >
> >> > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> >> > index 8f9f663a3..7baca98cb 100644
> >> > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> >> > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> >> > @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target = " \
> >> >       udev \
> >> >   "
> >> >
> >> > +
> >> > +# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB),
> parallel threads and iteration time (ms)
> >> > +LUKS2_PBKDF ?= "argon2i"
> >> > +LUKS2_MEMORYKB ?= "1048576"
> >> > +LUKS2_PARALLEL_THREADS ?= "4"
> >> > +LUKS2_ITERTIME ?= "2000"
> >> > +
> >>
> >> is this something that can be selected at runtime too ?
> >
> >
> >
> > Hi Khem,
> >
> > Yes, if using cryptsetup directly these can be changed at runtime
> regardless of the default set here.
> >
>
> in current settings, it will need to set two knobs and it seems a bit
> off from what packageconfigs are for.
> so perhaps we can enable the default configure options unconditionally
> with default values and make the values a weak assigment.
>

I'd be fine with that too, the only thing worth mentioning is that some of
these are only valid as a combination, for example:

Luks2-memorykb is only valid when luks2-pbkdf="argon2<foo>", if
luks2-pbkdf="pbkdf2" the luks header doesn't contain a memory field, also
all these are only valid when the type=luks2

I believe we can just set them all as you say, as long as they don't
conflict with one another and cause an error during do_configure.

I can check if these are okay to set and discarded if not compatible and we
can go with that, performing checks for compatibility with anonymous python
is another solution but seems a bit of an overkill.



> > Being able to change these at build time becomes useful when relying on
> the libcryptsetup API.
> >
> >
> > Cheers,
> > Alejandro
> >
> >
> >>
> >> > +
> >> >   PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
> >> >   PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
> >> >   PACKAGECONFIG[pwquality] =
> "--enable-pwquality,--disable-pwquality,libpwquality"
> >> > @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] =
> "--with-crypto_backend=nss,,nss"
> >> >   PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
> >> >   PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
> >> >   PACKAGECONFIG[luks2] =
> "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
> >> > +PACKAGECONFIG[luks2-pbkdf] = "--with-luks2-pbkdf=${LUKS2_PBKDF}"
> >> > +PACKAGECONFIG[luks2-memorykb] =
> "--with-luks2-memory-kb=${LUKS2_MEMORYKB}"
> >> > +PACKAGECONFIG[luks2-parallel-threads] =
> "--with-luks2-parallel-threads=${LUKS2_PARALLEL_THREADS}"
> >> > +PACKAGECONFIG[luks2-itertime] =
> "--with-luks2-iter-time=${LUKS2_ITERTIME}"
> >> >
> >> >   EXTRA_OECONF = "--enable-static"
> >> >   # Building without largefile is not supported by upstream
> >> >
> >> >
> >> >
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#96850):
> https://lists.openembedded.org/g/openembedded-devel/message/96850
> >> > Mute This Topic: https://lists.openembedded.org/mt/90765285/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >
>

--0000000000009f5b4b05ddc23bf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 28, 2022, 6:52 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Apr =
28, 2022 at 5:39 PM Alejandro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" rel=3D"noreferrer noreferrer" =
target=3D"_blank">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Thu, Apr 28, 2022, 6:30 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:<br>
&gt;&gt; &gt; Cryptsetup allows for certain luks2 related defaults to be<br=
>
&gt;&gt; &gt; set for libcryptsetup, these include the default PBKDF<br>
&gt;&gt; &gt; algorithm, memory limit for PBKDF2, parallel threads and<br>
&gt;&gt; &gt; iteration time.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Add these options as PACKAGECONFIGs to cryptsetup while<br>
&gt;&gt; &gt; setting variables defined as the current cryptsetup<br>
&gt;&gt; &gt; defaults, making this change transparent for the user but<br>
&gt;&gt; &gt; allow these knobs to be customized.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a h=
ref=3D"mailto:alejandro@enedino.org" rel=3D"noreferrer noreferrer" target=
=3D"_blank">alejandro@enedino.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0.../recipes-crypto/cryptsetup/<a href=3D"http://c=
ryptsetup_2.4.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">cryptsetup_2.4.3.bb</a>=C2=A0 =C2=A0 | 12 ++++++++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"htt=
p://cryptsetup_2.4.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D=
"_blank">cryptsetup_2.4.3.bb</a> b/meta-oe/recipes-crypto/cryptsetup/<a hre=
f=3D"http://cryptsetup_2.4.3.bb" rel=3D"noreferrer noreferrer noreferrer" t=
arget=3D"_blank">cryptsetup_2.4.3.bb</a><br>
&gt;&gt; &gt; index 8f9f663a3..7baca98cb 100644<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cry=
ptsetup_2.4.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">cryptsetup_2.4.3.bb</a><br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cry=
ptsetup_2.4.3.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank=
">cryptsetup_2.4.3.bb</a><br>
&gt;&gt; &gt; @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target =3D &quo=
t; \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0udev \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +# libcryptsetup default PBKDF algorithm, Argon2 memory cost =
(KB), parallel threads and iteration time (ms)<br>
&gt;&gt; &gt; +LUKS2_PBKDF ?=3D &quot;argon2i&quot;<br>
&gt;&gt; &gt; +LUKS2_MEMORYKB ?=3D &quot;1048576&quot;<br>
&gt;&gt; &gt; +LUKS2_PARALLEL_THREADS ?=3D &quot;4&quot;<br>
&gt;&gt; &gt; +LUKS2_ITERTIME ?=3D &quot;2000&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt;<br>
&gt;&gt; is this something that can be selected at runtime too ?<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; Yes, if using cryptsetup directly these can be changed at runtime rega=
rdless of the default set here.<br>
&gt;<br>
<br>
in current settings, it will need to set two knobs and it seems a bit<br>
off from what packageconfigs are for.<br>
so perhaps we can enable the default configure options unconditionally<br>
with default values and make the values a weak assigment.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;d be fine wi=
th that too, the only thing worth mentioning is that some of these are only=
 valid as a combination, for example:</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Luks2-memorykb is only valid when luks2-pbkdf=3D&quot;argon2&=
lt;foo&gt;&quot;, if luks2-pbkdf=3D&quot;pbkdf2&quot; the luks header doesn=
&#39;t contain a memory field, also all these are only valid when the type=
=3Dluks2</div><div dir=3D"auto"><br></div><div dir=3D"auto">I believe we ca=
n just set them all as you say, as long as they don&#39;t conflict with one=
 another and cause an error during do_configure.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">I can check if these are okay to set and discarded=
 if not compatible and we can go with that, performing checks for compatibi=
lity with anonymous python is another solution but seems a bit of an overki=
ll.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; Being able to change these at build time becomes useful when relying o=
n the libcryptsetup API.<br>
&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Alejandro<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[keyring] =3D &quot;--enable-keyring=
,--disable-keyring&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[fips] =3D &quot;--enable-fips,--dis=
able-fips&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[pwquality] =3D &quot;--enable-pwqua=
lity,--disable-pwquality,libpwquality&quot;<br>
&gt;&gt; &gt; @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] =3D &quot;--with-crypto=
_backend=3Dnss,,nss&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[kernel] =3D &quot;--with-crypto_bac=
kend=3Dkernel&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[nettle] =3D &quot;--with-crypto_bac=
kend=3Dnettle,,nettle&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0PACKAGECONFIG[luks2] =3D &quot;--with-default-luk=
s-format=3DLUKS2,--with-default-luks-format=3DLUKS1&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[luks2-pbkdf] =3D &quot;--with-luks2-pbkdf=3D${=
LUKS2_PBKDF}&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[luks2-memorykb] =3D &quot;--with-luks2-memory-=
kb=3D${LUKS2_MEMORYKB}&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[luks2-parallel-threads] =3D &quot;--with-luks2=
-parallel-threads=3D${LUKS2_PARALLEL_THREADS}&quot;<br>
&gt;&gt; &gt; +PACKAGECONFIG[luks2-itertime] =3D &quot;--with-luks2-iter-ti=
me=3D${LUKS2_ITERTIME}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0EXTRA_OECONF =3D &quot;--enable-static&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Building without largefile is not supported by =
upstream<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#96850): <a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/96850" rel=3D"noreferrer noreferrer n=
oreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-=
devel/message/96850</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/90765285/1997914" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/mt/90765285/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openem=
bedded-devel+owner@lists.openembedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a hre=
f=3D"mailto:raj.khem@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div></div></div>

--0000000000009f5b4b05ddc23bf1--

