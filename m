Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881EDC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 21:03:25 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.6478.1743714204821081393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 14:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=necPqrKf;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fa6c54cdb2so998374b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 14:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743714204; x=1744319004; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PkCwGlo/Rt4lesaAosXPvsOnCXvKkFexV/8Nu7aI/MQ=;
        b=necPqrKfLASQAH43j4iQ4k4SoEgyqDYO9NYpG5TF31GMhP5O80AtU583sFhzUlknUp
         LOTb9tgF9T8Zh0MebtzyJHRi2K3mGu/ehgXFs3AY4ZTG47lQ5jVvXrO7eg2SrP/VsVAr
         7x/uaC2CwzaWPt43rhqM3acphzjpw1Eox4EbIOm9zyaar35pRTNAEsZukTBLboKkOTqr
         1VMxQeGKVZDeWqXqQZoCfgBfLbjfcebwDlC6FqsTFjlBd8bpPtfWp6LuNeth0O+KkQk/
         fSZmDQaiwAob/xBuYVy+LxSzDtt2aqcbnRmps1qJSYUH2KrHOAXr4smsblvgPbEwts4m
         qQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743714204; x=1744319004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkCwGlo/Rt4lesaAosXPvsOnCXvKkFexV/8Nu7aI/MQ=;
        b=Mrb6s72KOoJ72kE+zWLOakOuIsYxS1gWJAHFMCHfGARFklYNAlV2SByjuOEB5Iika2
         W1C0G/A5g6urWyCu6+y8zcLg9llbeesV7Uogc9/BXfq+5JFK9tqhD8qAumLo3vnKUUOs
         wtM3KaSTr3oc+hGzEpOvvcn8iNXocre49hHSSn1/qxQ04cojgc9e8szOOl0uPgneR3I2
         T1AZmj0NV6yTdvffVeISpQvziNtEuuJdMhbwIk7j6doeNfkjVl1OyPgyWVhVHoZXvr8F
         DUmtqXFpCDI22fGdSNTIcuxIvrv2NFdLqbD25oqS3tu0WJcc7tm4RINRuU/KVS5rx4dK
         R8Og==
X-Gm-Message-State: AOJu0Yz7mWtweE8iNC3lfrWnmLfGWtorAdH+qfQN5h1fvpmeXzrrLZbN
	XBazGSt7HXyzodcvY/gdTKBxWaJoNUDu/xovv50DRroH3sdSedeZ2Qk804L95acccG/H6O5wvNv
	ePI3LRlYqpoWySosNHddkLj5SREc=
X-Gm-Gg: ASbGnctCUfXTNlkG6ZYLZRn04KI6aeFK/tghiivV5CbRNj7WQcXnmr4GBkqxF2AbYSc
	4jJE1vBsQETEsPfCcP7ofAEx6WHnqPBNajoN2E2LrxOIhepYjSQVoEur5bEVwuPwV8CMf+yfLpC
	06EpBl5LYyvOS8Jjg4Ebs/7AqUoStzEnMMag5wHlV0FHUYuUE5HYjW5YfN+w==
X-Google-Smtp-Source: AGHT+IGYnZVE1VF1scMo/FTgcnVseMQWsA5W2gV650FuuHIfYoH4v/Zzp2A7nySc3K+ENEpK94NQ5criEkmt6NH5AFw=
X-Received: by 2002:a05:6808:2002:b0:3fc:4181:ad44 with SMTP id
 5614622812f47-40046593467mr129195b6e.9.1743714203989; Thu, 03 Apr 2025
 14:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Apr 2025 14:03:13 -0700
X-Gm-Features: AQ5f1JrhGp-MwDgyfwkT07GFCPwwOZGQUCze6oDjYpXys--R23ylJ4UtmicJwSs
Message-ID: <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com>
Subject: Re: [oe] [PATCH] valkey: update from 8.0.2 -> 8.1.0
To: randy.macleod@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b7ff320631e619b6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 21:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116547

--000000000000b7ff320631e619b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via lists.openembedded=
.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Release notes:
>    https://github.com/valkey-io/valkey/releases/tag/8.1.0
>
> The license file checksum changed because upstream added the line:
>    SPDX-License-Identifier: BSD-3-Clause
> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
> which have been in glibc and musl for > 10 years so it's sensible to
> default to yes.


Why do they fail I wonder

>
>
> Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (75%)
>
> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb
> b/meta-oe/recipes-support/nano/nano_8.4.bb
> similarity index 75%
> rename from meta-oe/recipes-support/nano/nano_8.3.bb
> rename to meta-oe/recipes-support/nano/nano_8.4.bb
> index d1af89ef8d..1aae49d3b6 100644
> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>  PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>
>  SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz=
"
> -SRC_URI[sha256sum] =3D
> "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d854a3ca3778f111e"
> +SRC_URI[sha256sum] =3D
> "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41f36c97be2a8e628d"
>
>  UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano"
>
>  inherit autotools gettext pkgconfig
>
> +EXTRA_OECONF =3D " \
> +    ac_cv_func_strcasestr=3Dyes \
> +    gl_cv_func_strcasecmp_works=3Dyes \
> +    ac_cv_func_strcasecmp=3Dyes \
> +"
> +
> +
>  PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116546):
> https://lists.openembedded.org/g/openembedded-devel/message/116546
> Mute This Topic: https://lists.openembedded.org/mt/112047294/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b7ff320631e619b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM =
Randy MacLeod via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.opene=
mbedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">From: Randy MacLeod &lt;<a href=3D"mailto:Ran=
dy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>=
&gt;<br>
<br>
Release notes:<br>
=C2=A0 =C2=A0<a href=3D"https://github.com/valkey-io/valkey/releases/tag/8.=
1.0" rel=3D"noreferrer" target=3D"_blank">https://github.com/valkey-io/valk=
ey/releases/tag/8.1.0</a><br>
<br>
The license file checksum changed because upstream added the line:<br>
=C2=A0 =C2=A0SPDX-License-Identifier: BSD-3-Clause<br>
Add OECONF to avoid build-time checks for strcase[str|cmp], both of<br>
which have been in glibc and musl for &gt; 10 years so it&#39;s sensible to=
<br>
default to yes.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">W=
hy do they fail I wonder=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
<br>
Adjust the patches using devtool and manually munge the Upstream-Status-es.=
<br>
<br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.=
com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/nano/{<a href=3D"http://nano_8.3.bb" rel=3D"noref=
errer" target=3D"_blank">nano_8.3.bb</a> =3D&gt; <a href=3D"http://nano_8.4=
.bb" rel=3D"noreferrer" target=3D"_blank">nano_8.4.bb</a>}=C2=A0 =C2=A0 | 9=
 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/nano/{<a href=3D"http://nano_8.3.bb" r=
el=3D"noreferrer" target=3D"_blank">nano_8.3.bb</a> =3D&gt; <a href=3D"http=
://nano_8.4.bb" rel=3D"noreferrer" target=3D"_blank">nano_8.4.bb</a>} (75%)=
<br>
<br>
diff --git a/meta-oe/recipes-support/nano/<a href=3D"http://nano_8.3.bb" re=
l=3D"noreferrer" target=3D"_blank">nano_8.3.bb</a> b/meta-oe/recipes-suppor=
t/nano/<a href=3D"http://nano_8.4.bb" rel=3D"noreferrer" target=3D"_blank">=
nano_8.4.bb</a><br>
similarity index 75%<br>
rename from meta-oe/recipes-support/nano/<a href=3D"http://nano_8.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nano_8.3.bb</a><br>
rename to meta-oe/recipes-support/nano/<a href=3D"http://nano_8.4.bb" rel=
=3D"noreferrer" target=3D"_blank">nano_8.4.bb</a><br>
index d1af89ef8d..1aae49d3b6 100644<br>
--- a/meta-oe/recipes-support/nano/<a href=3D"http://nano_8.3.bb" rel=3D"no=
referrer" target=3D"_blank">nano_8.3.bb</a><br>
+++ b/meta-oe/recipes-support/nano/<a href=3D"http://nano_8.4.bb" rel=3D"no=
referrer" target=3D"_blank">nano_8.4.bb</a><br>
@@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D &quot;ncurses-terminfo-base&quot;<br=
>
=C2=A0PV_MAJOR =3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;.&#39;)[0]}&q=
uot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://nano-editor.org/dist/v$%7BPV_MAJ=
OR%7D/nano-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://n=
ano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;551b717b2e28f7e90f749323686a1b5bbbd84cfa13906=
04d854a3ca3778f111e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5ad29222bbd55624d87ea677928b3106a743114d6c6f9=
b41f36c97be2a8e628d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.gnu.org/gnu/nano"=
 rel=3D"noreferrer" target=3D"_blank">https://ftp.gnu.org/gnu/nano</a>&quot=
;<br>
<br>
=C2=A0inherit autotools gettext pkgconfig<br>
<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 ac_cv_func_strcasestr=3Dyes \<br>
+=C2=A0 =C2=A0 gl_cv_func_strcasecmp_works=3Dyes \<br>
+=C2=A0 =C2=A0 ac_cv_func_strcasecmp=3Dyes \<br>
+&quot;<br>
+<br>
+<br>
=C2=A0PACKAGECONFIG[tiny] =3D &quot;--enable-tiny,&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116546): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116546" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/116546</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112047294/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112047294/1997914</a><br>
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

--000000000000b7ff320631e619b6--

