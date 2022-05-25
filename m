Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DF3C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:41:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10606.1653504107980091792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GCh6YTAD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id x12so7049721wrg.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 May 2022 11:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QVF3Q5RiLQ/CKD79X+StcyyRruRGodItcltqT/hl/U=;
        b=GCh6YTADhTgVZmHp6wakWkHh9oqO2LYuMyXMyNpb45irYlgnjpVgSjpkNdQNiW97SK
         nLQEKLbSBSlsw7+9jqDrcpHi7y6bVeHezVEmzmPMwUykP5FgXxTWzMIkvpBtgk+ZZQio
         Aknj9hqrE9GL5USLeJ5hPdoxgRSKHq6oFp1IPxLc8NeqUWyWrsMN0e4oEJnK4V7WURbd
         Dwo30TOUws9t1OqMJS9RUJRKrjBR8CgEAygMDimPpRopK9LQNlfpgwszdAxAEwVDLqWT
         d7KtasJwImkOwI4e598FGWYT6+UxEE0QBIfC2utT3srvoHZGthEWR71rNBecwjaZJqtL
         QWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QVF3Q5RiLQ/CKD79X+StcyyRruRGodItcltqT/hl/U=;
        b=pKUf3mTF23YiWrzvwVv5bedB6jO+mm/2dur9TcvSc4CU0PdD6vPDLfLquGa9fs0C6g
         43B+JcMofIVKZjyE7WhBMtYw4wU3kXD9WaTnUAYJj1cMfYsDor7VuAHYMfF9JlMHcAU+
         0nnvlmVR1jZf8uwUIUhbOS+i1SamsoemjoZP6EPhNRgfHLvsGLWkcRSLtsiTkY8j34k/
         pZ7SirOVK1/rLVJBq2ihepxVe6s+8LOYT3Khg5xXW8850c454affGZDdwq9/DKQzgEO+
         QABM0HcWWSFKBOavg26+cwQGruNivuktslFuagHk0d2rORAagCfSy7ixzZvNVGYS3xzS
         Xmvw==
X-Gm-Message-State: AOAM532GpKnto42h36s3rsbgcIaof8D6XNMGQ0EmWhcEaUcu0zkwL5r3
	LkiIBoUAz44JOdN8IPRBaNfLgRlvBjKAph0HQHBam1uTpjA=
X-Google-Smtp-Source: 
 ABdhPJyDFn5Zln+3GUtZP12c/GhmHDzIlCVKz69nJMj0AwMZypc5Z9OF+bC1hNGZ4HQizHsH3FHvOr5KlA8vR3DnLog=
X-Received: by 2002:a05:6000:350:b0:20f:fbda:611a with SMTP id
 e16-20020a056000035000b0020ffbda611amr4630146wre.12.1653504106460; Wed, 25
 May 2022 11:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220512234307.1189721-1-denis@denix.org>
 <20220512234307.1189721-3-denis@denix.org>
 <CA+chaQfKJDOyRQ=Y3GwK5X_XVrSdNoNe5VpBLMdyncooMeHOPA@mail.gmail.com>
 <20220525180846.GU9834@denix.org>
 <CAMKF1soMGKgTn5b2uusc=uR_T0==_L-bPrHrysdq=cGFvRDU-Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soMGKgTn5b2uusc=uR_T0==_L-bPrHrysdq=cGFvRDU-Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 May 2022 20:41:25 +0200
Message-ID: 
 <CA+chaQeazL-3oxh43jcBiqq_B9_7Ha-n=oOEsXAPCc233Lb1PA@mail.gmail.com>
Subject: Re: [oe] [kirkstone][PATCH 3/3] devmem2: update SRC_URI according to
 redirect
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e6797405dfda6c19"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 May 2022 18:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97274

--000000000000e6797405dfda6c19
Content-Type: text/plain; charset="UTF-8"

buildroot removed it in 2019 and recommends to use busybox version instead:
https://github.com/buildroot/buildroot/commit/2b2579afebfc7a9b8a458af1f2d206101fbfa19c

"Use the the Busybox devmem utility, instead, which provides the same
functionality."

On Wed, May 25, 2022 at 8:32 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 25, 2022 at 11:08 AM Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > Sure, I can do that and put it in the repo, since I've made few patches
> on top
> > of it... Before I do that, are there any objections? Bootlin?
>
> I would suggest to cross post with buildroot and see if there is
> interest in using it from
> a separate repository.
>
> >
> >
> > On Wed, May 25, 2022 at 08:03:58PM +0200, Martin Jansa wrote:
> > > Anyone willing to create a repo for this on github instead of patching
> this
> > > in metadata?
> > >
> > > This is another reproducer for do_patch issue described here
> > > https://lists.yoctoproject.org/g/yocto/message/56602
> > >
> > > On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko <denis@denix.org>
> wrote:
> > >
> > > > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > >
> > > > http://www.free-electrons.com now redirects to https://bootlin.com
> > > >
> > > > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> > > > ---
> > > >  meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
> > > > b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > > index ba7aad8ab..70d413521 100644
> > > > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > > > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > > > @@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
> > > >  PR = "r7"
> > > >
> > > > -SRC_URI = "
> > > >
> http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c
> > > > \
> > > > +SRC_URI = "
> > > >
> https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
> > > >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
> > > >
> > > >
> file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch \
> > > >
> > > > file://0001-devmem2-support-different-page-sizes-at-run-time.patch \
> > > > --
> > > > 2.25.1
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97271):
> https://lists.openembedded.org/g/openembedded-devel/message/97271
> > Mute This Topic: https://lists.openembedded.org/mt/91070560/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000e6797405dfda6c19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>buildroot removed it in 2019 and recommends to use bu=
sybox version instead:</div><a href=3D"https://github.com/buildroot/buildro=
ot/commit/2b2579afebfc7a9b8a458af1f2d206101fbfa19c">https://github.com/buil=
droot/buildroot/commit/2b2579afebfc7a9b8a458af1f2d206101fbfa19c</a><br><div=
><br></div><div>&quot;Use the the Busybox devmem utility, instead, which pr=
ovides the same functionality.&quot;</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 25, 2022 at 8:32 PM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed,=
 May 25, 2022 at 11:08 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@den=
ix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Sure, I can do that and put it in the repo, since I&#39;ve made few pa=
tches on top<br>
&gt; of it... Before I do that, are there any objections? Bootlin?<br>
<br>
I would suggest to cross post with buildroot and see if there is<br>
interest in using it from<br>
a separate repository.<br>
<br>
&gt;<br>
&gt;<br>
&gt; On Wed, May 25, 2022 at 08:03:58PM +0200, Martin Jansa wrote:<br>
&gt; &gt; Anyone willing to create a repo for this on github instead of pat=
ching this<br>
&gt; &gt; in metadata?<br>
&gt; &gt;<br>
&gt; &gt; This is another reproducer for do_patch issue described here<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/g/yocto/message/56602" =
rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto=
/message/56602</a><br>
&gt; &gt;<br>
&gt; &gt; On Fri, May 13, 2022 at 1:43 AM Denys Dmytriyenko &lt;<a href=3D"=
mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; &gt; From: Michael Opdenacker &lt;<a href=3D"mailto:michael.opden=
acker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <a href=3D"http://www.free-electrons.com" rel=3D"noreferrer"=
 target=3D"_blank">http://www.free-electrons.com</a> now redirects to <a hr=
ef=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https://boo=
tlin.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Michael Opdenacker &lt;<a href=3D"mailto:mich=
ael.opdenacker@bootlin.com" target=3D"_blank">michael.opdenacker@bootlin.co=
m</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis=
@denix.org" target=3D"_blank">denis@denix.org</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta-oe/recipes-support/devmem2/<a href=3D"http://devm=
em2.bb" rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a> | 2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-support/devmem2/<a href=3D"http=
://devmem2.bb" rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a><br>
&gt; &gt; &gt; b/meta-oe/recipes-support/devmem2/<a href=3D"http://devmem2.=
bb" rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a><br>
&gt; &gt; &gt; index ba7aad8ab..70d413521 100644<br>
&gt; &gt; &gt; --- a/meta-oe/recipes-support/devmem2/<a href=3D"http://devm=
em2.bb" rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a><br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-support/devmem2/<a href=3D"http://devm=
em2.bb" rel=3D"noreferrer" target=3D"_blank">devmem2.bb</a><br>
&gt; &gt; &gt; @@ -3,7 +3,7 @@ LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &quot;file://devmem2.c;endline=3D38;md5=3Da9eb9f3890384519f4=
35aedf986297cf&quot;<br>
&gt; &gt; &gt;=C2=A0 PR =3D &quot;r7&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -SRC_URI =3D &quot;<br>
&gt; &gt; &gt; <a href=3D"http://www.free-electrons.com/pub/mirror/devmem2.=
c;downloadfilename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank">ht=
tp://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=3Ddevmem2=
-new.c</a><br>
&gt; &gt; &gt; \<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;<br>
&gt; &gt; &gt; <a href=3D"https://bootlin.com/pub/mirror/devmem2.c;download=
filename=3Ddevmem2-new.c" rel=3D"noreferrer" target=3D"_blank">https://boot=
lin.com/pub/mirror/devmem2.c;downloadfilename=3Ddevmem2-new.c</a> \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://devmem=
2-fixups-2.patch;apply=3Dyes;striplevel=3D0 \<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-f=
or-6.patch \<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; file://0001-devmem2-support-different-page-sizes-at-run-time=
.patch \<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.25.1<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#97271): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/97271" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97271</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91070560=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/91070560/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000e6797405dfda6c19--

