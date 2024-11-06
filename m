Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05F7D59F4A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 16:00:37 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.49357.1730908830108096238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 08:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCSAA6qa;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e607556c83so3885883b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 08:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730908829; x=1731513629; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3K8sqI8r5nf03ZLQ5nGiDxmx6OkSWHt8f5UHrFNVu9s=;
        b=GCSAA6qauJsTrGa82GLCdQCz/u+3/h7hjXs37IqRgcOABrGAPzQkNWNg/kDtS20mpa
         SSfRwMBLnPFOaoFvVuPNTUZUfQ8VGks48PkO4AjOcE09N7/ShgXmbdYrpZpM9BzopRlI
         Y/bHaFVUUqt2ewGb0wEZ2wfmZBpr7wm2RBCMXbvPgp60RRii5Z/drcH40ScdhLIWGnb0
         z91RHswEFBQs6AjkUz3qiZrNYqH8xzR9PecrtdkoQLSoTlvSRuFkL4fe5q4IJrUia2BK
         1D9xo0MZDIIxijlIeFQIVeZ3vE0LLLe8oenBR+VVoyhNVQFY1VWs7IdCiwj09HC3Wx90
         t3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730908829; x=1731513629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3K8sqI8r5nf03ZLQ5nGiDxmx6OkSWHt8f5UHrFNVu9s=;
        b=WG1FYaaaZw3H9ga/jQ973AFBfjzi3ZQiy22lEp9E/cmKSYb5x80Ge4tneNBG/SajJf
         hQr5CgnFGqSr712+mLzV9Ubt/uYFHa9Aelozh7qTJTD/8SV5fwXQjrwyxpBBIpLHSSG1
         YgKAEb/VgJH1VD3vDpMiQ2lbDuRXcpSndFTQkQ0Qpoqbwh+bS7SxRZ+bDaL/RpL1XSYE
         B9z5xP4ulKOM+rTP5DCGPBAi2PqWzGpWI5IKWyD+6pT2AY5TPlyD7lqZZW2DA+4jl/yu
         j02L+CDOJK40/sbZD3DFs+UbKjuOY+D7smTV81yV4ubaxqFvsTq7ExRWuS5rc2gvH8iq
         7JxQ==
X-Gm-Message-State: AOJu0YxxbuoG6SF8PfJBobl6EQs7kgEJyELpQq6h/JgxuvvArZSDV1gZ
	rpwL7TmRqR/HWDfZHZj6zWl5yLJw3vCo3Xa7uELLNIKFxqAajSZLFT+zdHFPshps1k+TG8OawRZ
	L/bp1uileHixikG9kzWEonSL8gyE=
X-Google-Smtp-Source: AGHT+IHfIOL51Ro+bo+PR5fA9FfD7e9WeVdnfhH/I6ErOA/gybN1K6CecgW73+9bCYIaosCcamQOJGZo7iG/BBNfCvk=
X-Received: by 2002:a05:6808:3383:b0:3e6:3cdd:b3d1 with SMTP id
 5614622812f47-3e63cddb3d6mr30978261b6e.16.1730908828436; Wed, 06 Nov 2024
 08:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20240922073618.1359707-1-yi.zhao@windriver.com> <26643868.1r3eYUQgxm@n9w6sw14>
In-Reply-To: <26643868.1r3eYUQgxm@n9w6sw14>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2024 08:00:17 -0800
Message-ID: <CAMKF1sqFFo_CEksutxjc2aCr+Vz+jd-kzcPyNXAfZo-upgcBYQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
To: Christian Eggers <ceggers@arri.de>
Cc: openembedded-devel@lists.openembedded.org, 
	Yi Zhao <yi.zhao@eng.windriver.com>, peter.marko@siemens.com, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="000000000000db933b0626409dca"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 16:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113743

--000000000000db933b0626409dca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm I thought I gave some feedback to author but there is no follow up can
you send a revert or perhaps the recommends suggestion

On Wed, Nov 6, 2024 at 7:54=E2=80=AFAM Christian Eggers <ceggers@arri.de> w=
rote:

> Hi Khem,
>
> I wonder why this patch has been applied although there were concerns
> about it:
>
> regards,
> Christian
>
> On Sunday, 22 September 2024, 09:36:17 CET, Yi Zhao wrote:
> > Since commit[1], the libraries of abseil-cpp have been splitted into
> > separate packages. When protobuf is installed into the image, only 48
> > abseil libraries are installed as runtime dependencies. But the output
> > of 'pkg-config --libs protobuf' lists 66 abseil-cpp libraries are
> > required. Add abseil-cpp to RDEPENDS to ensure that all required
> > abseil-cpp libraries are installed.
> >
> > [1]
> https://git.openembedded.org/meta-openembedded/commit/?id=3Ddd6421e65eb75=
c35a904f4b487ba022075035ecc
> >
> > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > ---
> >  meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > index cc5204de4..354b3213a 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D
> "${libdir}/libprotobuf-lite${SOLIBS}"
> >  # CMake requires protoc binary to exist in sysroot, even if it has
> wrong architecture.
> >  SYSROOT_DIRS +=3D "${bindir}"
> >
> > +RDEPENDS:${PN} =3D "abseil-cpp"
> > +RDEPENDS:${PN}-lite =3D "abseil-cpp"
> >  RDEPENDS:${PN}-compiler =3D "${PN}"
> >  RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> >  RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'python3-protobuf', '', d)}"
> >
>
>
> On Tuesday, 1 October 2024, 13:59:56 CET, Peter Kjellerstedt wrote:
> > Can we at least change the dependency to a recommendation so
> > that it can be avoided via BAD_RECOMMENDATIONS? Because as it
> > is, it penalizes everyone that use protobuf for the case where
> > one provides an SDK with protobuf.
>
>
> 2On Tuesday, 1 October 2024, 14:42:04 CET, Peter Marko via
> lists.openembedded.org wrote:
> > I think that's also not the right way to do this.
> > Adding unnecessary stuff to release images to satisfy SDK needs is wron=
g.
>
>
>
>

--000000000000db933b0626409dca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hmm I thought I gave some feedback to author but there is=
 no follow up can you send a revert or perhaps the recommends suggestion</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, Nov 6, 2024 at 7:54=E2=80=AFAM Christian Eggers &lt;<a href=3D"ma=
ilto:ceggers@arri.de">ceggers@arri.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Hi Khem,<br>
<br>
I wonder why this patch has been applied although there were concerns about=
 it:<br>
<br>
regards,<br>
Christian<br>
<br>
On Sunday, 22 September 2024, 09:36:17 CET, Yi Zhao wrote:<br>
&gt; Since commit[1], the libraries of abseil-cpp have been splitted into<b=
r>
&gt; separate packages. When protobuf is installed into the image, only 48<=
br>
&gt; abseil libraries are installed as runtime dependencies. But the output=
<br>
&gt; of &#39;pkg-config --libs protobuf&#39; lists 66 abseil-cpp libraries =
are<br>
&gt; required. Add abseil-cpp to RDEPENDS to ensure that all required<br>
&gt; abseil-cpp libraries are installed.<br>
&gt; <br>
&gt; [1] <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?=
id=3Ddd6421e65eb75c35a904f4b487ba022075035ecc" rel=3D"noreferrer" target=3D=
"_blank">https://git.openembedded.org/meta-openembedded/commit/?id=3Ddd6421=
e65eb75c35a904f4b487ba022075035ecc</a><br>
&gt; <br>
&gt; Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" ta=
rget=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.25.4.bb</a> | 2 ++<=
br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://proto=
buf_4.25.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.25.4.bb</a> =
b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.25.4.bb" r=
el=3D"noreferrer" target=3D"_blank">protobuf_4.25.4.bb</a><br>
&gt; index cc5204de4..354b3213a 100644<br>
&gt; --- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.25.4.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_4.2=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.25.4.bb</a><br>
&gt; @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D &quot;${libdir}/libprotobuf-l=
ite${SOLIBS}&quot;<br>
&gt;=C2=A0 # CMake requires protoc binary to exist in sysroot, even if it h=
as wrong architecture.<br>
&gt;=C2=A0 SYSROOT_DIRS +=3D &quot;${bindir}&quot;<br>
&gt;=C2=A0 <br>
&gt; +RDEPENDS:${PN} =3D &quot;abseil-cpp&quot;<br>
&gt; +RDEPENDS:${PN}-lite =3D &quot;abseil-cpp&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN}-compiler =3D &quot;${PN}&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN}-dev +=3D &quot;${PN}-compiler&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN}-ptest =3D &quot;bash ${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;python&#39;, &#39;python3-protobuf&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; <br>
<br>
<br>
On Tuesday, 1 October 2024, 13:59:56 CET, Peter Kjellerstedt wrote:<br>
&gt; Can we at least change the dependency to a recommendation so <br>
&gt; that it can be avoided via BAD_RECOMMENDATIONS? Because as it <br>
&gt; is, it penalizes everyone that use protobuf for the case where <br>
&gt; one provides an SDK with protobuf.<br>
<br>
<br>
2On Tuesday, 1 October 2024, 14:42:04 CET, Peter Marko via <a href=3D"http:=
//lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openem=
bedded.org</a> wrote:<br>
&gt; I think that&#39;s also not the right way to do this.<br>
&gt; Adding unnecessary stuff to release images to satisfy SDK needs is wro=
ng.<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000db933b0626409dca--

