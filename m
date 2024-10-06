Return-Path: <vincent.prince.fr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B8BCFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 17:21:46 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.35003.1728235299141241414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 10:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cmJD+AJa;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso3718804276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728235298; x=1728840098; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1j10znyx3KnAayis0drEx3Fj32h7ZWOPGvzeRlRfNXU=;
        b=cmJD+AJaM5AfNtCcu9xJOz12e6MLiDKZ1+S1cI6bD+MLqOWiKgGh53Em5c0IiVexcn
         Kc+EzFNTF2gUjSkV/9fYcv/lavYyuiKpWhOQXZWwRfeEnlsfpVgTg1J885s5TSOpnlUD
         iYMdikMJ6szaqq1JqRllNezPIqlHGjVvuWMKDw9Lw4t5bidOlZJRkm+XIapxJfMvuJ0I
         WGdLQoFIArhTDDlweOEZlq5pgoQwPEJOuCQ7JyqIdmTPS+MCUjU8RiSaVkcmfn9j/nBM
         BLM3e7NndtDLTM5QkfbHnAIUPvf8x98jgDPhR24f3lLuiSxOj59kzu3YNVE6SYgMHejC
         /ueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728235298; x=1728840098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1j10znyx3KnAayis0drEx3Fj32h7ZWOPGvzeRlRfNXU=;
        b=ws5M4BA4noKIKLBzgOD4FKz5j11+/3Zl4lopeH6Ma8YNnk5v2x9SgqytypqM+JNyoK
         ILbA1NBoJqdORx72Bze7px6b1oPpwS5wnYrz/lGyBM914EBKAaVFmIR38bcUR/1U9AFC
         +6hwcMGruT9OO/3WPPwWx0A5HolXtIWZbZLA8FBQR3nRzHDP/k4GwhV+zDuyG05oJ7R5
         nsLySje3avcKUvb/eFt1c/fFVpvUwyxMuOSf/OrUfSoowk5B/OBBOUoSX1wr43TBUdka
         eOe+1E17bwZqj0TP0zUuPIsyvxnpky9gYpZI8TS/eQviG+VZZE0FatnOX4io8QvNQDSk
         SqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUoUq4zt/7D7FSNsMI4mapsnq3iZOl+1PuAl62rpd68HTrYUuw0e/sMCTETXB9I4vbAZV65zyCLCHtxyspuhhISFWU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YytpxOHjDT7vD8bWHO4CZgKwvPM54IyCfIZp2sP9kgHnzvUU4TL
	YfHZfPsR5AsqscGLArVi4/pFyeC89+fxVE086ZyM+hskjlazP5d+0a2Tasy6rrrBuWV/4nh7wLh
	LAXx7p/cZveq0qBkDWWmsFJXQkSQ=
X-Google-Smtp-Source: AGHT+IGeXdBXgmNBYOkMCvOny1/dQR29bK9qBINM0jdJntt4PmU+tjFjBRLynwFMLiR4pVIgY8I+l7bHxxec9KSt3NM=
X-Received: by 2002:a05:6902:2685:b0:e25:d492:d096 with SMTP id
 3f1490d57ef6-e28939280afmr6447719276.38.1728235298185; Sun, 06 Oct 2024
 10:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org>
 <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
 <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com>
 <CALT56yOAdVUp-kfK2-sy=4-x2zeKk1D9qyeO++5qJfWOw5Zcng@mail.gmail.com>
 <CAMKF1sri+95bnhqVmsCG+bnukQ--jPrOXoH9CQdynCBQBbtkCg@mail.gmail.com> <CALT56yOFbY=TLCOfPSv40C+OyP03XTN7Tne1C3TfVE6ve0kPow@mail.gmail.com>
In-Reply-To: <CALT56yOFbY=TLCOfPSv40C+OyP03XTN7Tne1C3TfVE6ve0kPow@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Sun, 6 Oct 2024 19:21:26 +0200
Message-ID: <CAB2nKc9avezctDwQ2w_Z9U-syPaySsD4mPjYH9F042Qv+w97BQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Jose Quaresma <quaresma.jose@gmail.com>, 
	Armin Kuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Content-Type: multipart/alternative; boundary="000000000000096dbc0623d223c0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 17:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112687

--000000000000096dbc0623d223c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is no exception regarding fact that Poky Scarthgap is unbuildable
without this patch?

Le dim. 6 oct. 2024, 18:08, Dmitry Baryshkov <dbaryshkov@gmail.com> a
=C3=A9crit :

> On Sun, 6 Oct 2024 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Usually there is a monthly update to stable branches that Armin
> > prepares over the month in stable/<release>-nut branch on
> > meta-openembedded-contrib repo e.g. for scarthgap
> >
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/sc=
arthgap-nut
> >
> > I do see this patch staged there, so it will be in the next point
> > release in October.
>
> Ack, thanks. I didn't notice that there is a monthly cadence. Please
> excuse me then.
>
> >
> >
> > On Sun, Oct 6, 2024 at 8:15=E2=80=AFAM Dmitry Baryshkov <dbaryshkov@gma=
il.com>
> wrote:
> > >
> > > Hello,
> > >
> > > On Thu, 26 Sept 2024 at 12:13, Jose Quaresma <quaresma.jose@gmail.com=
>
> wrote:
> > > >
> > > >
> > > >
> > > > Vincent Prince via lists.openembedded.org <vincent.prince.fr=3D
> gmail.com@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s)
> 10:49):
> > > >>
> > > >> Hello all,
> > > >>
> > > >> Any update on this backport patch? :)
> > > >
> > > >
> > > > The patch is not yet on the staging tree but I believe it will be
> there soon.
> > > >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/sc=
arthgap-nut
> > > >
> > > > but yes, this should be a priority given that the scarthgap recipe
> is broken.
> > >
> > > And it still hasn't been merged. Armin, Khem, is there anything
> > > delaying the patch from being applied?
> > >
> > > >
> > > > Jose
> > > >
> > > >>
> > > >>
> > > >> Best regards,
> > > >> Vincent
> > > >>
> > > >> Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
> > > >> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.=
org>
> a
> > > >> =C3=A9crit :
> > > >> >
> > > >> > From: Peter Kjellerstedt <pkj@axis.com>
> > > >> >
> > > >> > This fixes errors from buildhistory changes where packages-split
> would
> > > >> > be empty.
> > > >> >
> > > >> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> > (cherry picked from commit
> 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
> > > >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >> > ---
> > > >> >
> > > >> > The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify
> intercept
> > > >> > call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
> > > >> > scarthgap branch. Backport the fix for libdevmapper too.
> > > >> >
> > > >> > ---
> > > >> >  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
> > > >> >  1 file changed, 2 insertions(+)
> > > >> >
> > > >> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.b=
b
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > > >> > index be558ce1d218..3b4439c3ae06 100644
> > > >> > --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > > >> > +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > > >> > @@ -5,6 +5,8 @@ require lvm2.inc
> > > >> >
> > > >> >  DEPENDS +=3D "autoconf-archive-native"
> > > >> >
> > > >> > +inherit nopackages
> > > >> > +
> > > >> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > > >> >
> > > >> >  do_install() {
> > > >> > --
> > > >> > 2.39.5
> > > >> >
> > > >> >
> > > >> >
> > > >> >
> > > >>
> > > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >> Links: You receive all messages sent to this group.
> > > >> View/Reply Online (#112515):
> https://lists.openembedded.org/g/openembedded-devel/message/112515
> > > >> Mute This Topic:
> https://lists.openembedded.org/mt/108648856/5052612
> > > >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> > > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >>
> > > >
> > > >
> > > > --
> > > > Best regards,
> > > >
> > > > Jos=C3=A9 Quaresma
> > >
> > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
>
>
> --
> With best wishes
> Dmitry
>

--000000000000096dbc0623d223c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">There is no exception regarding fact that Poky Scarthgap is =
unbuildable without this patch? </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le dim=
. 6 oct. 2024, 18:08, Dmitry Baryshkov &lt;<a href=3D"mailto:dbaryshkov@gma=
il.com">dbaryshkov@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Sun, 6 Oct 2024 at 18:07, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Usually there is a monthly update to stable branches that Armin<br>
&gt; prepares over the month in stable/&lt;release&gt;-nut branch on<br>
&gt; meta-openembedded-contrib repo e.g. for scarthgap<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/=
?h=3Dstable/scarthgap-nut" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut</a><br>
&gt;<br>
&gt; I do see this patch staged there, so it will be in the next point<br>
&gt; release in October.<br>
<br>
Ack, thanks. I didn&#39;t notice that there is a monthly cadence. Please<br=
>
excuse me then.<br>
<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Oct 6, 2024 at 8:15=E2=80=AFAM Dmitry Baryshkov &lt;<a href=3D=
"mailto:dbaryshkov@gmail.com" target=3D"_blank" rel=3D"noreferrer">dbaryshk=
ov@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; On Thu, 26 Sept 2024 at 12:13, Jose Quaresma &lt;<a href=3D"mailt=
o:quaresma.jose@gmail.com" target=3D"_blank" rel=3D"noreferrer">quaresma.jo=
se@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Vincent Prince via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 &lt;<a href=3D"http://vincent.prince.fr" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">vincent.prince.fr</a>=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openem=
bedded.org</a>&gt; escreveu (quinta, 26/09/2024 =C3=A0(s) 10:49):<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Hello all,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Any update on this backport patch? :)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The patch is not yet on the staging tree but I believe it wi=
ll be there soon.<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/meta-openembedded-co=
ntrib/log/?h=3Dstable/scarthgap-nut" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dstable/scarthgap-nut</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; but yes, this should be a priority given that the scarthgap =
recipe is broken.<br>
&gt; &gt;<br>
&gt; &gt; And it still hasn&#39;t been merged. Armin, Khem, is there anythi=
ng<br>
&gt; &gt; delaying the patch from being applied?<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Jose<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Best regards,<br>
&gt; &gt; &gt;&gt; Vincent<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via=
<br>
&gt; &gt; &gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;dbaryshkov=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank" re=
l=3D"noreferrer">gmail.com@lists.openembedded.org</a>&gt; a<br>
&gt; &gt; &gt;&gt; =C3=A9crit :<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@=
axis.com" target=3D"_blank" rel=3D"noreferrer">pkj@axis.com</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; This fixes errors from buildhistory changes where p=
ackages-split would<br>
&gt; &gt; &gt;&gt; &gt; be empty.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"ma=
ilto:peter.kjellerstedt@axis.com" target=3D"_blank" rel=3D"noreferrer">pete=
r.kjellerstedt@axis.com</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&=
gt;<br>
&gt; &gt; &gt;&gt; &gt; (cherry picked from commit 90f96e053ad3eefa7693d974=
8efdfbfa72d7dcfd)<br>
&gt; &gt; &gt;&gt; &gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mail=
to:dmitry.baryshkov@linaro.org" target=3D"_blank" rel=3D"noreferrer">dmitry=
.baryshkov@linaro.org</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; ---<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; The oe-core got commit c9e2a8fa2f03 (&quot;buildhis=
tory: Simplify intercept<br>
&gt; &gt; &gt;&gt; &gt; call sites and drop SSTATEPOSTINSTFUNC usage&quot;)=
 backported to the<br>
&gt; &gt; &gt;&gt; &gt; scarthgap branch. Backport the fix for libdevmapper=
 too.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; ---<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 meta-oe/recipes-support/lvm2/<a href=3D"http:=
//libdevmapper_2.03.22.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
libdevmapper_2.03.22.bb</a> | 2 ++<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; diff --git a/meta-oe/recipes-support/lvm2/<a href=
=3D"http://libdevmapper_2.03.22.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">libdevmapper_2.03.22.bb</a> b/meta-oe/recipes-support/lvm2/<a href=
=3D"http://libdevmapper_2.03.22.bb" rel=3D"noreferrer noreferrer" target=3D=
"_blank">libdevmapper_2.03.22.bb</a><br>
&gt; &gt; &gt;&gt; &gt; index be558ce1d218..3b4439c3ae06 100644<br>
&gt; &gt; &gt;&gt; &gt; --- a/meta-oe/recipes-support/lvm2/<a href=3D"http:=
//libdevmapper_2.03.22.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
libdevmapper_2.03.22.bb</a><br>
&gt; &gt; &gt;&gt; &gt; +++ b/meta-oe/recipes-support/lvm2/<a href=3D"http:=
//libdevmapper_2.03.22.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
libdevmapper_2.03.22.bb</a><br>
&gt; &gt; &gt;&gt; &gt; @@ -5,6 +5,8 @@ require lvm2.inc<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 DEPENDS +=3D &quot;autoconf-archive-native&qu=
ot;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; +inherit nopackages<br>
&gt; &gt; &gt;&gt; &gt; +<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br=
>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 do_install() {<br>
&gt; &gt; &gt;&gt; &gt; --<br>
&gt; &gt; &gt;&gt; &gt; 2.39.5<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;&gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; &gt;&gt; View/Reply Online (#112515): <a href=3D"https://lists.op=
enembedded.org/g/openembedded-devel/message/112515" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-deve=
l/message/112515</a><br>
&gt; &gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.o=
rg/mt/108648856/5052612" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/mt/108648856/5052612</a><br>
&gt; &gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowne=
r@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded=
-devel+owner@lists.openembedded.org</a><br>
&gt; &gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g=
/openembedded-devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:quaresma.jose@gmail.com" target=3D"_blank" rel=3D"noreferrer">quaresm=
a.jose@gmail.com</a>]<br>
&gt; &gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; Best regards,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Jos=C3=A9 Quaresma<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; With best wishes<br>
&gt; &gt; Dmitry<br>
<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000096dbc0623d223c0--

