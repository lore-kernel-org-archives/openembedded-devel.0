Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90962C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 13:17:56 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.9393.1666271875693790849
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Oct 2022 06:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GiCkFZT0;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id n83so22770372oif.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Oct 2022 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/cu3y63J0Hln9Hd/tyckH4q0NRCBmdh9169t1JN63mU=;
        b=GiCkFZT0tyMzzRQSBbV+0yXD9B94nQsFGrka+LXqiecn7bekJyCxzZchAtXwiDeweE
         V/D9NJvTWdcR0ersFm7/TtgR41OjVUQII50I8OETgCYMY6UL6KycZt5yvrWWktY8H9qj
         TALRJv3bLHWyDhfDwr+H99RgYZjx4HCGCnv9eb7M4MpTUC8bI0YaevKy+CzwHMKBwqsI
         qAUlf1wnYTtefku0shrLSV9MA7vt4AO977hdEsO1SeoP1/5pWVY49nUDyuaWx+DmFiiF
         +qHWcTDtJc6znVoxjr0fTmtW/VVxK+K5zQAHrD7dtfSB24MkcGBdxGAGY4Qen/4lTJCn
         qPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cu3y63J0Hln9Hd/tyckH4q0NRCBmdh9169t1JN63mU=;
        b=oH2AsPnb5xDqIKHkE+RnLYG+mU2h7lpeWzMMrVd4ibCsCes96dI0MCqyjjwrr/BALR
         E4UOqLUDi1/w31yT9VuyRqG88LldG68scgW/h5PM9nm3uSNQTKvAdr1z09HcWdiZ9zjj
         JN9U2rBg4jvlWm7Q5f3oYr4UqecT8WkGLI7+xr+0hmk+xR++QuQs40kS71sWYIQ4mFCB
         c8ZXUpiAZ0jrSvTe6ZO8Z24rO4kUSx0rcRB2QB58Ax3269Vb93lp2HsTGPqZ005fq5RK
         FyZWzmYH5Q8G2r+XB3uwL5eSL94aOw5eXE9qm5orULGsKSZVQJJp1x2uKrs1yGdkpxS6
         9BzA==
X-Gm-Message-State: ACrzQf2YLnB6uEBbfz54Ae2VZzgOA9aPDg1b2ZdgckJn9AqZ/sVFjfwZ
	yulUoAanujHaLYrXW2eTuDS7jVj/N4JsdGmOAivDPtVz
X-Google-Smtp-Source: AMsMyM6EQMPh2GqPJ74M6R9OoIxXrNUrCNS4WPKG93X9EDl/eGGEybADbKcbjuj+fOLXbe59XdfbVt8Lwo674rdTeyM=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr24710335oae.262.1666271864716; Thu, 20
 Oct 2022 06:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132909.52916-1-peron.clem@gmail.com> <CAJiuCcc1ejZ6LwbST__2=C2GwEsuwaiCgdTWS5d_8FyiNtHAmw@mail.gmail.com>
In-Reply-To: <CAJiuCcc1ejZ6LwbST__2=C2GwEsuwaiCgdTWS5d_8FyiNtHAmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2022 06:17:33 -0700
Message-ID: <CAMKF1sqpFPzSorR3-vfbDpMmGu9p19_kYC3iRDM0ZHbbY3fOrg@mail.gmail.com>
Subject: Re: [PATCH] python3: setuptools-git-versioning: new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009882da05eb772671"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Oct 2022 13:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99250

--0000000000009882da05eb772671
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 1:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:

> Hi,
>
> On Thu, 8 Sept 2022 at 15:29, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
> >
> > Add a recipe for python3-setuptools-git-versioning.
> >
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Sorry I forgot to add Khem in this patch, is it ok to upstream it or
> should I resend ?
>

Yes please resend


> Thanks,
>
> > ---
> >  .../python3-setuptools-git-versioning_1.10.1.bb     | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_1.10.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_1.10.1.bb
> b/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_1.10.1.bb
> > new file mode 100644
> > index 0000000000..9e480ae808
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> python3-setuptools-git-versioning_1.10.1.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY =3D "Use git repo data for building a version number according
> PEP-440"
> > +HOMEPAGE =3D "https://github.com/dolfinus/setuptools-git-versioning"
> > +AUTHOR =3D "dolfinus <martinov.m.s.8@gmail.com>"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92e79e3a844e66731724600f3ac=
9c0d8"
> > +
> > +SRC_URI[sha256sum] =3D
> "a68f2cd6d261503750fe600ba3c533440c57c1801ed743175c387e9b3e80f44e"
> > +
> > +DEPENDS +=3D "${PYTHON_PN}-toml ${PYTHON_PN}-packaging"
> > +
> > +inherit pypi setuptools3
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.34.1
> >
>

--0000000000009882da05eb772671
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 20, 2022 at 1:29 AM Cl=C3=A9ment P=C3=A9ron &lt=
;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Hi,<br>
<br>
On Thu, 8 Sept 2022 at 15:29, Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto=
:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Add a recipe for python3-setuptools-git-versioning.<br>
&gt;<br>
&gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.cle=
m@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
<br>
Sorry I forgot to add Khem in this patch, is it ok to upstream it or<br>
should I resend ?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes please resen=
d</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Thanks,<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .../<a href=3D"http://python3-setuptools-git-versioning_1.10.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-setuptools-git-versioning_1=
.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
&gt;=C2=A0 1 file changed, 13 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a href=
=3D"http://python3-setuptools-git-versioning_1.10.1.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-setuptools-git-versioning_1.10.1.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-setuptools-git-versioning_1.10.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-setuptools-git-versioning_1.10.1.bb</a> b/meta-python/recipes-d=
evtools/python/<a href=3D"http://python3-setuptools-git-versioning_1.10.1.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-setuptools-git-versioning_1=
.10.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9e480ae808<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-se=
tuptools-git-versioning_1.10.1.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-setuptools-git-versioning_1.10.1.bb</a><br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +SUMMARY =3D &quot;Use git repo data for building a version number acc=
ording PEP-440&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/dolfinus/setuptools-=
git-versioning" rel=3D"noreferrer" target=3D"_blank">https://github.com/dol=
finus/setuptools-git-versioning</a>&quot;<br>
&gt; +AUTHOR =3D &quot;dolfinus &lt;<a href=3D"mailto:martinov.m.s.8@gmail.=
com" target=3D"_blank">martinov.m.s.8@gmail.com</a>&gt;&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D92e79e3a844e667317246=
00f3ac9c0d8&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;a68f2cd6d261503750fe600ba3c533440c57c180=
1ed743175c387e9b3e80f44e&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;${PYTHON_PN}-toml ${PYTHON_PN}-packaging&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
</blockquote></div></div>

--0000000000009882da05eb772671--

