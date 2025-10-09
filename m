Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AA2CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:11:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.7398.1760033317016914387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ehjaxauu;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: joao.raul.434@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-7970e8d1cfeso16485986d6.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033316; x=1760638116; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4RD2Sat3rzeVdjZz3rbrM4c3p16yKqfazQLvQb86M8=;
        b=EhjaxauuWZpMlD+m2ke2yxLsvaZ3D9DsCLz/Sg0DEIpV/HZLAh/OqqnlTKYvBhBq0f
         NOXUQj7AYiodJvXg2lqQ/s7oPc/mpcgBhbpvviMpanFkUu+O4y/LWJwyPChvzdZVrSu1
         312aR1QLcQumj8DGaomYZP5CDnt0pzWD3BcKc2Wl5qXsnrmNBz8blHTjbourTf5zzJ/q
         F6Jo7DrCK6w84VWoD5bbTgrpCiOs8wYcOpgknEKZHONa3K3EEy1VlMx7jnYq1Y1K37Qm
         AhQf5Jqc1Nea7KXy6j6A3zVKF77qpuMZyVhsGxRSGK9rJSAwjA5R4olTHOpekq1Cr+Bx
         /olA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033316; x=1760638116;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4RD2Sat3rzeVdjZz3rbrM4c3p16yKqfazQLvQb86M8=;
        b=cEZMyinqYUhA0i5YB5iLHYeGSaOV4+yO/yTzujoPZ0ziAV75kIVYEHcGga7m2ygH+C
         wdJlsx9+shsufvjSSBRE1ijLEWFYhCiUmmjJTm/GPxT5Amn5XJK0r9yQbdm8TyqDUjuj
         e8J+7vrNFb8nBMrudHSsq2SQ70NnnUdp1Z2Po6tB1lh8NtTmrllPQ0dk5HNpWmv9WabX
         ADr3nUcQn/PDI+yGyL+wqdkvsXC9tGrR6qmEFtaiXdJg77MKoIvTzkxEHzvG1izvEeoQ
         FCsDwIuZA0q7avpPBPCkAGTHSvHnAJgug7WG1LcLozHBkHUrV7EivUBnEhZ1H4V5f9Z7
         bBNA==
X-Gm-Message-State: AOJu0YzKM30vLsrk8cQv0Aou/CUAN1J8VO3X7NZFHgyRR/jzSEXe2kjT
	G4Z7xtAo5NgFXDe+5zE4ALdUQSRqg2LsFipVM4k0OvZ7VTXgHTw0q2gJl/0SmXavBOMXDO2xXYj
	K7iubr6bFxx9pJGqVYRJYGMIr51wirrI=
X-Gm-Gg: ASbGncuWIqIlrh6dMJMz2z5DHOrC3Xyxve+syvwv768LJCnlKGkyQkY7L/Hbuex8++5
	fpIe48+MzInqY1NxeiASHu757FsPXo8yEcJUfRbj7d24SbLegX43UOY2K+wpFSpnxdWfYuYfUat
	x0vPVhcwyA2OXNZ+GsRaUMTkaPkCi11zmWclB+sV2bs7tt/r0xh0CQyNMuJpwNvBp2yJnzhhEXZ
	354Wq3Hgvz3v68c0s6dq4ngy40A8aCMloZiWZb6gXA=
X-Google-Smtp-Source: AGHT+IFw7G/cW9VrbYMDZjzIpSwNRO9pYSf07Z0T3wr9mDxsidAL6KxM0qsSQtE6VAQemItaX/wy485GTjWk/p/DVP8=
X-Received: by 2002:ad4:4eeb:0:b0:7f5:b2b6:2a30 with SMTP id
 6a1803df08f44-87b210320f1mr126839976d6.18.1760033315580; Thu, 09 Oct 2025
 11:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20251007105350.1237-1-joao.lima@hbkworld.com> <20251007105350.1237-2-joao.lima@hbkworld.com>
 <CAMKF1srm31ry7unszz67F=i7UhN-6a=xi+jP4DJ=3U-pFeLd_w@mail.gmail.com> <CAMKF1soHwesEkmQ8h+XsROBy6nqhVJ9d-ROyPfRLk_SAHk3JOw@mail.gmail.com>
In-Reply-To: <CAMKF1soHwesEkmQ8h+XsROBy6nqhVJ9d-ROyPfRLk_SAHk3JOw@mail.gmail.com>
From: =?UTF-8?B?Sm/Do28gUmHDumw=?= <joao.raul.434@gmail.com>
Date: Thu, 9 Oct 2025 19:08:24 +0100
X-Gm-Features: AS18NWAkKmW7LLepbX_N4l06nra2dDNrrVcczMAkUej2EuxWqa499LuBqyESiLo
Message-ID: <CA+yRQ9pcgc0Tq1Wog+Zebdmz+pB18yH7-nq7mXvLfH0-Ye3PWQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v2 1/3] openocd: bump the openocd, jimtcl versions
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, joao.lima@hbkworld.com, 
	ivitro@gmail.com
Content-Type: multipart/alternative; boundary="0000000000009172be0640bdb007"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120459

--0000000000009172be0640bdb007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem

Thank you for sharing the log.
I figured out what was wrong with my test setup.
Since I had to create a separate setup, I didn't configure it properly to
include the recipe.

I have already submitted a new series.
I tested them by generating a minimal image.

Thank you.

Best Regards,
Joao Lima

Khem Raj <raj.khem@gmail.com> escreveu (quarta, 8/10/2025 =C3=A0(s) 04:32):

> Once I remove the patch it fails to configure thats next problem see -
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3764711/raw_inl=
ine
>
> On Tue, Oct 7, 2025 at 2:57=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > How did you test it ?
> > I am seeing patching errors
> >
> > NOTE: Applying patch
> > '0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch'
> >
> (sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd/0001-=
Makefile.
> >    =E2=86=AA am-Use-SOURCE_DATE_EPOCH-environment-variab.patch)
> >    ERROR: Applying patch
> > '0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch' on
> > target directory
> > '/home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux-musl/
> >    =E2=86=AA openocd/0.12+git/sources/openocd-0.12+git'
> >
> >
> > On Tue, Oct 7, 2025 at 3:54=E2=80=AFAM Lima, Jo=C3=A3o <joao.raul.434@g=
mail.com>
> wrote:
> > >
> > > From: Joao Lima <joao.lima@hbkworld.com>
> > >
> > > Version bumps:
> > >    - openocd: 91bd431 -> 66ea461
> > >    - jimtcl: fcbb449 -> f160866
> > >    - libjaylink: 9aa7a59 -> 0d23921
> > >
> > > Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
> > > ---
> > >  meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > > index 3bbe33ca1d..3b7705c41d 100644
> > > --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > > +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> > > @@ -13,10 +13,10 @@ SRC_URI =3D " \
> > >  "
> > >
> > >  SRCREV_FORMAT =3D "openocd"
> > > -SRCREV_openocd =3D "91bd4313444c5a949ce49d88ab487608df7d6c37"
> > > +SRCREV_openocd =3D "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
> > >  SRCREV_git2cl =3D "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> > > -SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
> > > -SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> > > +SRCREV_jimtcl =3D "f160866171457474f7c4d6ccda70f9b77524407e"
> > > +SRCREV_libjaylink =3D "0d23921a05d5d427332a142d154c213d0c306eb1"
> > >
> > >  PV =3D "0.12+git"
> > >
>

--0000000000009172be0640bdb007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hello Khem</div><div><br></div><div>Thank=C2=A0you for shari=
ng the log.<br></div><div>I figured=C2=A0out what was wrong with my test se=
tup.<br>Since I had to create a separate setup, I didn&#39;t configure it p=
roperly to include the recipe.</div><div><br>I have already submitted a new=
 series.<br>I tested them by generating a minimal image.<br><br>Thank you.<=
br><br>Best Regards,<br>Joao Lima</div></div></div></div></div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; escreveu (quarta, 8/10/2025 =C3=A0(s) 04:32):<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Once I remove the patch it fails=
 to configure thats next problem see -<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/376471=
1/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/valkyrie/api/v2/logs/3764711/raw_inline</a><br>
<br>
On Tue, Oct 7, 2025 at 2:57=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; How did you test it ?<br>
&gt; I am seeing patching errors<br>
&gt;<br>
&gt; NOTE: Applying patch<br>
&gt; &#39;0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch&#=
39;<br>
&gt; (sources/meta-openembedded/meta-oe/recipes-devtools/openocd/openocd/00=
01-Makefile.<br>
&gt;=C2=A0 =C2=A0 =E2=86=AA am-Use-SOURCE_DATE_EPOCH-environment-variab.pat=
ch)<br>
&gt;=C2=A0 =C2=A0 ERROR: Applying patch<br>
&gt; &#39;0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch&#=
39; on<br>
&gt; target directory<br>
&gt; &#39;/home/kraj200/yoe/build/tmp/work/x86-64-v3-yoe-linux-musl/<br>
&gt;=C2=A0 =C2=A0 =E2=86=AA openocd/0.12+git/sources/openocd-0.12+git&#39;<=
br>
&gt;<br>
&gt;<br>
&gt; On Tue, Oct 7, 2025 at 3:54=E2=80=AFAM Lima, Jo=C3=A3o &lt;<a href=3D"=
mailto:joao.raul.434@gmail.com" target=3D"_blank">joao.raul.434@gmail.com</=
a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Joao Lima &lt;<a href=3D"mailto:joao.lima@hbkworld.com" tar=
get=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Version bumps:<br>
&gt; &gt;=C2=A0 =C2=A0 - openocd: 91bd431 -&gt; 66ea461<br>
&gt; &gt;=C2=A0 =C2=A0 - jimtcl: fcbb449 -&gt; f160866<br>
&gt; &gt;=C2=A0 =C2=A0 - libjaylink: 9aa7a59 -&gt; 0d23921<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Joao Lima &lt;<a href=3D"mailto:joao.lima@hbkworld=
.com" target=3D"_blank">joao.lima@hbkworld.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_=
git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a> | 6 +++---<=
br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/openocd/<a href=3D"http://o=
penocd_git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a> b/me=
ta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; &gt; index 3bbe33ca1d..3b7705c41d 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_=
git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/openocd/<a href=3D"http://openocd_=
git.bb" rel=3D"noreferrer" target=3D"_blank">openocd_git.bb</a><br>
&gt; &gt; @@ -13,10 +13,10 @@ SRC_URI =3D &quot; \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRCREV_FORMAT =3D &quot;openocd&quot;<br>
&gt; &gt; -SRCREV_openocd =3D &quot;91bd4313444c5a949ce49d88ab487608df7d6c3=
7&quot;<br>
&gt; &gt; +SRCREV_openocd =3D &quot;66ea461846a3a4a96687c9287c3f61ae8ce0b77=
5&quot;<br>
&gt; &gt;=C2=A0 SRCREV_git2cl =3D &quot;8373c9f74993e218a08819cbcdbab3f3564=
bbeba&quot;<br>
&gt; &gt; -SRCREV_jimtcl =3D &quot;fcbb4499a6b46ef69e7a95da53e30796e20817f0=
&quot;<br>
&gt; &gt; -SRCREV_libjaylink =3D &quot;9aa7a5957c07bb6e862fc1a6d3153d109c74=
07e4&quot;<br>
&gt; &gt; +SRCREV_jimtcl =3D &quot;f160866171457474f7c4d6ccda70f9b77524407e=
&quot;<br>
&gt; &gt; +SRCREV_libjaylink =3D &quot;0d23921a05d5d427332a142d154c213d0c30=
6eb1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PV =3D &quot;0.12+git&quot;<br>
&gt; &gt;<br>
</blockquote></div>

--0000000000009172be0640bdb007--

