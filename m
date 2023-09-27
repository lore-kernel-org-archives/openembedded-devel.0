Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7925E82CAF
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 16:06:34 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.21163.1695830786913602617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 09:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ok/pK2+g;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-307d58b3efbso9757236f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695830785; x=1696435585; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oCf/DrVn6vdgt427kFGDZ9IsIGpNmDw8wPpYe3DLgNQ=;
        b=Ok/pK2+g+puRU1Ilpr2Z564Ez4O5+AHkl9B3DZI/9khyiGb+TjYwn0fYrLkTx0i4zR
         NHrPW9QGpX9te3rssQ6dcYi5y7PknV7B4m8cn4vQn7859RJAh6a69bWvsH2mr2Vx+Umi
         m1GyftPmQ/N1hAN/jePZG/MVYdGrhEDonP3gt02h37f/GvWfILzZXz8KDApwptYz097S
         ZG7/DbUG+LDR1JF9fKMM6lwdMYHVnuSOm671xuE5dOWxMl2uDrkm5s9mmBdM7nwSzIr8
         /g56850kCbkaMi6CYPnu2FhbBAaKWZil/r7vvIOrW3hldjqnos7Ca2f1p32gxyPc7mXm
         C86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830785; x=1696435585;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCf/DrVn6vdgt427kFGDZ9IsIGpNmDw8wPpYe3DLgNQ=;
        b=DO8GXQrpXxb3Ky/sXZYbUkWu+uJ1wldyljfizZ4efxkhOpk6c3sVXMHGSUgmwOJF1c
         q+qOekit396A5C7wqx1l1SaE0ydIuaJb/8ES3y4KEdtEP3pXlRlfPMtRk0DGvyoRDuUP
         6WxqBlGlIRW3Z/hcJ8L+ogj5/M4RDcexeCJBu5GRABT502Tva24h6QPlbaU1z5czVB9r
         pizKLBPNTiwDePleT3aCwTIT2IY5K0Yi2Oyj+j9uiMcCWJdcZHwXQc7Vo9baOIAQ6QB8
         pEXZ0hzirHQ9gIibMI2rYg6tXZXeWVzZMclOmfofHNWR0Fx1GC0vxKGWPBG3xMd22XJv
         40Iw==
X-Gm-Message-State: AOJu0YwNfpJLD826p9BS/Ji4j41I/GQBEyLQQ3w5hyDPyk7Uzgw1CP4R
	N32cH8LG1s2UEw4ZnOQ4RogL8cd/s0iAUcKXPEQ=
X-Google-Smtp-Source: AGHT+IFZY5tZbBP6QnUr857X77ycGY8nPlrnOnzGSFgCwtWTlFtzV7IdIiuaVFlPyzKKI4eOdbTnP0Y57zu/GJv3V3E=
X-Received: by 2002:a5d:45cd:0:b0:321:7050:6fb6 with SMTP id
 b13-20020a5d45cd000000b0032170506fb6mr2221839wrs.67.1695830785053; Wed, 27
 Sep 2023 09:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230926175354.2297242-1-martin.jansa@gmail.com> <CAMKF1sqWvB-YHMJaXeeOyydHXbJxzErjYxgqOPX4srpT70rj3A@mail.gmail.com>
In-Reply-To: <CAMKF1sqWvB-YHMJaXeeOyydHXbJxzErjYxgqOPX4srpT70rj3A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Sep 2023 18:06:12 +0200
Message-ID: <CA+chaQf4XJ6KhYENTuH9ZKqVqNhP6SV-paBOP8nOLznBvEhdjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gupnp: fix build with meson-1.2.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008ad83b0606595f9c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 16:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105194

--0000000000008ad83b0606595f9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed, there is
https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/1372f9ebe45180d58cefb6c=
0475fafe77de37ef2

I haven't seen it in my world builds because it was "hidden" by gupnp
failure.

Will send patch later.

On Wed, Sep 27, 2023 at 5:50=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> I think we need same/simiilar fix for gupnp-tools as well. See
> https://errors.yoctoproject.org/Errors/Details/738235/
>
> On Tue, Sep 26, 2023 at 10:54=E2=80=AFAM Martin Jansa <martin.jansa@gmail=
.com>
> wrote:
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  ...roperly-spell-provide-in-.wrap-files.patch | 25 +++++++++++++++++++
> >  .../recipes-connectivity/gupnp/gupnp_1.4.1.bb |  1 +
> >  2 files changed, 26 insertions(+)
> >  create mode 100644
> meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-spel=
l-provide-in-.wrap-files.patch
> >
> > diff --git
> a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-sp=
ell-provide-in-.wrap-files.patch
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-sp=
ell-provide-in-.wrap-files.patch
> > new file mode 100644
> > index 0000000000..66f07094c5
> > --- /dev/null
> > +++
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properly-sp=
ell-provide-in-.wrap-files.patch
> > @@ -0,0 +1,25 @@
> > +From 7a4515a356a3d5eb2af1f602c77a42a544e71efa Mon Sep 17 00:00:00 2001
> > +From: Jan Beich <jbeich@FreeBSD.org>
> > +Date: Sun, 9 Jul 2023 03:30:47 +0000
> > +Subject: [PATCH] build: properly spell [provide] in *.wrap files
> > +
> > +meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean
> "[provide]"?
> > +
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29323cbb8fbd36bc69d=
08097a2ae2cd1
> ]
> > +---
> > + subprojects/gssdp-1.2.wrap | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
> > +index 469c75d..466b83b 100644
> > +--- a/subprojects/gssdp-1.2.wrap
> > ++++ b/subprojects/gssdp-1.2.wrap
> > +@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gssdp.git
> > + revision =3D gssdp-1.4
> > + depth =3D 1
> > +
> > +-[provides]
> > ++[provide]
> > + dependency_name =3D gssdp-1.2
> > +
> > diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> > index c21e7a05bf..efeb66f28f 100644
> > --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> > +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> > @@ -9,6 +9,7 @@ inherit meson pkgconfig vala gobject-introspection
> >
> >  SRC_URI =3D "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz \
> >      file://0001-all-Drop-xmlRecoverMemory.patch \
> > +    file://0001-build-properly-spell-provide-in-.wrap-files.patch \
> >  "
> >  SRC_URI[sha256sum] =3D
> "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55345ab3281655dc0c"
> >
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105145):
> https://lists.openembedded.org/g/openembedded-devel/message/105145
> > Mute This Topic: https://lists.openembedded.org/mt/101601703/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000008ad83b0606595f9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Agreed, there is<div><a href=3D"https://gitlab.gnome.org/G=
NOME/gupnp-tools/-/commit/1372f9ebe45180d58cefb6c0475fafe77de37ef2">https:/=
/gitlab.gnome.org/GNOME/gupnp-tools/-/commit/1372f9ebe45180d58cefb6c0475faf=
e77de37ef2</a><br></div><div><br></div><div>I haven&#39;t seen it in my wor=
ld builds because it was &quot;hidden&quot; by gupnp failure.</div><div><br=
></div><div>Will send patch later.</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 5:50=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
I think we need same/simiilar fix for gupnp-tools as well. See<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/738235/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/738235/</a><br>
<br>
On Tue, Sep 26, 2023 at 10:54=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; w=
rote:<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...roperly-spell-provide-in-.wrap-files.patch | 25 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a> |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 26 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gu=
pnp/0001-build-properly-spell-provide-in-.wrap-files.patch<br>
&gt;<br>
&gt; diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-bui=
ld-properly-spell-provide-in-.wrap-files.patch b/meta-multimedia/recipes-co=
nnectivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.pat=
ch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..66f07094c5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-prop=
erly-spell-provide-in-.wrap-files.patch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From 7a4515a356a3d5eb2af1f602c77a42a544e71efa Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jan Beich &lt;jbeich@FreeBSD.org&gt;<br>
&gt; +Date: Sun, 9 Jul 2023 03:30:47 +0000<br>
&gt; +Subject: [PATCH] build: properly spell [provide] in *.wrap files<br>
&gt; +<br>
&gt; +meson.build:1:0: ERROR: Unexpected &quot;[provides]&quot; section, di=
d you mean &quot;[provide]&quot;?<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
gupnp/-/commit/884639bd29323cbb8fbd36bc69d08097a2ae2cd1" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.gnome.org/GNOME/gupnp/-/commit/884639bd29=
323cbb8fbd36bc69d08097a2ae2cd1</a>]<br>
&gt; +---<br>
&gt; + subprojects/gssdp-1.2.wrap | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap<=
br>
&gt; +index 469c75d..466b83b 100644<br>
&gt; +--- a/subprojects/gssdp-1.2.wrap<br>
&gt; ++++ b/subprojects/gssdp-1.2.wrap<br>
&gt; +@@ -3,6 +3,6 @@ url =3D <a href=3D"https://gitlab.gnome.org/GNOME/gss=
dp.git" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME=
/gssdp.git</a><br>
&gt; + revision =3D gssdp-1.4<br>
&gt; + depth =3D 1<br>
&gt; +<br>
&gt; +-[provides]<br>
&gt; ++[provide]<br>
&gt; + dependency_name =3D gssdp-1.2<br>
&gt; +<br>
&gt; diff --git a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"htt=
p://gupnp_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a>=
 b/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gupnp_1.4.1=
.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a><br>
&gt; index c21e7a05bf..efeb66f28f 100644<br>
&gt; --- a/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gup=
np_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a><br>
&gt; +++ b/meta-multimedia/recipes-connectivity/gupnp/<a href=3D"http://gup=
np_1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">gupnp_1.4.1.bb</a><br>
&gt; @@ -9,6 +9,7 @@ inherit meson pkgconfig vala gobject-introspection<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-all-Drop-xmlRecoverMemory.patch \<br>
&gt; +=C2=A0 =C2=A0 file://0001-build-properly-spell-provide-in-.wrap-files=
.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;899196b5e66f03b8e25f046a7a658cd2a68=
51becb83f2d55345ab3281655dc0c&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105145): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105145" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105145</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10160170=
3/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101601703/1997914</a><br>
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

--0000000000008ad83b0606595f9c--

