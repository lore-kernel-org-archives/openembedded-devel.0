Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE57E748E9
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 16:07:05 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.86205.1696262820502938437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 09:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gE7XR7a3;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dcead29b3eso7394510fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696262820; x=1696867620; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L4ZWhNkQH46f+T4XMM5SDSsWmWNKozTh54o8/hRPtPY=;
        b=gE7XR7a3DQoyMnAr2qfIUzesJd+UVDsnAR/yMem+dgEe8z6Hbrb4ibcthvkDfAisEw
         DB7PQsW9wDiV/YcjIw87aQYzouXgL65ikzgH8tZ/5K2B2AmbWfnfWZCUOrASpRW4UwLk
         NHD0vUSB3EClZ9lobDrHW/YBOlTGsTMH8XQSJ6LEsnSWUyFyJ3Je8bIDpfHsp1heHi/V
         ChMRv2LP8NIqsazyyZYoestomQlbrQ1Yhtr0LH+JTD0Lh3XXZxskqYxC6UHUnWEowyd6
         8SjRC6Xiey4arZEX9MD8JSJbhvQus1q5zZCv2IQ6y6M+dS9xjdr0ajTkWcko/BESjSEA
         y3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696262820; x=1696867620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4ZWhNkQH46f+T4XMM5SDSsWmWNKozTh54o8/hRPtPY=;
        b=EpC1NOZOK1oYtFv3j70pgHaeqo7eNRaiMEeT6evWY3iPbW9JWH6O9TEW+kw4lxCJqZ
         EKc8eWpuzpoDStOjt0MYq4nMAzbIbKlX68jwNFvMsOdowzh/zf+VC7NmesVdjYfxLSnM
         XGIzicPT8bv4jSHkQS3lypYuhZcL6Qzoaz9v2derQ6Ysz8SPIhNuu3vnEvJWDDkzQDkK
         3Ups5bl0ON8vABpsLtPikFfKRyi/JHpwHTYAtFJKMHxWMUvRsDinM5qssg2NFh+3KF4j
         FuP0F8ew180UbQR4gPqsInS3XaToaS520igiLovGE8JtBghiAMOqLeX42M2pGDzLzkh+
         +NFg==
X-Gm-Message-State: AOJu0YwUxrCP8wDSpmkOEBZ+wWT9qLvX6NNPTENxy5fdwISBoCq4VgWZ
	M1blIkqX24BZM8wqSvWKiedEMv+K0y5P7Jzy1ck=
X-Google-Smtp-Source: AGHT+IHWJLgvjSE5fNMtpsdMol6c3Mbb8JWwW9SftFzipR/+qmBmSicWOI1VH/aUi7Nly0ZJP/EiDX8Vbcch/B3/958=
X-Received: by 2002:a05:6870:8196:b0:1c4:ee87:d3f6 with SMTP id
 k22-20020a056870819600b001c4ee87d3f6mr15549717oae.50.1696262819296; Mon, 02
 Oct 2023 09:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230929170731.749414-1-jeffrey.pautler@ni.com>
 <ZRqL7yT0ME00CakU@nuoska> <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
In-Reply-To: <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Oct 2023 09:06:48 -0700
Message-ID: <CAMKF1sprko_Qj_VPNcB8EK0YWJK70n5AHSVcupLtQYm20uH+Dg@mail.gmail.com>
Subject: Re: [oe] [PATCH] bolt: disable CVE checking for this recipe
To: Alex Stewart <alex.stewart@ni.com>
Cc: Jeffrey Pautler <jeffrey.pautler@ni.com>, mikko.rapeli@linaro.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ca5b520606bdf613"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 16:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105306

--000000000000ca5b520606bdf613
Content-Type: text/plain; charset="UTF-8"

If we want to use a not yet Defined value then it would be good to inform
upstream about the issue and also add a comment next to the definition so
we can correct it in future

On Mon, Oct 2, 2023 at 8:53 AM Alex Stewart <alex.stewart@ni.com> wrote:

>
>
> On 10/2/23 05:22, Mikko Rapeli via lists.openembedded.org wrote:
> > Hi,
> >
> > On Fri, Sep 29, 2023 at 12:07:31PM -0500, Jeffrey Pautler wrote:
> >> This bolt product does not currently have an entry in the CVE database.
> >> However, the default cve-check logic that maps recipes to products in
> >> the CVE database is incorrectly matching this package to a different
> >> bolt product made by bolt-cms. As a result, CVE checking incorrectly
> >> reports CVEs for that product for this package.
> >>
> >> Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
> >> ---
> >>   meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> >> index b6ad6337c..583cc6378 100644
> >> --- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> >> +++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
> >> @@ -12,6 +12,8 @@ SRCREV = "5a8a5866a847561566499847d46a97c612b4e6dd"
> >>
> >>   S = "${WORKDIR}/git"
> >>
> >> +CVE_CHECK_SKIP_RECIPE = "${PN}"
> > I think this is wrong and dangerous for anyone who in the future tries
> to use
> > cve checker for this recipe. Instead, set the CVE product with vendor
> correctly
> > so that other products/vendors don't mix the results? Hopefully any new
> CVEs
> > in the future will set the same vendor and product.
>
> Are you suggesting that he set the string to something like...
> `cpe:*:a:freedesktop:bolt:*`
>
> on the hopes that, if the Free Desktop folks open a CPE in the future,
> that it will match?
>
> >
> > Cheers,
> >
> > -Mikko
> >
> >>   inherit cmake pkgconfig meson features_check
> >>
> >>   FILES:${PN} += "${datadir}/dbus-1/* \
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >
> >
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105305):
> https://lists.openembedded.org/g/openembedded-devel/message/105305
> Mute This Topic: https://lists.openembedded.org/mt/101662068/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ca5b520606bdf613
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If we want to use a not yet Defined value then it would b=
e good to inform upstream about the issue and also add a comment next to th=
e definition so we can correct it in future=C2=A0</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 2, 2023 =
at 8:53 AM Alex Stewart &lt;<a href=3D"mailto:alex.stewart@ni.com">alex.ste=
wart@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
On 10/2/23 05:22, Mikko Rapeli via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br=
>
&gt; Hi,<br>
&gt;<br>
&gt; On Fri, Sep 29, 2023 at 12:07:31PM -0500, Jeffrey Pautler wrote:<br>
&gt;&gt; This bolt product does not currently have an entry in the CVE data=
base.<br>
&gt;&gt; However, the default cve-check logic that maps recipes to products=
 in<br>
&gt;&gt; the CVE database is incorrectly matching this package to a differe=
nt<br>
&gt;&gt; bolt product made by bolt-cms. As a result, CVE checking incorrect=
ly<br>
&gt;&gt; reports CVEs for that product for this package.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jeffrey Pautler &lt;<a href=3D"mailto:jeffrey.pautl=
er@ni.com" target=3D"_blank">jeffrey.pautler@ni.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.=
bb" rel=3D"noreferrer" target=3D"_blank">bolt_0.9.5.bb</a> | 2 ++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5=
.bb" rel=3D"noreferrer" target=3D"_blank">bolt_0.9.5.bb</a> b/meta-oe/recip=
es-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" rel=3D"noreferrer" target=3D"_=
blank">bolt_0.9.5.bb</a><br>
&gt;&gt; index b6ad6337c..583cc6378 100644<br>
&gt;&gt; --- a/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" re=
l=3D"noreferrer" target=3D"_blank">bolt_0.9.5.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" re=
l=3D"noreferrer" target=3D"_blank">bolt_0.9.5.bb</a><br>
&gt;&gt; @@ -12,6 +12,8 @@ SRCREV =3D &quot;5a8a5866a847561566499847d46a97c=
612b4e6dd&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; +CVE_CHECK_SKIP_RECIPE =3D &quot;${PN}&quot;<br>
&gt; I think this is wrong and dangerous for anyone who in the future tries=
 to use<br>
&gt; cve checker for this recipe. Instead, set the CVE product with vendor =
correctly<br>
&gt; so that other products/vendors don&#39;t mix the results? Hopefully an=
y new CVEs<br>
&gt; in the future will set the same vendor and product.<br>
<br>
Are you suggesting that he set the string to something like...<br>
`cpe:*:a:freedesktop:bolt:*`<br>
<br>
on the hopes that, if the Free Desktop folks open a CPE in the future, <br>
that it will match?<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -Mikko<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0inherit cmake pkgconfig meson features_check<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0FILES:${PN} +=3D &quot;${datadir}/dbus-1/* \<br>
&gt;&gt; -- <br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-- <br>
Alex Stewart<br>
Software Engineer - NI Real-Time OS<br>
NI (National Instruments)<br>
<br>
<a href=3D"mailto:alex.stewart@ni.com" target=3D"_blank">alex.stewart@ni.co=
m</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105305): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105305" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105305</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101662068/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101662068/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ca5b520606bdf613--

