Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web10.5790.1587110499952324535
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 01:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bZF865mg;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: gregory.vimont@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id r7so1031123ljg.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2020 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UtSgCY9pB6hF/5kCJq2sV03YUfP5e3T7Z9B/FEPvEaQ=;
        b=bZF865mgJ5NLUZm4XFYHDmusN+/7SwwWbUuxHNcSFvrg/Ye6dTheV2QxKSlDpAsF0L
         EjJWeuWRGuqyRR8eESdY+FE8JbpHFZakehxbq6CrGGj/GKiYLiMLhtFM5fYSEFPPW6HC
         7jupYpmC4a8CpQI6ShQvqFq7IM9niMF6GZTULlHN1drpdAwKpLVx8oj/2xG4SzoW36r+
         jj1mASBWgyPzWh0OPge53Hysh1h6zYp1LHsRJivYJeMKAo71TLCCov8MJlN4w2CoS/lW
         VbJyNteODzRJmW90mRBZP5lAnoH2Myyua4kv+q8vq/oYmiJalbofWHfAmXT0dBmfE5fs
         FrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UtSgCY9pB6hF/5kCJq2sV03YUfP5e3T7Z9B/FEPvEaQ=;
        b=PthjVQqUpBN9418/FLJG5vsGymzYK4BoCFf6p0nPY+FMO6a7MQHQzRnZkDcb60YBcv
         bv064wN+K8118lZL596PITxjmKe9EUKnfz8J2mXPPu072e+3WG0sc5hwn0u9aEGfUva/
         vUEgyu9DWMawsAT78BQySzQsTKgGEyY7Ps3K18/5ygYVNAeR9taG/jyGwPxu/at0Q9ie
         HJOO4nSHX3ccJU3AIW8FuLnq/uzGz11t/EUTbzB7fCZxRbUbIKcOCkxpM8vRc1AZnkzO
         2W7X3w1jMJq1lbRZEyzteOcdS0b/JNgpNUJPnJ5R9WxDbGMMd3UBtQBe4Y4iOFvCtz14
         //4g==
X-Gm-Message-State: AGi0PuZoIduY9xT5RRHZBndhyt5G/68M2/D5h6mO7SrO19/eEaNLYJ9h
	qRrTMv6HYYAKFwrYxPiLjPmOdG+PshgzPYOMp3A=
X-Google-Smtp-Source: APiQypLbhJU3DKz3fH3N29+b4L4HfRSrKFjs++4nhntNXchGXivUFPOpMFuQ18PIMITqSEcxNoEMdMA4VLQm6hieH7o=
X-Received: by 2002:a2e:b0ca:: with SMTP id g10mr1363834ljl.169.1587110498316;
 Fri, 17 Apr 2020 01:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
 <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com> <20200416190614.o7pwdhnjeeicaai6@jama>
In-Reply-To: <20200416190614.o7pwdhnjeeicaai6@jama>
From: "Gregory Vimont" <gregory.vimont@gmail.com>
Date: Fri, 17 Apr 2020 10:01:26 +0200
Message-ID: <CANjKyux_hn2QsBRPBrZvSCqYDfmUXjKDLuHkD8Em=U5fA3Aaew@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Content-Type: multipart/alternative; boundary="00000000000078b52405a377f5bc"

--00000000000078b52405a377f5bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was working on minimal security fixes on my zeus branch.
Later I will update the recipe for openCV 4.3.0.

Le jeu. 16 avr. 2020 =C3=A0 21:06, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> On Thu, Apr 16, 2020 at 11:38:24AM -0700, Khem Raj wrote:
> > This fails on mips/glibc
> >
> > https://errors.yoctoproject.org/Errors/Details/404685/
> >
> >
> > On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.c=
om>
> wrote:
> > >
> > > Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
> > > ---
> > >  .../opencv/{opencv_4.1.0.bb =3D> opencv_4.1.1.bb}             | 6
> +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb =3D>
> opencv_4.1.1.bb} (98%)
> > >
> > > diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > > similarity index 98%
> > > rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > > rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > > index d781da600..5074eb2fa 100644
> > > --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > > +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > > @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > >
> > >  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
> > >
> > > -SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"
> > > -SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"
> > > +SRCREV_opencv =3D "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
> > > +SRCREV_contrib =3D "0915b7eaddba3c06d83e201c9a7595e73801f417"
> > >  SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"
> > >  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
> > >  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
> > > @@ -51,7 +51,7 @@ SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv \
> > >
>  file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch =
\
> > >             file://download.patch \
> > >             "
> > > -PV =3D "4.1.0"
> > > +PV =3D "4.1.1"
>
> Gregory,
>
> was there a reason for 4.1.1 + backports instead of 4.2.0 version
> released in December 2019?
>
> Or 4.1.2 from Octobver 2019 if 4.2.x is breaking too many things.
>
> Cheers,
>
> > >  S =3D "${WORKDIR}/git"
> > >
> > > --
> > > 2.17.1
> > >
> > >
>
> >=20
>
>

--00000000000078b52405a377f5bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was working on minimal security fixes on my zeus br=
anch.</div><div>Later I will update the recipe for openCV 4.3.0.<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0jeu. 16 avr. 2020 =C3=A0=C2=A021:06, Martin Jansa &lt;<a href=3D"mai=
lto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Ap=
r 16, 2020 at 11:38:24AM -0700, Khem Raj wrote:<br>
&gt; This fails on mips/glibc<br>
&gt; <br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/404685/" re=
l=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/D=
etails/404685/</a><br>
&gt; <br>
&gt; <br>
&gt; On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont &lt;<a href=3D"mailto:=
gregory.vimont@gmail.com" target=3D"_blank">gregory.vimont@gmail.com</a>&gt=
; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Gregory Vimont &lt;<a href=3D"mailto:gregory.vimo=
nt@softbankrobotics.com" target=3D"_blank">gregory.vimont@softbankrobotics.=
com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../opencv/{<a href=3D"http://opencv_4.1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">opencv_4.1.0.bb</a> =3D&gt; <a href=3D"http://ope=
ncv_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-support/opencv/{<a href=3D"http://o=
pencv_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a> =
=3D&gt; <a href=3D"http://opencv_4.1.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">opencv_4.1.1.bb</a>} (98%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://op=
encv_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a> b/m=
eta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; &gt; similarity index 98%<br>
&gt; &gt; rename from meta-oe/recipes-support/opencv/<a href=3D"http://ope=
ncv_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-support/opencv/<a href=3D"http://openc=
v_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; &gt; index d781da600..5074eb2fa 100644<br>
&gt; &gt; --- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; &gt; @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS =3D &quot;libtool swig-native bzip2 zlib glib-2.0 =
libwebp&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV_opencv =3D &quot;371bba8f54560b374fbcd47e7e02f015ac4969a=
d&quot;<br>
&gt; &gt; -SRCREV_contrib =3D &quot;2c32791a9c500343568a21ea34bf2daeac2ada=
e7&quot;<br>
&gt; &gt; +SRCREV_opencv =3D &quot;ddbd10c0019f3ee5f43b7902d47e7fc4303a657=
4&quot;<br>
&gt; &gt; +SRCREV_contrib =3D &quot;0915b7eaddba3c06d83e201c9a7595e73801f4=
17&quot;<br>
&gt; &gt;=C2=A0 SRCREV_ipp =3D &quot;32e315a5b106a7b89dbed51c28f8120a48b36=
8b4&quot;<br>
&gt; &gt;=C2=A0 SRCREV_boostdesc =3D &quot;34e4206aef44d50e6bbcd0ab06354b5=
2e7466d26&quot;<br>
&gt; &gt;=C2=A0 SRCREV_vgg =3D &quot;fccf7cd6a4b12079f73bbfb21745f9babcd4e=
b1d&quot;<br>
&gt; &gt; @@ -51,7 +51,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://gith=
ub.com/opencv/opencv.git;name=3Dopencv" rel=3D"noreferrer" target=3D"_blank=
">github.com/opencv/opencv.git;name=3Dopencv</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-carot=
ene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://download.p=
atch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; -PV =3D &quot;4.1.0&quot;<br>
&gt; &gt; +PV =3D &quot;4.1.1&quot;<br>
<br>
Gregory,<br>
<br>
was there a reason for 4.1.1 + backports instead of 4.2.0 version<br>
released in December 2019?<br>
<br>
Or 4.1.2 from Octobver 2019 if 4.2.x is breaking too many things.<br>
<br>
Cheers,<br>
<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; <br>
<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000078b52405a377f5bc--
