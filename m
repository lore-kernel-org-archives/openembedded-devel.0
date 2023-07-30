Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B755FC001DE
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 13:01:30 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.72154.1690722083635044896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 06:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rZn77SE9;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso53145931fa.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690722082; x=1691326882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NSaABDr9xRpnMxclH6pf8TKA9VmC59eNsDNA2t4dP+I=;
        b=rZn77SE90jR+qpbg8KuBsSakonaASCRvIwhFF9CUHBbC1YVOaKJ4OVZmjFTsX75L2Q
         5Un4ltplBE0G7qVZVn2CqpM4EqFaROJgO+EUJwMO/meBSdEnemrv+s4iXxgY8VrAG+K3
         VSE6OnWJCAZc1DZWxEfXK9FBzsDWfWMgrvo7MeKENzWBut6LXn5DHed7eRChQj4UTim5
         YCIPmZx+qRwblkpRVt6cxRfgzNnhADKQf8YxsidDQUENOcFbh6cEcjYW7ghaYtrBnUcn
         x64APvjTWRdqAhE9yCJ3vQNCf9bi1cgICfLVYS/HrPTraeXT3IF/RDPBicrJs5RxXEAj
         dHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690722082; x=1691326882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSaABDr9xRpnMxclH6pf8TKA9VmC59eNsDNA2t4dP+I=;
        b=JG+K36FM+iGo6OfImopTZH9K4L1ZvSLkuK9EBRnVrBPkdHg+L44kBCEgcTjjbLb2b9
         3POCfWms+vYaGOSpnvnz0fzlNnzektDKZsn0Jw1p6Dm+/ml3h5Ca84H8NxycfgPRJLs0
         uQ5X+DcEMEj3r5XFcBPIMqeUINjMwwuS1uuEDxaGa4neT1qKy4hlaytRhsQvjU1yQyjZ
         jqE6pFdnte4EDFpaE6a/pU1LqOE11oXJW5v8Mrw9QuQzUwwuenzl/aDnPLfn734dFi+9
         yHkygIOLuVwZw9zS63+j2b0EjsP/lut3O5NriMWc5xoRVDNYmFLOcTCtUs018MJZKXbn
         KlEQ==
X-Gm-Message-State: ABy/qLYx9+/TwihtBwen8Ioh1qVT6VYi5TA+/blPtkzgO6g9aDWmKKqF
	FZu1Amtx046zWGUiyewLTLhOd25oGochvAHWlvw=
X-Google-Smtp-Source: APBJJlG6s4v96xWQzmGVhp4QCv9ciS3XmpVGfvN8C26Pp6pqzADGE4li4PGl3b4X3i5zco0n9Jzaj6lON7Vgi3122I8=
X-Received: by 2002:a2e:6e14:0:b0:2b9:dfd1:3808 with SMTP id
 j20-20020a2e6e14000000b002b9dfd13808mr1554610ljc.25.1690722081434; Sun, 30
 Jul 2023 06:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230331094145.2362159-1-xiangyu.chen@eng.windriver.com> <CAMKF1spbvF1hXwDEF2sBYPU0WODpkpdv0TiGKnJBBKQncUs0zQ@mail.gmail.com>
In-Reply-To: <CAMKF1spbvF1hXwDEF2sBYPU0WODpkpdv0TiGKnJBBKQncUs0zQ@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 30 Jul 2023 15:01:10 +0200
Message-ID: <CAJiuCcfnbyKHk76thf=zD6Hpo2ugROUt=eMpsnzeGL=mGji-dg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v4 0/3] update protobuf package from 3.21.12
 to 4.22.2
To: Khem Raj <raj.khem@gmail.com>
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000013efa40601b3e9c7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 13:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104075

--00000000000013efa40601b3e9c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiangyu,

On Sat, 1 Apr 2023 at 15:09, Khem Raj <raj.khem@gmail.com> wrote:

> next error
>
> https://errors.yoctoproject.org/Errors/Details/699337/


Could you try to bump gRPC and see if it fixed the compilation?

I was looking to bump gRPC but got other issues with utf8-native
https://lists.openembedded.org/g/openembedded-core/message/184648

Regards,
Clement



>
> On Fri, Mar 31, 2023 at 2:42=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
> >
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > The series patches are upgrading protobuf package to latest version and
> add support which is
> > depending protobuf package.
> >
> > Changes:
> > v3->v4:
> > 1. fix build failure under qemuarm
> > 2. fix protobuf-c-native build failure
> >
> > Tested compiling protobuf/protobuf-native on qemuarm(clang) and
> x86-64(gcc)
> > Tested compiling protobuf-c/protobuf-c-native on qemuarm(clang) and
> x86-64(gcc)
> > Tested compiling mosh on qemuarm(clang) and x86-64(gcc)
> >
> > ##### log of building qemuarm with clang (protobuf-c-native/protobuf
> failed before):
> >
> > poky/build-upstream$ bitbake protobuf protobuf-native protobuf-c
> protobuf-c-native mosh
> > /usr/lib/python3/dist-packages/html5lib/_trie/_base.py:3:
> DeprecationWarning: Using or importing the ABCs from 'collections' instea=
d
> of from 'collections.abc' is deprecated since Python 3.3, and in 3.9 it
> will stop working
> >   from collections import Mapping
> > NOTE: Reconnecting to bitbake server...
> > Loading cache: 100%
> |########################################################################=
###########################################################################=
###################|
> Time: 0:00:00
> > Loaded 3049 entries from dependency cache.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           =3D "2.3.1"
> > BUILD_SYS            =3D "x86_64-linux"
> > NATIVELSBSTRING      =3D "universal"
> > TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> > MACHINE              =3D "qemuarm"
> > DISTRO               =3D "poky"
> > DISTRO_VERSION       =3D
> "4.1+snapshot-51c56c35dcbdf990c764f62babdb303568d7c879"
> > TUNE_FEATURES        =3D "arm vfp cortexa15 neon thumb callconvention-h=
ard"
> > TARGET_FPU           =3D "hard"
> > meta
> > meta-poky
> > meta-yocto-bsp       =3D "master:51c56c35dcbdf990c764f62babdb303568d7c8=
79"
> > meta-oe              =3D
> "master-dev:a06ee7ad9f58f055cdd08e3807e36e0c21b302d1"
> > meta-clang           =3D "HEAD:371097cdaa0175119a6710390d11a4e967188968=
"
> >
> > Initialising tasks: 100%
> |########################################################################=
###########################################################################=
##############|
> Time: 0:00:01
> > Sstate summary: Wanted 27 Local 0 Mirrors 0 Missed 27 Current 312 (0%
> match, 92% complete)
> > NOTE: Executing Tasks
> > WARNING: mosh-1.4.0-r0 do_fetch: Failed to fetch URL
> http://mosh.mit.edu/mosh-1.4.0.tar.gz, attempting MIRRORS if available
> > WARNING: protobuf-4.22.2-r0 do_fetch: Failed to fetch URL gitsm://
> github.com/protocolbuffers/protobuf.git;branch=3D22.x;protocol=3Dhttps,
> attempting MIRRORS if available
> > WARNING: protobuf-c-1.4.1-r0 do_fetch: Failed to fetch URL git://
> github.com/protobuf-c/protobuf-c.git;branch=3Dmaster;protocol=3Dhttps,
> attempting MIRRORS if available
> > NOTE: Tasks Summary: Attempted 1254 tasks of which 1182 didn't need to
> be rerun and all succeeded.
> >
> > Summary: There were 3 WARNING messages.
> >
> > #### end of log
> >
> > v2->v3:
> > 1. fix mosh compile failure
> > 2. fix protobuf-c compile failure under clang
> >
> > protobuf,protobuf-c and mosh tested under both clang and gcc mode.
> >
> >
> > v1->v2:
> > The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.
> > After upgrading the protobuf, the package protobuf-c cannot compile
> anymore[2] due to the latest version
> > protobuf is using c++14 and some of API name has been changed, so use
> another patch to add support of
> > protobuf latest version in protobuf-c.
> >
> >
> > Ref:
> > [1] v1 thread please refer to
> https://lists.openembedded.org/g/openembedded-devel/message/101784
> > [2] https://errors.yoctoproject.org/Errors/Details/698756/
> >
> >
> > Xiangyu Chen (3):
> >   protobuf: upgrade 3.21.12 -> 4.22.2
> >   protobuf-c: add support of protobuf 4.22.x
> >   mosh: add support of protobuf 4.22.x
> >
> >  ...re.ac-add-support-of-protobuf-4.22.x.patch |  63 ++++
> >  .../recipes-connectivity/mosh/mosh_1.4.0.bb   |   7 +-
> >  ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++
> >  .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
> >  .../protobuf/protobuf-c_1.4.1.bb              |   6 +-
> >  ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  15 +-
> >  ...protobuf_3.21.12.bb =3D> protobuf_4.22.2.bb} |  11 +-
> >  7 files changed, 552 insertions(+), 12 deletions(-)
> >  create mode 100644
> meta-oe/recipes-connectivity/mosh/mosh/0001-configure.ac-add-support-of-p=
rotobuf-4.22.x.patch
> >  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-Makefile.am-do-not-comp=
ile-the-code-which-was-genera.patch
> >  create mode 100644
> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-protobuf=
-4.22.x.patch
> >  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb =3D>
> protobuf_4.22.2.bb} (86%)
> >
> > --
> > 2.34.1
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101868):
> https://lists.openembedded.org/g/openembedded-devel/message/101868
> Mute This Topic: https://lists.openembedded.org/mt/97969897/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> peron.clem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000013efa40601b3e9c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Xiangyu,</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, 1 Apr 2023 at 15:09, Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">next error<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/699337/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/699337/</a></blockquote><div><br></div><div class=3D"gmail_default" style=
=3D"font-family:monospace">Could you try to bump gRPC and see if it fixed t=
he compilation?</div><div class=3D"gmail_default" style=3D"font-family:mono=
space"><br></div><div class=3D"gmail_default" style=3D"font-family:monospac=
e">I was looking to bump gRPC but got other issues with utf8-native=C2=A0 <=
a href=3D"https://lists.openembedded.org/g/openembedded-core/message/184648=
">https://lists.openembedded.org/g/openembedded-core/message/184648</a></di=
v><div><br></div><div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace">Regards,</div><div class=3D"gmail_default" style=3D"font-family:mon=
ospace">Clement</div><br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
On Fri, Mar 31, 2023 at 2:42=E2=80=AFAM Xiangyu Chen<br>
&lt;<a href=3D"mailto:xiangyu.chen@eng.windriver.com" target=3D"_blank">xia=
ngyu.chen@eng.windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.com" t=
arget=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
&gt;<br>
&gt; The series patches are upgrading protobuf package to latest version an=
d add support which is<br>
&gt; depending protobuf package.<br>
&gt;<br>
&gt; Changes:<br>
&gt; v3-&gt;v4:<br>
&gt; 1. fix build failure under qemuarm<br>
&gt; 2. fix protobuf-c-native build failure<br>
&gt;<br>
&gt; Tested compiling protobuf/protobuf-native on qemuarm(clang) and x86-64=
(gcc)<br>
&gt; Tested compiling protobuf-c/protobuf-c-native on qemuarm(clang) and x8=
6-64(gcc)<br>
&gt; Tested compiling mosh on qemuarm(clang) and x86-64(gcc)<br>
&gt;<br>
&gt; ##### log of building qemuarm with clang (protobuf-c-native/protobuf f=
ailed before):<br>
&gt;<br>
&gt; poky/build-upstream$ bitbake protobuf protobuf-native protobuf-c proto=
buf-c-native mosh<br>
&gt; /usr/lib/python3/dist-packages/html5lib/_trie/_base.py:3: DeprecationW=
arning: Using or importing the ABCs from &#39;collections&#39; instead of f=
rom &#39;collections.abc&#39; is deprecated since Python 3.3, and in 3.9 it=
 will stop working<br>
&gt;=C2=A0 =C2=A0from collections import Mapping<br>
&gt; NOTE: Reconnecting to bitbake server...<br>
&gt; Loading cache: 100% |#################################################=
###########################################################################=
##########################################| Time: 0:00:00<br>
&gt; Loaded 3049 entries from dependency cache.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.3.1&quo=
t;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-li=
nux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-poky-=
linux-gnueabi&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemu=
arm&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;4.1+snapshot-51c56c=
35dcbdf990c764f62babdb303568d7c879&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm vfp cortexa15 n=
eon thumb callconvention-hard&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;hard&quot=
;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:51c56c35dcbd=
f990c764f62babdb303568d7c879&quot;<br>
&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mast=
er-dev:a06ee7ad9f58f055cdd08e3807e36e0c21b302d1&quot;<br>
&gt; meta-clang=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:3710=
97cdaa0175119a6710390d11a4e967188968&quot;<br>
&gt;<br>
&gt; Initialising tasks: 100% |############################################=
###########################################################################=
##########################################| Time: 0:00:01<br>
&gt; Sstate summary: Wanted 27 Local 0 Mirrors 0 Missed 27 Current 312 (0% =
match, 92% complete)<br>
&gt; NOTE: Executing Tasks<br>
&gt; WARNING: mosh-1.4.0-r0 do_fetch: Failed to fetch URL <a href=3D"http:/=
/mosh.mit.edu/mosh-1.4.0.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//mosh.mit.edu/mosh-1.4.0.tar.gz</a>, attempting MIRRORS if available<br>
&gt; WARNING: protobuf-4.22.2-r0 do_fetch: Failed to fetch URL gitsm://<a h=
ref=3D"http://github.com/protocolbuffers/protobuf.git;branch=3D22.x;protoco=
l=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/protocolbuffers/=
protobuf.git;branch=3D22.x;protocol=3Dhttps</a>, attempting MIRRORS if avai=
lable<br>
&gt; WARNING: protobuf-c-1.4.1-r0 do_fetch: Failed to fetch URL git://<a hr=
ef=3D"http://github.com/protobuf-c/protobuf-c.git;branch=3Dmaster;protocol=
=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/protobuf-c/protob=
uf-c.git;branch=3Dmaster;protocol=3Dhttps</a>, attempting MIRRORS if availa=
ble<br>
&gt; NOTE: Tasks Summary: Attempted 1254 tasks of which 1182 didn&#39;t nee=
d to be rerun and all succeeded.<br>
&gt;<br>
&gt; Summary: There were 3 WARNING messages.<br>
&gt;<br>
&gt; #### end of log<br>
&gt;<br>
&gt; v2-&gt;v3:<br>
&gt; 1. fix mosh compile failure<br>
&gt; 2. fix protobuf-c compile failure under clang<br>
&gt;<br>
&gt; protobuf,protobuf-c and mosh tested under both clang and gcc mode.<br>
&gt;<br>
&gt;<br>
&gt; v1-&gt;v2:<br>
&gt; The v2[1] patch for upgrading protobuf from 3.21.12 to 4.22.2.<br>
&gt; After upgrading the protobuf, the package protobuf-c cannot compile an=
ymore[2] due to the latest version<br>
&gt; protobuf is using c++14 and some of API name has been changed, so use =
another patch to add support of<br>
&gt; protobuf latest version in protobuf-c.<br>
&gt;<br>
&gt;<br>
&gt; Ref:<br>
&gt; [1] v1 thread please refer to <a href=3D"https://lists.openembedded.or=
g/g/openembedded-devel/message/101784" rel=3D"noreferrer" target=3D"_blank"=
>https://lists.openembedded.org/g/openembedded-devel/message/101784</a><br>
&gt; [2] <a href=3D"https://errors.yoctoproject.org/Errors/Details/698756/"=
 rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Error=
s/Details/698756/</a><br>
&gt;<br>
&gt;<br>
&gt; Xiangyu Chen (3):<br>
&gt;=C2=A0 =C2=A0protobuf: upgrade 3.21.12 -&gt; 4.22.2<br>
&gt;=C2=A0 =C2=A0protobuf-c: add support of protobuf 4.22.x<br>
&gt;=C2=A0 =C2=A0mosh: add support of protobuf 4.22.x<br>
&gt;<br>
&gt;=C2=A0 ...re.ac-add-support-of-protobuf-4.22.x.patch |=C2=A0 63 ++++<br=
>
&gt;=C2=A0 .../recipes-connectivity/mosh/<a href=3D"http://mosh_1.4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">mosh_1.4.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A07 +-<br>
&gt;=C2=A0 ...ot-compile-the-code-which-was-genera.patch | 147 ++++++++<br>
&gt;=C2=A0 .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../protobuf/<a href=3D"http://protobuf-c_1.4.1.bb" rel=3D"noref=
errer" target=3D"_blank">protobuf-c_1.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |=C2=A0 15 +-<br>
&gt;=C2=A0 ...<a href=3D"http://protobuf_3.21.12.bb" rel=3D"noreferrer" tar=
get=3D"_blank">protobuf_3.21.12.bb</a> =3D&gt; <a href=3D"http://protobuf_4=
.22.2.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_4.22.2.bb</a>} |=C2=
=A0 11 +-<br>
&gt;=C2=A0 7 files changed, 552 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh/0001-c=
onfigure.ac-add-support-of-protobuf-4.22.x.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/=
0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/=
0001-add-support-of-protobuf-4.22.x.patch<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/protobuf/{<a href=3D"http://prot=
obuf_3.21.12.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.21.12.bb</=
a> =3D&gt; <a href=3D"http://protobuf_4.22.2.bb" rel=3D"noreferrer" target=
=3D"_blank">protobuf_4.22.2.bb</a>} (86%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101868): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101868" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101868</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97969897/4240=
582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97969897/4240582</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:peron.clem@gmail.com" ta=
rget=3D"_blank">peron.clem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000013efa40601b3e9c7--

