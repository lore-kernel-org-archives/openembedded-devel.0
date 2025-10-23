Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEC1CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 03:48:49 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.web11.12263.1761191328515842268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 20:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ck0M1Rah;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63e365693c8so352507d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 20:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761191327; x=1761796127; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvmPhXgsU16Un+r4HtiYmFOShM84wI31lNnPoPXdtmA=;
        b=Ck0M1RahexGmge7CqeThrslwFeutzoEkyn7NsmG4urFJjntC0xAe+KVBufL53NANTJ
         I8MYh2Tb5D0hu526fzoviu1Y467zkzjelWseMmGanM2HUVHSrLUh9f+t3Lq1IcVOTyB8
         eZKyWBQEvoB11l0qQCT/qT/hWpBjM9PYEDeTmDBFnMJCuVyrpC8mL3fOdBMkJzWHLH3E
         VppPyawUyEk8dLdNkXJKDle8eOGbzh9mwgfJsqPWTc6laYkPJQOsKQ2jMpEpXu+ERxYX
         0YPZV5bT8ViyHODeOibTtmrSBex5gqubQwCyaW7QJMXXKWHwguHBTRFqkTcAGNNtpCIG
         ngew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761191327; x=1761796127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvmPhXgsU16Un+r4HtiYmFOShM84wI31lNnPoPXdtmA=;
        b=d1kJyDv3dpOFsEy6CizlIQuf+8w67eoThv+cjzhrp2nqlauoEs/s66M+QauS6a8j3X
         Syh8pr40ZufyV7sH1W96nkMCE0bQqhTprJfT/L9udTXg/tXcjjmy6MTwoDV7HqDVVyFI
         yLscBwgnsanE+xdNOAr+qDbkAzZGLrEsMc4N1pPTxj4nH+W7WoHBrSUWxpiBh2clrPUn
         Et5SHaP7Gn/lnYxa8Yc4L1bf7eSHwrB1b/B4gHpi6EyWHSeNMGxxJ710YPKg1jSmvDCz
         XZwcY7d/NLOV/C9mUqV3C1N+OmLMMQToM/EU4aXRhiOFHNX4GxE7sCmlMH3PdhppRDSu
         NDnA==
X-Gm-Message-State: AOJu0YyyjOtKirOKLfjhxIN9NUnlmNsXuT+iJGkQflhSN5t0YKONSOto
	iqLQL7YP09vdsP50fFd+2pXEkMJv8/PxVktGOplt6Nv111ycPus7VlIl1fgtu3qpB/DtSrPZyJg
	NK9pUVWbXqLmv2vuuArC8bVr7nX1IJbbcXXpY
X-Gm-Gg: ASbGncunbcTwOvsYHAx1/x2DN19dEBTsHqVN3IzgXBNaFr8LIPLmAhkyh0jhfDDv9AO
	5rKN0TO3qUZ8igKJCeZxE242+KlAf22hR58YjdlfbHHNQqDjGPaQofh7P5p2AUBjxvUogpuopVm
	VRh589Y8tWgNoudO1JAIu1j9RMhfzZOZWQff2PnZgmmtZAT5DYNffGPi1KLg5CNJ45e19aEHuGE
	FJQhDBbXba+nutPm3DYfxxBZuRXdP9ZawnyQgRdQgDXz7qXzxsFsfzGvVMw6ohQ4J7NcBLnlGsB
	SQWWFIFWWiJAQFeLQ4U+etfogU+1kGycxPXeutbMiR6HAbH7P9pGlOUdRSjjpxkWHiYs1RBCxv/
	fij0US25jdD+sPxgE7/VkKMs=
X-Google-Smtp-Source: AGHT+IF8M2fU+AXIC7sCSJ36WS9SGxeEHACxIeU7kAu4dtgZX0fiCmIdqyfNhAUIGe7qRxNavCyuOxGuceYspTvGz/I=
X-Received: by 2002:a05:690c:6b81:b0:781:64f:3144 with SMTP id
 00721157ae682-7836d3bb878mr198066887b3.66.1761191327255; Wed, 22 Oct 2025
 20:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251023025102.3182631-1-raj.khem@gmail.com> <CADySD0E9EKMLCYJ89uEh8uVtnqnb_90LN8RJMtg-pgb8v_KB+A@mail.gmail.com>
In-Reply-To: <CADySD0E9EKMLCYJ89uEh8uVtnqnb_90LN8RJMtg-pgb8v_KB+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Oct 2025 20:48:36 -0700
X-Gm-Features: AS18NWB7mFiOXkXvf4ilQDmlaOJ5G54RyWZJetX42iO_e5ygyIGgadIqiueH8cA
Message-ID: <CAMKF1sqNVDYH-HBFuJ4a93xnOakikRqXVyuaT2p+yYPbC1DA7w@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-setuptools-git-versioning:
 Add recipe
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007151380641cb4ffa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 03:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120914

--0000000000007151380641cb4ffa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:37=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.co=
m> wrote:

> On Thu, Oct 23, 2025 at 3:51=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Some packages e.g. python3-cytoolz are needing it now.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...python3-setuptools-git-versioning_2.1.0.bb | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_2.1.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_2.1.0.bb
> b/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_2.1.0.bb
> > new file mode 100644
> > index 0000000000..0da9d26dd3
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_2.1.0.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Use git repo data for building a version number according
> PEP-440"
> > +HOMEPAGE =3D "https://setuptools-git-versioning.readthedocs.io"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92e79e3a844e66731724600f3ac=
9c0d8"
> > +
> > +SRC_URI[sha256sum] =3D
> "6aef5b8bb1cfb953b6b343d27cbfc561d96cf2a2ee23c2e0dd3591042a059921"
> > +
> > +inherit pypi setuptools3
> > +
> > +PACKAGECONFIG ?=3D ""
> > +PACKAGECONFIG[python-version-smaller-3-dot-11] =3D ",,,python3-tomli"
> > +
> > +RDEPENDS:${PN} +=3D "python3-packaging python3-setuptools \
> > +                   python3-core python3-datetime python3-logging \
> > +                                  python3-packaging python3-pprint
> python3-setuptools \
>
> python3-packaging and python3-setuptools are already added


Good catch !


>
> > +                                  python3-tomllib"
> > +
> > +PYPI_PACKAGE =3D "setuptools_git_versioning"
> > +
> > +BBCLASSEXTEND +=3D "native"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120911):
> https://lists.openembedded.org/g/openembedded-devel/message/120911
> > Mute This Topic: https://lists.openembedded.org/mt/115904614/3619737
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> ankur.tyagi85@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000007151380641cb4ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 22, 2025 at 8:37=E2=80=AFPM=
 Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)">On Thu, Oct 23, 2025 at 3=
:51=E2=80=AFPM Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Some packages e.g. python3-cytoolz are needing it now.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...<a href=3D"http://python3-setuptools-git-versioning_2.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-setuptools-git-versioning_2.1=
.0.bb</a> | 20 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 20 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-setuptools-git-versioning_2.1.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-setuptools-git-versioning_2.1.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-setuptools-git-versioning_2.1.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-setuptools-git-versioning_2.1.0.bb</a> b/meta-python/recipes-dev=
tools/python/<a href=3D"http://python3-setuptools-git-versioning_2.1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-setuptools-git-versioning_2.1.=
0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0da9d26dd3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
tuptools-git-versioning_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-setuptools-git-versioning_2.1.0.bb</a><br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +SUMMARY =3D &quot;Use git repo data for building a version number acc=
ording PEP-440&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://setuptools-git-versioning.readt=
hedocs.io" rel=3D"noreferrer" target=3D"_blank">https://setuptools-git-vers=
ioning.readthedocs.io</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D92e79e3a844e667317246=
00f3ac9c0d8&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;6aef5b8bb1cfb953b6b343d27cbfc561d96cf2a2=
ee23c2e0dd3591042a059921&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +PACKAGECONFIG ?=3D &quot;&quot;<br>
&gt; +PACKAGECONFIG[python-version-smaller-3-dot-11] =3D &quot;,,,python3-t=
omli&quot;<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;python3-packaging python3-setuptools \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
python3-core python3-datetime python3-logging \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-packaging python3=
-pprint python3-setuptools \<br>
<br>
python3-packaging and python3-setuptools are already added</blockquote><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Good catch !</div><div dir=3D"aut=
o"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border=
-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-tomllib&quot;<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;setuptools_git_versioning&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND +=3D &quot;native&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#120911): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/120911" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/120911</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11590461=
4/3619737" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/115904614/3619737</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ankur.tyagi85@gmail=
.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000007151380641cb4ffa--

