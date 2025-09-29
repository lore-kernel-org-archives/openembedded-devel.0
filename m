Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF4FCAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 15:31:52 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.1102.1759159912350529314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 08:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUnlnnhW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-74435335177so81483307b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 08:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759159911; x=1759764711; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDe1J0zhKrK4jcwj6RceCxG/kz7oQj56prmkihjxMxw=;
        b=RUnlnnhWfaG/t3JrrycM5sKWSZmqitzOPHkddnet8jSyxhyqIkIqX/yMDCBbfBLxP4
         HEDyVNjfO86LJ8hypfMFppo3wKRSVseoMGj0oGw+78fJ3DzJK4XcUiRhV35cOOO3yZz2
         4g0V19hW7BJr0HSg2PpP9lcq78CdKeJNzK5vRMQrryEa1ICE0xrUtw39OWZoetv9JZmV
         iN8ID43hICdKLXAz3WoeygY0e5kj0+N2j7ZDncKe2AIO/9jukK2JyexyjK2bKPY2D9Xf
         e0HMtEUf7t37Rhxihn6I7TQQFWPj9JJpFMCJiCdBzpNMMr7GlJbK2K0v9GMuDkTfTI3/
         GF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759159911; x=1759764711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDe1J0zhKrK4jcwj6RceCxG/kz7oQj56prmkihjxMxw=;
        b=vWQDixLys+xe/Wz0QDim4lq8dL5ZT6T0MG5+qzZlZeTN2szFZU0iTyIlLm0b0/c94+
         48uJIvqhdjcpBuVHuC8SDD9+c+fBWivsrG5KVnfGrFgquf16O/TM8HZOaS+up6zdI7q5
         q3Mbwj6/I+RyF8+VDAEe8QGq2nSnN+ItiFWmEsBf4P0I80DBg1nQ+Qz/dbZU92OH241/
         qc4JTIkA3XpirEZC1tj6xDRlzytY2NF31nw2a9E0fctyVmFUAfbfWJS2s7G6V+FFwzCm
         UhP1Xe8EM3cOO6Auixo42MHYnC99kvIBnuF64UwNBPG9lbQreN9yJAs4nyQ8FDvEWmVG
         sbtA==
X-Gm-Message-State: AOJu0Yy81YxkFDgHSO7FiL9PJYm0Hfxysqc7AamxO0fThneHxB4t+bjr
	pumkEwc81ndSJVED0gy7JuNdXpk0UxRHaHg9voRpeVRCM5XXXu6HmZl85MfRh48T9DITfoiTFFv
	u60XtR5o7JIokRKX7/Zx/tlIknbI6FxM=
X-Gm-Gg: ASbGncv4Be7OAjLwvMIqnPp9WqetwHpK247OUYXV1gdMLx0sdhkND0MY1AAQWDt0Ltw
	3YTbbdyP5RtGJwCJhRPKG+/vQbu0Jblwum0o+XSxn9LUG0AEm5CGJCQ6pQLw3+I/87iBxV0xVpQ
	6cLSLiMbsqkI3DB7CSW9PzxrktoJ9G9+n8rzfQu5G6nq97Iuej42DLckiXoRFifaVgmTlo6m0iG
	sEz5OLsNOuW5mynRSg8rzhJD6RYXPA/C4+QC9c1pw8qgk73ur/klxgsiY/Term3OQ6MJH1rdMTr
	uiSqiZZ6/m+FhmSThdq2rBA46fq9l1I1VtQVHd7BNQsrc3AirlK6303I9QKj2PjIddjt
X-Google-Smtp-Source: AGHT+IGV6LZwa9uwBQd+WtSdSnjjBCGLfi5fdMRGHOsDretaZHtv6K9oQ9B0M8V3hEK9gIBKXlu3/EXkS6M9iQgyu/E=
X-Received: by 2002:a53:8551:0:b0:636:2079:185d with SMTP id
 956f58d0204a3-63b598671edmr917509d50.2.1759159911215; Mon, 29 Sep 2025
 08:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250928165143.16664-1-schonm@gmail.com>
In-Reply-To: <20250928165143.16664-1-schonm@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 08:31:24 -0700
X-Gm-Features: AS18NWDa5xTXsg0PVTlSh_HQw6G_9JcwtuU_Cuc8vrFw5g8ojgSt5i2NUYOyj9Q
Message-ID: <CAMKF1srBOn17=ac=nH4HxKGwyRhSE+VJ2N7Q4HuyQVO5K25syA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: upgrade 2.48.3 -> 2.48.7
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 15:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120036

its fails on qemuarm

https://errors.yoctoproject.org/Errors/Details/884060/

On Sun, Sep 28, 2025 at 9:52=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> WebKitGTK 2.48.7 release:
>
>     Fix a number of GStreamer memory leaks.
>     Fix several crashes and rendering issues.
>
> WebKitGTK 2.48.6 release:
>
>     Fix emojis incorrectly rendered in their text variant.
>     Add support for font collection / fragment identifiers.
>     Fix web process deadlock on exit.
>     Fix stuttering when playing WebP animations.
>     Fix CSS animations with cubic-bezier timing function.
>     Do not start the MemoryPressureMonitor if it=E2=80=99s disabled.
>     Fix several crashes and rendering issues.
>
> WebKitGTK 2.48.5 release:
>
>     Fix several crashes.
>
> WebKitGTK 2.48.4 release:
>
>     Improve emoji font selection with USE_SKIA=3DON.
>     Improve playback of multimedia streams from blob URLs.
>     Fix the build with USE_SKIA_OPENTYPE_SVG=3DON and USE_SYSPROF_CAPTURE=
=3DON.
>     Fix the build on LoongArch with USE_SKIA=3DON.
>     Fix crash when using a WebKitWebView widget in an offscreen window.
>     Fix several crashes and rendering issues.
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../webkitgtk/{webkitgtk3_2.48.3.bb =3D> webkitgtk3_2.48.7.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.3.bb =3D> webk=
itgtk3_2.48.7.bb} (98%)
>
> diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> similarity index 98%
> rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> index b848008910..6c105e7bb1 100644
> --- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.3.bb
> +++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.7.bb
> @@ -22,7 +22,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitg=
tk-${PV}.tar.xz \
>             file://fix-ftbfs-riscv64.patch \
>             file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAY=
S_I.patch \
>             "
> -SRC_URI[sha256sum] =3D "d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e92=
79640b3217a782c3"
> +SRC_URI[sha256sum] =3D "2c62aebb608e09f930a539f3623a5cc8023b5068029f42a2=
08f45f9124da6e30"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119999): https://lists.openembedded.org/g/openembedde=
d-devel/message/119999
> Mute This Topic: https://lists.openembedded.org/mt/115481606/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

