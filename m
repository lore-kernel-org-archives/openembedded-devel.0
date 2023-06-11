Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC00EC7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:20:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.39571.1686500420918653954
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BNQsX+Aw;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-30ae61354fbso2259405f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 09:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686500419; x=1689092419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v4qZRNVFBDKkrigbI0qjhSs3u7duqy/0Jem8D4dzITc=;
        b=BNQsX+Awp9ruKultRjq/HSQUckOOo0RkLa47cJ6ufbbOnquIx1IQLJHtBYQI1mhfNO
         yXPR2W3D0sShl7l0HWB2xyBvE4SlDVZBgKfP2lVatVyZLum8mIjae4+53fr+3cAKH0i0
         q3C9CLreMAo0LCdrkpdxcXINwwmVxfOqqmZwdzSGM466/2RWerfoOFeGNIUAOQqZX2VH
         0i/GZHMm4bDCNh3Eo+pjR9kpeQB6HESCIuWm0UzqcvYmmQXQPXCz+kLb0EuTPGd+kqNw
         CUqvVXfIepvhwaY45L4fPTc+vjLg8pqxEUzcBJN4B06QdJZxJYyzu08Wi94TpPlXDyJr
         xoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686500419; x=1689092419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v4qZRNVFBDKkrigbI0qjhSs3u7duqy/0Jem8D4dzITc=;
        b=M8zuhRYL/X3pc0kKRhvrqSIuGgGLyO6Q5/MDq9UC99sfUIHCBcOG3ajJ6x+hD17Nmo
         3utvV6Keca4MeZ0CnBvHbQCZIcmTB4ESkmm/lAqPtGrlxKa7KOp7pZte9i9jP3A17BI1
         +yTJqO1kn8Ef3uZm/mBS/XVEgG1jC5uRa/AbTACQkvObYc0XOtJyPeNuKN1pDX7Bt8uM
         VZnqdd+MaDudiara1LKQYLAPU0xHvUhRCueDJFbM9UA9u6eekkqXQfMUzMZn+e+H50Fj
         lJH+RJFJwRNyBlC1tpEFamUpjWj0ZXgp80gwwXAeEqtDRUCJiHCRqs0OySDSq7gAgcv8
         n8MQ==
X-Gm-Message-State: AC+VfDy/7b+5EV6UMr5BIeJSKoplLhFEuQdDBUBtRwtud0nc31az7hTU
	ts7oN1Pb5UolYZzDULhkx2FQJdl/OfNwjMTJ0c0=
X-Google-Smtp-Source: ACHHUZ759Ug/eDGom5b/DbX+yJ1Sgm6HO8qMdkqEX33C9YgMDpeaTDEneves0QTFmsAZ6t6WEsjMFtP09MP24eB9cm4=
X-Received: by 2002:adf:e44a:0:b0:306:42bb:53be with SMTP id
 t10-20020adfe44a000000b0030642bb53bemr2675713wrm.10.1686500418921; Sun, 11
 Jun 2023 09:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230611160530.392975-1-mhei@heimpold.de>
In-Reply-To: <20230611160530.392975-1-mhei@heimpold.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Jun 2023 18:20:07 +0200
Message-ID: <CA+chaQe28PSL+09O7pfQSRg4apTdjhJwWt7Ucc7+7Z93DrTvxA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: drop explicite ARM_INSTRUCTION_SET
To: Michael Heimpold <mhei@heimpold.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000622a2805fddcfa2e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jun 2023 16:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103206

--000000000000622a2805fddcfa2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Did you try it on qemuarmv5? as regular qemuarm used Thumb2 since 2019
https://git.openembedded.org/openembedded-core/commit/meta/conf/machine/qem=
uarm.conf?id=3D6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988
(and most of these issues where ARM_INSTRUCTION_SET is explicitly set in
the recipe were reproducible only with Thumb-1).

That said, I haven't built any armv5 builds recently and it's quite likely
that nobody cares about Thumb-1 nowadays.

On Sun, Jun 11, 2023 at 6:05=E2=80=AFPM Michael Heimpold <mhei@heimpold.de>=
 wrote:

> If my git skills don't trick me, forcing ARM mode for PHP
> dates back to year 2015 with commit e836f8f93.
>
> I wondered whether the compile problem still persists and just
> tested that it compiles fine for qemuarm nowaydays.
>
> I also tested the binaries on a physical device, a
> NXP iMX6ULL based one, and did not notice any problems
> so far.
>
> Signed-off-by: Michael Heimpold <mhei@heimpold.de>
> ---
>  meta-oe/recipes-devtools/php/php_8.2.6.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> index dad955452..404ff393b 100644
> --- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
> +++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
> @@ -284,12 +284,3 @@ do_install:append:class-native() {
>      create_wrapper ${D}${bindir}/php \
>          PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/
>  }
> -
> -# Fails to build with thumb-1 (qemuarm)
> -# | {standard input}: Assembler messages:
> -# | {standard input}:3719: Error: selected processor does not support
> Thumb mode `smull r0,r2,r9,r3'
> -# | {standard input}:3720: Error: unshifted register required -- `sub
> r2,r2,r0,asr#31'
> -# | {standard input}:3796: Error: selected processor does not support
> Thumb mode `smull r0,r2,r3,r3'
> -# | {standard input}:3797: Error: unshifted register required -- `sub
> r2,r2,r0,asr#31'
> -# | make: *** [ext/standard/math.lo] Error 1
> -ARM_INSTRUCTION_SET =3D "arm"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103205):
> https://lists.openembedded.org/g/openembedded-devel/message/103205
> Mute This Topic: https://lists.openembedded.org/mt/99465975/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000622a2805fddcfa2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Did you try it on qemuarmv5? as regular qemuarm used Thumb=
2 since 2019 <a href=3D"https://git.openembedded.org/openembedded-core/comm=
it/meta/conf/machine/qemuarm.conf?id=3D6fc70eb4f3494bee2be10ee24fe3ea1c8b5f=
f988">https://git.openembedded.org/openembedded-core/commit/meta/conf/machi=
ne/qemuarm.conf?id=3D6fc70eb4f3494bee2be10ee24fe3ea1c8b5ff988</a> (and most=
 of these issues where ARM_INSTRUCTION_SET is explicitly set in the recipe =
were reproducible only with Thumb-1).<div><br></div><div>That said, I haven=
&#39;t built any armv5 builds recently and it&#39;s quite likely that nobod=
y cares about Thumb-1 nowadays.</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 11, 2023 at 6:05=E2=80=AFP=
M Michael Heimpold &lt;<a href=3D"mailto:mhei@heimpold.de">mhei@heimpold.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
If my git skills don&#39;t trick me, forcing ARM mode for PHP<br>
dates back to year 2015 with commit e836f8f93.<br>
<br>
I wondered whether the compile problem still persists and just<br>
tested that it compiles fine for qemuarm nowaydays.<br>
<br>
I also tested the binaries on a physical device, a<br>
NXP iMX6ULL based one, and did not notice any problems<br>
so far.<br>
<br>
Signed-off-by: Michael Heimpold &lt;<a href=3D"mailto:mhei@heimpold.de" tar=
get=3D"_blank">mhei@heimpold.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">php_8.2.6.bb</a> | 9 ---------<br>
=C2=A01 file changed, 9 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb" r=
el=3D"noreferrer" target=3D"_blank">php_8.2.6.bb</a> b/meta-oe/recipes-devt=
ools/php/<a href=3D"http://php_8.2.6.bb" rel=3D"noreferrer" target=3D"_blan=
k">php_8.2.6.bb</a><br>
index dad955452..404ff393b 100644<br>
--- a/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">php_8.2.6.bb</a><br>
+++ b/meta-oe/recipes-devtools/php/<a href=3D"http://php_8.2.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">php_8.2.6.bb</a><br>
@@ -284,12 +284,3 @@ do_install:append:class-native() {<br>
=C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/php \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PHP_PEAR_SYSCONF_DIR=3D${sysconfdir}/<br>
=C2=A0}<br>
-<br>
-# Fails to build with thumb-1 (qemuarm)<br>
-# | {standard input}: Assembler messages:<br>
-# | {standard input}:3719: Error: selected processor does not support Thum=
b mode `smull r0,r2,r9,r3&#39;<br>
-# | {standard input}:3720: Error: unshifted register required -- `sub r2,r=
2,r0,asr#31&#39;<br>
-# | {standard input}:3796: Error: selected processor does not support Thum=
b mode `smull r0,r2,r3,r3&#39;<br>
-# | {standard input}:3797: Error: unshifted register required -- `sub r2,r=
2,r0,asr#31&#39;<br>
-# | make: *** [ext/standard/math.lo] Error 1<br>
-ARM_INSTRUCTION_SET =3D &quot;arm&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103205): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103205" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103205</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99465975/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99465975/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000622a2805fddcfa2e--

