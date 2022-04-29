Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B785EC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 00:39:12 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.4676.1651192752031873943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: aehs29@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id t11so4710369qto.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MpidKTiQQ4RTp78a+E0Ies84/Qg/B5m0Li3kPj1yho=;
        b=xASvOBmIaeRo0trqLSLE7kxXeGzepggSHt22AHsnfbN/NWlKTb7Pw14rDzO7koUYm/
         pxfbQ6LJJ5D2Ow7VwCQoYJHKEa9kOngiyQaTeS8F+Tauc0W8D9TR8Z3l7w1x4QwHhWgD
         fDOnSH3Gr2pqetfeF8npjuB6fP7/7u257q3zRaMwC04/xLncdqP/ve9k/hYPzNiHeoUV
         F4vvsTcAUjW5jjTzXo+nLzahUqr3D0YSb5msWcnZ+hGYmIgfYVMl0HCxuyvPfxYyx77K
         jcklmMogWA/aVO/LKoydKe3nvUWjjPpnl/Q7SWv4aQx2qNj3+1t5uQlgwvSdF5iyBN9q
         EgLQ==
X-Gm-Message-State: AOAM5312WvVWx3F2wGso/NvZ4rJjfS4OijdCsNk6VewyauYYd7U+fns3
	GGjKw5n1HFDPCc0td7bfMj1BSM7mPWpp0A==
X-Google-Smtp-Source: 
 ABdhPJwXaI4JiPaA8R8D8QFjA2H8eEFsMf52Kv6uxZ/lbjibf7/b5bx3GTEdN0rG8YizyiaSL1F/UQ==
X-Received: by 2002:ac8:5716:0:b0:2f3:3f2e:535c with SMTP id
 22-20020ac85716000000b002f33f2e535cmr25228046qtw.544.1651192750965;
        Thu, 28 Apr 2022 17:39:10 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com.
 [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id
 z18-20020ae9c112000000b0069fb1e90434sm680616qki.128.2022.04.28.17.39.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 17:39:10 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id b20so2288626qkc.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:39:10 -0700 (PDT)
X-Received: by 2002:a05:620a:40d6:b0:69f:2d4b:4236 with SMTP id
 g22-20020a05620a40d600b0069f2d4b4236mr17961834qko.197.1651192750267; Thu, 28
 Apr 2022 17:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220428230012.3467800-1-alejandro@enedino.org>
 <66219d6d-9a8e-e4c9-5d88-a4a37ca9115e@gmail.com>
In-Reply-To: <66219d6d-9a8e-e4c9-5d88-a4a37ca9115e@gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Thu, 28 Apr 2022 18:38:58 -0600
X-Gmail-Original-Message-ID: 
 <CAHMutrb-XosSSouvUQenKdcOd_Bcbeg9nLd89=BPX7Pj5shEMA@mail.gmail.com>
Message-ID: 
 <CAHMutrb-XosSSouvUQenKdcOd_Bcbeg9nLd89=BPX7Pj5shEMA@mail.gmail.com>
Subject: Re: [oe] [PATCH] cryptsetup: Add luks2 related PACKAGECONFIGs
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055e7bd05ddc0455c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 00:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96852

--00000000000055e7bd05ddc0455c
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 28, 2022, 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:
> > Cryptsetup allows for certain luks2 related defaults to be
> > set for libcryptsetup, these include the default PBKDF
> > algorithm, memory limit for PBKDF2, parallel threads and
> > iteration time.
> >
> > Add these options as PACKAGECONFIGs to cryptsetup while
> > setting variables defined as the current cryptsetup
> > defaults, making this change transparent for the user but
> > allow these knobs to be customized.
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > ---
> >   .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> > index 8f9f663a3..7baca98cb 100644
> > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
> > @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target = " \
> >       udev \
> >   "
> >
> > +
> > +# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB),
> parallel threads and iteration time (ms)
> > +LUKS2_PBKDF ?= "argon2i"
> > +LUKS2_MEMORYKB ?= "1048576"
> > +LUKS2_PARALLEL_THREADS ?= "4"
> > +LUKS2_ITERTIME ?= "2000"
> > +
>
> is this something that can be selected at runtime too ?
>


Hi Khem,

Yes, if using cryptsetup directly these can be changed at runtime
regardless of the default set here.

Being able to change these at build time becomes useful when relying on the
libcryptsetup API.


Cheers,
Alejandro



> > +
> >   PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
> >   PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
> >   PACKAGECONFIG[pwquality] =
> "--enable-pwquality,--disable-pwquality,libpwquality"
> > @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
> >   PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
> >   PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
> >   PACKAGECONFIG[luks2] =
> "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
> > +PACKAGECONFIG[luks2-pbkdf] = "--with-luks2-pbkdf=${LUKS2_PBKDF}"
> > +PACKAGECONFIG[luks2-memorykb] =
> "--with-luks2-memory-kb=${LUKS2_MEMORYKB}"
> > +PACKAGECONFIG[luks2-parallel-threads] =
> "--with-luks2-parallel-threads=${LUKS2_PARALLEL_THREADS}"
> > +PACKAGECONFIG[luks2-itertime] =
> "--with-luks2-iter-time=${LUKS2_ITERTIME}"
> >
> >   EXTRA_OECONF = "--enable-static"
> >   # Building without largefile is not supported by upstream
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#96850):
> https://lists.openembedded.org/g/openembedded-devel/message/96850
> > Mute This Topic: https://lists.openembedded.org/mt/90765285/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000055e7bd05ddc0455c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 28, 2022, 6:30 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><br>
<br>
On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:<br>
&gt; Cryptsetup allows for certain luks2 related defaults to be<br>
&gt; set for libcryptsetup, these include the default PBKDF<br>
&gt; algorithm, memory limit for PBKDF2, parallel threads and<br>
&gt; iteration time.<br>
&gt; <br>
&gt; Add these options as PACKAGECONFIGs to cryptsetup while<br>
&gt; setting variables defined as the current cryptsetup<br>
&gt; defaults, making this change transparent for the user but<br>
&gt; allow these knobs to be customized.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"ma=
ilto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@=
enedino.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup=
_2.4.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cryptsetup_2.4.3=
.bb</a>=C2=A0 =C2=A0 | 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://crypt=
setup_2.4.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cryptsetup_=
2.4.3.bb</a> b/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptset=
up_2.4.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cryptsetup_2.4=
.3.bb</a><br>
&gt; index 8f9f663a3..7baca98cb 100644<br>
&gt; --- a/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_2=
.4.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cryptsetup_2.4.3.b=
b</a><br>
&gt; +++ b/meta-oe/recipes-crypto/cryptsetup/<a href=3D"http://cryptsetup_2=
.4.3.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cryptsetup_2.4.3.b=
b</a><br>
&gt; @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0udev \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), par=
allel threads and iteration time (ms)<br>
&gt; +LUKS2_PBKDF ?=3D &quot;argon2i&quot;<br>
&gt; +LUKS2_MEMORYKB ?=3D &quot;1048576&quot;<br>
&gt; +LUKS2_PARALLEL_THREADS ?=3D &quot;4&quot;<br>
&gt; +LUKS2_ITERTIME ?=3D &quot;2000&quot;<br>
&gt; +<br>
<br>
is this something that can be selected at runtime too ?<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Hi Khem,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, =
if using cryptsetup directly these can be changed at runtime regardless of =
the default set here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Be=
ing able to change these at build time becomes useful when relying on the l=
ibcryptsetup API.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Cheers,</div><div dir=3D"auto">Alejandro</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[keyring] =3D &quot;--enable-keyring,--disabl=
e-keyring&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[fips] =3D &quot;--enable-fips,--disable-fips=
&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[pwquality] =3D &quot;--enable-pwquality,--di=
sable-pwquality,libpwquality&quot;<br>
&gt; @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] =3D &quot;--with-crypto_backend=
=3Dnss,,nss&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[kernel] =3D &quot;--with-crypto_backend=3Dke=
rnel&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[nettle] =3D &quot;--with-crypto_backend=3Dne=
ttle,,nettle&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[luks2] =3D &quot;--with-default-luks-format=
=3DLUKS2,--with-default-luks-format=3DLUKS1&quot;<br>
&gt; +PACKAGECONFIG[luks2-pbkdf] =3D &quot;--with-luks2-pbkdf=3D${LUKS2_PBK=
DF}&quot;<br>
&gt; +PACKAGECONFIG[luks2-memorykb] =3D &quot;--with-luks2-memory-kb=3D${LU=
KS2_MEMORYKB}&quot;<br>
&gt; +PACKAGECONFIG[luks2-parallel-threads] =3D &quot;--with-luks2-parallel=
-threads=3D${LUKS2_PARALLEL_THREADS}&quot;<br>
&gt; +PACKAGECONFIG[luks2-itertime] =3D &quot;--with-luks2-iter-time=3D${LU=
KS2_ITERTIME}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0EXTRA_OECONF =3D &quot;--enable-static&quot;<br>
&gt;=C2=A0 =C2=A0# Building without largefile is not supported by upstream<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#96850): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/96850" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-devel/message/96850<=
/a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90765285=
/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/90765285/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div></div>

--00000000000055e7bd05ddc0455c--

