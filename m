Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD12C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 23:44:49 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.47744.1686527080743897622
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 16:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CVrFwKET;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-39c7f7a66abso1864987b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 16:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686527080; x=1689119080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4vmoDWOpuGsPTBzC5BbSjJ4yWRx+xsHfVyGCR4nvsIM=;
        b=CVrFwKETctP0s3vbXgm1kzMjXXpyNQGPgttZcHM3NCEpJJOBYK+PU8DoFxoNaM9OuY
         S8VjpR3JveNprl5N72tZwRA9XZ/2sWSELi3g/lBXwApFBrxCZYrAblNdQUXF9XhCQ0V+
         0Jf8ZoCuxS92+L4mOOmeIn0p0IQfcggj4PZipOs9+rE2XofZ9S6dD2XFJMxfmXZPCL4l
         jKDdy2kT5VRyxiiMaTYWEO7VoMF0+SJGIVutOJHtMffdEDXQ1HbiRXt2g47QFtigrGEY
         NhBsfD2+qJHIygAKO3vrDbGNjJyRlmRzpBrSy6mfMlCGIA1OK4WUIoGI9xG4pxPIGUOW
         OmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686527080; x=1689119080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vmoDWOpuGsPTBzC5BbSjJ4yWRx+xsHfVyGCR4nvsIM=;
        b=ISiiXFyB40UYk3yb9bh38o+ILyHQ9y8Qt3ccPX10kUAfmmEzeGNNu6hi5/7BePPwYM
         Jv+fCEkp0UeGeSV8q8Ss5Oy6hNnBkSTTgilbFmonAii/tXgJ4map/BonP2fU8tR7pTOI
         vxj9dkKV/Q1RovbJtGk4Bl4SN5Sc1Q8amtV83ddjQXshkdINoqUGJSN3E3h21W5UryR5
         EgeAwrx+8Bb36qRTLSLWM92Oxq+YAlEIhra/jolFQ/dc3/VO/KWAWrYCtW2boELFQtNv
         PW0tCCcOcMvVQavS7pneFv3o4jI/8jEWfYcNDpE5x7WzaDyqSwKuqeCaLEJVWekzotkt
         ZF+g==
X-Gm-Message-State: AC+VfDye4Q8dBQKUAnhlah8aswXvSlq7WNIIez7FI0Bc/2EUHYdHeRXr
	h4ycsHhti0Cs9OlYsMggvwUlOakuyFkHeb/QCRj7c2+c
X-Google-Smtp-Source: ACHHUZ7KZpo2QHxuHlCiXGZR2x6TG2dLL3f5kAlJ3F8teuaor+KpjxH0Ag9Y5+OqPcEPs64WqSVA8QjiSJjRYiz6X/Q=
X-Received: by 2002:aca:3387:0:b0:38e:a925:8f95 with SMTP id
 z129-20020aca3387000000b0038ea9258f95mr2884362oiz.26.1686527079823; Sun, 11
 Jun 2023 16:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230611160530.392975-1-mhei@heimpold.de> <CAMKF1srQwuXQV8QLTCfYmDKfm-iTDXNjLTJKFxN+umTrq3tOPw@mail.gmail.com>
 <8273188.T7Z3S40VBb@kerker>
In-Reply-To: <8273188.T7Z3S40VBb@kerker>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 16:44:29 -0700
Message-ID: <CAMKF1sqeRP-+YES+WoB784U1389_=f2MmuHzS13-d2rP2GK-Bw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
To: Michael Heimpold <mhei@heimpold.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f3c6d05fde32f18"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 23:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103209

--0000000000007f3c6d05fde32f18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2023 at 1:53 PM Michael Heimpold <mhei@heimpold.de> wrote:

> Am Sonntag, 11. Juni 2023, 18:32:31 CEST schrieb Khem Raj:
> > On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold <mhei@heimpold=
.de>
> wrote:
> > > If my git skills don't trick me, forcing ARM mode for PHP
> > > dates back to year 2015 with commit e836f8f93.
> > >
> > > I wondered whether the compile problem still persists and just
> > > tested that it compiles fine for qemuarm nowaydays.
> > >
> > > I also tested the binaries on a physical device, a
> > > NXP iMX6ULL based one, and did not notice any problems
> > > so far.
> > >
> > > Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> > > ---
> > >
> > >  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
> > >  1 file changed, 9 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > b/meta-oe/recipes-devtools/php/php_8.2.6.bb index dad955452..404ff393=
b
> > > 100644
> > > --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> > > @@ -284,12 +284,3 @@ do_install:append:class-native() {
> > >
> > >      create_wrapper ${D}${bindir}/php \
> > >
> > >          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
> > >
> > >  }
> > >
> > > -
> > > -# Fails to build with thumb-1 (qemuarm)
> > > -# | {standard input}: Assembler messages:
> > > -# | {standard input}:3719: Error: selected processor does not suppor=
t
> > > Thumb mode `smull r0,r2,r9,r3' -# | {standard input}:3720: Error:
> > > unshifted register required -- `sub r2,r2,r0,asr#31' -# | {standard
> > > input}:3796: Error: selected processor does not support Thumb mode
> `smull
> > > r0,r2,r3,r3' -# | {standard input}:3797: Error: unshifted register
> > > required -- `sub r2,r2,r0,asr#31' -# | make: *** [ext/standard/math.l=
o]
> > > Error 1
> > > -ARM_INSTRUCTION_SET =3D "arm"
> >
> > Martin explained it well, it was seen with thumb1 ISA some armv6 and
> > all armv7+ uses thumb2 ISA along with standard ARM ISA
> > Testing this will need armv4/armv5 perhaps you can limit this to
> > armv5/arm4 arches
> >
> > ARM_INSTRUCTION_SET:armv5 =3D "arm"
> > ARM_INSTRUCTION_SET:armv4 =3D "arm"
> >
> > If you can test it on armv5 and ensure that it works there too now a
> > days then we can remove it completely
>
> Thank you all for your feedback.
>
> Here is what I've done so far.
>
> I've done a compile test against machine qemuarmv5 which succeeded
> without errors.
>
> I have a custom board at hand, which uses a NXP iMX28 CPU, the build
> configuration tells me the same TUNE_FEATURES as qemuarmv5:
> MACHINE              =3D "evachargese"
> TUNE_FEATURES        =3D "arm armv5 thumb dsp"
> I used the kirkstone branch to have a faster roundtrip since the board
> currently runs a kirkstone-based system. The PHP binaries run without
> obvious problems in a quick test (simple webpages on the device).


That=E2=80=99s for testing it out. Can you check compiler longs for php and=
 see if
it passed -mthumb to it ?

>
>
> I have no armv4 board at hand nor a found a configuration file for
> qemuarmv4.
> So I put some lines manually together using strongarm - which should be
> armv4,
> right? It resulted in
> TUNE_FEATURES        =3D "arm strongarm"
> The build completed without error - no runtime testing with qemu done yet=
.
>
>
>
>

--0000000000007f3c6d05fde32f18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 11, 2023 at 1:53 PM Michael Heimpold &lt;<a hre=
f=3D"mailto:mhei@heimpold.de">mhei@heimpold.de</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Am Sonntag, 11. Juni 2023, 18:32:31 CEST schrieb=
 Khem Raj:<br>
&gt; On Sun, Jun 11, 2023 at 9:05=E2=80=AFAM Michael Heimpold &lt;<a href=
=3D"mailto:mhei@heimpold.de" target=3D"_blank">mhei@heimpold.de</a>&gt; wro=
te:<br>
&gt; &gt; If my git skills don&#39;t trick me, forcing ARM mode for PHP<br>
&gt; &gt; dates back to year 2015 with commit e836f8f93.<br>
&gt; &gt; <br>
&gt; &gt; I wondered whether the compile problem still persists and just<br=
>
&gt; &gt; tested that it compiles fine for qemuarm nowaydays.<br>
&gt; &gt; <br>
&gt; &gt; I also tested the binaries on a physical device, a<br>
&gt; &gt; NXP iMX6ULL based one, and did not notice any problems<br>
&gt; &gt; so far.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Michael Heimpold &lt;<a href=3D"mailto:mhei@heimpo=
ld.de" target=3D"_blank">mhei@heimpold.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb=
" rel=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a> | 9 ---------<br>
&gt; &gt;=C2=A0 1 file changed, 9 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8=
.2.6.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a><br>
&gt; &gt; b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb" re=
l=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a> index dad955452..404ff3=
93b<br>
&gt; &gt; 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb=
" rel=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb=
" rel=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a><br>
&gt; &gt; @@ -284,12 +284,3 @@ do_install:append:class-native() {<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 create_wrapper ${D}${bindir}/php \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PHP_PEAR_SYSCONF_DIR=3D${syscon=
fdir}/<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; <br>
&gt; &gt; -<br>
&gt; &gt; -# Fails to build with thumb-1 (qemuarm)<br>
&gt; &gt; -# | {standard input}: Assembler messages:<br>
&gt; &gt; -# | {standard input}:3719: Error: selected processor does not su=
pport<br>
&gt; &gt; Thumb mode `smull r0,r2,r9,r3&#39; -# | {standard input}:3720: Er=
ror:<br>
&gt; &gt; unshifted register required -- `sub r2,r2,r0,asr#31&#39; -# | {st=
andard<br>
&gt; &gt; input}:3796: Error: selected processor does not support Thumb mod=
e `smull<br>
&gt; &gt; r0,r2,r3,r3&#39; -# | {standard input}:3797: Error: unshifted reg=
ister<br>
&gt; &gt; required -- `sub r2,r2,r0,asr#31&#39; -# | make: *** [ext/standar=
d/math.lo]<br>
&gt; &gt; Error 1<br>
&gt; &gt; -ARM_INSTRUCTION_SET =3D &quot;arm&quot;<br>
&gt; <br>
&gt; Martin explained it well, it was seen with thumb1 ISA some armv6 and<b=
r>
&gt; all armv7+ uses thumb2 ISA along with standard ARM ISA<br>
&gt; Testing this will need armv4/armv5 perhaps you can limit this to<br>
&gt; armv5/arm4 arches<br>
&gt; <br>
&gt; ARM_INSTRUCTION_SET:armv5 =3D &quot;arm&quot;<br>
&gt; ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt; <br>
&gt; If you can test it on armv5 and ensure that it works there too now a<b=
r>
&gt; days then we can remove it completely<br>
<br>
Thank you all for your feedback.<br>
<br>
Here is what I&#39;ve done so far.<br>
<br>
I&#39;ve done a compile test against machine qemuarmv5 which succeeded<br>
without errors.<br>
<br>
I have a custom board at hand, which uses a NXP iMX28 CPU, the build<br>
configuration tells me the same TUNE_FEATURES as qemuarmv5:<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;evacharge=
se&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv5 thumb dsp&quot=
;<br>
I used the kirkstone branch to have a faster roundtrip since the board<br>
currently runs a kirkstone-based system. The PHP binaries run without<br>
obvious problems in a quick test (simple webpages on the device).</blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">That=E2=80=99s for testing=
 it out. Can you check compiler longs for php and see if it passed -mthumb =
to it ?=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
I have no armv4 board at hand nor a found a configuration file for qemuarmv=
4.<br>
So I put some lines manually together using strongarm - which should be arm=
v4, <br>
right? It resulted in<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm strongarm&quot;<br>
The build completed without error - no runtime testing with qemu done yet.<=
br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000007f3c6d05fde32f18--

