Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E770E728CF
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 17:48:43 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.24269.1696009714204876653
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 10:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RFLvlDb0;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-7abbe1067d1so4437836241.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696009713; x=1696614513; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBo7f0RAhDENQ3xye5oyk+gPE0dYmIaFKfOM5IZMK/U=;
        b=RFLvlDb008OxSkCWAV0lZd8Da8uuWCH3i48n8CqcIeo5SJNZZasm8NIA5XSchTw2VS
         NnQQbqcsaX20RSTHQzumSQHkJa4gxfq6bUuSkfdADvFTL/57bbows0H0Fb1lpCgwQvTJ
         Ox3T/QZeAWpru4UrHWP+G/XfSxk9aXtioWxw95vTjW0KOA0s6j7vJRSnQpVZjF/LvY50
         ZCFrTM3dtNCGwRZW49bElBpfvTi0osGq252ZS5pbka5m5mWh+8xO3dbDQyEyIveTawAi
         Kbe+MiqWjCbBeAp1oQOPPFXrKdSFQEx7mKj8ZC14Vu0xdNjz/iYpH66Sir609d10aEgC
         S9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009713; x=1696614513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBo7f0RAhDENQ3xye5oyk+gPE0dYmIaFKfOM5IZMK/U=;
        b=Y5NvwR50qwKAtagdZ2ZjEZRU2hQbxzD3q8ctwdn0mXwpOa177Un24tMGEfpcvZWoyN
         TO2y3C4E8U8IYldnkRaQjlR1jqRtmEarobtiM2oF4uiM+aEIRvfFEsxdztXkXovG3H0k
         x7bwAZSwKNevTl7G8+4jwG+yjEDzKu0Bbjff/pv8EdNU8GmT8JvQxBa1a3hs3NQvHkaI
         TOyKWZVfFz7MFuGoo/rtqlwm08q9HZvVPMz+VlkOhDr38i3wqE1J8mN6ZaDFp7sjWUYj
         zacIinRcs3p7fj3w9Vvvezn5jCa7CeHy9x0UrgKrpW2Bsa3vbW442ZKeNzNg8vf/1yi9
         3GeQ==
X-Gm-Message-State: AOJu0Yzl9jNAGrPYieCo+IMXMmFoes2/BKodiBbpTAUAxvxl9aMi7DfD
	SY5NqxFHZvnPYthw27SU3A3ZmSWpczuBO42fvS/f0XdmQpiq8A==
X-Google-Smtp-Source: AGHT+IFf/h/Sz3XebNnHw5Rk5TM9MU8GEsOn9I1WvonUWf7f2OIWC8WN1zkAVvNnEQ8Mul74K+INJd3W0OIN5OT+LQc=
X-Received: by 2002:a67:fb1a:0:b0:44e:a9b6:5290 with SMTP id
 d26-20020a67fb1a000000b0044ea9b65290mr5056644vsr.19.1696009713130; Fri, 29
 Sep 2023 10:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230929133724.56928-1-uvv.mail@gmail.com> <20230929133724.56928-3-uvv.mail@gmail.com>
 <CAMKF1sqO58Z6DwJyymo85ButXsc42mdciH_CpCCw8N-Ymbi5hA@mail.gmail.com>
In-Reply-To: <CAMKF1sqO58Z6DwJyymo85ButXsc42mdciH_CpCCw8N-Ymbi5hA@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Fri, 29 Sep 2023 11:48:22 -0600
Message-ID: <CAKHfEajJsVQPsY7fPfMRsWC8zF9k7bTtVUDPEfVw+P62-iXYig@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 3/3] overlayfs-tools: Install fsck binary
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007ca4c20606830830"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 17:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105259

--0000000000007ca4c20606830830
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for catching this. I'd rather change the dependency in V2.

Slava

On Fri, Sep 29, 2023, 10:22 Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Sep 29, 2023 at 6:38=E2=80=AFAM Vyacheslav Yurkov <uvv.mail@gmail=
.com>
> wrote:
> >
> > Two projects, overlayfs-tools and overlayfs-progs, were combined
> > upstream.
>
> Merging into one is fine however there are dependencies on
> overlayfs-progs so perhaps we need to add
> RPROVIDES =3D "overlayfs-progs" to overlayfs-tools_git.bb and then
> update the recipes e.g. xftests to depend on overayfs-tools
>
> >
> > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > ---
> >  ...-Makefile-proper-location-of-LDFLAGS.patch | 32 -------------------
> >  .../overlayfs/overlayfs-progs_git.bb          | 32 -------------------
> >  .../overlayfs/overlayfs-tools_git.bb          |  5 +--
> >  3 files changed, 1 insertion(+), 68 deletions(-)
> >  delete mode 100644
> meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-pr=
oper-location-of-LDFLAGS.patch
> >  delete mode 100644 meta-filesystems/recipes-utils/overlayfs/
> overlayfs-progs_git.bb
> >
> > diff --git
> a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-=
proper-location-of-LDFLAGS.patch
> b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-=
proper-location-of-LDFLAGS.patch
> > deleted file mode 100644
> > index 2c001834b..000000000
> > ---
> a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-=
proper-location-of-LDFLAGS.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 8eeaee82dcfdf47f16ad880e416b722827f41bdb Mon Sep 17 00:00:00 2001
> > -From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > -Date: Mon, 23 May 2022 19:37:32 +0200
> > -Subject: [PATCH] Makefile: proper location of LDFLAGS
> > -
> > -Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
> > ----
> > -Upstream-Status: Pending
> > -
> > - Makefile | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/Makefile b/Makefile
> > -index e3c5207..14b155e 100644
> > ---- a/Makefile
> > -+++ b/Makefile
> > -@@ -1,5 +1,5 @@
> > - CFLAGS =3D -Wall -g
> > --LFLAGS =3D -lm
> > -+LDFLAGS =3D -lm
> > - CC =3D gcc
> > -
> > - all: overlay
> > -@@ -7,7 +7,7 @@ all: overlay
> > - objects =3D fsck.o common.o lib.o check.o mount.o path.o overlayfs.o
> > -
> > - overlay: $(objects)
> > --      $(CC) $(LFLAGS) $(objects) -o fsck.overlay
> > -+      $(CC) $(objects) -o fsck.overlay $(LDFLAGS)
> > -
> > - .c.o:
> > -       $(CC) $(CFLAGS) -c $<
> > diff --git a/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-progs_git.bb b/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-progs_git.bb
> > deleted file mode 100644
> > index 9d58b9a63..000000000
> > --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -SUMMARY =3D "File system check utility for OverlayFS"
> > -HOMEPAGE =3D "https://github.com/hisilicon/overlayfs-progs"
> > -LICENSE =3D "PD"
> > -LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/files/common-licenses/PD;md5=3Db3597d12946881e13=
cb3b548d1173851"
> > -
> > -SRC_URI =3D "\
> > -    git://
> github.com/hisilicon/overlayfs-progs.git;protocol=3Dhttps;branch=3Dmaster=
 \
> > -    file://0001-Makefile-proper-location-of-LDFLAGS.patch \
> > -"
> > -
> > -PV =3D "1.0+git${SRCPV}"
> > -SRCREV =3D "e10ef686570d9c7eff42f52461593a5c15da56bd"
> > -
> > -S =3D "${WORKDIR}/git"
> > -B =3D "${S}"
> > -
> > -# Required to have the fts.h header for musl
> > -DEPENDS:append:libc-musl =3D " fts"
> > -# Fix the missing fts libs when using musl
> > -EXTRA_OEMAKE:append:libc-musl =3D " LDFLAGS=3D'-lfts'"
> > -
> > -EXTRA_OEMAKE +=3D "'CC=3D${CC} -O2' "
> > -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > -
> > -do_compile () {
> > -    oe_runmake
> > -}
> > -
> > -do_install () {
> > -    install -d ${D}${bindir}
> > -    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
> > -}
> > diff --git a/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/
> overlayfs-tools_git.bb
> > index de5155133..ca2ec9cc4 100644
> > --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> > +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
> > @@ -21,11 +21,8 @@ EXTRA_OEMAKE +=3D "'CC=3D${CC} -O2'"
> >  EXTRA_OEMAKE:append:libc-musl =3D " LDLIBS=3D-lfts"
> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >
> > -do_compile () {
> > -    oe_runmake
> > -}
> > -
> >  do_install () {
> >      install -d ${D}${bindir}
> >      install -m 0755 ${B}/overlay ${D}${bindir}
> > +    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
> >  }
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105245):
> https://lists.openembedded.org/g/openembedded-devel/message/105245
> > Mute This Topic: https://lists.openembedded.org/mt/101657502/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000007ca4c20606830830
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks for catching this. I&#39;d rather change the =
dependency in V2.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Slava<=
br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Sep 29, 2023, 10:22 Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, Sep 29, 2023 at 6:38=E2=80=AFAM Vyacheslav Yurkov &lt=
;<a href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>uvv.mail@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Two projects, overlayfs-tools and overlayfs-progs, were combined<br>
&gt; upstream.<br>
<br>
Merging into one is fine however there are dependencies on<br>
overlayfs-progs so perhaps we need to add<br>
RPROVIDES =3D &quot;overlayfs-progs&quot; to <a href=3D"http://overlayfs-to=
ols_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayfs-tools=
_git.bb</a> and then<br>
update the recipes e.g. xftests to depend on overayfs-tools<br>
<br>
&gt;<br>
&gt; Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-Makefile-proper-location-of-LDFLAGS.patch | 32 -------------=
------<br>
&gt;=C2=A0 .../overlayfs/<a href=3D"http://overlayfs-progs_git.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">overlayfs-progs_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 -------------------<br>
&gt;=C2=A0 .../overlayfs/<a href=3D"http://overlayfs-tools_git.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">overlayfs-tools_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +--<br>
&gt;=C2=A0 3 files changed, 1 insertion(+), 68 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/over=
layfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch<br>
&gt;=C2=A0 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/<a h=
ref=3D"http://overlayfs-progs_git.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">overlayfs-progs_git.bb</a><br>
&gt;<br>
&gt; diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/=
0001-Makefile-proper-location-of-LDFLAGS.patch b/meta-filesystems/recipes-u=
tils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.pat=
ch<br>
&gt; deleted file mode 100644<br>
&gt; index 2c001834b..000000000<br>
&gt; --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Ma=
kefile-proper-location-of-LDFLAGS.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -From 8eeaee82dcfdf47f16ad880e416b722827f41bdb Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Vyacheslav Yurkov &lt;<a href=3D"mailto:Vyacheslav.Yurkov@bruke=
r.com" target=3D"_blank" rel=3D"noreferrer">Vyacheslav.Yurkov@bruker.com</a=
>&gt;<br>
&gt; -Date: Mon, 23 May 2022 19:37:32 +0200<br>
&gt; -Subject: [PATCH] Makefile: proper location of LDFLAGS<br>
&gt; -<br>
&gt; -Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:Vyacheslav.Yur=
kov@bruker.com" target=3D"_blank" rel=3D"noreferrer">Vyacheslav.Yurkov@bruk=
er.com</a>&gt;<br>
&gt; ----<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; - Makefile | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Makefile b/Makefile<br>
&gt; -index e3c5207..14b155e 100644<br>
&gt; ---- a/Makefile<br>
&gt; -+++ b/Makefile<br>
&gt; -@@ -1,5 +1,5 @@<br>
&gt; - CFLAGS =3D -Wall -g<br>
&gt; --LFLAGS =3D -lm<br>
&gt; -+LDFLAGS =3D -lm<br>
&gt; - CC =3D gcc<br>
&gt; -<br>
&gt; - all: overlay<br>
&gt; -@@ -7,7 +7,7 @@ all: overlay<br>
&gt; - objects =3D fsck.o common.o lib.o check.o mount.o path.o overlayfs.o=
<br>
&gt; -<br>
&gt; - overlay: $(objects)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(LFLAGS) $(objects) -o fsck.overlay<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(objects) -o fsck.overlay $(LDFLAGS)<br>
&gt; -<br>
&gt; - .c.o:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(CFLAGS) -c $&lt;<br>
&gt; diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http:=
//overlayfs-progs_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">o=
verlayfs-progs_git.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a hre=
f=3D"http://overlayfs-progs_git.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">overlayfs-progs_git.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 9d58b9a63..000000000<br>
&gt; --- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-progs_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayf=
s-progs_git.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;File system check utility for OverlayFS&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/hisilicon/overlayfs-=
progs" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/h=
isilicon/overlayfs-progs</a>&quot;<br>
&gt; -LICENSE =3D &quot;PD&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/files/common-licen=
ses/PD;md5=3Db3597d12946881e13cb3b548d1173851&quot;<br>
&gt; -<br>
&gt; -SRC_URI =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 git://<a href=3D"http://github.com/hisilicon/overlayfs-=
progs.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">github.com/hisilicon/overlayfs-progs.git;protocol=3Dhttps;=
branch=3Dmaster</a> \<br>
&gt; -=C2=A0 =C2=A0 file://0001-Makefile-proper-location-of-LDFLAGS.patch \=
<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -PV =3D &quot;1.0+git${SRCPV}&quot;<br>
&gt; -SRCREV =3D &quot;e10ef686570d9c7eff42f52461593a5c15da56bd&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; -B =3D &quot;${S}&quot;<br>
&gt; -<br>
&gt; -# Required to have the fts.h header for musl<br>
&gt; -DEPENDS:append:libc-musl =3D &quot; fts&quot;<br>
&gt; -# Fix the missing fts libs when using musl<br>
&gt; -EXTRA_OEMAKE:append:libc-musl =3D &quot; LDFLAGS=3D&#39;-lfts&#39;&qu=
ot;<br>
&gt; -<br>
&gt; -EXTRA_OEMAKE +=3D &quot;&#39;CC=3D${CC} -O2&#39; &quot;<br>
&gt; -TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt; -<br>
&gt; -do_compile () {<br>
&gt; -=C2=A0 =C2=A0 oe_runmake<br>
&gt; -}<br>
&gt; -<br>
&gt; -do_install () {<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; -=C2=A0 =C2=A0 install -m 0755 ${B}/fsck.overlay ${D}${bindir}<br>
&gt; -}<br>
&gt; diff --git a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http:=
//overlayfs-tools_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">o=
verlayfs-tools_git.bb</a> b/meta-filesystems/recipes-utils/overlayfs/<a hre=
f=3D"http://overlayfs-tools_git.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">overlayfs-tools_git.bb</a><br>
&gt; index de5155133..ca2ec9cc4 100644<br>
&gt; --- a/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-tools_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayf=
s-tools_git.bb</a><br>
&gt; +++ b/meta-filesystems/recipes-utils/overlayfs/<a href=3D"http://overl=
ayfs-tools_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">overlayf=
s-tools_git.bb</a><br>
&gt; @@ -21,11 +21,8 @@ EXTRA_OEMAKE +=3D &quot;&#39;CC=3D${CC} -O2&#39;&qu=
ot;<br>
&gt;=C2=A0 EXTRA_OEMAKE:append:libc-musl =3D &quot; LDLIBS=3D-lfts&quot;<br=
>
&gt;=C2=A0 TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt;<br>
&gt; -do_compile () {<br>
&gt; -=C2=A0 =C2=A0 oe_runmake<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 do_install () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0755 ${B}/overlay ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${B}/fsck.overlay ${D}${bindir}<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105245): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105245" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/105=
245</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10165750=
2/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/101657502/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000007ca4c20606830830--

