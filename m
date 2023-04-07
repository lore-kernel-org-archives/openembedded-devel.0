Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06354C77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 23:50:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1190.1680911420188302674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 16:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=qknyfQq1;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id k5so154173wms.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 16:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680911418; x=1683503418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vY3o+hUbt6AIodPtoDY7VP80JGRPcohD5YcY/KdoGfU=;
        b=qknyfQq1j5aUR4IU+rspbT99jIU6n1CBtU9VzRqhi2Yc1jMjMmvNPQRfbAPH+LUAYr
         pJ3wHgLlhisl3v6WewAMI4Pc4LyU9lKf/m8spoTmLVzuDiH9sRHexGpWBT3mqHQCm3Vr
         D9SMgdzxeXJlAyPeueP/9oP6y45qFaJvOKtE9UpMmcFfOPhfT6yzFhNrApwwFee4eh1m
         H+aDIUQy94cFTiFaiC3wltImiuYhLRe+EVDB0cpWnzMkZlspAU6EiBdrcsZiuWl9Dg0l
         D+vAl7NvuQrbTr5OF2ZywMDF6ZrUSsS3zrf+Y17gPZxRkVumqC1cCWvWW8WvCPcGo5lc
         BoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911418; x=1683503418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vY3o+hUbt6AIodPtoDY7VP80JGRPcohD5YcY/KdoGfU=;
        b=4sGYZx0eHBgOsXh5XGR9NL1SfyDvwV6QxXXMBzFb0VNtPIZE1L5Ojcbrt0VSJZLdKD
         pg8kdBjYT3blVQV1GmAvEullfwA8KDRAJ32zJOiX+5Riy84p7Nm+Ar3Zj4PCOfiE7VNj
         0841dKZxyMmROlo0cm+4sDX8hY4hKx/uIZSsuajeUwMNzpSaM7wdZXRWzlkevLyHsBOW
         5g1poWJ5M3x8yrIQytVEFM7d+0WBhSQNWJCULrAHomlN/mCDnma4Fi8qW1VgF3XGIg21
         5+xT16UcYP5ai8VmBPilQDm8ozfZvzaRCb79CagyJNokUxLpIiq2RJ3FV6ATsQJDPGnc
         yzIg==
X-Gm-Message-State: AAQBX9f2NAHXQ7ePM51sqqe9WnzBBiLAn6VLR6KyQI1hWYFXHLpb2TI6
	+9fc9zmfAKJaFQL18LLqhJUEWBvCcexq/XBFlII=
X-Google-Smtp-Source: AKy350ZYoPq0QbssxqWpMU6zHeqBW/tFW/jSZMouXCLgWsHjtmU7nzsH/vZKer3IccqdCF5umuMTZuaphny1wgu0lYw=
X-Received: by 2002:a05:600c:cc:b0:3f0:5beb:6d8 with SMTP id
 u12-20020a05600c00cc00b003f05beb06d8mr37249wmm.3.1680911418412; Fri, 07 Apr
 2023 16:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230407220737.889502-1-Martin.Jansa@gmail.com> <CAMKF1sofLgFddNZay7MmbPvQELsB8KeQTAXMgR4V0EgcAnZxdA@mail.gmail.com>
In-Reply-To: <CAMKF1sofLgFddNZay7MmbPvQELsB8KeQTAXMgR4V0EgcAnZxdA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 8 Apr 2023 01:50:07 +0200
Message-ID: <CA+chaQdeazrz56nCQ_U3Xn6xfO5g70AmNujQEmQ1JaOwrJGQYw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] pahole: respect libdir
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe558805f8c7afc9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 23:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101993

--000000000000fe558805f8c7afc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, we can I think as commit message says, but we should probably use
baselib in cmake.bbclass as well for consistency.

On Sat, Apr 8, 2023 at 1:48=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 7, 2023 at 3:07=E2=80=AFPM Martin Jansa <Martin.Jansa@gmail.c=
om>
> wrote:
> >
> > * use the same expression as cmake.bbclass is using:
> >   CMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar('libdir'),
> d.getVar('prefix') + '/')}
> >   but ${baselib} should work here as well
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/pahole/pahole_1.24.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> > index b7f1f8bb28..2bb73c3eb7 100644
> > --- a/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> > +++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
> > @@ -20,7 +20,7 @@ inherit cmake pkgconfig
> >
> >  PACKAGECONFIG[python3] =3D ",,python3-core,python3-core"
> >
> > -EXTRA_OECMAKE =3D "-D__LIB=3Dlib -DCMAKE_BUILD_TYPE=3DRelease
> -DLIBBPF_EMBEDDED=3DOFF"
> > +EXTRA_OECMAKE =3D "-D__LIB=3D${@os.path.relpath(d.getVar('libdir'),
> d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=3DRelease -DLIBBPF_EMBEDDED=
=3DOFF"
>
> Can we use ${baselib} instead ?
>
> >
> >  FILES:${PN} =3D  "${bindir}/pahole \
> >                 ${libdir}/libdwarves.so* \
> > --
> > 2.40.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#101990):
> https://lists.openembedded.org/g/openembedded-devel/message/101990
> > Mute This Topic: https://lists.openembedded.org/mt/98134284/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000fe558805f8c7afc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, we can I think as commit message says, but we should =
probably use baselib in cmake.bbclass as well for consistency.</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 8=
, 2023 at 1:48=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Fri, Apr 7, 2023 at 3:07=E2=80=AFPM Martin Jansa &lt=
;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * use the same expression as cmake.bbclass is using:<br>
&gt;=C2=A0 =C2=A0CMAKE_INSTALL_LIBDIR:PATH=3D${@os.path.relpath(d.getVar(&#=
39;libdir&#39;), d.getVar(&#39;prefix&#39;) + &#39;/&#39;)}<br>
&gt;=C2=A0 =C2=A0but ${baselib} should work here as well<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb=
" rel=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_=
1.24.bb" rel=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a> b/meta-oe/=
recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb" rel=3D"noreferrer=
" target=3D"_blank">pahole_1.24.bb</a><br>
&gt; index b7f1f8bb28..2bb73c3eb7 100644<br>
&gt; --- a/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb=
" rel=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/pahole/<a href=3D"http://pahole_1.24.bb=
" rel=3D"noreferrer" target=3D"_blank">pahole_1.24.bb</a><br>
&gt; @@ -20,7 +20,7 @@ inherit cmake pkgconfig<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[python3] =3D &quot;,,python3-core,python3-core&quo=
t;<br>
&gt;<br>
&gt; -EXTRA_OECMAKE =3D &quot;-D__LIB=3Dlib -DCMAKE_BUILD_TYPE=3DRelease -D=
LIBBPF_EMBEDDED=3DOFF&quot;<br>
&gt; +EXTRA_OECMAKE =3D &quot;-D__LIB=3D${@os.path.relpath(d.getVar(&#39;li=
bdir&#39;), d.getVar(&#39;prefix&#39;) + &#39;/&#39;)} -DCMAKE_BUILD_TYPE=
=3DRelease -DLIBBPF_EMBEDDED=3DOFF&quot;<br>
<br>
Can we use ${baselib} instead ?<br>
<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN} =3D=C2=A0 &quot;${bindir}/pahole \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}=
/libdwarves.so* \<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#101990): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/101990" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/101990</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98134284=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98134284/1997914</a><br>
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

--000000000000fe558805f8c7afc9--

