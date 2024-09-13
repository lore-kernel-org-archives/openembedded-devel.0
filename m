Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66911FC616F
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 18:17:42 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.79232.1726248342844744339
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Sep 2024 10:25:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3vj8he5;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: tolvupostur@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-27b88b8a24aso1107062fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726248342; x=1726853142; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmEt9SQW8xORaMIHpWzuCD+GBCFdwzXa0FTtJxoMgHI=;
        b=d3vj8he5dQlP+auBQIqe4DsRYINEU2yuTAtr8j8rMn6JQ8N2jrWVnc3QNUtf4jqNvB
         McdZ5MFYdd0CyYoCOz+tRmZ+Rk1zrsYyQIqCdJTrT1ZVgJjGhhQn9pp/8xQZRM7YjJNH
         xkKA3NN9eZ4HgV5ktDa1gmPaaYdLumpGuqu/D0ae0Yy21Aqtia7v5iwvSjsOb0Mb5WpU
         Ei9YxcWnS0VrZeZP/HR6TD8RLqc5fotUXkEtKFR9Y0Y2R8FtDTGAIlCqZ6BOIfqy8i5N
         e9aRWiZFepA3o2evOqPXd0AQX5f21mzI+X2ZBNCNplSRLBM0PWvl6kIQ84zWZiN4/9qD
         ioYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726248342; x=1726853142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmEt9SQW8xORaMIHpWzuCD+GBCFdwzXa0FTtJxoMgHI=;
        b=i/zx+xqLUno7YYbEklSFUHblDPTWe2tAV0YgS/BOC+hostajZF1LvxK4zslJDDpjtQ
         JTnt5ROzZ/iiQnLHAusMMs7p99jGV1SZE2Jmv8HPykF3sf3SYiwmrSeciKEi3jjE/z4+
         uzABq55JjnW1p2f+GSuDHdj+FPhIKzYkMo5aS6m9IsyUi8ZAhQ64HtpoPC9WDcQFLGvm
         8J4cqF1/v+0YezwH84iW9lTzKJjyPdoNH0gQpXpELUyhxtsJuZQBBA5gMfWCqX2t1eAQ
         ijLZv5d84lLue9KV9L4G15BMnEUzQ+70RYIDCwGT57lgV7nbF5U569cMQf6i1NM9n+hQ
         pVoQ==
X-Gm-Message-State: AOJu0YzQ9v9qBfvrnIs7qu5xe8jIYXBlOajLYPi55CFY0chh27bhBRM8
	7F6FRn84RDLWGyTH7i4PMQReG7+SD8106uxQ4odMj+1weNpLdC8UluMtF0bjET0o9oFOzMO0ekw
	mUbgHgpFPRy9YScSpt14ExGI4q+4=
X-Google-Smtp-Source: AGHT+IHxOc5psd1yzIi1R7r/ahkPNhQOFKhTiDXXOb+jrnHxL71UXBqxiVNVyyaXg/EQkvf4ymT0/JVn83K7MSlI2B8=
X-Received: by 2002:a05:6871:79a3:b0:27b:5a42:1448 with SMTP id
 586e51a60fabf-27c3f41b164mr6945965fac.25.1726248341796; Fri, 13 Sep 2024
 10:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240910124936.21220-1-tolvupostur@gmail.com> <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
In-Reply-To: <c501aa82-8069-48ce-abb2-6c6ab7a86bb1@ti.com>
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Fri, 13 Sep 2024 19:25:30 +0200
Message-ID: <CABhNV210+OW4qpTzP9N0fhStTEAOthxgjk4Mqq+MqikV3iYJ3A@mail.gmail.com>
Subject: Re: [oe] [PATCH] yavta: Update to kernel 6.8
To: Ryan Eatmon <reatmon@ti.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003502ab062203838e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 18:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112277

--0000000000003502ab062203838e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ooops

On Fri, 13 Sept 2024 at 15:25, Ryan Eatmon <reatmon@ti.com> wrote:

>
> I'm seeing build failures on 32bit platforms with this new version.  Can
> anyone verify?
>

I can confirm that this does not build on 32-bit.
The problem seems to be switching to meson build - both the current SRCREV
and the updated one fail on time_t size with meson, but build with the old
mess of a code.

Sorry about that
Einar Jon


>
> On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:
> > Additional changes:
> > Use https protocol for git fetch
> > Build with meson
> >
> > Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
> > ---
> >   .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++--------------=
-
> >   1 file changed, 3 insertions(+), 15 deletions(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > index c4f31c033..db00c67b1 100644
> > --- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > +++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
> > @@ -2,9 +2,9 @@ SUMMARY =3D "Yet Another V4L2 Test Application"
> >   LICENSE =3D "GPL-2.0-only"
> >   LIC_FILES_CHKSUM =3D
> "file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa882bbe"
> >
> > -SRC_URI =3D "git://git.ideasonboard.org/yavta.git;branch=3Dmaster \
> > +SRC_URI =3D "git://
> git.ideasonboard.org/yavta.git;branch=3Dmaster;protocol=3Dhttps \
> >             "
> > -SRCREV =3D "65f740aa1758531fd810339bc1b7d1d33666e28a"
> > +SRCREV =3D "323facd1d5bd6251eec70dd5c1484a12ce01202a"
> >
> >   PV =3D "0.0"
> >   S =3D "${WORKDIR}/git"
> > @@ -12,16 +12,4 @@ S =3D "${WORKDIR}/git"
> >   # Upstream repo does not tag
> >   UPSTREAM_CHECK_COMMITS =3D "1"
> >
> > -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> > -
> > -# The yavta sources include copies of the headers required to build in
> the
> > -# include directory.  The Makefile uses CFLAGS to include these, but
> since
> > -# we override the CFLAGS then we need to add this include path back in=
.
> > -CFLAGS +=3D "-I${S}/include"
> > -
> > -do_install() {
> > -    install -d ${D}${bindir}
> > -    install -m 0755 yavta ${D}${bindir}
> > -}
> > -
> > -
> > +inherit meson
> >
> >
> >
> >=20
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>


--=20
Regards
Einar J=C3=B3n

--0000000000003502ab062203838e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Ooops<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 13 Sept 2024=
 at 15:25, Ryan Eatmon &lt;<a href=3D"mailto:reatmon@ti.com">reatmon@ti.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
I&#39;m seeing build failures on 32bit platforms with this new version.=C2=
=A0 Can <br>
anyone verify?<br></blockquote><div><br></div><div>I can confirm that this =
does not build on 32-bit.<br></div><div>The problem seems to be switching t=
o meson build - both the current SRCREV <br>and the updated one fail on tim=
e_t size with meson, but build with the old mess of a code.<br></div><div><=
br></div><div>Sorry about that<br></div><div>Einar Jon<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 9/10/2024 7:49 AM, Einar Gunnarsson wrote:<br>
&gt; Additional changes:<br>
&gt; Use https protocol for git fetch<br>
&gt; Build with meson<br>
&gt; <br>
&gt; Signed-off-by: Einar Jon Gunnarsson &lt;<a href=3D"mailto:tolvupostur@=
gmail.com" target=3D"_blank">tolvupostur@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../recipes-multimedia/v4l2apps/<a href=3D"http://yavta_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">yavta_git.bb</a>=C2=A0 =C2=A0| 1=
8 +++---------------<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://yav=
ta_git.bb" rel=3D"noreferrer" target=3D"_blank">yavta_git.bb</a> b/meta-oe/=
recipes-multimedia/v4l2apps/<a href=3D"http://yavta_git.bb" rel=3D"noreferr=
er" target=3D"_blank">yavta_git.bb</a><br>
&gt; index c4f31c033..db00c67b1 100644<br>
&gt; --- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://yavta_git.=
bb" rel=3D"noreferrer" target=3D"_blank">yavta_git.bb</a><br>
&gt; +++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://yavta_git.=
bb" rel=3D"noreferrer" target=3D"_blank">yavta_git.bb</a><br>
&gt; @@ -2,9 +2,9 @@ SUMMARY =3D &quot;Yet Another V4L2 Test Application&qu=
ot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPL;md5=3D751419=
260aa954499f7abaabaa882bbe&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://git.ideasonboard.org/yavta.=
git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.ideasonboard.=
org/yavta.git;branch=3Dmaster</a> \<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.ideasonboard.org/yavta.=
git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">=
git.ideasonboard.org/yavta.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRCREV =3D &quot;65f740aa1758531fd810339bc1b7d1d33666e28a&quot;<br>
&gt; +SRCREV =3D &quot;323facd1d5bd6251eec70dd5c1484a12ce01202a&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PV =3D &quot;0.0&quot;<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; @@ -12,16 +12,4 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0# Upstream repo does not tag<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot;<br>
&gt; -<br>
&gt; -# The yavta sources include copies of the headers required to build i=
n the<br>
&gt; -# include directory.=C2=A0 The Makefile uses CFLAGS to include these,=
 but since<br>
&gt; -# we override the CFLAGS then we need to add this include path back i=
n.<br>
&gt; -CFLAGS +=3D &quot;-I${S}/include&quot;<br>
&gt; -<br>
&gt; -do_install() {<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 install -m 0755 yavta ${D}${bindir}<br>
&gt; -}<br>
&gt; -<br>
&gt; -<br>
&gt; +inherit meson<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Ryan Eatmon=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"mailto:reatmon@ti.com" target=3D"_blank">reatmon@ti.com</a><br>
-----------------------------------------<br>
Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Regards<br>Einar J=C3=B3n<br></div></div></div>

--0000000000003502ab062203838e--

