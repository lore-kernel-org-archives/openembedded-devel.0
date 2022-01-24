Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0957AC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 05:13:53 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.19673.1643001232011422611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 21:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ml9yDk1X;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id a12so3857020qkk.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 21:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Px3/+qyoMM/+n9YqZUdQSrlmnBKLFq46cMpkJve6Js=;
        b=ml9yDk1Xp3i+L38PcCT7E/wHMAINhPzgiGI5oUgEI004WzhQ+SYOoWxIfu8xhz6ml+
         IgDE3/9wHWtNiPu63kmtwms2Box5SScGo4JQdSNE/2KCrKdeqImQP+i3SgfZAYB8sKMO
         T1a+samIrZNBmniCv0B26EwY7P+9sxY34CEOXMbwaIZFrWgKuAmDJEHmrtSbPtJPQyBf
         pPEMB243VHm7Bv1KsFrJ1AmyhsPNDBVqlARjl535jK7JpKwA1ew2WR5XDkm5DELJoeoP
         8LNwD1JrZJuc6bcYa4Asl9YTcFN7ag+GJN+4oONfxSXgUiflbD1LIWl0gSNszhiv3QZ4
         eGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Px3/+qyoMM/+n9YqZUdQSrlmnBKLFq46cMpkJve6Js=;
        b=lJACVuuKeG027wD/zmR7CDlWQkf5um3dVqEBdObQHjpGmkaD8FNdXqLmsciI5jwxbc
         s7JBDAiGjociIPBE8PIdACuhGpzEEoviNUClpzBDFxbLWieKlRgwEaQXNRt0KoZV8bnI
         /dL8Lp6efaTRBXU/FHlMmG2K7FKp25Qvvnu0pCRV/NiNIu0NzmUEtYe5JPdtTabjX0TS
         Z6lqsTEDlDibtBvqqXb1ykK0HLtiTNlSvKHhpdhDFGmYSflTrlBy2SX2IdNVfGxHDGf8
         T5x0Vsu4n/D/Dyw4PqX5dCDjLHZAQB0YjNevb6e8Q6g+yKXiwFQEANWMRTnE56wyNBst
         VRjg==
X-Gm-Message-State: AOAM531KBoYiGloaIVMUdnCRYUWJAqvJoQ2tiPBk03ITR4cSdZ89i5M5
	5BcwN+U7H11wrM9d1k2+V660aHOPc/O8k0wsf3w=
X-Google-Smtp-Source: 
 ABdhPJw8VlZOFuSZCUwkAT4x7rjyXLrZYtp9LvSedgMqQ7YauJV04fSLiapwJbJicGNfgW+OhIE5PIRYYocWsVvrf6E=
X-Received: by 2002:a05:620a:2990:: with SMTP id
 r16mr9925836qkp.463.1643001230953;
 Sun, 23 Jan 2022 21:13:50 -0800 (PST)
MIME-Version: 1.0
References: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
 <1642725351-24004-2-git-send-email-wangmy@fujitsu.com>
 <CAMKF1sq17qpZjOv_wD5OLM9yyW-_KkLX9=B5nPfpKgLRneHNvg@mail.gmail.com>
 <OSBPR01MB184518BAB36CDC208212F232DC5E9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB184518BAB36CDC208212F232DC5E9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Jan 2022 21:13:40 -0800
Message-ID: 
 <CAMKF1srv-hW-=nZ=0JUsuR-_rPVf5sRmdg+3kprmVx7QXf2jew@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] sdbus-c++-libsystemd: upgrade 249 -> 250.3
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc91b105d64d0870"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 05:13:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95026

--000000000000bc91b105d64d0870
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 23, 2022 at 6:57 PM wangmy@fujitsu.com <wangmy@fujitsu.com>
wrote:

> When compiling the systemd, this message will be displayed:
> systemd-1_250.1-r0 do_warn_musl: Using systemd with musl is not
> recommended since it is not supported upstream and some patches are known
> to be problematic.
> Does sdbus-c++-libsystemd need to be compiled in musl?
>

Yes. I have send a patch to bring in needed patches for systemd 250 on musl


>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> Development Dept.I
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 Wenzhu Road,
> Nanjing, 210012, China
> <https://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?e=
ntry=3Dgmail&source=3Dg>
> TEL: +86+25-86630566-8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
> http://www.fujitsu.com/cn/fnst/
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Saturday, January 22, 2022 3:40 AM
> > To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe] [PATCH] sdbus-c++-libsystemd: upgrade 249 -=
>
> > 250.3
> >
> > this fails on musl
> > https://errors.yoctoproject.org/Errors/Details/623260/
> >
> > On Thu, Jan 20, 2022 at 4:36 PM wangmy <wangmy@fujitsu.com> wrote:
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  ...us-c++-libsystemd_249.bb =3D> sdbus-c++-libsystemd_250.3.bb} | 4
> > > ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)  rename
> > > meta-oe/recipes-core/sdbus-c++/{sdbus-c++-libsystemd_249.bb =3D>
> > > sdbus-c++-libsystemd_250.3.bb} (97%)
> > >
> > > diff --git
> > > a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
> > > b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> > > similarity index 97%
> > > rename from
> > meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
> > > rename to
> > meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> > > index a3ef6a747..0cd96f528 100644
> > > --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_249.bb
> > > +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
> > > @@ -10,8 +10,8 @@ inherit meson pkgconfig
> > >
> > >  DEPENDS +=3D "gperf-native gettext-native util-linux libcap util-lin=
ux
> > python3-jinja2-native"
> > >
> > > -SRCREV =3D "00b0393e65252bf631670604f58b844780b08c50"
> > > -SRCBRANCH =3D "v249-stable"
> > > +SRCREV =3D "1b003bbc806198dbdd57b405d968f30565495e70"
> > > +SRCBRANCH =3D "v250-stable"
> > >  SRC_URI =3D
> > "git://github.com/systemd/systemd-stable.git;protocol=3Dhttps;branch=3D=
${SRC
> <http://github.com/systemd/systemd-stable.git;protocol=3Dhttps;branch=3D$=
%7BSRC>
> > BRANCH} \
> > >             file://static-libsystemd-pkgconfig.patch \
> > >             "
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#94961):
> > > https://lists.openembedded.org/g/openembedded-devel/message/94961
> > > Mute This Topic: https://lists.openembedded.org/mt/88573656/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub
> > > [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--000000000000bc91b105d64d0870
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jan 23, 2022 at 6:57 PM <a href=3D"mailto:wangmy@fu=
jitsu.com">wangmy@fujitsu.com</a> &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">When compiling=
 the systemd, this message will be displayed: <br>
systemd-1_250.1-r0 do_warn_musl: Using systemd with musl is not recommended=
 since it is not supported upstream and some patches are known to be proble=
matic.<br>
Does sdbus-c++-libsystemd need to be compiled in musl?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. I have send=
 a patch to bring in needed patches for systemd 250 on musl=C2=A0</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)"><br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
Development Dept.I<br>
Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST) No. 6 <a href=3D"https=
://www.google.com/maps/search/Wenzhu+Road,+Nanjing,+210012,+China?entry=3Dg=
mail&amp;source=3Dg">Wenzhu Road, Nanjing, 210012, China</a><br>
TEL: +86+25-86630566-8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<a href=3D"http://www.fujitsu.com/cn/fnst/" rel=3D"noreferrer" target=3D"_b=
lank">http://www.fujitsu.com/cn/fnst/</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; Sent: Saturday, January 22, 2022 3:40 AM<br>
&gt; To: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Cc: openembeded-devel &lt;<a href=3D"mailto:openembedded-devel@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.or=
g</a>&gt;<br>
&gt; Subject: Re: [oe] [meta-oe] [PATCH] sdbus-c++-libsystemd: upgrade 249 =
-&gt;<br>
&gt; 250.3<br>
&gt; <br>
&gt; this fails on musl<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/623260/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/623260/</a><br>
&gt; <br>
&gt; On Thu, Jan 20, 2022 at 4:36 PM wangmy &lt;<a href=3D"mailto:wangmy@fu=
jitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...us-c++-<a href=3D"http://libsystemd_249.bb" rel=3D"noref=
errer" target=3D"_blank">libsystemd_249.bb</a> =3D&gt; sdbus-c++-<a href=3D=
"http://libsystemd_250.3.bb" rel=3D"noreferrer" target=3D"_blank">libsystem=
d_250.3.bb</a>} | 4<br>
&gt; &gt; ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)=C2=A0 renam=
e<br>
&gt; &gt; meta-oe/recipes-core/sdbus-c++/{sdbus-c++-<a href=3D"http://libsy=
stemd_249.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_249.bb</a> =
=3D&gt;<br>
&gt; &gt; sdbus-c++-<a href=3D"http://libsystemd_250.3.bb" rel=3D"noreferre=
r" target=3D"_blank">libsystemd_250.3.bb</a>} (97%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://libs=
ystemd_249.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_249.bb</a><b=
r>
&gt; &gt; b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://libs=
ystemd_250.3.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_250.3.bb</=
a><br>
&gt; &gt; similarity index 97%<br>
&gt; &gt; rename from<br>
&gt; meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://libsystemd_=
249.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_249.bb</a><br>
&gt; &gt; rename to<br>
&gt; meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://libsystemd_=
250.3.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_250.3.bb</a><br>
&gt; &gt; index a3ef6a747..0cd96f528 100644<br>
&gt; &gt; --- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://=
libsystemd_249.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_249.bb</=
a><br>
&gt; &gt; +++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-<a href=3D"http://=
libsystemd_250.3.bb" rel=3D"noreferrer" target=3D"_blank">libsystemd_250.3.=
bb</a><br>
&gt; &gt; @@ -10,8 +10,8 @@ inherit meson pkgconfig<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;gperf-native gettext-native util-linux l=
ibcap util-linux<br>
&gt; python3-jinja2-native&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;00b0393e65252bf631670604f58b844780b08c50&quot;<=
br>
&gt; &gt; -SRCBRANCH =3D &quot;v249-stable&quot;<br>
&gt; &gt; +SRCREV =3D &quot;1b003bbc806198dbdd57b405d968f30565495e70&quot;<=
br>
&gt; &gt; +SRCBRANCH =3D &quot;v250-stable&quot;<br>
&gt; &gt;=C2=A0 SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://github.com/systemd/systemd-stable.git;pr=
otocol=3Dhttps;branch=3D$%7BSRC" rel=3D"noreferrer" target=3D"_blank">githu=
b.com/systemd/systemd-stable.git;protocol=3Dhttps;branch=3D${SRC</a><br>
&gt; BRANCH} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://static-libs=
ystemd-pkgconfig.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#94961):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/94961" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/message/94961</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/885=
73656/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/88573656/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/opene=
mbedded-devel/unsub</a><br>
&gt; &gt; [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000bc91b105d64d0870--

