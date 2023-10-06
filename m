Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF149E92FF5
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 07:46:36 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.7736.1696578392633649906
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 00:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDvPtLMN;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690d2441b95so1456136b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 00:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696578392; x=1697183192; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PihXPTrQYTJf2DRxkTj2af+L8r/+ytoniyP6/8C7LT8=;
        b=lDvPtLMNXfwYRwJrwvajShqfR1UY/DLiDiU4RK5OZ/G4yzR7P9MW7fsI1qVf7c1BNY
         gK5wSDXypYgvu8RgI6ZP4/VSprCv4QdydwCXvSNfKeLf80TSuwA/7bYF6IkLtBdDhQG3
         d4Sat6e2na6wu64h9dcR8asMKfTx6V9jehS55o78hDz3JfOvMI/TajUBF/S2RoOAAbIy
         I2lV/Y0b0FcUajqLVpoJK5PxYaTjEe3d4/+IAojzaGAGCBh2Gcs4htwEemb5dcf8lVSD
         TkeTTRyOylL8NiL7B1iHHR3GVnScNPmOtellNvtD6LfPj6T56nrijBYRCUnvbBcxyXub
         pl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696578392; x=1697183192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PihXPTrQYTJf2DRxkTj2af+L8r/+ytoniyP6/8C7LT8=;
        b=emEtGN+X3JEcRwwYrtw7gq5IjqtS6UO6Ea0V/vhxVOXDDpweVRkqZdH4zYiMyb9iXe
         jt0a5GRSFU9qrtiVmwBVuW0oh7J7L10+e8DQC28anbV76cNHYb+YC7nFfS8VD5j88m7k
         wUcdDIpUN74Gs9Mbs2RufSkGvX3z5FLxHTHPFIhMJs2e+T1f8jRDgAN/8lnK3igzXBIa
         DqwXIxsJan+lV47njj6KECVTfCyFGmC4ZXPQLf/mFQqHsL8tuj+0w9aroNiIu/BSCvsb
         A/9AOJFSIlnlgKvfHjDdBwMQ/ktZEPESIu1uJcFQnAX8WjWKwedBhtYTkK1YoU/IfDr4
         2mbQ==
X-Gm-Message-State: AOJu0Yw9sBaBtlD6cHDJzwIwybmFKsGKas0OKTC4WGt+fWSRKs1B0aki
	M8zFk2uFg9qOAitWNWqU+RI/GDzTirTE4qmvR4Q=
X-Google-Smtp-Source: AGHT+IHvhrPujf/8etMCbJghjw4OMqnQSDlDCNvqIPIsoKbkHAtcXI4mCD7b6jRn/8GZBpv+Wm6rbK3NYIBPGV6SuIs=
X-Received: by 2002:a05:6a00:3981:b0:68f:c078:b0c9 with SMTP id
 fi1-20020a056a00398100b0068fc078b0c9mr7471040pfb.11.1696578391939; Fri, 06
 Oct 2023 00:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20231002091534.963730-1-costamagnagianfranco@yahoo.it>
 <CAMKF1so3TeHf5J_wMqZg2s8xVJiqTo3GEWzsPOMyMbF6aakKEw@mail.gmail.com> <CAMKF1spEZ6B7zywyq238CAhOPHYPq-j28n1cBiWJQz1iRUz2TQ@mail.gmail.com>
In-Reply-To: <CAMKF1spEZ6B7zywyq238CAhOPHYPq-j28n1cBiWJQz1iRUz2TQ@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Fri, 6 Oct 2023 09:46:20 +0200
Message-ID: <CAATN8PWfmYUwUdzuVw9O7waq6dm6ZzYzQv++N8wLBBtq-niZEA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon: update patch 544.patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="00000000000062a073060707708d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 07:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105365

--00000000000062a073060707708d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, I sent an additional patch some seconds ago.

G.

On Fri, Oct 6, 2023 at 3:06=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> seeing build failures on non-systemd distros see
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3217/st=
eps/14/logs/stdio
>
>
> ybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/dlt-=
daemon/2.18.10/git/src/system/dlt-system.h:57:10:
> fatal error: systemd/sd-journal.h: No such file or directory
>      include <systemd/sd-journal.h>
>              ^~~~~~~~~~~~~~~~~~~~~~
>
> On Mon, Oct 2, 2023 at 12:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Gianfranco
> >
> > I have staged some of your patches on master-next,  please check and
> > if you have anything pending, let me know
> >
> > On Mon, Oct 2, 2023 at 2:15=E2=80=AFAM Gianfranco
> > <costamagna.gianfranco@gmail.com> wrote:
> > >
> > > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > > ---
> > >  meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch | 8 ++++---=
-
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > > index 550493351..3699b8c83 100644
> > > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > > @@ -1,6 +1,6 @@
> > >  Upstream-Status: Submitted [
> https://github.com/COVESA/dlt-daemon/pull/544]
> > >
> > > -From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:00 20=
01
> > > +From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 20=
01
> > >  From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > >  Date: Thu, 28 Sep 2023 12:54:23 +0200
> > >  Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on no=
n
> amd64
> > > @@ -28,7 +28,7 @@ index d572ecf3..8608c6c4 100644
> > >
> > >  diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c
> b/src/core_dump_handler/dlt_cdh_cpuinfo.c
> > >  new file mode 100644
> > > -index 00000000..d6fc3905
> > > +index 00000000..03509fda
> > >  --- /dev/null
> > >  +++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
> > >  @@ -0,0 +1,33 @@
> > > @@ -62,8 +62,8 @@ index 00000000..d6fc3905
> > >  +{
> > >  +/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct
> *)prstatus->pr_reg;
> > >  +
> > > -+    registers->pc =3D ptr_reg->pc; /* [REG_PROC_COUNTER]; */
> > > -+*/
> > > ++    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
> > > ++
> > >  +}
> > >  diff --git a/src/core_dump_handler/dlt_cdh_crashid.c
> b/src/core_dump_handler/dlt_cdh_crashid.c
> > >  index bca44e0e..8dd98d70 100644
> > > --
> > > 2.34.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#105301):
> https://lists.openembedded.org/g/openembedded-devel/message/105301
> > > Mute This Topic: https://lists.openembedded.org/mt/101708265/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--00000000000062a073060707708d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello, I sent an additional patch some seconds ago.</=
div><div><br></div><div>G.<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 6, 2023 at 3:06=E2=80=AFAM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">seeing=
 build failures on non-systemd distros see<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/3217/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3217/steps/14/logs/=
stdio</a><br>
<br>
=C2=A0 =C2=A0 ybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-pok=
y-linux/dlt-daemon/2.18.10/git/src/system/dlt-system.h:57:10:<br>
fatal error: systemd/sd-journal.h: No such file or directory<br>
=C2=A0 =C2=A0 =C2=A0include &lt;systemd/sd-journal.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~<br>
<br>
On Mon, Oct 2, 2023 at 12:27=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Gianfranco<br>
&gt;<br>
&gt; I have staged some of your patches on master-next,=C2=A0 please check =
and<br>
&gt; if you have anything pending, let me know<br>
&gt;<br>
&gt; On Mon, Oct 2, 2023 at 2:15=E2=80=AFAM Gianfranco<br>
&gt; &lt;<a href=3D"mailto:costamagna.gianfranco@gmail.com" target=3D"_blan=
k">costamagna.gianfranco@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costam=
agnagianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a=
>&gt;<br>
&gt; &gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutu=
sofborg@debian.org" target=3D"_blank">locutusofborg@debian.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch | =
8 ++++----<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.p=
atch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br>
&gt; &gt; index 550493351..3699b8c83 100644<br>
&gt; &gt; --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br=
>
&gt; &gt; +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch<br=
>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https://github.com/C=
OVESA/dlt-daemon/pull/544" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/COVESA/dlt-daemon/pull/544</a>]<br>
&gt; &gt;<br>
&gt; &gt; -From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt;=C2=A0 From: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagn=
agianfranco@yahoo.it" target=3D"_blank">costamagnagianfranco@yahoo.it</a>&g=
t;<br>
&gt; &gt;=C2=A0 Date: Thu, 28 Sep 2023 12:54:23 +0200<br>
&gt; &gt;=C2=A0 Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock bu=
ild on non amd64<br>
&gt; &gt; @@ -28,7 +28,7 @@ index d572ecf3..8608c6c4 100644<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/=
core_dump_handler/dlt_cdh_cpuinfo.c<br>
&gt; &gt;=C2=A0 new file mode 100644<br>
&gt; &gt; -index 00000000..d6fc3905<br>
&gt; &gt; +index 00000000..03509fda<br>
&gt; &gt;=C2=A0 --- /dev/null<br>
&gt; &gt;=C2=A0 +++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c<br>
&gt; &gt;=C2=A0 @@ -0,0 +1,33 @@<br>
&gt; &gt; @@ -62,8 +62,8 @@ index 00000000..d6fc3905<br>
&gt; &gt;=C2=A0 +{<br>
&gt; &gt;=C2=A0 +/*=C2=A0 =C2=A0 struct user_regs_struct *ptr_reg =3D (stru=
ct user_regs_struct *)prstatus-&gt;pr_reg;<br>
&gt; &gt;=C2=A0 +<br>
&gt; &gt; -+=C2=A0 =C2=A0 registers-&gt;pc =3D ptr_reg-&gt;pc; /* [REG_PROC=
_COUNTER]; */<br>
&gt; &gt; -+*/<br>
&gt; &gt; ++=C2=A0 =C2=A0 registers-&gt;pc =3D ptr_reg-&gt;pc;*/ /* [REG_PR=
OC_COUNTER]; */<br>
&gt; &gt; ++<br>
&gt; &gt;=C2=A0 +}<br>
&gt; &gt;=C2=A0 diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/=
core_dump_handler/dlt_cdh_crashid.c<br>
&gt; &gt;=C2=A0 index bca44e0e..8dd98d70 100644<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#105301): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/105301" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/105301</a>=
<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101=
708265/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/101708265/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000062a073060707708d--

