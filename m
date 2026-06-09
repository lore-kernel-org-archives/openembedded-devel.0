Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B222CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:16 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79384.1781010307180207225
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 06:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TIppwxpR;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66077f6c438so4991717d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781010306; cv=none;
        d=google.com; s=arc-20240605;
        b=F4NRi9KSWXfIR4HUHtN0+HwajQK23p1lVO2Ivm5HPG/SOmPTlvoob1aaxFZZimefjt
         NpAq9yV+qT/eU5usyX8/l/VJq9eeBdFZSKAv74GtueXo0347noon+5ZyWa/pAOnrdJ1o
         AkXM72egz7lQhAdm8TJk0A68K2hS0TovZwMC0RYFuUo0bmYYQ4fEWeN+A/elsiNR28uE
         d1BSCDVZd/ZVznEYGWDDjbaeFK4Tx2Wik86VJaU76L6xGYXkO2RTwUHouWWSnjMpQ4wW
         BjEUmVAI70XSDtTr6NYyh1Fa2qc0xqmY4Pc42Y33nJSPD1gMbynuKaF7Y8uvtQobnQMA
         pxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=626eDSZ4c1qTUSxr9KBJImtfB7evfffDl74nZeToz6s=;
        fh=hOOZNshoD7E+ZlkLLUqqnV9XtxlbdrhypBmJDQPY6KI=;
        b=BFHmvy//K1r2So8FRWTXQFPSVrmH4yxL7bufJWZViyQDNhSbmfhsddMFnKSZeMxkqH
         rVbf04vqbqgNbWcBQ4Qpf6aAKWmf8Y/TDKW/dpESWkfsKytsIRflfXfau9OQPDFMu+HL
         6adicqYEsc2DWDe9z+vFhqT3bDynfqxipuHqDBqJVOhLNSZ0nMGTJw5dSF/7c+nyL1Px
         u29neL9SgeSksiZnEjeL3WgEfWpDjRnZCvEFyvFvUyGS89S/GPEh7ymHpdOQP67OKFwy
         cWupXObdh4xNmVSr19MUH8VRar6ui2PunPRG7FMfgVQptrXGob86FftxBdAr+f59lk3E
         woyg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010306; x=1781615106; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=626eDSZ4c1qTUSxr9KBJImtfB7evfffDl74nZeToz6s=;
        b=TIppwxpRPv07zQe+V0tjfVKiKe/uUL1HYeVms/owkbQLbGFfg676NaV9MW7mtGcRqC
         q240gTn1GAbcCnHXTpBUkYFdahnA2seVW2D4DZdEZYifiw1fwGxjPf6OBKWzwW4BU62V
         V0p8sj9ihLhtVa84u5RxlO2Ooe2wpPGe8L0tbf0lPnpKTZzkykQ5FtJxZOzvIdqrBAX8
         /6BJ+X8B0qtjpB+yYgmlB977Y4MvEmHK+KYq+/HwCVj3L7dXNirA8BsZdZ0zQpSeC2t3
         rvpV6L4aG2nLaEgAQot83h377IE/2etT+ItatShU/96bvBDlo1r4locY63mEuhltFjmR
         /9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010306; x=1781615106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=626eDSZ4c1qTUSxr9KBJImtfB7evfffDl74nZeToz6s=;
        b=ClkmxY6j9Q7AOlCq+SSekOna0WkSnK2sodA2jqmRV6OYgyBE6GDLpZH2I3dbAepUZQ
         s+GNfhmN/XBOQMBLPmsduZ6FBu9Yo2Pz6t7g/F49TR8foyXQC7aYw4tSzIXMvv6nSw/R
         YyWInWhMZXX0SPdfn8RInyOTKixWhASICukQrnc8/XOakA3i9hLzd/LO8LDvU2bVjwB1
         fFPzE30uSqkw3bIyiEGh+yRjWzbGhAtdtD7ZfsWqiAN5VrHvnDJoV4lqH4AcU/WbLmc0
         YXiUltz7YF4xjNOheFAW3+hhiwoglDYUd0IpygGofyBDFwEegEFNdAUpvn2G1h/pVGCs
         EwuQ==
X-Gm-Message-State: AOJu0YxEOiFB+WO61g42MLdN5e7OQW/1EVm4syNvHi2ekfixWUkSDTeB
	jKi7b6cs2PUiOtt2+k8VqQWrH4JGnjpTUvjAxTPS7+pzDv4wL+Z4PLyERJXxmmKSf4pQujLpSPl
	xGB2WoELqIpyjSW5yBs+inBMbgdVr2E4=
X-Gm-Gg: Acq92OEuEHIqHz2KyKJiMINdAcFxUE+n3Mu8FScNAe9OqIG3e2NpbETQX6onrjy72BW
	4EmvhWn1YqGi92NfDDMm9BLKmud8+vTKUtWCheK8zblqzdn76yiBh5ULUlBVNtiBCvRzGhtaI6B
	ZFIR+M9uIGvEnPOU4Wa/k7W4KF16ipaT7aU5tjNkpl+IZOnb8RYgTL6yVyjnrFiVjrSXfaTxURa
	p7Zn2g6RQypkavx2W3grMK1OX784AOQLfw4SNgmPVEfRyVxyWRLmV2w5BJASHf4Nsg7Pi2Hs6ED
	/fM8EAdL9cBLEkfn2hxpNrNd3K3k4FcP7LwGw2lta3qXpDiOjwXiOZvffuez+8xUqido7bnforL
	3dGx62+E03xCaSMsWtmqXmTWYicWS8GLwWQzBr5bgYKvnBVwFRfq7akpdy+D6hwYNgkqMT4///M
	tSZvx4DDR62YywFtI=
X-Received: by 2002:a05:690e:439b:b0:660:ea4a:4903 with SMTP id
 956f58d0204a3-66106e36dfbmr12653113d50.18.1781010305786; Tue, 09 Jun 2026
 06:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260609102913.2204-1-wangmy@fujitsu.com> <20260609102913.2204-12-wangmy@fujitsu.com>
In-Reply-To: <20260609102913.2204-12-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jun 2026 06:04:54 -0700
X-Gm-Features: AVVi8Cdp_nyNJJjsLCXnPzof0WQdcmg0jSz_OQvk_YqVi5HKPevByJvN3I0GXTc
Message-ID: <CAMKF1squECtt0NXVvkZ6ygsBo9F9dUdGG3g3+44ZE2ZaaPZHwQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 12/30] python3-aiohttp: upgrade 3.13.5
 -> 3.14.1
To: wangmy <wangmy@fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009e2eb00653d1c636"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 13:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127487

--0000000000009e2eb00653d1c636
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026, 3:29=E2=80=AFAM wangmy via lists.openembedded.org <wan=
gmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-aiohttp_3.13.5.bb =3D> python3-aiohttp_3.14.1.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-aiohttp_3.13.5.bb =
=3D>
> python3-aiohttp_3.14.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.b=
b
> b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
> index f3a0fbf557..a2267ea23c 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.14.1.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "Async http client/server framework"
>  DESCRIPTION =3D "Asynchronous HTTP client/server framework for asyncio a=
nd
> Python"
>  HOMEPAGE =3D "https://github.com/aio-libs/aiohttp"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D748073912af33aa59430d3702aa32d41"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Db5e9e27554f71f0f132919037cb967b2"
>
>
>
> What changed here
>


-SRC_URI[sha256sum] =3D
> "9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a23b421187d1209dbb7d1"
> +SRC_URI[sha256sum] =3D
> "307f2cff90a764d329e77040603fa032db89c5c24fdad50c4c15334cba744035"
>
>  CVE_PRODUCT =3D "aiohttp"
>  CVE_STATUS_GROUPS =3D "CVE_AIOHTTP_FIX_3_13_4"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127466):
> https://lists.openembedded.org/g/openembedded-devel/message/127466
> Mute This Topic: https://lists.openembedded.org/mt/119720409/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009e2eb00653d1c636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 9, 2026, 3:29=E2=80=
=AFAM wangmy via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.or=
g">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailt=
o:wangmy@fujitsu.com" target=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.c=
om</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank" rel=3D"noreferrer">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-aiohttp_3.13.5.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">python3-aiohttp_3.13.5.bb</a> =3D&gt; <a href=
=3D"http://python3-aiohttp_3.14.1.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">python3-aiohttp_3.14.1.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-aiohttp_3.13.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3=
-aiohttp_3.13.5.bb</a> =3D&gt; <a href=3D"http://python3-aiohttp_3.14.1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">python3-aiohttp_3.14.1.bb<=
/a>} (86%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
aiohttp_3.13.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-=
aiohttp_3.13.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http=
://python3-aiohttp_3.14.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">python3-aiohttp_3.14.1.bb</a><br>
similarity index 86%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-a=
iohttp_3.13.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-a=
iohttp_3.13.5.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-aio=
http_3.14.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-aio=
http_3.14.1.bb</a><br>
index f3a0fbf557..a2267ea23c 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-aiohttp=
_3.13.5.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-aiohttp=
_3.13.5.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-aiohttp=
_3.14.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-aiohttp=
_3.14.1.bb</a><br>
@@ -2,9 +2,9 @@ SUMMARY =3D &quot;Async http client/server framework&quot;<=
br>
=C2=A0DESCRIPTION =3D &quot;Asynchronous HTTP client/server framework for a=
syncio and Python&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/aio-libs/aiohttp" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/aio-libs/a=
iohttp</a>&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D748073912af33aa59430d3=
702aa32d41&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Db5e9e27554f71f0f132919=
037cb967b2&quot;<br>
<br><br><br>What changed here=C2=A0<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
-SRC_URI[sha256sum] =3D &quot;9d98cc980ecc96be6eb4c1994ce35d28d8b1f5e5208a2=
3b421187d1209dbb7d1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;307f2cff90a764d329e77040603fa032db89c5c24fdad=
50c4c15334cba744035&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;aiohttp&quot;<br>
=C2=A0CVE_STATUS_GROUPS =3D &quot;CVE_AIOHTTP_FIX_3_13_4&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127466): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127466" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127466</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119720409/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119720409/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000009e2eb00653d1c636--

