Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76172C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 19:43:08 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.22268.1707507778353899765
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 11:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eL1NIiUm;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc754853524so856308276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 11:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707507777; x=1708112577; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5qEE4hmihXOXp44BV6UqpW1j8Xbezy7fGGKfN2wsBs=;
        b=eL1NIiUmpkmBxcY0F1JmYTGlBaSl4LPaYyBBim4b1UgZr7Nd4wNZBMa+dEUl4vSjvV
         k1LY83Gy2f+Cu+rojrnG4q2VHvSewaITgyYq3n/nU+YSXgIm4QVNbZnMBXmDfH2WC7OD
         j28dALyeQLXuGNK4ai92t3eUb7MFrMMB9ttr0ccAREeboxEb1laVneybmt8y8zdUnszT
         dS4rXmEfm3YkWvIeKrfX4MRwDapx3p6L/Rly7zNXkF+kGPqr3VEP+TQmdTLNI1dQWk9F
         UG59EM8HWl9uQpA21nBkZ2L6Bww3/Zttfs+MvzYTrTGzk6zHjC/FEfU7Pz9/c+pedRx4
         orvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707507777; x=1708112577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5qEE4hmihXOXp44BV6UqpW1j8Xbezy7fGGKfN2wsBs=;
        b=qVkzIjMCgTUSzWUqN6zvmAF/iUui6pDOzqpt761WhJmzf6jynZH2rG+fbJsqxkU0sk
         HfVQsMo5jfwDS7DSzZ7RyrAdB4g38CtnEfqTzcWUZwYCAhaj+PBiN+o/qXb/zdCC2S6L
         A1s7VG2gKhYfUAFGNrJ6jW0fBOCxZA0powWYuJ93gFSczZ1Pt+cYKGLQg4ciMFUvqUzj
         I+P2rn4OTfr5fY8yNkmaTmMpAD2dWpElKaC4t215LExPeGUSV1dLA2nQyzTSR34xhnMs
         Ly5I6cxjZBo8Ftb4fOpEkNcIGkK/mYKMfnmnrFcIog71JW3Wz3Y+GptkEyjBRTZpmip+
         Stww==
X-Gm-Message-State: AOJu0YyaNTpyTqmgBxPaQFw/E7Vc4QhWrjTYe9CZUsbR+hlhlU51ZDhO
	KYXPCkPbOi/YCIgwBk/bd7kK96h47UtIXMFh2Aky7iJQS6S5MSFmBYWL6BfGkScP9gNYhRYgC45
	ER2DNMDkcTgfAr1c5YqbnRsoV4Lo=
X-Google-Smtp-Source: AGHT+IErSouDiaHv7z2XI5j1uGsGOg5w90vUNywp8VKcDsABvZy1NkP6ApSms1twNTuZNcJxq0D33HJB/WJi1uBP67k=
X-Received: by 2002:a05:6902:2611:b0:dc6:bd4c:b119 with SMTP id
 dw17-20020a056902261100b00dc6bd4cb119mr164385ybb.55.1707507777357; Fri, 09
 Feb 2024 11:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20240209181917.1941840-1-festevam@gmail.com>
In-Reply-To: <20240209181917.1941840-1-festevam@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 9 Feb 2024 11:42:46 -0800
Message-ID: <CANx9H-ATNOoSgtoK1QJ9opj0jbr1x+1eh5xF5mBurYEbRQgDNQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] [meta-java] xml-commons: xom: Update github entry
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, richard.leitner@skidata.com, 
	tim.orling@konsulko.com, Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="000000000000854c380610f82216"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 19:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108691

--000000000000854c380610f82216
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 10:19=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Switch to using https, pass protocol and the branch name to fix
> the following warnings:
>
> WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL: git:/=
/
> github.com/codehaus/jaxen;name=3Djaxen uses git protocol which is no long=
er
> supported by github. Please change to ;protocol=3Dhttps in the url.
> WARNING: .../meta-java/recipes-core/xml-commons/xom_1.2.10.bb: URL: git:/=
/
> github.com/codehaus/jaxen;name=3Djaxen does not set any branch parameter.
> The future default branch used by tools and repositories is uncertain and
> we will therefore soon require this is set in all git urls.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  recipes-core/xml-commons/xom_1.2.10.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/xml-commons/xom_1.2.10.bb
> b/recipes-core/xml-commons/xom_1.2.10.bb
> index 42ad957..2eed0fe 100644
> --- a/recipes-core/xml-commons/xom_1.2.10.bb
> +++ b/recipes-core/xml-commons/xom_1.2.10.bb
> @@ -14,7 +14,7 @@ PV_jaxen =3D "1.1.6"
>
>  SRC_URI =3D "\
>         http://www.cafeconleche.org/XOM/${P}-src.tar.gz;name=3Darchive \
> -       git://github.com/codehaus/${SRCNAME_jaxen};name=3Djaxen
> <http://github.com/codehaus/$%7BSRCNAME_jaxen%7D;name=3Djaxen> \
> +
> https://github.com/codehaus/${SRCNAME_jaxen};protocol=3Dhttps;branch=3Dma=
ster
> \
>

You should not drop the name=3Djaxen, pretty sure that is required for the
SRCREV_jaxen to work?

We should also drop the archive.md5sum... we haven't used md5sum in quite
some time.

        file://04_remove_sun_import.patch \
>  "
>  SRC_URI[archive.md5sum] =3D "9f3a2ae827a9f6826fe76e4b7b0c22b3"
> --
> 2.37.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108690):
> https://lists.openembedded.org/g/openembedded-devel/message/108690
> Mute This Topic: https://lists.openembedded.org/mt/104264377/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000854c380610f82216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 9, 2024 at 10:19=E2=80=AF=
AM Fabio Estevam &lt;<a href=3D"mailto:festevam@gmail.com">festevam@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=3D"_bl=
ank">festevam@denx.de</a>&gt;<br>
<br>
Switch to using https, pass protocol and the branch name to fix<br>
the following warnings:<br>
<br>
WARNING: .../meta-java/recipes-core/xml-commons/<a href=3D"http://xom_1.2.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a>: URL: git://<a=
 href=3D"http://github.com/codehaus/jaxen;name=3Djaxen" rel=3D"noreferrer" =
target=3D"_blank">github.com/codehaus/jaxen;name=3Djaxen</a> uses git proto=
col which is no longer supported by github. Please change to ;protocol=3Dht=
tps in the url.<br>
WARNING: .../meta-java/recipes-core/xml-commons/<a href=3D"http://xom_1.2.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a>: URL: git://<a=
 href=3D"http://github.com/codehaus/jaxen;name=3Djaxen" rel=3D"noreferrer" =
target=3D"_blank">github.com/codehaus/jaxen;name=3Djaxen</a> does not set a=
ny branch parameter. The future default branch used by tools and repositori=
es is uncertain and we will therefore soon require this is set in all git u=
rls.<br>
<br>
Signed-off-by: Fabio Estevam &lt;<a href=3D"mailto:festevam@denx.de" target=
=3D"_blank">festevam@denx.de</a>&gt;<br>
---<br>
=C2=A0recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=
=3D"noreferrer" target=3D"_blank">xom_1.2.10.bb</a> b/recipes-core/xml-comm=
ons/<a href=3D"http://xom_1.2.10.bb" rel=3D"noreferrer" target=3D"_blank">x=
om_1.2.10.bb</a><br>
index 42ad957..2eed0fe 100644<br>
--- a/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a><br>
+++ b/recipes-core/xml-commons/<a href=3D"http://xom_1.2.10.bb" rel=3D"nore=
ferrer" target=3D"_blank">xom_1.2.10.bb</a><br>
@@ -14,7 +14,7 @@ PV_jaxen =3D &quot;1.1.6&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://www.cafeconleche.org/XOM/$%7B=
P%7D-src.tar.gz;name=3Darchive" rel=3D"noreferrer" target=3D"_blank">http:/=
/www.cafeconleche.org/XOM/${P}-src.tar.gz;name=3Darchive</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/codehaus/$%7=
BSRCNAME_jaxen%7D;name=3Djaxen" rel=3D"noreferrer" target=3D"_blank">github=
.com/codehaus/${SRCNAME_jaxen};name=3Djaxen</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/codehaus/$%7BSRCN=
AME_jaxen%7D;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/codehaus/${SRCNAME_jaxen};protocol=3Dhttps;bran=
ch=3Dmaster</a> \<br></blockquote><div><br></div><div>You should not drop t=
he name=3Djaxen, pretty sure that is required for the SRCREV_jaxen to work?=
</div><div><br></div><div>We should also drop the archive.md5sum... we have=
n&#39;t used md5sum in quite some time.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://04_remove_sun_import.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;9f3a2ae827a9f6826fe76e4b7b0c22b3&qu=
ot;<br>
-- <br>
2.37.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108690): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108690" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108690</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104264377/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104264377/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000854c380610f82216--

