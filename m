Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839B5C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 16:24:02 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26159.1785687834555794549
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 09:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LBhhRx99;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6688a2dceb8so1551998d50.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 09:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785687833; cv=none;
        d=google.com; s=arc-20260327;
        b=F2AabiOe/oslnvNenKXyHHasBWbm7G4UHecvI5arJ2HzKIEzGQy8f3KnFUnQyuecYt
         Utsmpm81ERgVUwAh2LAq8RxQhc8g4SGzDZ6sTVNyFGtJ4uEgWqx3rLC6qHKUKHaGsfgQ
         iJd+VgoxifFmN+3gYP9WKLhujcIkO+Uv+StYaG36/tGc8WWpXJCgpIrWLJ/jvmpl8mYu
         cMJNEyg+s0l68EktsBPnvhND7s/LUHGw6cfj7ooIIha8pr3kRvrZGmy7NXLR7+8yKCdz
         vIihMVe9duaCVsoH3OI8Q9UnlTqs5HjE4LgKb0C2JzplZLUm384eSVHe8ZfOlZu9tp7P
         6UNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jBRHXLV0NlleC7D6KPHyIs+1wqMOOhjpb8wjsqMGbYo=;
        fh=XOI6TtVZPT4M4+St2buSvvvpyffvGrE/xpgLSZrQNok=;
        b=gE+lEFyvzRsd2tRT+AVKnuuIUZ2vtr3qyn/s7LqYwAdVgaWrdgKytGINPQXqwcLMiP
         9+zW6fx07NEG0MN6lAKvaiXSW/K24LiP6Os3jedveZQSjo10+FxUnz+JxfHup4AhnQZh
         QIAQWB/OM0qkaQRPVs/ofCIod53iKami+zS/igTkKc7xO+y/54pN1nEUfnX/vH1LpwsD
         5WlfOO+8k8EwWq74mZYuTN+smnypZfzXWnenamu3GfaRQGB4nkkM2z3RA7GejdZvJ/Ky
         yTzUB1H8kCiiz0LJWDXqjuelY7vqqnOe/kV5PbvAIRJFHDdXRJMs7ZdMKa6RbeGGaU0p
         +wNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785687833; x=1786292633; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBRHXLV0NlleC7D6KPHyIs+1wqMOOhjpb8wjsqMGbYo=;
        b=LBhhRx99CpLviL80GfpnXo11svU1XzZ0QoiU6+O76fQk14YTW4WY1NJeLe10oUZNNT
         YjVEgQ/pgJvmHIkzdi73mq2WkMY6INKDr1ntEdvnQVvV+efsikDOU9ljrW7UYijmOtfC
         hGfwddAbLNdN9BGak1IfR8txpDPVf50TY0d56b0EE2XxWNmRVJPpSKBuSoBORnUom7QQ
         NezgzuWk9MagaMfbBeoU1IoL+FoLk99dtsTi8Jo0zhj1svdU4j7Mf43mfk7ehETQla7o
         P41E/k7FFbxQPckMBi5X5bmWJjIXc6skD4BbzlwjNLp4mPilhcTW2WdEn6B9HNMtl5iR
         2ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785687833; x=1786292633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jBRHXLV0NlleC7D6KPHyIs+1wqMOOhjpb8wjsqMGbYo=;
        b=C18uOZNCjPGmpXtg1AObeJvXaGrnrQJdg6qL9UTjfgjsj24ZCwQ09pYJ1X4Og/alYd
         k3RwcXHNhTMw0kRvAKLFq7+7hGJb2Gyod2jPh2c37A8X0O/3Az3tv/RcVk9qJB5foM0e
         GuvEMoHSgn4kYb/+96RYwV+yWswoBGO/rPcWY0GZiayH2t4HME8wHXHHuWDTmJ8kxh2n
         R0PtRH1whkV/nmGLkriLimZ22RK702xX+6ZJo7w65h8quCPJzaEGwdMjU5lPw6TuUSyQ
         pM1ho33Pu/b+aQni8kNliRCIhUxvoMr4k5QP6Ziw1ftB3FDxnsFWbtIoKZ0r7Q8ZvZ7p
         hGAw==
X-Gm-Message-State: AOJu0Yys8X/j9/s6BOMJRhzWxVpOHFfrUPHq7IvglgzZG0DgjJoxZbOP
	qiweCzC8Pu6K4HNknUHDsO6elGeX4JSrkPl9N1eZlh9CTtGwo47WWyRB9RsO3+DUPc5fr/NVDKQ
	zETKub2UqnCuT/f0xKAvEAKqU49qwlks=
X-Gm-Gg: AR+sD13TSbPHWJwqgqK5HpqRIzn+xKU9mdBbaiyu8REaF2XQ7hdo0vv3P8RX+hmR98r
	fOvmJ5CH9hh2Y9SvI12IHaeb5V1clPZyH1Q4Zd1ngpY00lFwDcfCuMTjmXRqlwMDh8c2XzsN6l1
	GlLeu27DE3lqTUBfiR1Bg1WY/V05BW5UVTFiFbV0iD3G+RSm7zfGp/U6XZJl/L09lrE+4zWKtLw
	uDiXYrIk8ElC0313YCQMVA9kCp0lvzgx71a0Tnk5pqmpbjHE40KILKNobSS32Kkhtre/lR5PdO4
	E2RNSAf9aYepWKteQQCwjnRFytNxWBaq5Npth2P+3XlJvQ1eXYOhmEf1wfhcGnns5scOOmYJI6N
	gJ/3P5zhMO75e4JWfj1HnOGt5+6bab14CD5mH7MMIkk5XF0ho4yo/uYLLCXz97U8AvjAU6wLMma
	mAK7I9d4BaVdf6TFXO4gWtE4ZJFlZr9ES+C4YrdmHdW5o=
X-Received: by 2002:a05:690e:4010:b0:669:586a:8673 with SMTP id
 956f58d0204a3-669586a8718mr6673763d50.21.1785687833454; Sun, 02 Aug 2026
 09:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260731191523.2153901-1-ross.burton@arm.com>
In-Reply-To: <20260731191523.2153901-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Aug 2026 09:23:27 -0700
X-Gm-Features: AUfX_mwNtpg730JCGSoxBVvpq6YS0k3cj3Z6wDjFixCJ5kUbntSogOgN3f03QfE
Message-ID: <CAMKF1srKU837wk=mG=_0zTHLDjZGH=3Gcbprok-BrsK6VG5a5A@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/4] librav1e: add missing libgit2 build dependency
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe2cb6065812d8ad"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 16:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128670

--000000000000fe2cb6065812d8ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails on master-next with
https://errors.yoctoproject.org/Errors/Details/958359/
this is on arm64 build host

On Fri, Jul 31, 2026 at 12:15=E2=80=AFPM Ross Burton via lists.openembedded=
.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Not sure why an AV1 encoder needs libgit2 but that's rust's dependency
> tree for you.  Needed since our cargo class now stops the git2-sys crate
> from using a bundled copy of libgit2.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/rav1e/
> librav1e_p20250902.bb b/meta-multimedia/recipes-multimedia/rav1e/
> librav1e_p20250902.bb
> index 4c03c9417d..740918bd18 100644
> --- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
> +++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
> @@ -7,6 +7,7 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates
>
>  require ${PN}-crates.inc
>
> +DEPENDS =3D "libgit2"
>  DEPENDS:append:x86 =3D " nasm-native"
>  DEPENDS:append:x86-64 =3D " nasm-native"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128589):
> https://lists.openembedded.org/g/openembedded-devel/message/128589
> Mute This Topic: https://lists.openembedded.org/mt/120539931/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe2cb6065812d8ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails on master-next with=C2=A0<a href=3D"https://errors.y=
octoproject.org/Errors/Details/958359/">https://errors.yoctoproject.org/Err=
ors/Details/958359/</a><div>this is on arm64 build host</div></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Jul 31, 2026 at 12:15=E2=80=AFPM Ross Burton via <a href=3D=
"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ross.burton=
=3D<a href=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Not sure why an AV1 encoder needs libgit2 but that&#39;s rust&#39;s=
 dependency<br>
tree for you.=C2=A0 Needed since our cargo class now stops the git2-sys cra=
te<br>
from using a bundled copy of libgit2.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav1e_p=
20250902.bb" rel=3D"noreferrer" target=3D"_blank">librav1e_p20250902.bb</a>=
 | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://lib=
rav1e_p20250902.bb" rel=3D"noreferrer" target=3D"_blank">librav1e_p20250902=
.bb</a> b/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav=
1e_p20250902.bb" rel=3D"noreferrer" target=3D"_blank">librav1e_p20250902.bb=
</a><br>
index 4c03c9417d..740918bd18 100644<br>
--- a/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav1e_p=
20250902.bb" rel=3D"noreferrer" target=3D"_blank">librav1e_p20250902.bb</a>=
<br>
+++ b/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav1e_p=
20250902.bb" rel=3D"noreferrer" target=3D"_blank">librav1e_p20250902.bb</a>=
<br>
@@ -7,6 +7,7 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates<br>
<br>
=C2=A0require ${PN}-crates.inc<br>
<br>
+DEPENDS =3D &quot;libgit2&quot;<br>
=C2=A0DEPENDS:append:x86 =3D &quot; nasm-native&quot;<br>
=C2=A0DEPENDS:append:x86-64 =3D &quot; nasm-native&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128589): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128589" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128589</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120539931/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120539931/1997914</a><br>
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

--000000000000fe2cb6065812d8ad--

