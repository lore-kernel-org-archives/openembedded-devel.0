Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC1FE74902
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 18:14:46 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.89656.1696270483596762334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Oct 2023 11:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hB3n0AKg;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50444e756deso3845e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 11:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696270481; x=1696875281; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SuWsP98IECojle4D6H4MYMpfL2Sdb66ALoLSPCykGY4=;
        b=hB3n0AKgwbwVkaBLfucqLF4PfSIGwZt6Slh428LSPGaxKsF7n5I7NrtlByy3ug2NgA
         VGwwZTOEklkB6G6fvhqT3uZkPWLnfX10VfJpJqT0hszn6GO6N9ZRi35oUZKt24yA+1Q2
         LOZkuTpFlXIKNMqjpMd4NRRNb3jTPhJDGcFPeNOhXXqPw28GJgqe7TW2T2RTbMI45KqX
         iInfsVyT9onu+Z5YRVSki3NhFPiV+SAR9e3h2dl9hSEkvd/HH/2Gki5H825YDjNQVowQ
         yEsdM25IJk2Kghp47GnWlxkcKihvfKRKJsoOHK44mIEN8Qj1Zv4KmVQVKc8rCBUWku5g
         LjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696270481; x=1696875281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SuWsP98IECojle4D6H4MYMpfL2Sdb66ALoLSPCykGY4=;
        b=Qa8FMNNMRrV1pJuDDZv+CaNZIR4l1XWu113UDsw6/RFvDJ/qwJaqCyTy6TtYqb7ZMk
         YKwOSmPjlv9WUMgFylDKM0JiLjmSLEdPL2bQLovaEhTbiiujGMJ4aOS6TKN2nns/mhhD
         ic0aGQ3YiUTn8Pf89xw69w95jECaEUFX3Awo+neUqC38WPt7ldz7YZYdDeuWgDJMnfEC
         LCpg9jhQKA0D8zw0EcreLmAIS8e511eFsMJoZJmLY3WZk4Lca3201sd9R7oZqkCSLimN
         z0h+QxmfjKRiypG8JuITp85T9lOm5eSJPH0T8CqFP0cdSgCFztpqq4URMYL5pnkpsgrk
         BuuA==
X-Gm-Message-State: AOJu0YyBzrRBJ8o/wbI4kVK1N6RuclbO9cPc62f/ccG/ASu+WMtfmc9+
	tCJRCxngK0sMlY+i+AxPNXG1Z+RkrQT3WuN9A9s=
X-Google-Smtp-Source: AGHT+IE+cnTsKq7VaqKlijy+SE2Y8218LvfgiHcRUom9xxU2LZOnl/e1eQQmoRGnn/sVDp5+GD1miR8Nm1VaN8Ymspc=
X-Received: by 2002:a2e:b790:0:b0:2bf:ec8e:97c9 with SMTP id
 n16-20020a2eb790000000b002bfec8e97c9mr10050505ljo.17.1696270481164; Mon, 02
 Oct 2023 11:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230929170731.749414-1-jeffrey.pautler@ni.com>
 <ZRqL7yT0ME00CakU@nuoska> <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
In-Reply-To: <23d7986a-4bd8-4445-ac32-3f2d8fa98663@ni.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 2 Oct 2023 20:14:28 +0200
Message-ID: <CAApg2=T6_YEN21iBkrTTPh-21ADEmdZJHbD+Wq6=_xJ=u3OpGw@mail.gmail.com>
Subject: Re: [oe] [PATCH] bolt: disable CVE checking for this recipe
To: Alex Stewart <alex.stewart@ni.com>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, Jeffrey Pautler <jeffrey.pautler@ni.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007913070606bfbf7a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Oct 2023 18:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105310

--0000000000007913070606bfbf7a
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Oct 2023, 17:53 Alex Stewart, <alex.stewart@ni.com> wrote:

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

Or you can ignore CVEs that are badly assigned to this project. That works
if there is a manageable number.

Kind regards,
Marta

>

--0000000000007913070606bfbf7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 2 Oct 2023, 17:53 Alex Stewart, &lt;<a href=3D=
"mailto:alex.stewart@ni.com">alex.stewart@ni.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
On 10/2/23 05:22, Mikko Rapeli via <a href=3D"http://lists.openembedded.org=
" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a=
> wrote:<br>
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
er@ni.com" target=3D"_blank" rel=3D"noreferrer">jeffrey.pautler@ni.com</a>&=
gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">bolt_0.9.5.bb</a> | 2 +=
+<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">bolt_0.9.5.bb</a> b/me=
ta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">bolt_0.9.5.bb</a><br>
&gt;&gt; index b6ad6337c..583cc6378 100644<br>
&gt;&gt; --- a/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">bolt_0.9.5.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-bsp/bolt/<a href=3D"http://bolt_0.9.5.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">bolt_0.9.5.bb</a><br>
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
that it will match?<br></blockquote></div></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Or you can ignore CVEs that are badly assigned to this p=
roject. That works if there is a manageable number.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Kind regards,</div><div dir=3D"auto">Marta</div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
</blockquote></div></div></div>

--0000000000007913070606bfbf7a--

