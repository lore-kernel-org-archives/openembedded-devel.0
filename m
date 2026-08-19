Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FADC5DF87
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 21:27:32 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.480.1787174845582099624
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 14:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HCsjTv5L;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-80bb41f7f3cso17179847b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 14:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787174844; cv=none;
        d=google.com; s=arc-20260327;
        b=lILYBR5YjS908fQldrvUmpO74r6Mi8kmytwmQCWuz6ORVQ4bgzLaYGyLITJeY/AklP
         642WjolOsjiWzizV5D/XGwtgM8FTKyFlPVtvM02kQT/UY6DGNEYIGcM5sO2938IICegb
         IybCPu99OFUCVZa8dbd5eE1R0+4daxSsZ19zk7gedeBt/EZ+od12xnSss3WM3vHKW625
         Wuocf/EQfCFMnZOl6QLaRtN2DoyA5aOIrxGeSuP/06pV719Kil65raV6p6LFoHrOKZ5H
         gAc1FberNXA7DiUqOw0aDbXjHIUnTPUTfXT6HI5ZeYDZbcQlQjGttTNGGOvHam2nE5SC
         Nn8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yfwEYNIX4wAbHMjFHsiJ+bGe0gVzHgYiz6vFBDmOJ/o=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=kdklc7EYsQ62DpJqL1ZhQoc/zwG1vcihX9shoVLeI9LhLw+3DsLc+yXiKN/gRxl1Y5
         EmoUSSL6TniXP+SryXuXIz42jioXdfEy9Yuy5934o1zWc049DrdmC3emKuZdeqjn7/EL
         Om8sjrmeMspUW/U0rGFggcYdmPoe+WBBUcHABcieCbYkfizBHsnLQoGZeCNbH9eYTR2+
         Cso1XBh/kPtVZw5ZAXIRK3pwK2JWBwgeiE4wBB6W2o9uN40FZIuUxjK2M1Kk6kGqCIdP
         RVWwbN4EVWTc0a84Lg3ZXzq/Axa9u5L4vTx8+ZyBV7WumKPMsLhQKCJfOdX12qDWpxmJ
         5F3w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787174844; x=1787779644; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yfwEYNIX4wAbHMjFHsiJ+bGe0gVzHgYiz6vFBDmOJ/o=;
        b=HCsjTv5LGr9wZVKEphQj83YF3fR1H0C2+/fCKIQ1Jve2kvyUEE1EBQ1UR1Z1mgME4D
         Bd2fUmqvE1B2lkvjO57RmthS2wP8hupbtskdCEedQQ4JGCEDyyt9o+BWSo46Cs1NkgdU
         8MIzH4pKPY6S5sG19YoHYTtT0oppS6Kxp3pdSd7VnKxdG3ng0yJYwvKRkGuQPmvgMIBh
         vnZcVFs1BruDKVftcN5FK1gP7mQ5nAsn1kT38tMAD0dTP7m/Jr5x0It5qwkTDvSGlOQT
         ecwFVMM9bwrXhFCe9XHT+lKlY7qjzn+vhdvP7tzEULJ5hncn219B9OCkmcszA85Giqsy
         7B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174844; x=1787779644;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yfwEYNIX4wAbHMjFHsiJ+bGe0gVzHgYiz6vFBDmOJ/o=;
        b=BKyQ2mxguHMmfvSqT2F+I2sjxsV2Anl4Vp7u7hbyxMGc3bEdUrk9h3geUXKJjOTidU
         RsBWQcl2iQiKVDSjQ3M71UAPZzp10J8CBXaxmc9BGaBzESJYCPBp3s3z3MRD6LDZ9J+0
         hmo1GQPqfDDmOIpBLGrL4M2JFQiDg2TAZEpI09NedOFoGKKg8MUx9bzVGYj4iyX6Bsrp
         w/nwGggno0RFS8gHkBaD99/NkvO47/gOXSnT9iYyMkFWIDGqViO/FuYqK/fGjnBFwrqa
         jCqTjvjtfMTkbTMqnSax9gYSp9jlkBjGLtKpM0dziXfLnmZ7kEXKG0K65Kc0OZ6XLiDg
         35zw==
X-Gm-Message-State: AFuF++nLPztanRIph3TuMniB/ca0VI0Vbt4mEo1Uz3j8C1gdfJ2O0vkj
	ZppY/4Ho2COWCP/on6x/eDii/FCWjf50Bi00TOSVdAwe5hPuUX7e4ged4IeN7alUlm+lLPM2GW9
	3L3QLbWdLtI06UgSgouuBX7hWYj06aTM=
X-Gm-Gg: AR+sD13hwK25Ahe0XjBXn5J3u/D2bDI5WP0xRW2Fy9i15lPF7urMmvpcnDurrIS2ap5
	YlgJnQlOeI9c8nPXS2255jnWEZyHlZwgsirZzCtp5MAkxCOsOQZJmY8WerYfjn6WQHlSkhTe/QI
	dw9gGJ6xtmxxwfwxOK9LPVE0eIEaFaQxl9nM79HiHUxLeV0qqihT20urVbCGpCPjJko15jZQShV
	0Nj3dbHPQYjtFuDaQfwtB7rBtskXWOolCXA9wq2T8fRzzAV9OtxouXyAy6ojVZUVm0tSiod8esm
	BBBZmlwJ4kPCzKZ/GL9lPePPDVmVivFoMwT8TG8F1J5u3HDi5vEpLKlFyMKWBCFE/NztuyAMgfT
	7p3Je6xScP8ch/QQQOEk+u8dQ58amBVnaY46cISAMpuvxkCQ+VSD+CaGCvr+JmeR8c6uradJuWG
	p8ResAGlTnDagJpa+XnfbM7CODIvnqDiO/sl0d8dixtrCaWvyymQ1WfiU52PE3V2v+98NS7kFnL
	reXazXfKAaL0Q==
X-Received: by 2002:a05:690c:9a85:b0:81d:e7d2:a46d with SMTP id
 00721157ae682-844e25159c1mr35340437b3.5.1787174844521; Wed, 19 Aug 2026
 14:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260819093514.1101-1-wangmy@fujitsu.com> <20260819093514.1101-16-wangmy@fujitsu.com>
In-Reply-To: <20260819093514.1101-16-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Aug 2026 14:26:57 -0700
X-Gm-Features: AcwNN1UoCbnGhwZSslZGAMR2a9MmgygL6n1I0Ze6xtrflYO9MMOBvrRmdU72GIk
Message-ID: <CAMKF1srxonDULWwhgAfXdbXVk5n9Ktb2YVvzPox9bGAv5Cmigw@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 16/70] poke: upgrade 4.3 -> 5.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c25fad06596d118a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 21:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129366

--000000000000c25fad06596d118a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build with clang

https://errors.yoctoproject.org/Errors/Details/964099/

On Wed, Aug 19, 2026 at 2:35=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-devtools/poke/{poke_4.3.bb =3D> poke_5.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/poke/{poke_4.3.bb =3D> poke_5.0.bb} (94%=
)
>
> diff --git a/meta-oe/recipes-devtools/poke/poke_4.3.bb
> b/meta-oe/recipes-devtools/poke/poke_5.0.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/poke/poke_4.3.bb
> rename to meta-oe/recipes-devtools/poke/poke_5.0.bb
> index 14597c93c2..ede460fca0 100644
> --- a/meta-oe/recipes-devtools/poke/poke_4.3.bb
> +++ b/meta-oe/recipes-devtools/poke/poke_5.0.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
>
>  DEPENDS =3D "flex-native bison-native bdwgc readline"
>
> -SRC_URI[sha256sum] =3D
> "a84cb9175d50d45a411f2481fd0662b83cb32ce517316b889cfb570819579373"
> +SRC_URI[sha256sum] =3D
> "6873d59abe821c8111b88623ea7ad9e090892fa95c75562606dd88374e2f5b8f"
>  UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/poke/"
>  UPSTREAM_CHECK_REGEX =3D "poke-(?P<pver>\d+(\.\d+)+)\.tar"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129286):
> https://lists.openembedded.org/g/openembedded-devel/message/129286
> Mute This Topic: https://lists.openembedded.org/mt/120826953/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c25fad06596d118a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build with clang<div><br></div><div><a href=3D"ht=
tps://errors.yoctoproject.org/Errors/Details/964099/">https://errors.yoctop=
roject.org/Errors/Details/964099/</a></div></div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Au=
g 19, 2026 at 2:35=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.c=
om@lists.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Min=
gyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fuji=
tsu.com</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/poke/{<a href=3D"http://poke_4.3.bb" rel=3D"=
noreferrer" target=3D"_blank">poke_4.3.bb</a> =3D&gt; <a href=3D"http://pok=
e_5.0.bb" rel=3D"noreferrer" target=3D"_blank">poke_5.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/poke/{<a href=3D"http://poke_4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">poke_4.3.bb</a> =3D&gt; <a href=3D"htt=
p://poke_5.0.bb" rel=3D"noreferrer" target=3D"_blank">poke_5.0.bb</a>} (94%=
)<br>
<br>
diff --git a/meta-oe/recipes-devtools/poke/<a href=3D"http://poke_4.3.bb" r=
el=3D"noreferrer" target=3D"_blank">poke_4.3.bb</a> b/meta-oe/recipes-devto=
ols/poke/<a href=3D"http://poke_5.0.bb" rel=3D"noreferrer" target=3D"_blank=
">poke_5.0.bb</a><br>
similarity index 94%<br>
rename from meta-oe/recipes-devtools/poke/<a href=3D"http://poke_4.3.bb" re=
l=3D"noreferrer" target=3D"_blank">poke_4.3.bb</a><br>
rename to meta-oe/recipes-devtools/poke/<a href=3D"http://poke_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">poke_5.0.bb</a><br>
index 14597c93c2..ede460fca0 100644<br>
--- a/meta-oe/recipes-devtools/poke/<a href=3D"http://poke_4.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">poke_4.3.bb</a><br>
+++ b/meta-oe/recipes-devtools/poke/<a href=3D"http://poke_5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">poke_5.0.bb</a><br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/poke/poke-${PV}.tar.gz \<=
br>
<br>
=C2=A0DEPENDS =3D &quot;flex-native bison-native bdwgc readline&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a84cb9175d50d45a411f2481fd0662b83cb32ce517316=
b889cfb570819579373&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6873d59abe821c8111b88623ea7ad9e090892fa95c755=
62606dd88374e2f5b8f&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.gnu.org/gnu/poke/=
" rel=3D"noreferrer" target=3D"_blank">https://ftp.gnu.org/gnu/poke/</a>&qu=
ot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;poke-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129286" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129286</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120826953/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120826953/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c25fad06596d118a--

