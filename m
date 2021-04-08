Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.4288.1617863096196303359
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 23:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: valentin.longchamp@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q26so1145147qkm.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 23:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5CPRoRql1WcMoFaOnDnqsVk1SiX9ne++XpJpYfJiKmw=;
        b=jrRNiBaW2XCISK3y03cip/7qnnNo15eAuOgVKCRuT5HrbESdbbvunI7+ep/sxNgr8C
         odAF50MZeAs/Ugn2v5JcBsWVSRuXb9my1skQErz6RiUOG7GaVMbey6hu+mkpLuUaXJdg
         7jMGO3kTiERJdMQxtSTXC4IlEYYOsz1Ahymo+g2xQTHt4Dctl8qW0pJJuIfL0aGSbdQY
         Z/paoBFX3TClZbpd6baKXlP0yMQrLc9AD3rsnB311PvOK71yDIkURVRYgtvETQs4Lc2p
         sHVLvFPqNaDdMQ8PGgtnIS3vaW0KlAgdB2YiggGSJW71HPm/BWyvy+wZgryJm90GVQBm
         8bYQ==
X-Gm-Message-State: AOAM530ooECs3sQMOrOCK2uXWrjtZe2ju+/NOPeVhcCDeANImjv/uqj1
	gDHY5TCTaQr8BNB8sDRfWO7nO7L1ilZeJQ==
X-Google-Smtp-Source: ABdhPJzjT9NGjFlAkV6VanlblDZyuiioy9MM8QYAio59KEHP+2Bpi/Ami7G4mK2uthpND2LB+zc/9g==
X-Received: by 2002:a37:a515:: with SMTP id o21mr6924151qke.307.1617863095133;
        Wed, 07 Apr 2021 23:24:55 -0700 (PDT)
Return-Path: <valentin.longchamp@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id s133sm20379520qke.1.2021.04.07.23.24.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 23:24:54 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id o5so1215040qkb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 23:24:54 -0700 (PDT)
X-Received: by 2002:a37:589:: with SMTP id 131mr7041753qkf.97.1617863094495;
 Wed, 07 Apr 2021 23:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210407212337.2307476-1-valentin@longchamp.me> <a07e006e-9c1b-abc4-e156-029bb5a7b713@gmail.com>
In-Reply-To: <a07e006e-9c1b-abc4-e156-029bb5a7b713@gmail.com>
From: "Valentin Longchamp" <valentin@longchamp.me>
Date: Thu, 8 Apr 2021 08:24:44 +0200
X-Gmail-Original-Message-ID: <CADYrJDw53yTyZ=6Sc5znbVzBQ+fa4wARsDFwH7j+JBpJ04Y5Rw@mail.gmail.com>
Message-ID: <CADYrJDw53yTyZ=6Sc5znbVzBQ+fa4wARsDFwH7j+JBpJ04Y5Rw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libssh: add gcrypt to PACKAGECONFIG
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000aef7305bf701bdf"

--0000000000000aef7305bf701bdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops. I had a quick look yesterday coming back from vacation and couldn't
find the patch on patchwork. I assumed something went wrong with the first
message, but you've just been too fast.

Sorry about that, please ignore this patch. Thanks for all

Le jeu. 8 avr. 2021 =C3=A0 00:55, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> the last patch you send it  already in see
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D86eb692a4e96=
b77857a4160a12625fc694812d52
>
> if there are change on top of v1 then please rebase and send them
> seprately.
>
> if you wan to send a reminder just reply to original patch
>
> On 4/7/21 2:23 PM, Valentin Longchamp wrote:
> > This would allow to build it without libgcrypt (relying instead on
> > libcrypto).
> >
> > Enable it by default to keep the recipe behaving the same wihtout a
> > configuration change.
> >
> > Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
> > ---
> >   meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > index 39ed8a8fb..2aff2c878 100644
> > --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > @@ -4,7 +4,7 @@ SECTION =3D "libs"
> >   LICENSE =3D "LGPLv2.1"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea255a0"
> >
> > -DEPENDS =3D "zlib openssl libgcrypt"
> > +DEPENDS =3D "zlib openssl"
> >
> >   SRC_URI =3D "git://git.libssh.org/projects/libssh.git;branch=3Dstabl=
e-0.8"
> >   SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> > @@ -13,13 +13,13 @@ S =3D "${WORKDIR}/git"
> >
> >   inherit cmake
> >
> > -PACKAGECONFIG ??=3D""
> > +PACKAGECONFIG ??=3D "gcrypt"
> >   PACKAGECONFIG[gssapi] =3D "-DWITH_GSSAPI=3D1, -DWITH_GSSAPI=3D0, krb=
5, "
> > +PACKAGECONFIG[gcrypt] =3D "-DWITH_GCRYPT=3D1, -DWITH_GCRYPT=3D0, libg=
crypt, "
> >
> >   ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >
> >   EXTRA_OECMAKE =3D " \
> > -    -DWITH_GCRYPT=3D1 \
> >       -DWITH_PCAP=3D1 \
> >       -DWITH_SFTP=3D1 \
> >       -DWITH_ZLIB=3D1 \
> >
> >
> >
> >=20
> >
>


--=20
Valentin Longchamp
Rue de la Carri=C3=A8re 30, CH-1700 Fribourg
valentin@longchamp.me
Mobile: +41 79 569 25 75

--0000000000000aef7305bf701bdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oops. I had a quick look yesterday coming back from v=
acation and couldn&#39;t find the patch on patchwork. I assumed something w=
ent wrong with the first message, but you&#39;ve just been too fast.</div><=
div><br></div><div>Sorry about that, please ignore this patch. Thanks for a=
ll<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0jeu. 8 avr. 2021 =C3=A0=C2=A000:55, Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">the last p=
atch you send it=C2=A0 already in see<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=3D86e=
b692a4e96b77857a4160a12625fc694812d52" rel=3D"noreferrer" target=3D"_blank"=
>https://git.openembedded.org/meta-openembedded/commit/?id=3D86eb692a4e96b7=
7857a4160a12625fc694812d52</a><br>
<br>
if there are change on top of v1 then please rebase and send them sepratel=
y.<br>
<br>
if you wan to send a reminder just reply to original patch<br>
<br>
On 4/7/21 2:23 PM, Valentin Longchamp wrote:<br>
&gt; This would allow to build it without libgcrypt (relying instead on<br=
>
&gt; libcrypto).<br>
&gt; <br>
&gt; Enable it by default to keep the recipe behaving the same wihtout a<b=
r>
&gt; configuration change.<br>
&gt; <br>
&gt; Signed-off-by: Valentin Longchamp &lt;<a href=3D"mailto:valentin@long=
champ.me" target=3D"_blank">valentin@longchamp.me</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0=
.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> | 6 +++--=
-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_=
0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> b/meta-o=
e/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferr=
er" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; index 39ed8a8fb..2aff2c878 100644<br>
&gt; --- a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.b=
b" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.b=
b" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; @@ -4,7 +4,7 @@ SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;LGPLv2.1&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ddabb4958b=
830e5df11d2b0ed8ea255a0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -DEPENDS =3D &quot;zlib openssl libgcrypt&quot;<br>
&gt; +DEPENDS =3D &quot;zlib openssl&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.libssh.org/=
projects/libssh.git;branch=3Dstable-0.8" rel=3D"noreferrer" target=3D"_blan=
k">git.libssh.org/projects/libssh.git;branch=3Dstable-0.8</a>&quot;<br>
&gt;=C2=A0 =C2=A0SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0da78b4f4fa1f8=
&quot;<br>
&gt; @@ -13,13 +13,13 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit cmake<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -PACKAGECONFIG ??=3D&quot;&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;gcrypt&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[gssapi] =3D &quot;-DWITH_GSSAPI=3D1, -DWITH=
_GSSAPI=3D0, krb5, &quot;<br>
&gt; +PACKAGECONFIG[gcrypt] =3D &quot;-DWITH_GCRYPT=3D1, -DWITH_GCRYPT=3D0=
, libgcrypt, &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0EXTRA_OECMAKE =3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 -DWITH_GCRYPT=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DWITH_PCAP=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DWITH_SFTP=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DWITH_ZLIB=3D1 \<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Valentin Longchamp<br>Rue de la Carri=C3=A8re 30, CH-1700 =
Fribourg<br><a href=3D"mailto:valentin@longchamp.me" target=3D"_blank">vale=
ntin@longchamp.me</a><br>Mobile: +41 79 569 25 75</div>

--0000000000000aef7305bf701bdf--
