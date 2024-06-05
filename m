Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF9EC25B78
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 02:13:24 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.5320.1717553594683339568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jun 2024 19:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cx/dxVmO;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-24542b8607fso3294829fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 19:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717553594; x=1718158394; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hvxEhQfbXBAf9DZxvayzO64GQOkJK92fpFDEzlbItJI=;
        b=cx/dxVmOxHlfo9/gGmzaPntswVEfJQ9EYs8wnzj1GCmEW9ak5x1O2qP+dnxo02nR66
         fHbOcP+DAznDZTe9VvA8C4MVcFzNbPVx4wPSgKTimrAmyLXtIAA6CG9W7QwmjoTcyCKH
         qTCj3JR22aBrjDCuNHtvW/7mKJoDdlkvBXtBaVRM87/gxyUpCntgsvZKL2lPcNyv5HTm
         R/QSbOKG7XZNAiwKiwoRQ/mIbKXVYVHL5IYtcpmhE/DTz3pLkzuE4TkjOlb7h9U2FXL+
         RHA8+C0mctKmMKN+2vY04XRl/KOSC+7CWiGlxv86+kBqLMI1SUIr0fbsg25q44mgBABO
         5j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717553594; x=1718158394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvxEhQfbXBAf9DZxvayzO64GQOkJK92fpFDEzlbItJI=;
        b=SXqam7YWC+keOqCH0bpbrauF024+veXU/qmY1P06MEYvkJ0OTDWvwI3tBM0Jgscapd
         0kOdsO7K0URh49PNI5UvZJBCaqqLd19IRal897JIK77NexP16VuMSdBj9YVnOaz1VM48
         6JsCZC4o/FXWLUc9NeOaTxj/U1QssBk7+eDZGDDp/3ujUDmN7EpPrIoicSSAKhok0hix
         NDeC8VSgHlMGJjEU9lbvnJ5pkx8XkDC9epLP40tLbWv97VFIs6IPhKLxNYouu66bxk7C
         FbtaNXtcGhW028D8eBmIT3EiBV49PST/wnxH0OvOk+F+wTVXQZiDECYXIePbs9g+o7uo
         /8ng==
X-Forwarded-Encrypted: i=1; AJvYcCURsdgpZVPFzVNAXKef2Zf+HZUPhVzlsD2jW5s3OiFZQFQtlyKiLQ0s+IdNje39Xv41HGHeBDftAI7sAGN/caid1nyidjbyT6/7BMuUrAtmKvnOrvoU2/NK7g==
X-Gm-Message-State: AOJu0YyNnATifxVb/e4ViDsKFWucohw7NLVwi5CSFm1uYW5RrnLDQIww
	pd8dJ5CZ3fE8XUR2L1HEaU6uza27bWzkoeo0CtJWTwi9C61epA41nUkj83DBzedNkSWAKGdIQic
	lwI2J5xA/4zmisiTJat0s5+HDbkU=
X-Google-Smtp-Source: AGHT+IHhWfMIB4gKQ2iJ6H2yqnEFxfN83BCCxXP01oWK1RPUMCN9aztRAfnDwLH9MQDNWtol7fGsNoy2irJTKSsRzM0=
X-Received: by 2002:a05:6870:71c9:b0:24f:f51e:e3a8 with SMTP id
 586e51a60fabf-25121c9550fmr1481665fac.4.1717553593739; Tue, 04 Jun 2024
 19:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240603084336.3732231-1-kai.kang@windriver.com>
 <CAMKF1sogCTmV=Z9zt5qYYo=0Pu1XxaW075gjuKO7jELxLqB8Hg@mail.gmail.com> <0b799735-6940-4ced-8d86-0c063bbc2353@windriver.com>
In-Reply-To: <0b799735-6940-4ced-8d86-0c063bbc2353@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 19:13:03 -0700
Message-ID: <CAMKF1sqeftmFWAm27376cqxUo69juko0WWDzdnhqMZ2hREaJzQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] lvm2: rename to add version back
To: Kai <kai.kang@windriver.com>
Cc: kai.kang@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d67056061a1b1b91"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 02:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110693

--000000000000d67056061a1b1b91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 7:05=E2=80=AFPM Kai <kai.kang@windriver.com> wrote:

> On 6/4/24 00:31, Khem Raj wrote:
> > its now in lvm2.inc which is shared between libdevmapper.bb and lvm2.bb
>
> Thank you all.
>
> It triggers bbappend file can not find corresponding bb file. I'll
> figure it out.


Yeah let it is going to be a problem as the version is not part of recipe
name means version specific bbappends can not be created


>
> Regards,
> Kai
>
>
> >
> > On Mon, Jun 3, 2024 at 1:43=E2=80=AFAM Kai Kang via lists.openembedded.=
org
> > <kai.kang=3Deng.windriver.com@lists.openembedded.org> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> The version has been removed from recipe name by commit
> >>
> >> * cc4e9fbd82 lvm2: remove subitted patch
> >>
> >> it is not proper and rename to add the version back in recipe name.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb} | 0
> >>   1 file changed, 0 insertions(+), 0 deletions(-)
> >>   rename meta-oe/recipes-support/lvm2/{lvm2.bb =3D> lvm2_2.03.22.bb}
> (100%)
> >>
> >> diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb
> b/meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
> >> similarity index 100%
> >> rename from meta-oe/recipes-support/lvm2/lvm2.bb
> >> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.22.bb
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#110670):
> https://lists.openembedded.org/g/openembedded-devel/message/110670
> >> Mute This Topic: https://lists.openembedded.org/mt/106458240/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Kai Kang
> Wind River Linux
>
>

--000000000000d67056061a1b1b91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jun 4, 2024 at 7:05=E2=80=AFPM Kai &lt;<a href=3D"m=
ailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 6/4/24 00:31, Khem Raj wrote:<br>
&gt; its now in lvm2.inc which is shared between <a href=3D"http://libdevma=
pper.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper.bb</a> and <a hr=
ef=3D"http://lvm2.bb" rel=3D"noreferrer" target=3D"_blank">lvm2.bb</a><br>
<br>
Thank you all.<br>
<br>
It triggers bbappend file can not find corresponding bb file. I&#39;ll <br>
figure it out.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ye=
ah let it is going to be a problem as the version is not part of recipe nam=
e means version specific bbappends can not be created=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Regards,<br>
Kai<br>
<br>
<br>
&gt;<br>
&gt; On Mon, Jun 3, 2024 at 1:43=E2=80=AFAM Kai Kang via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a><br>
&gt; &lt;kai.kang=3D<a href=3D"mailto:eng.windriver.com@lists.openembedded.=
org" target=3D"_blank">eng.windriver.com@lists.openembedded.org</a>&gt; wro=
te:<br>
&gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The version has been removed from recipe name by commit<br>
&gt;&gt;<br>
&gt;&gt; * cc4e9fbd82 lvm2: remove subitted patch<br>
&gt;&gt;<br>
&gt;&gt; it is not proper and rename to add the version back in recipe name=
.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.c=
om" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-support/lvm2/{<a href=3D"http://lvm2.b=
b" rel=3D"noreferrer" target=3D"_blank">lvm2.bb</a> =3D&gt; <a href=3D"http=
://lvm2_2.03.22.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.22.bb</a=
>} | 0<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 0 insertions(+), 0 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0rename meta-oe/recipes-support/lvm2/{<a href=3D"http:/=
/lvm2.bb" rel=3D"noreferrer" target=3D"_blank">lvm2.bb</a> =3D&gt; <a href=
=3D"http://lvm2_2.03.22.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.=
22.bb</a>} (100%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2.b=
b" rel=3D"noreferrer" target=3D"_blank">lvm2.bb</a> b/meta-oe/recipes-suppo=
rt/lvm2/<a href=3D"http://lvm2_2.03.22.bb" rel=3D"noreferrer" target=3D"_bl=
ank">lvm2_2.03.22.bb</a><br>
&gt;&gt; similarity index 100%<br>
&gt;&gt; rename from meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2.bb=
" rel=3D"noreferrer" target=3D"_blank">lvm2.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03=
.22.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.22.bb</a><br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#110670): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/110670" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/110670</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1064=
58240/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/106458240/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
-- <br>
Kai Kang<br>
Wind River Linux<br>
<br>
</blockquote></div></div>

--000000000000d67056061a1b1b91--

