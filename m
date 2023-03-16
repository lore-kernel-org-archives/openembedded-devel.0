Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B533C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:58:57 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.191.1678985928548272013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 09:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jKFjaDm7;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id p203so2665211ybb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 09:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BeD5azSeWNSz3NXeSg8HIdbS/4xaNv2U7DKEbLP2oJQ=;
        b=jKFjaDm7XeqXElyq6PfFkuEeWBWD0LnNvgOS0xiR7B9s9gQryEnMF1Q7YdpTt4xZ/T
         UUccWEj3+HRaRSU8pEjHooAncgnwuNiJDKF/zVtZ6bay2up+UPjf6EWz4JZOt4/Fy1Ai
         RlZX7XBjVLFWkO27rrXjkUH7lGE3RvUSsC3BfGmILClUvxBCMVjuVCGulA7n25tw/Vm2
         VbZsUViyTmFx+UpPvNwk2HPDX5xdCawpxQWslah83oVtHxygadlyL8e4SovT8WMKwYu5
         hRL0FRbRqfAPn7mLJfqAQgX4CjY0+R3vmJwQ92PzjEl7dWQLHopXJYQj2V8wDZXuXRp/
         y6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeD5azSeWNSz3NXeSg8HIdbS/4xaNv2U7DKEbLP2oJQ=;
        b=LnnxC7oPhhsUCWwRr9i2OyvhuBm/HRkZB5u2D3H8PrcHg7mL7/CcP2pEQ7p8xVQqHE
         xosj3Umf91zytJ2Ah/lmgdvR8X7HAOcIM9X50Edg9fxbUB7FF07TZ7a/nri+Zw2h8QDH
         orU0tubnKM7f8WgUyZJXUldQt2JCfJJeNMyNjUS7PLNaKZQKtvxdk/hXaxMefR2ApGsZ
         4rxwyK9BVsYs0YNTe++0PlmrosPCo4/hKkKyPVFyrt5PrQlnjcivxy8M7C7PPv4iWlyv
         /OFJ3uF/bB9gWeWXHv7qhpZuTzUW/TI1ckpEBiTEXD/RSPUF1TxRx9WAhvYKhuoJuzMY
         9yEg==
X-Gm-Message-State: AO0yUKUpY6/cCdHRxHrZRMCJw/0uHShYaK91pXvJUrZZIEAzQpYP/oAU
	b1Gvvayn5t06FCyfyNPbT96ILgeCml88Xx1C3lc=
X-Google-Smtp-Source: AK7set/9Zp+AtivxeRDP0PJZQDynfrVvUlKUKspkH7bqEuSuToYPUaQIxLPizfuq7m/r/RkQO1vNzvp7RqUY0tLTsEc=
X-Received: by 2002:a5b:83:0:b0:a17:c04e:bf7c with SMTP id b3-20020a5b0083000000b00a17c04ebf7cmr28415141ybp.11.1678985927566;
 Thu, 16 Mar 2023 09:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230316131823.132874-1-peron.clem@gmail.com>
In-Reply-To: <20230316131823.132874-1-peron.clem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 16 Mar 2023 09:58:36 -0700
Message-ID: <CANx9H-BLz-3A5AtLniq_gK04hsBgSqyLGTwT0pN=ChSg=twNPQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-click-repl: add mising
 prompt-toolkit runtime dependency
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cba9b705f7075ffe"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 16:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101582

--000000000000cba9b705f7075ffe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2023 at 6:18 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:

> Python3 click-repl package requires prompt-toolkit to be installed.
>
> Add the missing RDEPENDS to the recipe.
>

Good catch.
https://github.com/click-contrib/click-repl/blob/master/setup.cfg#L29


> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-click-repl_0.2.0.bb b/meta-python/recipes-devtools/python/
> python3-click-repl_0.2.0.bb
> index cf5ba988b..c8798c5e3 100644
> --- a/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-click-repl_0.2.0.bb
> @@ -7,4 +7,4 @@ SRC_URI[sha256sum] =3D
> "cd12f68d745bf6151210790540b4cb064c7b13e571bc64b6957d98d120
>
>  inherit pypi setuptools3
>
> -RDEPENDS:${PN} =3D "${PYTHON_PN}-click"
> +RDEPENDS:${PN} =3D "${PYTHON_PN}-click ${PYTHON_PN}-prompt-toolkit"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101576):
> https://lists.openembedded.org/g/openembedded-devel/message/101576
> Mute This Topic: https://lists.openembedded.org/mt/97650046/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cba9b705f7075ffe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 16, 2023 at 6:18 AM Cl=C3=A9ment P=C3=A9ron &lt=
;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Python3 click-repl package requir=
es prompt-toolkit to be installed.<br>
<br>
Add the missing RDEPENDS to the recipe.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Good catch.</div=
><div dir=3D"auto"><div><a href=3D"https://github.com/click-contrib/click-r=
epl/blob/master/setup.cfg#L29">https://github.com/click-contrib/click-repl/=
blob/master/setup.cfg#L29</a></div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><br>
Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-python/recipes-devtools/python/<a href=3D"http://python3-click-r=
epl_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.2.0=
.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
click-repl_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-rep=
l_0.2.0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-click-repl_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click=
-repl_0.2.0.bb</a><br>
index cf5ba988b..c8798c5e3 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-r=
epl_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.2.0=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-click-r=
epl_0.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-click-repl_0.2.0=
.bb</a><br>
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] =3D &quot;cd12f68d745bf6151210790540b4cb=
064c7b13e571bc64b6957d98d120<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-click&quot;<br>
+RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-click ${PYTHON_PN}-prompt-toolkit&qu=
ot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101576): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101576" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101576</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97650046/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97650046/924729</a><br>
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

--000000000000cba9b705f7075ffe--

