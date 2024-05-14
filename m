Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A870C04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 06:39:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.8805.1715668755690455939
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 23:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jGNRAbco;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51fdc9af005so8330670e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 23:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715668754; x=1716273554; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPbFfsBwmKYcNf2FCGUFwltKilcBPoYzIO+KiemBN1k=;
        b=jGNRAbcoiocP46Fpp5+Zbw0qJoYkko5Y2taaPlTqIPOUOpIWT4AdKcyTf/FfOz6k4Y
         QMPdtqveA7SYKX7BRWgOekYDU4dryhlUnFyPkuRVU6NPioSffFchpEv/ONinZTYizBCt
         I38fh50mOzpCbLUMxqlvR6ZuzSkG6MOEzgPuHDKJtPGKlFfRJ/mBE1woy3o6hd1uEvwo
         KcsVaBEr2D5phHjoB6Q50qbMSCjlXZy5MQ4dVf4z7Oya4aS+dmC9GYHWTjUbIDmYNL+1
         jGt33f6no/+S9CkjpZv1eRkFCneIvHQx1MS9tCHSGLpa/nLtbtMeDSUflHhpYCzr0U0E
         LuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715668754; x=1716273554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPbFfsBwmKYcNf2FCGUFwltKilcBPoYzIO+KiemBN1k=;
        b=VKbXvKvJgQA9I8g+u5+wfSmFofCD8T3uMPa4MhbNxVNdIhFqAA4ip5hg4VSCS89fyA
         fVqz+JfYRtTB3K/PYty3xOgZwp32Ew3G/ZVdwJQeg5TlH+OMgQ7BUmkbNraGgoIHaUXV
         fcO/jgR4+wNRydAuobTYItRNVgMypSRfalgPshuztPg+jGK6EJihyPoKVPOxamoOBvfV
         WuAD+TfZWWIMbWipf4cFtlrauoDs56mLMyZceAqs2IKprJ1AkIT4PCrnhZ06JxdnlUKN
         eU2b22IgmlnOJvJcw+HhrFzsGZLhvFNNman+AWKTgximtAFewCIIdkYA7DLUSDAJTd0c
         hjiA==
X-Gm-Message-State: AOJu0YzRWBezdbXP1rQwj/veOD8K92ksMaykh/TMG6EqLvk8zwZG62zf
	gqU+kYmdDH/p+yY8/2k3uWZNAWesh2mj7fwCuv78USLv/mQBEEKWguCjg0zLCk5phvHwQyW+ONA
	80i3LmgKeaka1Wliio4032WpqIrQ=
X-Google-Smtp-Source: AGHT+IEnSIwUyEGcwcX8gCT/VWBJZ10tkkDJPTpCJNyAq4l9a9F9PjzazWYZuuRFXtM4DBgLnV6rR+MaTjSzcBm0wG4=
X-Received: by 2002:a05:6512:33cf:b0:51d:9291:6945 with SMTP id
 2adb3069b0e04-522102785abmr12025311e87.44.1715668753485; Mon, 13 May 2024
 23:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240509192537.1639358-1-raj.khem@gmail.com>
In-Reply-To: <20240509192537.1639358-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 May 2024 08:39:00 +0200
Message-ID: <CA+chaQc2R1MGecp6CMXwDT_28gzgzfcG+wJb_pXNOPM99R_ofQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] freerdp: Upgrade to 2.11.7
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 06:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110347

On Thu, May 9, 2024 at 9:25=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Partially backport a fix to build with gcc-14

It fixes it only partially, right?

I'm stills seeing:

freerdp/2.11.7/git/libfreerdp/core/info.c:88:39: error: initialization
of 'const WCHAR *' {aka 'const short unsigned int *'} from
incompatible pointer type 'BYTE *' {aka 'unsigned char *'}
[-Wincompatible-pointer-types]
   88 |                 const WCHAR* domain =3D Stream_Pointer(s);
      |                                       ^~~~~~~~~~~~~~


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Fixed-compilation-warnings.patch     | 27 +++++++++++++++++++
>  .../{freerdp_2.11.2.bb =3D> freerdp_2.11.7.bb}  |  3 ++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-co=
mpilation-warnings.patch
>  rename meta-oe/recipes-support/freerdp/{freerdp_2.11.2.bb =3D> freerdp_2=
.11.7.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilati=
on-warnings.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-comp=
ilation-warnings.patch
> new file mode 100644
> index 0000000000..7fae2703f8
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warn=
ings.patch
> @@ -0,0 +1,27 @@
> +From 75fa1fa5bd5ef2350390564245fd0984209ac092 Mon Sep 17 00:00:00 2001
> +From: akallabeth <akallabeth@posteo.net>
> +Date: Mon, 4 Jul 2022 14:34:46 +0200
> +Subject: [PATCH] Fixed compilation warnings
> +
> +Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/2da=
280b8a1748052b70b3f5a1ef0d8e932c33adc]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + client/X11/xf_graphics.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/client/X11/xf_graphics.c b/client/X11/xf_graphics.c
> +index 5aa1fd48b..fe81e0ed9 100644
> +--- a/client/X11/xf_graphics.c
> ++++ b/client/X11/xf_graphics.c
> +@@ -438,7 +438,7 @@ static BOOL xf_Pointer_New(rdpContext* context, rdpP=
ointer* pointer)
> +
> + #endif
> + fail:
> +-      WLog_DBG(TAG, "%s: %ld", __func__, rc ? pointer : -1);
> ++      WLog_DBG(TAG, "%s: %p", __func__, rc ? pointer : NULL);
> +       return rc;
> + }
> +
> +--
> +2.45.0
> +
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.11.7.bb
> similarity index 97%
> rename from meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> rename to meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> index 3319488051..43c38bf9c9 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp_2.11.2.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
> @@ -13,9 +13,10 @@ inherit pkgconfig cmake gitpkgv
>  PE =3D "1"
>  PKGV =3D "${GITPKGVTAG}"
>
> -SRCREV =3D "a38c1be9eee39a9bc22b511fffe96e63fdf8ebe7"
> +SRCREV =3D "7f6cc93c21d7f0faad6daacca06f494f29ce882c"
>  SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
>             file://winpr-makecert-Build-with-install-RPATH.patch \
> +           file://0001-Fixed-compilation-warnings.patch \
>             file://0001-Fix-const-qualifier-error.patch \
>             file://0002-Do-not-install-tools-a-CMake-targets.patch \
>             "
> --
> 2.45.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110294): https://lists.openembedded.org/g/openembedde=
d-devel/message/110294
> Mute This Topic: https://lists.openembedded.org/mt/106007932/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

