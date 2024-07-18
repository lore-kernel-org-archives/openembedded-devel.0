Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9F7C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 06:23:48 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.9311.1721283824196127468
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 23:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EY3T/dvL;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7515437ff16so276432a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 23:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721283823; x=1721888623; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TqfRxYFnWBLO39t1TUSMTabGE7lt0PhMOS5INfw5iE0=;
        b=EY3T/dvLia2fRaRxF3E97GWN0htB0Bk1PXdqVcx/p/SSgCsxFzNkSCdDydOHUSLcnv
         IXviG7JiMZd0yPsOd2XSG15nXJoswVhg9oIvXmAiqdbZEViruIYWLCUrog6LKkRfmfRq
         xn3O63O1zkoVgdQ0uAbfDzyvON6pCrLWuDwTocgykruaeGNmOEI5qw3+P3ShbI6xYwAt
         5x4U+shhrYP0aBANVT6XpO+ORSqYbo0q3LNncxyjAqiPSvETtrL8cLMvc6tVr9g42lJ4
         g7G8wk1Izx1qNJBZkfHSh11ZDjKuVdHAFyv4lG8AQsdiI8mAd0UmwscFxZkzuMBbFNTl
         H3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721283823; x=1721888623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqfRxYFnWBLO39t1TUSMTabGE7lt0PhMOS5INfw5iE0=;
        b=gHSy03Fc6WVuAKHvoEMcYm2qnec+BzDby5fDXpg89SF2w+LhK9q2hJWl2IGniseF7S
         KqXL9lvPAiwt+HiWXxtI+3a5hxzov8RrC/KAf2/BthfcE1tbL+Pe1ENgQ7syhY+EfziI
         BNQkjvaDhJ/VcP0Vl2c6PRxLnEwf9HpLy982BnlQRVOEmkD2N986cUw1Cqiv73ZSQ5DJ
         KVxTqCljThTrlOjrtSC+IJ6EfJRiiqYi0DR0mlPNiSCO5fjChIdtGNs0g4DcV/3pZcxK
         Cpnu/ZFlcpIWJxydvrnBPSuPeY7ktkByoxC62fSq0OidzZPZicVFlkb6JurBKHtDZrsz
         4Lqg==
X-Gm-Message-State: AOJu0YzFEglvU9rxAtNnSv28d42AvjVL4srC+x82zrfsGu0ODW/JD6SQ
	iYOhV44k/jh4Z5o4cpJM4OM8lqeKEcLovnGGRMcy8WM8F6pXVGYcX+1i6NgBik4K2OVvHFN3QVC
	mvqGCVuOWlMi3A3DfLfTUDSO1MNg=
X-Google-Smtp-Source: AGHT+IGl+ieTRkypq8nQEDhFxl5/XIiJhxcpggC9lv98cQz3XZvq6CPUJAgwgBHgdGfZ+40ehCFRwyVEPsXbmXqhX+4=
X-Received: by 2002:a05:6a20:cd8f:b0:1bd:feed:c031 with SMTP id
 adf61e73a8af0-1c3fdd1b128mr4981063637.28.1721283823215; Wed, 17 Jul 2024
 23:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240716125617.1597303-1-costamagnagianfranco@yahoo.it> <CAMKF1soahBM_iB7JWKoBD2cTcizTjaTDpPgW0eS9+sSq0PvsLw@mail.gmail.com>
In-Reply-To: <CAMKF1soahBM_iB7JWKoBD2cTcizTjaTDpPgW0eS9+sSq0PvsLw@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Thu, 18 Jul 2024 08:23:30 +0200
Message-ID: <CAATN8PXRM+6oBR9giHmfZrcARUGLArW1_prKOeKjZ8-zDosx9Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.18 -> 7.0.20
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: multipart/alternative; boundary="000000000000d72e87061d7f9ef7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 06:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111393

--000000000000d72e87061d7f9ef7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resubmitted thanks!

On Thu, Jul 18, 2024, 01:13 Khem Raj <raj.khem@gmail.com> wrote:

> This fails to build
>
> https://errors.yoctoproject.org/Errors/Details/791076/
>
> Always test with
>
> bitbake -ccleanall <recipe>
> bitbake recipe
>
> to ensure all tasks are run.
>
> On Tue, Jul 16, 2024 at 5:56=E2=80=AFAM Gianfranco via lists.openembedded=
.org
> <costamagna.gianfranco=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  .../{vboxguestdrivers_7.0.18.bb =3D> vboxguestdrivers_7.0.20.bb}  | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/vboxguestdrivers/{
> vboxguestdrivers_7.0.18.bb =3D> vboxguestdrivers_7.0.20.bb} (97%)
> >
> > diff --git a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.18.bb b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.20.bb
> > similarity index 97%
> > rename from meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.18.bb
> > rename to meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.20.bb
> > index 47f616e99..714814fba 100644
> > --- a/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.18.bb
> > +++ b/meta-oe/recipes-support/vboxguestdrivers/
> vboxguestdrivers_7.0.20.bb
> > @@ -15,7 +15,7 @@ SRC_URI =3D "
> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
> >      file://Makefile.utils \
> >  "
> >
> > -SRC_URI[sha256sum] =3D
> "d999513533631674a024762668de999411d8197060c51e68c5faf0a2c0eea1a5"
> > +SRC_URI[sha256sum] =3D
> "5cf5979bef66ebab3fcd495796b215a940e8a07c469d4bc56d064de44222dd02"
> >
> >  S ?=3D "${WORKDIR}/vbox_module"
> >  S:task-patch =3D "${WORKDIR}/${VBOX_NAME}"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111374):
> https://lists.openembedded.org/g/openembedded-devel/message/111374
> > Mute This Topic: https://lists.openembedded.org/mt/107251081/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000d72e87061d7f9ef7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Resubmitted thanks! </p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Jul 18, 2024, 01:13 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">ra=
j.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thi=
s fails to build<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/791076/" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Err=
ors/Details/791076/</a><br>
<br>
Always test with<br>
<br>
bitbake -ccleanall &lt;recipe&gt;<br>
bitbake recipe<br>
<br>
to ensure all tasks are run.<br>
<br>
On Tue, Jul 16, 2024 at 5:56=E2=80=AFAM Gianfranco via <a href=3D"http://li=
sts.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists=
.openembedded.org</a><br>
&lt;costamagna.gianfranco=3D<a href=3D"mailto:gmail.com@lists.openembedded.=
org" target=3D"_blank" rel=3D"noreferrer">gmail.com@lists.openembedded.org<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:costamagnag=
ianfranco@yahoo.it" target=3D"_blank" rel=3D"noreferrer">costamagnagianfran=
co@yahoo.it</a>&gt;<br>
&gt; Signed-off-by: Gianfranco Costamagna &lt;<a href=3D"mailto:locutusofbo=
rg@debian.org" target=3D"_blank" rel=3D"noreferrer">locutusofborg@debian.or=
g</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{<a href=3D"http://vboxguestdrivers_7.0.18.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">vboxguestdrivers_7.0.18.bb</a> =3D&gt; <=
a href=3D"http://vboxguestdrivers_7.0.20.bb" rel=3D"noreferrer noreferrer" =
target=3D"_blank">vboxguestdrivers_7.0.20.bb</a>}=C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-support/vboxguestdrivers/{<a href=3D"http=
://vboxguestdrivers_7.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">vboxguestdrivers_7.0.18.bb</a> =3D&gt; <a href=3D"http://vboxguestdrive=
rs_7.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vboxguestdriv=
ers_7.0.20.bb</a>} (97%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http:=
//vboxguestdrivers_7.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">vboxguestdrivers_7.0.18.bb</a> b/meta-oe/recipes-support/vboxguestdriver=
s/<a href=3D"http://vboxguestdrivers_7.0.20.bb" rel=3D"noreferrer noreferre=
r" target=3D"_blank">vboxguestdrivers_7.0.20.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http:/=
/vboxguestdrivers_7.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank=
">vboxguestdrivers_7.0.18.bb</a><br>
&gt; rename to meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://v=
boxguestdrivers_7.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
vboxguestdrivers_7.0.20.bb</a><br>
&gt; index 47f616e99..714814fba 100644<br>
&gt; --- a/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxg=
uestdrivers_7.0.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vbox=
guestdrivers_7.0.18.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/vboxguestdrivers/<a href=3D"http://vboxg=
uestdrivers_7.0.20.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">vbox=
guestdrivers_7.0.20.bb</a><br>
&gt; @@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.virtual=
box.org/virtualbox/$%7BPV%7D/$%7BVBOX_NAME%7D.tar.bz2" rel=3D"noreferrer no=
referrer" target=3D"_blank">http://download.virtualbox.org/virtualbox/${PV}=
/${VBOX_NAME}.tar.bz2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://Makefile.utils \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d999513533631674a024762668de999411d81970=
60c51e68c5faf0a2c0eea1a5&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;5cf5979bef66ebab3fcd495796b215a940e8a07c=
469d4bc56d064de44222dd02&quot;<br>
&gt;<br>
&gt;=C2=A0 S ?=3D &quot;${WORKDIR}/vbox_module&quot;<br>
&gt;=C2=A0 S:task-patch =3D &quot;${WORKDIR}/${VBOX_NAME}&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111374): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111374" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/message/111=
374</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10725108=
1/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/107251081/1997914</a><br>
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
</blockquote></div>

--000000000000d72e87061d7f9ef7--

