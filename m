Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5EA107BCED
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 23:56:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.940.1773446179375548175
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 16:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CxZyP/NN;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dea72099eso2699406e87.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 16:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773446177; cv=none;
        d=google.com; s=arc-20240605;
        b=OK9qwh0H4lI6sSY9V0F6Xm85ZzBX4E5PiNOVHXnMe894HnQN1Dtss+3DiWhhEX/GFh
         cEv0HbSJricFZTf7+ZNVLz4uA1ta9/45idEIu2d9KEjBgzEgGEVfMA/blTkVqmc6+92o
         pfFNLHIy4qgsGWMKxPItSND2Tj+U6qVDP7xTCRi0Dy52gRMUGroboTE6mB3Ot/D9wjtA
         bKrImZbyRkzUbSB8Q3XzvQOfDRnSbXhJRZekkxPKoQt8rOwico1FjCD6U8KitBH7LFGS
         0vrU6tLMhqqzezYZnhQ6yK5R/eVM8jJ4GgO2na6RERzAlp3sJs376Q1h0VatVUpPCUxJ
         CU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yBsnPuygzGmetVTp6JRF5seYRbO0dD2sAQC25ZvUVWM=;
        fh=7nvsj+EGyR7HBj2ASPOfc0LZUL5vset55OUcCpV8RZY=;
        b=EZ58zwVy9L5W4FCacbCBt65W8LRUoA6zMNJYUfVpkWUPB5DOjbX95R6r4C9LgXe6e/
         2NFmE769kwwc3aEAnI3VO0Z8UrWrC9Eon/r6OPVKJjkACDsO/nW2znjEf5VGP0rIQg0x
         +DAjggmi58p7ZJZMPx+5xHcuyrGEwM0uZxvEwAA56QABhC+zkybzupFwMKna/CY5dchB
         iWuEwfty+xggqOLqznk6ObaWDmtFquBjI8JPU3rgm4LqcDCnbAKhKwJ6xGVovxtGHg93
         pT/O5MtzN+DQgsurjQLIXGr3gh5GWqRetM0Eyv8xkEtw2Gy8aTKdBNRCUq7cG7OCuT+I
         oZmA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773446177; x=1774050977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yBsnPuygzGmetVTp6JRF5seYRbO0dD2sAQC25ZvUVWM=;
        b=CxZyP/NNzF5ObJ+XcEfZjDJ/cJNv1qU1M131FD4wODgeI8k68TooeF07JvxtJELm9H
         DyVfRNYgVFy1YZ01IMWdP9UznHErGDKJd10CdFIM1QYyuywHgNVdcEwcbe/gejnex7lS
         2XGMpzj0SBY+DVae4CoG8CFnJQVx7jrgfdap/sybS5aYdAtbcJ5SQ36CUm+mVrDfbfLZ
         6seFdDFKLynXT5psUmsf03QTyd9GYf1/ICXamhFQR/adeOGMBhLNeQCnRWwOgjeoHW0x
         jBy0OcoDDyWm5gRc+CieGGg7IjP0Xp5Mb8VLnQF4kVqFZIGY8igP81lY4WiepbfcKIwh
         XEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773446177; x=1774050977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBsnPuygzGmetVTp6JRF5seYRbO0dD2sAQC25ZvUVWM=;
        b=iQigbURWkzUltJagqnc9V3eFf2nwhulVJb/QTHNSFtayFwMJvVP9GGBx3uAteDyIJN
         ElZ36P6eFNew5hEdHsv1a8YjPDayktpGxX03UQFgDfB5V7POqQbM5aj3AU/4YL1H6Lat
         iCNqjM9VJU7/bBr2uD9pSez/sMOcfWkJG1h6xm/JI/+Cd9ZGqiSnIfz7A75gJ3jUfEs2
         /Vfx2ox3YRCgnSPf+vrd6/bSWOo03vk8nKCLNJrXaZ7JHYfgqlJM9FNDti/XeYO+K905
         SqutQWCUh4CTaCvUCZW6EnP3sQHQlK6CnnVYuGAR6KA3WPQz/m4Kt1CmZqKZsuV26GS+
         kXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWeYVzAdCinxRTmQvQP42Z5rpEcDrFxamPGxKSnzwXpWkghsWMxqtCkAnNWtnSF18qGofRDveWLwZFdC+Yca6+6WY4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHvuo4i70D7ULUu4Y0QlV8gtlUttY6TTWH2TelrPnq/SlmBgz/
	l7A1pzYHi7XXKz88anMbeSPW2T1EQ3wRWiJWkjNnuYwr7BBpd2RM5Dr16Uhop22cdDlqrTsdL49
	Il3/EgIEAuc2JiCdhxfmM3UmOoROBkmY=
X-Gm-Gg: ATEYQzx+H9nY8raDocZb6yGggD7513B6uS5SBN2/xuJxp3o8f+OQtjtewU4lzYHmL9x
	PXEDvdIL/tZtWvbI/ATXc9dz0mk/lBb3uCxaX8JlzG/BJH32g11uG3OjIIV4I/b/geO0gdSTYN5
	tPX6pNdDEj1l2ynF6728gHynznRfakHUKF7uQ/U7WTfKuhUTI808mJxReGo5PWJjPeol496iFL7
	E7xN3EW8pflilCfyEB2C3Jd9PVhFNlbmEDvM/MTSiNT9OnBUyGuO/HsGGbDLYalt+eSUoHrbn0R
	s3WKAaojeRZrtyW1AA==
X-Received: by 2002:ac2:44cb:0:b0:5a1:1957:be83 with SMTP id
 2adb3069b0e04-5a162b1dbc0mr1298155e87.39.1773446177073; Fri, 13 Mar 2026
 16:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260310134815.374345-1-Deepesh.Varatharajan@windriver.com>
 <1f68cd24-b5ab-406a-b245-1c0d9b592367@gmail.com> <CADySD0HYvcqYqhkHcXtLo-6A+HUaqo_L4S129Qu-AjPbVeB+Xw@mail.gmail.com>
 <DB5PR02MB1021349A303B20831AB1F09E7EF45A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB1021349A303B20831AB1F09E7EF45A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 13 Mar 2026 16:56:05 -0700
X-Gm-Features: AaiRm51j_9rv-uqqPBiQ8G1Q8H454w48JnRm006FiLRI6qJM7yqac1WkWeGF-5A
Message-ID: <CANx9H-CSUh=8JMDfrUA6RHQs7F91RdC5RML1DKdcNuYKsufU4g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
To: peter.kjellerstedt@axis.com
Cc: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>, 
	"skandigraun@gmail.com" <skandigraun@gmail.com>, 
	"deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000069ae77064cf09d29"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 23:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125194

--00000000000069ae77064cf09d29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We already have precedent to use Debian naming with perl recipes.


On Fri, Mar 13, 2026 at 11:18=E2=80=AFAM Peter Kjellerstedt via
lists.openembedded.org <peter.kjellerstedt=3Daxis.com@lists.openembedded.or=
g>
wrote:

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> lists.openembedded.org
> > Sent: den 10 mars 2026 20:18
> > To: skandigraun@gmail.com
> > Cc: deepesh.varatharajan@windriver.com;
> openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe
> >
> > On Wed, Mar 11, 2026 at 6:19=E2=80=AFAM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> wrote:
> > >
> > > On 3/10/26 14:48, Varatharajan, Deepesh via lists.openembedded.org
> wrote:
> > > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > > >
> > > > Add a recipe for the cxx crate, which provides a safe and efficient
> > > > bridge for interoperability between Rust and C++ code. It allows
> > > > defining the FFI boundary in a shared Rust module and generates
> > > > compatible bindings for both languages during the build process.
> > > >
> > > > The crate is implemented in Rust and supports zero-overhead FFI wit=
h
> > > > common Rust and C++ standard library types.
> > > >
> > > > More information: https://crates.io/crates/cxx
> > > >
> > > > Signed-off-by: Deepesh Varatharajan <
> Deepesh.Varatharajan@windriver.com>
> > > > ---
> > > >  meta-oe/recipes-devtools/cxx/cxx-crates.inc | 130
> ++++++++++++++++++++
> > > >  meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb |  34 +++++
> > > >  2 files changed, 164 insertions(+)
> > > >  create mode 100644 meta-oe/recipes-devtools/cxx/cxx-crates.inc
> > > >  create mode 100644 meta-oe/recipes-devtools/cxx/cxx_1.0.194.bb
> > > >
> > >
> > > This is mostly just a thought, I don't intend this as a blocker of th=
is
> > > patch. Maybe a loud thought, or a quick-discussion starter?
> > >
> > > cxx is pretty generic name, I find it hard to guess that it's a Rust
> > > library for FFI.
> > >
> > > Debian prefixes this (and similar packages) with librust - this one i=
s
> > > called librust-cxx. Fedora calls it rust-cxx. (Though OpenSuse just
> > > calls it cxx - I guess there is accepted no standard)
> > > What if we would follow Debian or Fedora naming with such Rust
> > > libraries, similar to what is done with many Python and Perl recipes?=
 I
> > > imagine that over time there will be more similar recipes.
> > >
> >
> > Had similar thoughts when I read the recipe name.
> > Another idea is to use "cxx-crates" name for both, inc and bb files.
>
> No, that is a bad idea. The -crates.inc files tie into the similar
> files for Go, i.e., -go-mods.inc and -licenses.inc. And I expect that
> in the future there will also be -licenses.inc files for the Rust
> recipes.
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125192):
> https://lists.openembedded.org/g/openembedded-devel/message/125192
> Mute This Topic: https://lists.openembedded.org/mt/118240942/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000069ae77064cf09d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We already have precedent to use Debian naming with perl r=
ecipes.<div><br></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2026 at 11:18=
=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axi=
s.com@lists.openembedded.org">axis.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; -----Orig=
inal Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Ankur Tyagi via <a=
 href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank=
">lists.openembedded.org</a><br>
&gt; Sent: den 10 mars 2026 20:18<br>
&gt; To: <a href=3D"mailto:skandigraun@gmail.com" target=3D"_blank">skandig=
raun@gmail.com</a><br>
&gt; Cc: <a href=3D"mailto:deepesh.varatharajan@windriver.com" target=3D"_b=
lank">deepesh.varatharajan@windriver.com</a>; <a href=3D"mailto:openembedde=
d-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel@lists.=
openembedded.org</a><br>
&gt; Subject: Re: [oe] [meta-oe][PATCH] cxx: Add cxx recipe<br>
&gt; <br>
&gt; On Wed, Mar 11, 2026 at 6:19=E2=80=AFAM Gyorgy Sarvari via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt; On 3/10/26 14:48, Varatharajan, Deepesh via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; &gt; &gt; From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Var=
atharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.c=
om</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Add a recipe for the cxx crate, which provides a safe and ef=
ficient<br>
&gt; &gt; &gt; bridge for interoperability between Rust and C++ code. It al=
lows<br>
&gt; &gt; &gt; defining the FFI boundary in a shared Rust module and genera=
tes<br>
&gt; &gt; &gt; compatible bindings for both languages during the build proc=
ess.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The crate is implemented in Rust and supports zero-overhead =
FFI with<br>
&gt; &gt; &gt; common Rust and C++ standard library types.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; More information: <a href=3D"https://crates.io/crates/cxx" r=
el=3D"noreferrer" target=3D"_blank">https://crates.io/crates/cxx</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:De=
epesh.Varatharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@wi=
ndriver.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta-oe/recipes-devtools/cxx/cxx-crates.inc | 130 ++++=
++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 meta-oe/recipes-devtools/cxx/<a href=3D"http://cxx_1.0=
.194.bb" rel=3D"noreferrer" target=3D"_blank">cxx_1.0.194.bb</a> |=C2=A0 34=
 +++++<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 164 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/cxx/cxx-cr=
ates.inc<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/cxx/<a hre=
f=3D"http://cxx_1.0.194.bb" rel=3D"noreferrer" target=3D"_blank">cxx_1.0.19=
4.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This is mostly just a thought, I don&#39;t intend this as a block=
er of this<br>
&gt; &gt; patch. Maybe a loud thought, or a quick-discussion starter?<br>
&gt; &gt;<br>
&gt; &gt; cxx is pretty generic name, I find it hard to guess that it&#39;s=
 a Rust<br>
&gt; &gt; library for FFI.<br>
&gt; &gt;<br>
&gt; &gt; Debian prefixes this (and similar packages) with librust - this o=
ne is<br>
&gt; &gt; called librust-cxx. Fedora calls it rust-cxx. (Though OpenSuse ju=
st<br>
&gt; &gt; calls it cxx - I guess there is accepted no standard)<br>
&gt; &gt; What if we would follow Debian or Fedora naming with such Rust<br=
>
&gt; &gt; libraries, similar to what is done with many Python and Perl reci=
pes? I<br>
&gt; &gt; imagine that over time there will be more similar recipes.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Had similar thoughts when I read the recipe name.<br>
&gt; Another idea is to use &quot;cxx-crates&quot; name for both, inc and b=
b files.<br>
<br>
No, that is a bad idea. The -crates.inc files tie into the similar <br>
files for Go, i.e., -go-mods.inc and -licenses.inc. And I expect that <br>
in the future there will also be -licenses.inc files for the Rust <br>
recipes.<br>
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125192): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125192" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125192</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118240942/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/118240942/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000069ae77064cf09d29--

