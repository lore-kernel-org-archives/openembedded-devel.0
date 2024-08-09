Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BFBC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 21:52:59 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.94746.1723240376684537342
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 14:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CZE/UCHk;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f1870c355cso23895441fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 14:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723240375; x=1723845175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w9ewk4A38PWx9XbvZmLMbxKrXNioOnF4Tq32VNkxeB4=;
        b=CZE/UCHkA6g5CtxNanMSMF+HhCDAY2a+LLn+bOm4gRZwjZ0Lq0c0CD5wvIDMaEVNiR
         LE3A+l/lEKYZDq19DvIm9Fwufz09N2WRG4ZE/tNBUnw8FRwx/hVqDyNZ8B5GDn6oGhqq
         wM3XR9zRDH6bJpobpWSOHm6/pJQriYe4Lf33uFojWS+FZeGX/qZ9vlcRBAcwBSJ4JQP5
         Fg+aZX57Wuaab+ERGlKkj1qdc6Q3MLNnXBSU5P9nKvDLgdqmnPeBWhCxgnCp6P5mKaY7
         FqOJAF0zc29xIU4Vku2brq4ma/sOdj97UmJLdQFppOv2CXf1eMQy+Uy2vBSTZOPiUB+u
         3kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723240375; x=1723845175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9ewk4A38PWx9XbvZmLMbxKrXNioOnF4Tq32VNkxeB4=;
        b=XqDZDgm3s96oLT7kk/gfRTxavRE4gCW4w1hp1aYmh/BAIEGbx3IntwuIhz2wVqF8iU
         mtjtOWPTSRbj7yQF/GHM5zvsoj5AT2PEw+xQaxBxGf1NoQbwm4mZcuplLi51eSNB3bMA
         4eVHMdQjsbtVznhISJbeSgqA1dp3oSubnZfT2eegicJiGBuYDdOoovzeTnn7R/XN4X+z
         72IVjh5Ua5GBDIo7Y00sEkqYHpvmZUH5H3gSUwGBvEIyDBiXD+HKjK2122OSkj8NteGN
         yCwfrKIn0I8rZK5Iw4y7+bOib6ZWZ2YMRr1EKLKxqdHwgnzI7/g5g95n8AIH6l5JSyI1
         qUPg==
X-Forwarded-Encrypted: i=1; AJvYcCVm+x8+hfLSCTL4O5kncotx7/0dUDrOUcWfXmdkXqdyuK8iLDY+Zadqb9+l91i600cHAqOL4ODMdizY/nT3y/UtZxzeyb2bys0FYYcFOFoYEXaOurXNXsuVxg==
X-Gm-Message-State: AOJu0YzK6/k7NDPtoOKFqMhmfmxXeQzGEZluTTL0iLc6ld3Hssg+8qmV
	wNxVXbXkLhaebfzn41Gx9/8F7ix2TxAlwjUj5VoY9rfOmWDbvxl3goZbrKT+ZKBr1v/xvrjh7kl
	DD1w6VuYhdvS1BPqrEHTqbDG2HT0=
X-Google-Smtp-Source: AGHT+IEgRAunVWLqyFdZYETnql+Fz0EeAjo5H4D8jj/QBu3YNgaMXkC8KWb653b/OFCY6JSFCMOJGrSQClVEPzhRNSY=
X-Received: by 2002:a05:6512:3350:b0:530:ac6e:ea2f with SMTP id
 2adb3069b0e04-530eea1fcdemr1633755e87.37.1723240374179; Fri, 09 Aug 2024
 14:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240807124748.126211-1-alperyasinak1@gmail.com>
 <CAMKF1srJ1+TVbifjSi7_WRadAkTdanAqWqXXN_NvUtPRVgzG1Q@mail.gmail.com> <CAMKF1sq9v+vFzcHz58Tv--CFTcs+ubODfPQENwwm9E2BZ6Ve3g@mail.gmail.com>
In-Reply-To: <CAMKF1sq9v+vFzcHz58Tv--CFTcs+ubODfPQENwwm9E2BZ6Ve3g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 9 Aug 2024 14:52:41 -0700
Message-ID: <CANx9H-BD+G85WLNFRPMwd6+F6iCA8UjTZ61z-8mv19tTjB4_Zw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-daemon: switch to PEP-517 build backend
To: raj.khem@gmail.com
Cc: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005da039061f472ac2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 21:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111731

--0000000000005da039061f472ac2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 2:42=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> here is link to error for just this recipe -
> https://errors.yoctoproject.org/Errors/Details/797752/


The key to that backtrace is:
ModuleNotFoundError: No module named 'setuptools.extern'

Where to go from there is less obvious.

>
>
> On Fri, Aug 9, 2024 at 9:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > it fails to compile see
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4025/st=
eps/15/logs/stdio
> >
> > On Wed, Aug 7, 2024 at 5:47=E2=80=AFAM Alper Ak via lists.openembedded.=
org
> > <alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > The project has a proper pyproject.toml which declares the
> setuptools.build.meta PEP-517 backend.
> > >
> > > Fix:
> > >
> > > WARNING: python3-daemon-3.0.1-r0 do_check_backend: QA Issue: inherits
> setuptools3 but has pyproject.toml with setuptools.build_meta, use the
> correct class [pep517-backend]
> > >
> > > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > > ---
> > >  .../python/python3-daemon_3.0.1.bb             | 18
> +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/
> python3-daemon_3.0.1.bb b/meta-python/recipes-devtools/python/
> python3-daemon_3.0.1.bb
> > > index 715d3bf12..4cdbff0ee 100644
> > > --- a/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-daemon_3.0.1.bb
> > > @@ -1,18 +1,18 @@
> > >  DESCRIPTION =3D "Library to implement a well-behaved Unix daemon
> process"
> > >  HOMEPAGE =3D "https://pagure.io/python-daemon/"
> > >  SECTION =3D "devel/python"
> > > -
> > > -DEPENDS +=3D "python3-docutils-native"
> > > -RDEPENDS:${PN} =3D "python3-docutils \
> > > -                  python3-lockfile (>=3D 0.10) \
> > > -                  python3-resource \
> > > -"
> > > -
> > >  LICENSE =3D "Apache-2.0 & GPL-3.0-only"
> > >  LIC_FILES_CHKSUM =3D
> "file://README;md5=3Da3a94c615dc969a70525f1eebbacf235"
> > >
> > > -inherit pypi setuptools3
> > > +PYPI_PACKAGE =3D "python-daemon"
> > > +
> > > +inherit pypi python_setuptools_build_meta
> > >
> > >  SRC_URI[sha256sum] =3D
> "6c57452372f7eaff40934a1c03ad1826bf5e793558e87fef49131e6464b4dae5"
> > >
> > > -PYPI_PACKAGE =3D "python-daemon"
> > > +DEPENDS +=3D "python3-docutils-native"
> > > +
> > > +RDEPENDS:${PN} =3D "python3-docutils \
> > > +                  python3-lockfile (>=3D 0.10) \
> > > +                  python3-resource \
> > > +"
> > > --
> > > 2.25.1
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111730):
> https://lists.openembedded.org/g/openembedded-devel/message/111730
> Mute This Topic: https://lists.openembedded.org/mt/107768088/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005da039061f472ac2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 9, 2024 at 2:42=E2=80=AFP=
M Khem Raj via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">here is link to error for just this recipe=
 -<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/797752/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/797752/</a></blockquote><div><br></div><div>The key to that backtrace is:<=
br><span style=3D"background-color:rgb(245,245,245);color:rgb(51,51,51);fon=
t-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace;font-size:=
13px">ModuleNotFoundError: No module named &#39;setuptools.extern&#39;</spa=
n>=C2=A0</div><div><br></div><div>Where to go from there is less obvious.</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On Fri, Aug 9, 2024 at 9:08=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; it fails to compile see<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/4025/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/4025/steps/15/=
logs/stdio</a><br>
&gt;<br>
&gt; On Wed, Aug 7, 2024 at 5:47=E2=80=AFAM Alper Ak via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a><br>
&gt; &lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; The project has a proper pyproject.toml which declares the setupt=
ools.build.meta PEP-517 backend.<br>
&gt; &gt;<br>
&gt; &gt; Fix:<br>
&gt; &gt;<br>
&gt; &gt; WARNING: python3-daemon-3.0.1-r0 do_check_backend: QA Issue: inhe=
rits setuptools3 but has pyproject.toml with setuptools.build_meta, use the=
 correct class [pep517-backend]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.=
com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-daemon_3.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-daemon_3.0.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++++++++---------<br>
&gt; &gt;=C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-daemon_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-dae=
mon_3.0.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://py=
thon3-daemon_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_=
3.0.1.bb</a><br>
&gt; &gt; index 715d3bf12..4cdbff0ee 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-daemon_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0=
.1.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-daemon_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-daemon_3.0=
.1.bb</a><br>
&gt; &gt; @@ -1,18 +1,18 @@<br>
&gt; &gt;=C2=A0 DESCRIPTION =3D &quot;Library to implement a well-behaved U=
nix daemon process&quot;<br>
&gt; &gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://pagure.io/python-daem=
on/" rel=3D"noreferrer" target=3D"_blank">https://pagure.io/python-daemon/<=
/a>&quot;<br>
&gt; &gt;=C2=A0 SECTION =3D &quot;devel/python&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -DEPENDS +=3D &quot;python3-docutils-native&quot;<br>
&gt; &gt; -RDEPENDS:${PN} =3D &quot;python3-docutils \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
ython3-lockfile (&gt;=3D 0.10) \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
ython3-resource \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;Apache-2.0 &amp; GPL-3.0-only&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://README;md5=3Da3a94c615dc9=
69a70525f1eebbacf235&quot;<br>
&gt; &gt;<br>
&gt; &gt; -inherit pypi setuptools3<br>
&gt; &gt; +PYPI_PACKAGE =3D &quot;python-daemon&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pypi python_setuptools_build_meta<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;6c57452372f7eaff40934a1c03ad18=
26bf5e793558e87fef49131e6464b4dae5&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PYPI_PACKAGE =3D &quot;python-daemon&quot;<br>
&gt; &gt; +DEPENDS +=3D &quot;python3-docutils-native&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS:${PN} =3D &quot;python3-docutils \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
ython3-lockfile (&gt;=3D 0.10) \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p=
ython3-resource \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111730): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111730" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111730</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107768088/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107768088/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005da039061f472ac2--

