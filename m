Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1C1C5B552
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 01:27:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.19030.1748741221207566699
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 18:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jOVNAA9j;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e9192a03d4so1457485fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 18:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748741220; x=1749346020; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e76q778EFc6vn4hx1SQ678bnhtXVZqoDXkUkdw0Iiro=;
        b=jOVNAA9jH7I8YB2WHFT4lGIBYbioMLHgo8YmLWpT6NnUh8gaTnEND2nuVo3Hcem5Dj
         DQWqyVVTS7ZW6YjAV/5kqnCX0D9tvWOD5pelHV55EDebIQsZIrFADY2sE/QiE5CpMSXe
         LgTD+391z00E3azk2gtPnZrVIaONYFims3g/My3PmfTnBjEbBaukvWCA6grtYqjpEIcV
         o4Y3HXRFzf0uPAVDu9/6So6l1URhIDIjgMBy9NPoGPpNUIZHBywbAaxfNp1BD1qxS0jx
         f5jhq7Upi71RXZqz+1U0QvLit9iXik8rn779Nj2e+iSdsJsUHb5M+3B/bjqcAjvngmrX
         u53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748741220; x=1749346020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e76q778EFc6vn4hx1SQ678bnhtXVZqoDXkUkdw0Iiro=;
        b=uLbPL3R8vpxbSxASPvD6oeypGU6jeqaeZ0HN3NUx/oSCuJzl1RGXdEiH6ZgeSJZnR9
         XCD0M3wSlNJvrTLcoGlVrMst+cKUxa2rvhK8Ogw6ucjMbA7tNchOmMwihHxRBeviIpFt
         VNKZ2SyKmqjz2iUVSpJF9eiIprWOgCBDHMthuOnpQP9AGcdkVe7BwRcs1uAIO+9t25/7
         sOMlSmFvjpoCmCZ2jLmsR3wlCPy9zXlamUTCFEZtFiX4GM95zhHS3y0a9Y3GA3Ls2cLf
         T1PIUvT0GLN351tzCsYIQ5N1c27wx4B8/1NneYb5BULHbGhxx9ju/XWp/ws+zEP4cJ4T
         44Og==
X-Gm-Message-State: AOJu0YxLeRtPbAnxcx4+LaT29opito1aYOqz5m33bM+3V5KLg4CO2njn
	ruz7hik2RNVrKXs5rrtLR7GsAcEWh7q1tzeyq/Guk6RcL0/stcfdokrnC48yO/DDvUD+X/L7DVk
	KP+brg9eLc8cvyBRUzT/NO5h/xSRBFno=
X-Gm-Gg: ASbGnctmTfkUvO+kxiiUNhxMd8SizVJJwkS8dEUcaPL1XOABP9toCsagCXmYZ1QMePI
	RNadkdM724D5dLEzSZLZk5GN//zkO5eF4cwMUbUZhtzDSKjSuvuvHNx3W5QaixNwv6kaP0TVj9S
	y8s3LbsICVC6OPJULnaVf3ZlPk0frdLEA=
X-Google-Smtp-Source: AGHT+IGw7p594qDDx6bIxmlS68ENYb4QHmbG1Sq4++F28JfGEmcCk17/BsyluwqdL+9JQSnCgaKfWVBFCUVfpkVs1n8=
X-Received: by 2002:a05:6870:1641:b0:2cc:3763:c7d0 with SMTP id
 586e51a60fabf-2e92168c7camr4885955fac.33.1748741220287; Sat, 31 May 2025
 18:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171139.525281-1-jan.vermaete@gmail.com>
In-Reply-To: <20250530171139.525281-1-jan.vermaete@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 May 2025 18:26:34 -0700
X-Gm-Features: AX0GCFuH-loEscDRwuUllqzOrdS_GFAy1jVVIjYgagK6pbJ2cPbpv_0glBz9fXs
Message-ID: <CAMKF1sqUJ3rK5Q18pmtNwAE8vfyqMLeC8_Mygpv5D-XSD-DMZw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: version bump (3.4.0 -> 3.6.0)
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Jun 2025 01:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117692

it fails to configure

https://errors.yoctoproject.org/Errors/Details/856261/

On Fri, May 30, 2025 at 10:11=E2=80=AFAM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> - apply upstream patch to compile at master
> - added HOMEPAGE
> - downloads are not from github
>   "Stable releases are available on our releases page on github, where yo=
u can find more information about each release. All releases are also mirro=
red on the old downloads page on sourceforge."
>   @see: https://freeglut.sourceforge.net/
> - fixed 'devtool check-upgrade-status'
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  ...formDestroyContext-prototype-for-C23.patch | 30 +++++++++++++++++++
>  .../{freeglut_3.4.0.bb =3D> freeglut_3.6.0.bb}  | 14 +++++++--
>  2 files changed, 41 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-f=
ix-fgPlatformDestroyContext-prototype-for-C23.patch
>  rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb =3D> freeglu=
t_3.6.0.bb} (69%)
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPl=
atformDestroyContext-prototype-for-C23.patch b/meta-oe/recipes-graphics/fre=
eglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patc=
h
> new file mode 100644
> index 0000000000..13ba2316f3
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformD=
estroyContext-prototype-for-C23.patch
> @@ -0,0 +1,30 @@
> +From 800772e993a3ceffa01ccf3fca449d3279cde338 Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Sun, 17 Nov 2024 01:14:26 +0000
> +Subject: [PATCH 1/1] egl: fix fgPlatformDestroyContext prototype for C23
> +
> +C23 removes unprototyped functions, so this conflicted with the definiti=
on
> +in fg_init_x11.c.
> +
> +Bug: https://github.com/freeglut/freeglut/issues/186
> +
> +Upstream-Status: Backport [https://github.com/freeglut/freeglut/commit/8=
00772e993a3ceffa01ccf3fca449d3279cde338]
> +---
> + src/egl/fg_init_egl.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
> +index 592c5221..8753dc0b 100644
> +--- a/src/egl/fg_init_egl.h
> ++++ b/src/egl/fg_init_egl.h
> +@@ -28,6 +28,6 @@
> +
> + extern void fghPlatformInitializeEGL();
> + extern void fghPlatformCloseDisplayEGL();
> +-extern void fgPlatformDestroyContext();
> ++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDisplay, SF=
G_WindowContextType MContext );
> +
> + #endif
> +--
> +2.39.5
> +
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-o=
e/recipes-graphics/freeglut/freeglut_3.6.0.bb
> similarity index 69%
> rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> rename to meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
> index 2cd00b0349..ebd5fbcbce 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
> @@ -1,10 +1,15 @@
>  DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternative to =
the OpenGL \
>                 Utility Toolkit (GLUT) library"
> +HOMEPAGE =3D "https://freeglut.sourceforge.net"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78a=
dfb"
>
> -SRC_URI =3D "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/=
${BPN}-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd=
42bb0ea0c6f3eaec"
> +SRC_URI =3D "\
> +    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${P=
V}.tar.gz \
> +    file://0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch=
 \
> +"
> +
> +SRC_URI[sha256sum] =3D "9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d=
269e3288a6c3ea52"
>
>  inherit cmake features_check pkgconfig
>
> @@ -22,7 +27,10 @@ CFLAGS +=3D "-Wno-implicit-function-declaration"
>
>  PROVIDES +=3D "mesa-glut"
>
> -DEPENDS =3D "virtual/libgl libxi"
> +DEPENDS +=3D "virtual/libgl libxi"
> +
> +UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
> +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>
>  do_install:append() {
>      # Remove buildpaths
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117675): https://lists.openembedded.org/g/openembedde=
d-devel/message/117675
> Mute This Topic: https://lists.openembedded.org/mt/113383172/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

