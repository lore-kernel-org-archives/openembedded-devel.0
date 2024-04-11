Return-Path: <ninette@neighbourhood.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B8EC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 16:18:57 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.22417.1712852333131139008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 09:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=zOIZ8pUM;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.50, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e6646d78bso5013173a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 09:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712852331; x=1713457131; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CTFItBtVdTgtW+lH9GezWD+/sY7Qh6o3BDudntHu0Oo=;
        b=zOIZ8pUMHemF0+FWMeO4cPofHwY8vks6fQdZuQK7YyZy1J47XYShg8djMDN8dOnw3p
         x7MPPYnchWvFvJRdfOqqLel+hE5o6wY5jEseObV2pOR4AeaaRANWEDNr3/CM8vNOp8Nk
         u6nluTZv1kDCxL8jxC6spNzkHaZ43ezAZ0T+9eWou+hC/Qy3chSWOHiOKzBp5MHjfX17
         87ZsNyDvw+WG5qTATbEVG4wuPGxE1l36UUOaNq+PcJ3ZAWzHfMoqnSkumaoyZocm/eZU
         wBSGzgazPJJlSI/Jta/Hrl09XQOP9orZ8OvB+ahDXMy3TDnziBWUdnksWQgcNzSbyeqZ
         kKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712852331; x=1713457131;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTFItBtVdTgtW+lH9GezWD+/sY7Qh6o3BDudntHu0Oo=;
        b=lE0D91fr/tXTX/rVHhWRS6WaAZAgeErwYMZ/Z4RcS9aqKCX1NLCFvmwHhk57cs2FKa
         IoR2cM16PGXpoSGsy6gk/GhNsGGYxpB/q6v1C/B1Zz8yPC24S0wL5gN6L+2xa6fiQaJd
         Yh7zGc9HMXlp+OLC9HYBf+9f1aCAQvL2lk9yXn+FqUOeCbDoz21VtEwgmw5ch3iMupI4
         0pfMYJR5kMDSBXMHr5MOARmdFJiOvvhVqY52N4yWAD3UEGvNYE95hP/qnmst0RKGKVKt
         74T5aiLzyeNGtCt3/nD9rv701aVyseLsGCODDUBhQCHLzsAx+xIg5SxorxgZqlc9VTgY
         6yVA==
X-Gm-Message-State: AOJu0YwemCDLhdT7pEZqmO+1LR1jPU0ZIzVCpsmcJL+eknp5JFW071Qc
	y8L+WkvEuI/Rz1rJq6ttnO6mquV/NQH4W3xhzkrn3Mlv09vO7CdYtuIUIoyZUhJWj9zDGDkHPnk
	bUMIPujtqQ/XmQ1vcP1I8pxM+dGiuTjkVsr/lxA==
X-Google-Smtp-Source: AGHT+IHX/Sn3kVzLhH9ZDrbLtbPGxXOcO+J5mhbA8FYUgKUGpGnrShsVNvajQNtkVPkJQb0PH+u+IWFg6XVV8Krqido=
X-Received: by 2002:a17:906:b187:b0:a51:ddc6:e00d with SMTP id
 w7-20020a170906b18700b00a51ddc6e00dmr142751ejy.26.1712852331091; Thu, 11 Apr
 2024 09:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240410150453.12726-1-ninette@thehoodiefirm.com>
 <20240410150453.12726-2-ninette@thehoodiefirm.com> <AS1PR10MB5697292F84DCD4311F1227C7FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697292F84DCD4311F1227C7FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Ninette Adhikari <ninette@neighbourhood.ie>
Date: Thu, 11 Apr 2024 18:18:40 +0200
Message-ID: <CAG1aeW3if2t3Taf0ti3O3xjQX4jot1kArKSdDLYb6ZaSD26a2w@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bf75e10615d4828c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 16:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109921

--000000000000bf75e10615d4828c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks so much for your response. Many apologies for the confusion, I was
trying to follow the example here
<https://git.yoctoproject.org/poky/commit/?id=3D378bc2f8e3ac393d89a6d2e5209=
4478fb3879ef7>
to report a CVE issue but clearly I chose an incorrect classification.

I meant to say that the 7 CVEs are invalid or not relevant any more. I can
make new patches marking them as "cve-invalid" instead of "cpe-incorrect".
Would that be okay? Let me know.

Thanks again!
Ninette

On Wed, Apr 10, 2024 at 6:54=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hello,
>
> May I ask what are you trying to achieve?
> These entries fix incorrect CPE mapping so they are still needed.
> So by removing these 7 CVE_STATUS entries via your 7 contributions, you
> are marking the CVEs as relevant for the components.
> Basically direct opposite of what your commit messages are saying.
>
> Peter
>
> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Ninette Adhikari
> via lists.openembedded.org
> Sent: Wednesday, April 10, 2024 17:05
> To: openembedded-devel@lists.openembedded.org
> Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
> Subject: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status
>
> > Current version 0.28.0 is not affected by the issue.
> > Affected version: < 0.13-r1
> >
> > Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> > ---
> >  meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> > index 958810cf7..ad99d0bf4 100644
> > --- a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> > +++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
> > @@ -10,6 +10,8 @@ SRC_URI[sha256sum] =3D
> "89af3b5ef7277753ef7a7b5374ae017c6b9e304db3b688f1948e73e103
> >  # inherit dos2unix
> >  S =3D "${WORKDIR}/${BP}-Source"
> >
> > +CVE_STATUS[CVE-2007-6353] =3D "cpe-incorrect: Current version 0.28.0 i=
s
> not affected by the issue."
> > +
> >  inherit cmake gettext
> >
> >  do_install:append:class-target() {
> > --
> > 2.44.0
>
>

--=20
Ninette Adhikari
Software developer
The Neighbourhoodie Software GmbH
Harzer Stra=C3=9Fe 39, 12059 Berlin
neighbourhood.ie

Handelsregister HRB 157851 B Amtsgericht Charlottenburg
Gesch=C3=A4ftsf=C3=BChrung: Jan Lehnardt, Simone Haas

--000000000000bf75e10615d4828c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>Thanks so much for=
 your response. Many apologies for the confusion, I was trying to follow th=
e example <a href=3D"https://git.yoctoproject.org/poky/commit/?id=3D378bc2f=
8e3ac393d89a6d2e52094478fb3879ef7">here</a> to report a CVE issue but clear=
ly I chose an incorrect classification.</div><div><br></div><div>I meant to=
 say that the 7 CVEs are invalid or not relevant any more. I can make new p=
atches marking them as &quot;cve-invalid&quot; instead of &quot;cpe-incorre=
ct&quot;. Would that be okay? Let me know.</div><div><br></div><div>Thanks =
again!</div><div>Ninette<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 10, 2024 at 6:54=E2=80=AFPM M=
arko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siem=
ens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hello,<br>
<br>
May I ask what are you trying to achieve?<br>
These entries fix incorrect CPE mapping so they are still needed.<br>
So by removing these 7 CVE_STATUS entries via your 7 contributions, you are=
 marking the CVEs as relevant for the components.<br>
Basically direct opposite of what your commit messages are saying.<br>
<br>
Peter<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=
=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D"ma=
ilto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openembed=
ded-devel@lists.openembedded.org</a>&gt; On Behalf Of Ninette Adhikari via =
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
Sent: Wednesday, April 10, 2024 17:05<br>
To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" target=3D"=
_blank">openembedded-devel@lists.openembedded.org</a><br>
Cc: Ninette Adhikari &lt;<a href=3D"mailto:ninette@thehoodiefirm.com" targe=
t=3D"_blank">ninette@thehoodiefirm.com</a>&gt;<br>
Subject: [oe] [PATCH 1/1] exiv2: Update CVE-2007-6353 status<br>
<br>
&gt; Current version 0.28.0 is not affected by the issue.<br>
&gt; Affected version: &lt; 0.13-r1<br>
&gt;<br>
&gt; Signed-off-by: Ninette Adhikari &lt;<a href=3D"mailto:ninette@thehoodi=
efirm.com" target=3D"_blank">ninette@thehoodiefirm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.28.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">exiv2_0.28.0.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.2=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">exiv2_0.28.0.bb</a> b/meta-oe/=
recipes-support/exiv2/<a href=3D"http://exiv2_0.28.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">exiv2_0.28.0.bb</a><br>
&gt; index 958810cf7..ad99d0bf4 100644<br>
&gt; --- a/meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.28.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">exiv2_0.28.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.28.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">exiv2_0.28.0.bb</a><br>
&gt; @@ -10,6 +10,8 @@ SRC_URI[sha256sum] =3D &quot;89af3b5ef7277753ef7a7b5=
374ae017c6b9e304db3b688f1948e73e103<br>
&gt;=C2=A0 # inherit dos2unix<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/${BP}-Source&quot;<br>
&gt;=C2=A0 <br>
&gt; +CVE_STATUS[CVE-2007-6353] =3D &quot;cpe-incorrect: Current version 0.=
28.0 is not affected by the issue.&quot;<br>
&gt; +<br>
&gt;=C2=A0 inherit cmake gettext<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append:class-target() {<br>
&gt; -- <br>
&gt; 2.44.0<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div><font color=3D"#666666">Ninette Adhikari</font></div><div><font co=
lor=3D"#666666">Software developer</font></div><div><font color=3D"#666666"=
>The Neighbourhoodie Software GmbH</font></div><div><font color=3D"#666666"=
>Harzer Stra=C3=9Fe 39, 12059 Berlin</font></div><div><font color=3D"#66666=
6"><a href=3D"http://neighbourhood.ie" target=3D"_blank">neighbourhood.ie</=
a></font></div><div><font color=3D"#666666"><br></font></div><div><font col=
or=3D"#666666">Handelsregister HRB 157851 B Amtsgericht Charlottenburg</fon=
t></div><div><font color=3D"#666666">Gesch=C3=A4ftsf=C3=BChrung: Jan Lehnar=
dt, Simone Haas</font></div></div></div>

--000000000000bf75e10615d4828c--

