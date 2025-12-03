Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8032DD15DAB
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 16:53:18 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20375.1764780789164597701
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 08:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aawYl4IX;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-63f996d4e1aso7522448d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764780788; x=1765385588; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qcd8ESF/b3CbeorqLaoZy/IOpKf9NNmLski6tMFp7LU=;
        b=aawYl4IX1PkiG4trK5A+oRUc1A/p1+JgSrcZ3ycQBtBn1eEQ4m9XUoaklpJlZRYb4+
         EmY5TBU40flF7fYBcwI2hd32o59CnkiFP8bF1NbAkyp9zAf73wPgDU/buzgxEBG6IIpL
         C146oUKEDvsEw0ua0hi9CMueCO2CvNV8JninKOl23P1KpYikCO+4M8oxLYcuu6BtHuZ1
         PunBFOZ2JI6r9IkV5U5njoSCB2o7ESoyyusxzEUBf9UqoXTi23TYoNGNsjNklbfcJOPK
         kR8PW5WzyfEq+HmiuvQYAGWzIwkPP+BkP8wqtQ1TC9C6HJ4kDuNzFV7hrKvrN/CTxaW0
         37yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764780788; x=1765385588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcd8ESF/b3CbeorqLaoZy/IOpKf9NNmLski6tMFp7LU=;
        b=Dz2MNdctTvYkyZtcJnGAD9EVvR9CXD+AyleoCpdBMPcXLmri6N8ijRgZuawXVomlow
         qTj5CGH6e7mMRX/+Ur+bPGfj+iR+nCZwdMaXbKXed3h0iC9ZK8MMQwlmvs+PYP0XHw7j
         L9eMsJCnAgSMSr3XJIWbnrTx4VMx4iLJLSWKavLDGMP0+uXlBirrlOu1gUgorRkufOgH
         tlNq0Noq41VQUrd8ElMqi1Ku5EIZ580TgkXLY6dIEl0E1hkHTksQM2SxaT3hq28OFtTI
         8gN0PvKcISkvxFh1cnXw7YVkZnbzkNGySaW7HxLVz2JlHLOJ+QnhBi0tHwVk98fk5GtG
         OzvA==
X-Gm-Message-State: AOJu0Yww9+eRg0+4zTIZ8ObTb+VoJs8KDIyCb8rq1t7OmyO7ti4ZIp8e
	nz4dWXT4FWaWtr746NuZB0E+A7C0WlYoxqLNgv3P2dYMsk5KBYERsGaKiwnG13/Ai8haia4t1xQ
	7QwRVZrBkqfsz0Dcv7AcQ610B1XeKGL0=
X-Gm-Gg: ASbGnctMVzFMMoSWdCFqZQOVhHnSl3Q8K5o9q7JD8Xl7vUAsUnbUopxEUcRhOX7REHS
	MKSOwqFjdVIDVUjhyhr39Fvd7WukDcUQiwLUYrGgm6y03hqnP6AksohBUmAXP09TPDTzT85qg0Z
	AHP8/ab10gP5koStKvJPXMkukvvlC0iowemhAQ6VweznTLfW9QmXRIyS8CPglwo2aEWj9C2XZiZ
	cz26DUoEmAailGQrcDb6czXc0uz1lQEFoNHG6GvUb9waWQ+iFqMOsFW4vh3EMTGVVfPkmxno0+x
	cuuVHS6Tk4P/wWaRyePoEp3tBRD7gjIAVwZS2BGD8zdph/4N5c2Vf599sIgjsccDg9bV1vTiwqP
	1E7qiO3bxxYct
X-Google-Smtp-Source: AGHT+IFlsvm+72Dw7xBjHCpQ49ij00lWMWa1MRaYO4lKXAyIU2UHiHyNw7JYhjJwU22S1f53ZbUpKy+fz+t8EVy4Ox8=
X-Received: by 2002:a05:690e:2511:10b0:63c:ed4b:e53 with SMTP id
 956f58d0204a3-64436fc4517mr1969006d50.25.1764780787221; Wed, 03 Dec 2025
 08:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20251203143659.736329-1-pkj@axis.com>
In-Reply-To: <20251203143659.736329-1-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Dec 2025 08:52:40 -0800
X-Gm-Features: AWmQ_bmvkfBswi-e6Z83keNeO4fuuE9_SFBbQ0huqSfZwgXkDJ5F0YM5VNa_Nks
Message-ID: <CAMKF1spc9tibcU_NAzuH-8YJR9O9Lckfat9my0BcP5jZYmQS0g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] Revert "proj: Fix do_package QA issue
 for unshipped bash-completion files"
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000edc67506450f0b67"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 16:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122278

--000000000000edc67506450f0b67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, please send a reminder once it's merged in OE-core lest I forget
about it.

On Wed, Dec 3, 2025 at 6:35=E2=80=AFAM Peter Kjellerstedt via lists.openemb=
edded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:

> This reverts commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d.
>
> Since this recipe inherits bash-completion, adding
> ${datadir}/bash-completion to FILES:${PN} should not be needed (in
> addition to being the wrong thing to do as the files are expected to be
> packaged in the ${PN}-bash-completion package). The reason the problem
> addressed in commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d turned up
> is due to the recent change to the bash-completion bbclass, where it
> started to use PACKAGE_BEFORE_PN. This clashed with the lib_package
> bbclass, which used to set rather than add to PACKAGE_BEFORE_PN, and
> since it is inherited after bash-completion, it overrid what
> bash-completion does.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>
> I have sent a patch to openembedded-core to correct lib_package.bbclass,
> and it obviously needs to be accepted before this is integrated.
>
>  meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> index eb9fe46f30..2a41f1ec52 100644
> --- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
> @@ -12,9 +12,7 @@ inherit bash-completion cmake lib_package pkgconfig
>
>  EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
>
> -FILES:${PN} +=3D " \
> -       ${datadir}/proj \
> -       ${datadir}/bash-completion"
> +FILES:${PN} +=3D "${datadir}/proj"
>
>  BBCLASSEXTEND =3D "native"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122277):
> https://lists.openembedded.org/g/openembedded-devel/message/122277
> Mute This Topic: https://lists.openembedded.org/mt/116594502/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000edc67506450f0b67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, please send a reminder once it&#39;s merged in OE-=
core lest I forget about it.</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, 2025 at 6:=
35=E2=80=AFAM Peter Kjellerstedt via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:a=
xis.com@lists.openembedded.org">axis.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This reverts=
 commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d.<br>
<br>
Since this recipe inherits bash-completion, adding<br>
${datadir}/bash-completion to FILES:${PN} should not be needed (in<br>
addition to being the wrong thing to do as the files are expected to be<br>
packaged in the ${PN}-bash-completion package). The reason the problem<br>
addressed in commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d turned up<br>
is due to the recent change to the bash-completion bbclass, where it<br>
started to use PACKAGE_BEFORE_PN. This clashed with the lib_package<br>
bbclass, which used to set rather than add to PACKAGE_BEFORE_PN, and<br>
since it is inherited after bash-completion, it overrid what<br>
bash-completion does.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
<br>
I have sent a patch to openembedded-core to correct lib_package.bbclass,<br=
>
and it obviously needs to be accepted before this is integrated.<br>
<br>
=C2=A0meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">proj_9.7.0.bb</a> | 4 +---<br>
=C2=A01 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.b=
b" rel=3D"noreferrer" target=3D"_blank">proj_9.7.0.bb</a> b/meta-oe/recipes=
-navigation/proj/<a href=3D"http://proj_9.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">proj_9.7.0.bb</a><br>
index eb9fe46f30..2a41f1ec52 100644<br>
--- a/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">proj_9.7.0.bb</a><br>
+++ b/meta-oe/recipes-navigation/proj/<a href=3D"http://proj_9.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">proj_9.7.0.bb</a><br>
@@ -12,9 +12,7 @@ inherit bash-completion cmake lib_package pkgconfig<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DBUILD_TESTING=3DOFF&quot;<br>
<br>
-FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/proj \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${datadir}/bash-completion&quot;<br>
+FILES:${PN} +=3D &quot;${datadir}/proj&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122277): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122277" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122277</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116594502/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116594502/1997914</a><br>
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

--000000000000edc67506450f0b67--

