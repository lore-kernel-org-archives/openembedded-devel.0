Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83285C25B75
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 06:32:18 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.4065.1715236336169598458
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 23:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=APPKS33W;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-47f43c742e0so172696137.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715236335; x=1715841135; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BvmMyx+kPs4fKTPML+dqjegDNHFOI6CkhMmkUnWiMiQ=;
        b=APPKS33WxikftH4LBn654y7p15iVyq6xf9oxdUI0iZauRgzJT+AQJZnCF3lYaa3NIJ
         8GBEC+qqjxbw6A7mri47N0zB1yoIh1X5F6M2p9nJDGcmqHQVxeTfpj07NqLelSg4ZzUe
         d8aj2odecnPC9S1fU5HnheEwbE7YFUYnOUgdpp8EUCyXV0OtGjPgxY8RWsvbm8DfYplf
         dzJq2TLin+IRmfmKCYro1mMNHIl2kSLa91oBfOmlUmdD5sO7XuENbpTURqISiiX9dVn9
         sUHGbJxGCWmxkBpDMxXftr3KUuU2pnQViNCfMBvo6KFv/ONRWXGeSZKAaHbSTLClEEgf
         ylrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715236335; x=1715841135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvmMyx+kPs4fKTPML+dqjegDNHFOI6CkhMmkUnWiMiQ=;
        b=Kw+EUrBLGtbzy6q/SoMn1eNjTnitPvrSwrdh/+U6CuK0hlDRa6LsoBiqlkKIhMpH3t
         wZP/o88ERhSxPVRHt2qtvz67/S72XGC4BQMPUjozzrCkDyA6TGlk3u7wH/fmcMbslp+E
         V7NtrLCDz+PpOZQhjLmi8T3iBq/qCMLwVpt8nQjgso3mxyZOp74w5WN13LnjN//XK+My
         kRvyYC0BSlR19fZvGANA8Yrb+MXr3DLfc/ry8WsW2Z0gHJhQix0f3cD+7QvDnNTIdesD
         9CljRmfQ1QTf4gVixIU4z4vToLKH+Qx9H8SoPtrGML8o2/S89THG3k5mzo9ErwH+TPs9
         MwMw==
X-Forwarded-Encrypted: i=1; AJvYcCUti4taSv4A4RzMzOFT7YtzHk1XwjY/zVnYSDZfZtPkt0AoJUOhoiHWNrfJJW2zySuEU32Xt/25fHMVWQK9g56us1e1a8rkvYqEvpyT66yDP4rJqZ3aMjbBjQ==
X-Gm-Message-State: AOJu0YwchqKoYeOjE7hlyxNFipAykbrQSLIyZbhJ6S8H99b7hRruBz/P
	ET1OSdKkc5iHzlvbVg3IcD7YrIwCVbThYVlVipHHIIFuA5IIGndOEWdRn4hS4/IWK8hWVyLvys7
	LuG+N/GHh+AljkFKcd8symLgJ+WU=
X-Google-Smtp-Source: AGHT+IGCKaFiP814eJtf20VfETwZxPGGf4UPjnplTLtcn01Bdc69XreDwXKDvh+3tYlhLqeC5VpK3+um13O1k5BCjV8=
X-Received: by 2002:a67:fe83:0:b0:47c:37e9:6333 with SMTP id
 ada2fe7eead31-47f3c2e698cmr4712357137.17.1715236333597; Wed, 08 May 2024
 23:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
 <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
 <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com> <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
In-Reply-To: <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 9 May 2024 07:32:02 +0100
Message-ID: <CANPvuR=qAm4HRRWVN5YpyTRW3dmBZO+kHkePsEz3DdqsNewjrg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005eba5b0617ff94bc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110283

--0000000000005eba5b0617ff94bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fathi,

I am thinking of moving this back again to the meta-oe/recipes-extended/com
posefs.
The fuse3 is only used for development purposes and the composefs uses the
kernel overlayfs and erofs on the target.
So in my opinion we can remove inteirly the fuse support in OE.

I'm also adding support for the native target that will be required for the
next ostree v2024.6

Jose

Fathi Boudra <fathi.boudra@linaro.org> escreveu (segunda, 8/04/2024 =C3=A0(=
s)
15:33):

> Hi Martin,
>
> On Mon, 8 Apr 2024 at 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Mon, Apr 8, 2024 at 3:50=E2=80=AFPM Fathi Boudra <fathi.boudra@linar=
o.org>
> wrote:
> > >
> > > Hi Khem,
> > >
> > > On Sat, 6 Apr 2024 at 03:04, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > fails with latest musl
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/761688/
> > >
> > > I tried to reproduce:
> > >
> > > local.conf:
> > > MACHINE =3D "qemuarm64"
> > > TCLIBC =3D "musl"
> > > TOOLCHAIN =3D "clang"
> > >
> > > $ bitbake -e musl |grep "^PV=3D"
> > > PV=3D"1.2.4+git"
> > >
> > > Build Configuration:
> > > BB_VERSION           =3D "2.7.3"
> > > BUILD_SYS            =3D "x86_64-linux"
> > > NATIVELSBSTRING      =3D "debian"
> > > TARGET_SYS           =3D "aarch64-oe-linux-musl"
> > > MACHINE              =3D "qemuarm64"
> > > DISTRO               =3D "nodistro"
> > > DISTRO_VERSION       =3D "nodistro.0"
> > > TUNE_FEATURES        =3D "aarch64 crc cortexa57"
> > > TARGET_FPU           =3D ""
> > > meta                 =3D
> "master:486ed69939f1b7572f121960c2dde246032686e7"
> > > meta-clang           =3D
> "master:13dcab852c5bcd51fd75ae84ace9eddd99254653"
> > > meta-filesystems
> > > meta-networking
> > > meta-oe
> > > meta-python          =3D
> "master:5a02b76b82d1f48986212c33dddf7986385c79ef"
> > >
> > > I couldn't reproduce the build failure. What am I missing?
> >
> > removing meta-filesystems from your bblayers.conf
>
> no, I'm asking about the musl basename() related build failure.
>
> The build failure about fuse3 dependency is quite obvious.
> In my local build, I moved the recipe to
> meta-filesystems/recipes-support/composefs/
> I'll submit a v2 for the latter but if I can reproduce the musl issue
> and get it fixed for v2 that would be great.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109866):
> https://lists.openembedded.org/g/openembedded-devel/message/109866
> Mute This Topic: https://lists.openembedded.org/mt/105351850/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005eba5b0617ff94bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Fathi,<br><br>I am thinking of moving this back ag=
ain to the=C2=A0<span style=3D"color:rgb(0,0,0)">meta-oe/recipes-extended/c=
om</span><span style=3D"color:rgb(0,0,0)">posefs.</span><br><div><span styl=
e=3D"color:rgb(0,0,0)">The fuse3 is only used for development=C2=A0purposes=
 and the=C2=A0</span><span style=3D"color:rgb(0,0,0)">com</span><span style=
=3D"color:rgb(0,0,0)">posefs uses the kernel overlayfs and erofs on the tar=
get.</span><span style=3D"color:rgb(0,0,0)"><br></span></div><div><span sty=
le=3D"color:rgb(0,0,0)">So in my opinion we can remove inteirly the fuse su=
pport in OE.<br><br></span>I&#39;m also adding support for the native targe=
t that will be required for the next ostree v2024.6<br><br>Jose</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Fathi =
Boudra &lt;<a href=3D"mailto:fathi.boudra@linaro.org">fathi.boudra@linaro.o=
rg</a>&gt; escreveu (segunda, 8/04/2024 =C3=A0(s) 15:33):<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br>
<br>
On Mon, 8 Apr 2024 at 16:18, Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Apr 8, 2024 at 3:50=E2=80=AFPM Fathi Boudra &lt;<a href=3D"mai=
lto:fathi.boudra@linaro.org" target=3D"_blank">fathi.boudra@linaro.org</a>&=
gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt; On Sat, 6 Apr 2024 at 03:04, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; fails with latest musl<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/76=
1688/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org=
/Errors/Details/761688/</a><br>
&gt; &gt;<br>
&gt; &gt; I tried to reproduce:<br>
&gt; &gt;<br>
&gt; &gt; local.conf:<br>
&gt; &gt; MACHINE =3D &quot;qemuarm64&quot;<br>
&gt; &gt; TCLIBC =3D &quot;musl&quot;<br>
&gt; &gt; TOOLCHAIN =3D &quot;clang&quot;<br>
&gt; &gt;<br>
&gt; &gt; $ bitbake -e musl |grep &quot;^PV=3D&quot;<br>
&gt; &gt; PV=3D&quot;1.2.4+git&quot;<br>
&gt; &gt;<br>
&gt; &gt; Build Configuration:<br>
&gt; &gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.7.=
3&quot;<br>
&gt; &gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_=
64-linux&quot;<br>
&gt; &gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;debian&quot;<br>
&gt; &gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;aarc=
h64-oe-linux-musl&quot;<br>
&gt; &gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;qemuarm64&quot;<br>
&gt; &gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D =
&quot;nodistro&quot;<br>
&gt; &gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;nodistro.0&quo=
t;<br>
&gt; &gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64 crc co=
rtexa57&quot;<br>
&gt; &gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quo=
t;<br>
&gt; &gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D &quot;master:486ed69939f1b7572f121960c2dde246032686e7&quot;<br>
&gt; &gt; meta-clang=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;mast=
er:13dcab852c5bcd51fd75ae84ace9eddd99254653&quot;<br>
&gt; &gt; meta-filesystems<br>
&gt; &gt; meta-networking<br>
&gt; &gt; meta-oe<br>
&gt; &gt; meta-python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:5a=
02b76b82d1f48986212c33dddf7986385c79ef&quot;<br>
&gt; &gt;<br>
&gt; &gt; I couldn&#39;t reproduce the build failure. What am I missing?<br=
>
&gt;<br>
&gt; removing meta-filesystems from your bblayers.conf<br>
<br>
no, I&#39;m asking about the musl basename() related build failure.<br>
<br>
The build failure about fuse3 dependency is quite obvious.<br>
In my local build, I moved the recipe to<br>
meta-filesystems/recipes-support/composefs/<br>
I&#39;ll submit a v2 for the latter but if I can reproduce the musl issue<b=
r>
and get it fixed for v2 that would be great.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109866): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109866" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109866</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105351850/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105351850/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--0000000000005eba5b0617ff94bc--

