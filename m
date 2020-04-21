Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web11.7804.1587473474401324800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 05:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SKXjkfwb;
 spf=pass (domain: gmail.com, ip: 209.85.167.66, mailfrom: gregory.vimont@gmail.com)
Received: by mail-lf1-f66.google.com with SMTP id l11so11038486lfc.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcyla02VZJkiaQ8ceCm9OGaDX7iw5xhx1VObFa20iA8=;
        b=SKXjkfwbPb/Evvo/rHMB8tLVQ81+mKh1zrj7WHca76jdz9/SwQo7p8XYXceNTRDPhU
         si6dr5GG5ysa5dvM3xHElz4rqclnBJH+CAhC5M8XpvqS4FerQC6y4ZQRe/AWCfYMyPL0
         t9ELPSCjY3V/Z9c8/SvK//5MSahNJtgMgAfEqij/F4T6XYsEQ1lJdBfoZt8k1WX7IPYP
         8pBT34faCVobq8VCoXgWQ5zv/1d+If6zotmiYy4T4MAuEBnkAKzp8nJ+IuOKlAdM2Vgi
         FYih9oEUgkxMf4xGBK/zTHslRobh+N26KQIZ0boZJjkCrbPaPgYlvGW8YC21uBhng+dI
         bM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcyla02VZJkiaQ8ceCm9OGaDX7iw5xhx1VObFa20iA8=;
        b=rfl7aZqbqh484l/m1jAX/UqY7W/Xxb4xrSJ+3jAqA1xDUdB6gBpWEMXX+9IVIM2PTW
         8/sbPyxKQIHcjg33vcrXGNBkP2BLKA3+uxKLPIxSQWWW6mr/tkCOaycXy08E1H3LGBYW
         ARXkTgJMbkpm/G6y1JvjGKTyHEa/jSMWV+yo9GOmsVYRTUa2i5ObZb6wiom7yF1xVje3
         IA3mT2rX9WIl/yu1fDdzLqpdKLzPt635HXzEIPJzSyFT0Z1cHLtIj6cXhxhepwNkzXYm
         ZM0D0O+ufnfgGte+rDZ2KwY/sBBjvPr0n+CXKCG1bN2AuhNvFYdrLATquNE4rzLB8eie
         D7ww==
X-Gm-Message-State: AGi0PuZYtpOTqlZyM5/i/hYlboxmiHCcFpdaRmlqEWRUbLVVC2kQx0sr
	APKPwTISt+sRQwPZ/R89UfSGu7s+GU2Z22bSsYs=
X-Google-Smtp-Source: APiQypKE2sBjLQRA6HBewdEndpMmZOlvtjwZPj+qqX7uI0UaEDq29CNWEk+6NxYBHU2ANP434V9jLpK3fmiFVehhDn0=
X-Received: by 2002:a19:ae16:: with SMTP id f22mr13888628lfc.2.1587473472484;
 Tue, 21 Apr 2020 05:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200416141656.7900-1-gregory.vimont@softbankrobotics.com>
 <CAMKF1sq0uK6F0h=MANR1kUNjwUzZOUO-RT+Gh2ACYqaJLkv9bA@mail.gmail.com> <CANjKyuzzm8C-TzB1AJCC0YYX8TsiWEU+JiA9xQLBL0tYF30eWA@mail.gmail.com>
In-Reply-To: <CANjKyuzzm8C-TzB1AJCC0YYX8TsiWEU+JiA9xQLBL0tYF30eWA@mail.gmail.com>
From: "Gregory Vimont" <gregory.vimont@gmail.com>
Date: Tue, 21 Apr 2020 14:51:00 +0200
Message-ID: <CANjKyuy-wtt6Pu_mEONy6QFm1jBa0wgK+Ps-pTaMHc51Fd0uow@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/3] opencv: 4.1.0 -> 4.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gregory Vimont <gregory.vimont@softbankrobotics.com>
Content-Type: multipart/alternative; boundary="0000000000006afa1105a3cc78ab"

--0000000000006afa1105a3cc78ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
How can I reproduce this build configuration ?


Le ven. 17 avr. 2020 =C3=A0 09:57, Gr=C3=A9gory Vimont <gregory.vimont@gma=
il.com> a
=C3=A9crit :

> I don't know what went wrong, I see only Warnings there.
>
> Le jeu. 16 avr. 2020 =C3=A0 20:38, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>
>> This fails on mips/glibc
>>
>> https://errors.yoctoproject.org/Errors/Details/404685/
>>
>>
>> On Thu, Apr 16, 2020 at 7:17 AM Gregory Vimont <gregory.vimont@gmail.co=
m>
>> wrote:
>> >
>> > Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
>> > ---
>> >  .../opencv/{opencv_4.1.0.bb =3D> opencv_4.1.1.bb}             | 6 ++=
+---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >  rename meta-oe/recipes-support/opencv/{opencv_4.1.0.bb =3D>
>> opencv_4.1.1.bb} (98%)
>> >
>> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
>> b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
>> > similarity index 98%
>> > rename from meta-oe/recipes-support/opencv/opencv_4.1.0.bb
>> > rename to meta-oe/recipes-support/opencv/opencv_4.1.1.bb
>> > index d781da600..5074eb2fa 100644
>> > --- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
>> > +++ b/meta-oe/recipes-support/opencv/opencv_4.1.1.bb
>> > @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET_armv5 =3D "arm"
>> >
>> >  DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>> >
>> > -SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"
>> > -SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"
>> > +SRCREV_opencv =3D "ddbd10c0019f3ee5f43b7902d47e7fc4303a6574"
>> > +SRCREV_contrib =3D "0915b7eaddba3c06d83e201c9a7595e73801f417"
>> >  SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"
>> >  SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>> >  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>> > @@ -51,7 +51,7 @@ SRC_URI =3D "git://
>> github.com/opencv/opencv.git;name=3Dopencv \
>> >
>>  file://0001-carotene-Replace-ipcp-unit-growth-with-ipa-cp-unit-g.patch=
 \
>> >             file://download.patch \
>> >             "
>> > -PV =3D "4.1.0"
>> > +PV =3D "4.1.1"
>> >
>> >  S =3D "${WORKDIR}/git"
>> >
>> > --
>> > 2.17.1
>> >
>> >=20
>>
>

--0000000000006afa1105a3cc78ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>How can I reproduce this build confi=
guration ?</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 17 avr. 2020 =C3=A0=C2=A009:57,=
 Gr=C3=A9gory Vimont &lt;<a href=3D"mailto:gregory.vimont@gmail.com">gregor=
y.vimont@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I don&#39;t know what we=
nt wrong, I see only Warnings there.<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 16 avr. 2020 =C3=A0=C2=
=
=A020:38, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">This fails on mips/glibc<br>
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
</blockquote></div>

--0000000000006afa1105a3cc78ab--
