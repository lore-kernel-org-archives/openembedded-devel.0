Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8F8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 09:57:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.29315.1701165448948741785
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 01:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isIHcCuf;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4129827a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701165448; x=1701770248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4kGfxviFhZzxKhDw881h7le8WXKGGOV30sVLiUAwlYA=;
        b=isIHcCuff0A7qqcDg0JWNkbWAsSfHc05P7gZpNUu7CpHM+6qAi/uqMAzx7uxJxuHxF
         bpErJ2RjawccSeiJEvsN+5DPqAll2i+EphzDeW2ICnHCFq8kkylBmvS1GWL8Ebmh2lMf
         4o0wZ4MVvvv/X3H2eEAC0hoxlgjHNSngG3gEJNfrfUEX9Jyt/7edJox3OeY4HLtDfh+x
         /aJILFKP43rbgIr1r4p9Ko/gUK8jc8PS9wxSFQqS1nu8MzXqq0Tswg5s8VC/sC9Q76Lm
         +qxCVaVy9YhYRwlUhTOG8kuCBXIUKinrDecFtLu73mVtUoz27WBgdUdZfqnHMi3crP5J
         2n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701165448; x=1701770248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kGfxviFhZzxKhDw881h7le8WXKGGOV30sVLiUAwlYA=;
        b=Q7IrhblA4dxsSYDs0pOO9CyBt59+y/QLHdJy0nDJvcYUWP6yunHRutcZDYGPl6kv+m
         kBZiOf1FRQlgISNs7V3QNeLqRsLDliI5pe+7N57RiokvoGgmi1ynVsZnpw6fdaAfW4qL
         y1aW2Dnkxn3dUvtSbAu/HYMDJcQg4oGAnXvWgc06ZQRXA5MQNigo/fnHNUcUtJVHP8Qv
         +UTvAcxgvIeJXmFKs2KMTh0ORz4wVsdAVZr6cAuyo3UWtZePLEbTLbLM4sQiCOh0bs2X
         in6jZuHs4eVO7bZDjP9iFEVb00LW65QXYq6z5uw280A4y9GA/7MWezbll9SI0qMU5s4r
         0NnQ==
X-Gm-Message-State: AOJu0Yyb59p2v4eJe74F9oHUzXZxngueIdLa2PaYnslBW8H8lqB0ZBpT
	eZcS3p+P4dEihHETgT5SvXCX23CjFrATWQV92fA=
X-Google-Smtp-Source: AGHT+IEu9woK0cejmAljwpWl/4tG02qVjaECu6Q7I/PiPH+MwwUJ8ZjdRPMWDkW2SmEBj/xfdqCvxbWgCPE3JfKbyz4=
X-Received: by 2002:a05:6a20:8421:b0:185:876f:4f4d with SMTP id
 c33-20020a056a20842100b00185876f4f4dmr21179600pzd.32.1701165448092; Tue, 28
 Nov 2023 01:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20231127133808.1396531-1-alperyasinak1@gmail.com> <CAMKF1spUpnuDK8BB=yWpTL3KZobFCe4XQZ=d-k3O9=A=WWgZ7w@mail.gmail.com>
In-Reply-To: <CAMKF1spUpnuDK8BB=yWpTL3KZobFCe4XQZ=d-k3O9=A=WWgZ7w@mail.gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Tue, 28 Nov 2023 12:57:16 +0300
Message-ID: <CAGpma=5TJimZbo0JcmnfNJ2r48m-pLBpmuQ0vAYaybp7ky-GjA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] msgpack-c: upgrade 4.0.0 -> 6.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003cdf7f060b33724e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 09:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107096

--0000000000003cdf7f060b33724e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent a patch request for tmate to fix this issue:

https://lists.openembedded.org/g/openembedded-devel/message/107095

Khem Raj <raj.khem@gmail.com>, 27 Kas 2023 Pzt, 21:06 tarihinde =C5=9Funu y=
azd=C4=B1:

> tmate fails to build with this upgrade
>
> https://errors.yoctoproject.org/Errors/Details/743897/
>
> On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com=
> wrote:
> >
> > - GTest should be OFF by default. ->
> https://github.com/msgpack/msgpack-c/issues/1066
> >
> > Changelog:
> >
> > - Remove C++ requirement if test is disabled (#1055)
> > - Change CMake package name of C library to msgpack-c (#1053)
> > - Unified all C package, library, cmake, tarball name become msgpack-c.
> > - Add additional address sanitizer for CI. (#1023)
> > - Change CMake package name of C library to msgpackc (#1044, #1049)
> >
> > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > ---
> >  .../msgpack/{msgpack-c_4.0.0.bb =3D> msgpack-c_6.0.0.bb}      | 6 +++-=
--
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-devtools/msgpack/{msgpack-c_4.0.0.bb =3D>
> msgpack-c_6.0.0.bb} (86%)
> >
> > diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> > similarity index 86%
> > rename from meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> > rename to meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> > index c6a6ac467..40d997a52 100644
> > --- a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> > +++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> > @@ -7,14 +7,14 @@ LIC_FILES_CHKSUM =3D
> "file://NOTICE;md5=3D7a858c074723608e08614061dc044352 \
> >
> file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31bef20d78c \
> >                     "
> >
> > -PV .=3D "+git${SRCPV}"
> > -
> >  SRC_URI =3D "git://
> github.com/msgpack/msgpack-c;branch=3Dc_master;protocol=3Dhttps \
> >             "
> > -SRCREV =3D "a9a48cea3a78ba661ee8096b5dab456361b0ff23"
> > +SRCREV =3D "8160ede5e20fd3019a77eea46d9c72cf6163f802"
> >
> >  S =3D "${WORKDIR}/git"
> >
> >  inherit cmake pkgconfig
> >
> > +EXTRA_OECMAKE +=3D "-DMSGPACK_BUILD_TESTS=3Doff"
> > +
> >  BBCLASSEXTEND +=3D "native nativesdk"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107059):
> https://lists.openembedded.org/g/openembedded-devel/message/107059
> > Mute This Topic: https://lists.openembedded.org/mt/102828614/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003cdf7f060b33724e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I sent a patch request for tmate to fix this issue:<br><br=
><a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/107=
095">https://lists.openembedded.org/g/openembedded-devel/message/107095</a>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;, 27 Kas 2023 Pzt, 21:06 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">tmate fails to build with this u=
pgrade<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/743897/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/743897/</a><br>
<br>
On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Alper Ak &lt;<a href=3D"mailto:alpe=
ryasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; - GTest should be OFF by default. -&gt; <a href=3D"https://github.com/=
msgpack/msgpack-c/issues/1066" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/msgpack/msgpack-c/issues/1066</a><br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; - Remove C++ requirement if test is disabled (#1055)<br>
&gt; - Change CMake package name of C library to msgpack-c (#1053)<br>
&gt; - Unified all C package, library, cmake, tarball name become msgpack-c=
.<br>
&gt; - Add additional address sanitizer for CI. (#1023)<br>
&gt; - Change CMake package name of C library to msgpackc (#1044, #1049)<br=
>
&gt;<br>
&gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" =
target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../msgpack/{<a href=3D"http://msgpack-c_4.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">msgpack-c_4.0.0.bb</a> =3D&gt; <a href=3D"http://ms=
gpack-c_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_6.0.0.bb</=
a>}=C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/msgpack/{<a href=3D"http://msgpa=
ck-c_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_4.0.0.bb</a> =
=3D&gt; <a href=3D"http://msgpack-c_6.0.0.bb" rel=3D"noreferrer" target=3D"=
_blank">msgpack-c_6.0.0.bb</a>} (86%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpac=
k-c_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_4.0.0.bb</a> b=
/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-c_6.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">msgpack-c_6.0.0.bb</a><br>
&gt; similarity index 86%<br>
&gt; rename from meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack=
-c_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_4.0.0.bb</a><br=
>
&gt; rename to meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-c=
_6.0.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_6.0.0.bb</a><br>
&gt; index c6a6ac467..40d997a52 100644<br>
&gt; --- a/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-c_4.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_4.0.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/msgpack/<a href=3D"http://msgpack-c_6.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">msgpack-c_6.0.0.bb</a><br>
&gt; @@ -7,14 +7,14 @@ LIC_FILES_CHKSUM =3D &quot;file://NOTICE;md5=3D7a858=
c074723608e08614061dc044352 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31bef20d78c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;<br>
&gt; -PV .=3D &quot;+git${SRCPV}&quot;<br>
&gt; -<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/msgpack/msg=
pack-c;branch=3Dc_master;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/msgpack/msgpack-c;branch=3Dc_master;protocol=3Dhttps</a> \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRCREV =3D &quot;a9a48cea3a78ba661ee8096b5dab456361b0ff23&quot;<br>
&gt; +SRCREV =3D &quot;8160ede5e20fd3019a77eea46d9c72cf6163f802&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake pkgconfig<br>
&gt;<br>
&gt; +EXTRA_OECMAKE +=3D &quot;-DMSGPACK_BUILD_TESTS=3Doff&quot;<br>
&gt; +<br>
&gt;=C2=A0 BBCLASSEXTEND +=3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#107059): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/107059" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/107059</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10282861=
4/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102828614/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000003cdf7f060b33724e--

