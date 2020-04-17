Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.5749.1587110262989954094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2020 00:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZGIdAG5z;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: gregory.vimont@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id u6so1053418ljl.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2020 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9TJaIuIb8JvKFjqDSt92IMrzu05fsP/mwxO/70TBGk=;
        b=ZGIdAG5zzubYLAz3kztXLTd/ywrK3atOX+7xyHP81qYgAPl9m4CQMz2rmPxLKkLR30
         hQqU1s+vxcrkvDj1YrR4eE6i8Z3BcabpotOhROltboQwqMkct2U/x6tZtr3J34HnjRgA
         V5tCg32r7xfRMFs9W2xT9NlGROmdRdmTlw5xlO69vwzPyhvi71Q+M0FAB7RXReFmScZf
         vP81OBzek/94ADBA6sl69L2Sjl04QkVPhJexqdPB4awZv/q65jo2pjzOX20UgcagejM2
         EWQD9SJsJUNz7guZmARF8x7PtoXK7Bv5sYnQkumHp3CLRrC16RMwnRIAVjCAb3xl/tBp
         5CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9TJaIuIb8JvKFjqDSt92IMrzu05fsP/mwxO/70TBGk=;
        b=k4X3q82ClO9klRaN0dltOmqXZCpH14a/pjoreAEuQ46KYhiXkk+vn1qoNzpuLDzAMX
         VcfyLyD1fmUMMRA6lhYBLJJC3ccCLVmHnGaSfjmPCdj2g6WnKZnSZT6Owsqh6GZqDeCg
         gNPAAsU1D3nTKqTGIcrpBraiCrgXWVQrRdzMvt7hIX+R3MiHTB++VTSuvQtyzXfUMWtI
         acuGZw6AR27tQpuNKuhdwgxHxxhVkpEb9iZ4+CCNN1VPPeRWbUTrkYsjDG9F+BA0sBlq
         lV+XC5iu20oCwQy2u6IkduibmnYVLC29Vp9SejJAK04aBsjq9vmfYsCf0loSkbt2CNJY
         qJkg==
X-Gm-Message-State: AGi0Pub0j9gVa/4N8zXpQBgcsZkDNW8ZhF3Y6pcUgP0e+Y/u7myhQfpd
	MY+n1rMS4ZhQ8gGM3LgihbCCQhlvkWUnMkAdm3Y=
X-Google-Smtp-Source: APiQypLVEsBu8T2RNDp7AqUH1EpKehKnOEVobye7gO/1H0aUrSpa8zu9o/W4BQKYJQn9/f6dARJcNwj9yMkwvegIBYk=
X-Received: by 2002:a2e:a548:: with SMTP id e8mr1330912ljn.151.1587110260976;
 Fri, 17 Apr 2020 00:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com> <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
In-Reply-To: <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com>
From: "Gregory Vimont" <gregory.vimont@gmail.com>
Date: Fri, 17 Apr 2020 09:57:29 +0200
Message-ID: <CANjKyuzzm8C-TzB1AJCC0YYX8TsiWEU+JiA9xQLBL0tYF30eWA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Content-Type: multipart/alternative; boundary="000000000000532f4b05a377e732"

--000000000000532f4b05a377e732
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know what went wrong, I see only Warnings there.

Le jeu. 16 avr. 2020 =C3=A0 20:38, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

> This fails on mips/glibc
>
> https://errors.yoctoproject.org/Errors/Details/404685/
>
>
> On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.com=
>
> wrote:
> >
> > Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
> > ---
> >  .../opencv/{opencv_4.1.0.bb =3D> opencv_4.1.1.bb}             | 6 +++=
---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb =3D>
> opencv_4.1.1.bb} (98%)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > index d781da600..5074eb2fa 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
> > @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
> >
> >  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
> >
> > -SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"
> > -SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"
> > +SRCREV_opencv =3D "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
> > +SRCREV_contrib =3D "0915b7eaddba3c06d83e201c9a7595e73801f417"
> >  SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"
> >  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
> >  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
> > @@ -51,7 +51,7 @@ SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv \
> >
>  file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch =
\
> >             file://download.patch \
> >             "
> > -PV =3D "4.1.0"
> > +PV =3D "4.1.1"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.17.1
> >
> >=20
>

--000000000000532f4b05a377e732
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t know what went wrong, I see only Warnings ther=
e.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Le=C2=A0jeu. 16 avr. 2020 =C3=A0=C2=A020:38, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">This fails on mip=
s/glibc<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/404685/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/404685/</a><br>
<br>
<br>
On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont &lt;<a href=3D"mailto:grego=
ry.vimont@gmail.com" target=3D"_blank">gregory.vimont@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; Signed-off-by: Gregory Vimont &lt;<a href=3D"mailto:gregory.vimont@so=
ftbankrobotics.com" target=3D"_blank">gregory.vimont@softbankrobotics.com</=
a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../opencv/{<a href=3D"http://opencv_4.1.0.bb" rel=3D"noreferre=
r" target=3D"_blank">opencv_4.1.0.bb</a> =3D&gt; <a href=3D"http://opencv_4=
.1.1.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/opencv/{<a href=3D"http://opencv=
_4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a> =3D&gt;=
 <a href=3D"http://opencv_4.1.1.bb" rel=3D"noreferrer" target=3D"_blank">op=
encv_4.1.1.bb</a>} (98%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_=
4.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a> b/meta-o=
e/recipes-support/opencv/<a href=3D"http://opencv_4.1.1.bb" rel=3D"noreferr=
er" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
&gt; rename to meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1=
.1.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; index d781da600..5074eb2fa 100644<br>
&gt; --- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.1.1.b=
b" rel=3D"noreferrer" target=3D"_blank">opencv_4.1.1.bb</a><br>
&gt; @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libtool swig-native bzip2 zlib glib-2.0 libwe=
bp&quot;<br>
&gt;<br>
&gt; -SRCREV_opencv =3D &quot;371bba8f54560b374fbcd47e7e02f015ac4969ad&quo=
t;<br>
&gt; -SRCREV_contrib =3D &quot;2c32791a9c500343568a21ea34bf2daeac2adae7&qu=
ot;<br>
&gt; +SRCREV_opencv =3D &quot;ddbd10c0019f3ee5f43b7902d47e7fc4303a6574&quo=
t;<br>
&gt; +SRCREV_contrib =3D &quot;0915b7eaddba3c06d83e201c9a7595e73801f417&qu=
ot;<br>
&gt;=C2=A0 SRCREV_ipp =3D &quot;32e315a5b106a7b89dbed51c28f8120a48b368b4&q=
uot;<br>
&gt;=C2=A0 SRCREV_boostdesc =3D &quot;34e4206aef44d50e6bbcd0ab06354b52e746=
6d26&quot;<br>
&gt;=C2=A0 SRCREV_vgg =3D &quot;fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d&q=
uot;<br>
&gt; @@ -51,7 +51,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/opencv/opencv.git;name=3Dopencv" rel=3D"noreferrer" target=3D"_blank">git=
hub.com/opencv/opencv.git;name=3Dopencv</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-carotene-R=
eplace-ipcp-unit-growth-with-ipa-cp-unit-g.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://download.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -PV =3D &quot;4.1.0&quot;<br>
&gt; +PV =3D &quot;4.1.1&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000532f4b05a377e732--
