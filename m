Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175E0E8784F
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 17:26:07 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22018.1770139564196707727
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 09:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4+LS/T0;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7d19bfe1190so4436815a34.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 09:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770139563; cv=none;
        d=google.com; s=arc-20240605;
        b=O51anhBqP0OniPyz6Yq3q0mpXHVYvm+uEDpxSxesnfmzp+az0QKJCFGuc/N+EStx3/
         UKWLEBxZlh+AK6qM/ku3uH6Ov3pGV/GUozec961NMPJstpC6xPBdmjHo38g4s2jlHeIQ
         JfsAaajlJGBiZb/9tS4TqkquxxY66MvZrv08STgvbRc7dyKgHkHzFDu+55zH/Hj6b4Nh
         NyDBf76CQoHPimYLOrptAvuuKG/on4ombhey2qRmX5GYIGnKwkvnSGCoA/kPDLV5Kgsl
         AxiWefptKhPhd4tBrlL1Y3ECcy9WQEC8srMep2St81kA7Xg7NBu0c1MBPzH+XREWPZoJ
         guLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7SxcZzPgIuiYpsqIsr09Td4UyfraOFzL9oJpXZE+Vk=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=NoUKNhobVeO+AUgMxwZmSPo11c5RRp2p+YlOPe0dzpdUj95HP48asdCX0xkd/RflyI
         K1RmsikpJjT3MkDX66CSwh8bul+/orpemaipvc+td31jJ8qh5BPVbbCcKigMVkPdaTFe
         9JPkm6Xt1/2LMIgOOVFN5COe+Kh/5TlysJu7+r155XK1FnWR6o7CcYIBQcU4rUjC3bNh
         3H0RoY9yEoZ8NQ1UBBZw8gXeV1LHBkc5QN4dklX56ZSSgDNP5mWcOtVspj6+wb0RGc4O
         mpRAdt5zv0zYXK8Pme8sTxhYGdOvh1dqMQAYZmZDRHGmDPM3uzxPNLpAiaRmDj6YEneW
         hfBw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770139563; x=1770744363; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7SxcZzPgIuiYpsqIsr09Td4UyfraOFzL9oJpXZE+Vk=;
        b=T4+LS/T0c28Ofamq8WHtO1Wn94S7X3f2NWBkLCAkuM0vD/t12JaJCUOJy8wNxMG4XB
         kdNMuRV+b1t71UcI+9mw7jDAdG9jDt7aGmA5bBThyjFWxs3jU8RwDW7tQoVPTUEUbzQk
         x32U3fyTeHxtblTX/w7+DQMaPPJHvLcuhVGlL6vsRmqS/7J0kJYpNGRL+7y+eLNEWbRb
         5kUgb6dotJGjtWpDRJexAJFEV+5se3coZHYYwKkl2ZKUAWzBjlq99MAMsvZlT9C6/+Jd
         Lii5k+moMEnSNnA4Nh9CmT+VLq7d2GaSC0CtQlDha2pt0gFjBW1dQnku00zfRThkAZYp
         k5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770139563; x=1770744363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7SxcZzPgIuiYpsqIsr09Td4UyfraOFzL9oJpXZE+Vk=;
        b=ABWqHeCMYgLtd3Glo4uijxS5X3J3alYWncddxjcz4hN6LUKuTGEkI1gbN3KLc0xz7r
         nECELgYKDi5xgFYuP+sz37AqtcZ3t/fXKwnn7PFiypxd0m6Bj4a5fX/65YNUsEVNbTvT
         zVDXI3nOvH2uw7y20u48Hds4HakSzL0Yot0XaDbzfHygMisAnmJkYhtihUypgf/BExHm
         3/V4uc9pZCnHxw8TycVCl+r3HBHuPrFjNGWsuFPeH+ssbR3VKloMHg76w36ZFiGXdtpE
         1Bh+Cm+HqrUgfa2ojlJP8Ku3gbf9nb3hNFpx1x8JM3pA+y1UAkcXYeMy1ipxMTcGIq4s
         6sWw==
X-Gm-Message-State: AOJu0YyJKeMxQ0SLP8oOU8n0XfEeGexcwkBy071ufgX63b784Ezr5E1V
	ziY1uK2/f5cHsQ7mDFls8t+8YU8zR+6TkiDeIeCYvkAPqxMtxLbVtR4i6vgeqr8CO03p+aDFVEu
	QUclPsggEwp2Ep8degx+8DKTHxVAfMTi5qF25
X-Gm-Gg: AZuq6aIyoZ0ZDN7WR1vti+M39+ZAJwjFBtc3fcDH8FosIYkCjVDl9u2qXM07rp0CJ2a
	+OjSGnFB4LQKd+8XXM5rBNFzZ++5d1zR1dH/HE3E2LNZOKwDzoyEtKRmd87G+XX9xS7EwXFqhKK
	oAoHtDzYET9KoWoKF5r+nHdZzTuIka2DE7GXhGjUHN1QXbEfl6JYiM13QbTLNAnpfHpJeBLOw2a
	c3mbOPb+drbcYazaYlWp0YEkXaDqM8yuBEZzFWgVc3t+f7tMTxl+Z4ScmbXTqb0WfxhjuhU
X-Received: by 2002:a05:6820:f04:b0:669:fb20:e9e7 with SMTP id
 006d021491bc7-66a2113abf1mr193551eaf.32.1770139563355; Tue, 03 Feb 2026
 09:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20260203155342.3393711-1-skandigraun@gmail.com>
In-Reply-To: <20260203155342.3393711-1-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 4 Feb 2026 06:25:52 +1300
X-Gm-Features: AZwV_Qh0FnCEiQVL7MQXQe1hBTZTUOrinhATLEJSIrn0AEwkMvR6nCqrjJ749g8
Message-ID: <CADySD0H1xHB6n5uJ8wWwbf8YuURaW1PLpXvo3kBy2E7Z5=od6A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH] gimp: patch libunwind detection
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 17:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124102

On Wed, Feb 4, 2026 at 4:53=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Gimp 3.0.8's meson file detects the presence of libunwind incorrectly,
> making it fail on some platforms, even when libunwind is explicitly disab=
led:
>
> | <snip>i686-oe-linux-musl-ld: app/core/libappcore.a.p/gimpbacktrace-linu=
x.c.o: in function `gimp_backtrace_get_address_info':
> | /usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-=
linux.c:708:(.text+0xbd7): undefined reference to `_ULx86_init_local'
>
> This backported patch fixes this.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...ind-header-detection-on-non-macOS-pl.patch | 51 +++++++++++++++++++
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb    |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libu=
nwind-header-detection-on-non-macOS-pl.patch
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-h=
eader-detection-on-non-macOS-pl.patch b/meta-gnome/recipes-gimp/gimp/gimp/0=
001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
> new file mode 100644
> index 0000000000..879529b80e
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-d=
etection-on-non-macOS-pl.patch
> @@ -0,0 +1,51 @@
> +From 8862f36fcec74152afeee2a99c0e04b84b6cf5b3 Mon Sep 17 00:00:00 2001
> +From: Bruno Lopes <brunvonlope@outlook.com>
> +Date: Sun, 25 Jan 2026 11:11:48 -0300
> +Subject: [PATCH] meson: Fix libunwind header detection on non-macOS plat=
forms
> +
> +Closes: #15750
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
1aa51ca0637db88a4ea958d03fa6692e6ac0289b]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + meson.build | 17 ++++++++++-------
> + 1 file changed, 10 insertions(+), 7 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 2192968..cfa1f71 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -731,11 +731,14 @@ conf.set('HAVE_LIBBACKTRACE', libbacktrace.found()=
)
> + ## Check for libunwind
> + # In most platforms, unw_*() functions are in the libunwind library.
> + # In macOS, it is on libSystem (there we only need the SDK header).
> +-libunwind =3D ( get_option('libunwind')
> +-  ? dependency('libunwind', version: '>=3D1.1.0', required: false)
> +-  : no_dep
> +-)
> +-have_unwind =3D libunwind.found() or cc.has_header('libunwind.h', requi=
red: false)
> ++libunwind =3D no_dep
> ++if get_option('libunwind')
> ++  libunwind =3D dependency('libunwind', version: '>=3D1.1.0', required:=
 false)
> ++  libunwind_h =3D platform_osx ? cc.has_header('libunwind.h', required:=
 false) : false
> ++  have_unwind =3D libunwind.found() or libunwind_h
> ++else
> ++  have_unwind =3D false
> ++endif
> + conf.set('HAVE_LIBUNWIND', have_unwind ? 1 : false)
> +
> + ## Check for backtrace() API
> +@@ -758,11 +761,11 @@ if platform_windows
> + elif platform_linux
> +   if not have_execinfo_h
> +     dashboard_backtrace=3D'no (missing: execinfo.h)'
> +-  elif not libbacktrace.found() and not libunwind.found()
> ++  elif not libbacktrace.found() and not have_unwind
> +     dashboard_backtrace=3D'rough (missing: libbacktrace and libunwind)'
> +   elif not libbacktrace.found()
> +     dashboard_backtrace=3D'partially detailed (missing: libbacktrace)'
> +-  elif not libunwind.found()
> ++  elif not have_unwind
> +     dashboard_backtrace=3D'partially detailed (missing: libunwind)'
> +   else
> +     dashboard_backtrace=3D'detailed'
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.8.bb
> index 863d9a1667..860fb5d26b 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
> @@ -60,6 +60,7 @@ SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.=
tar.xz \
>             file://0002-meson.build-reproducibility-fix.patch \
>             file://0001-meson.build-dont-check-for-lgi.patch \
>             file://0001-meson.build-require-iso-codes-native.patch \
> +           file://0001-meson-Fix-libunwind-header-detection-on-non-macOS=
-pl.patch \
>             "
>  SRC_URI[sha256sum] =3D "feb498acc01b26827cff1ff95aa8fb82cdd6a60d7abf773c=
fcd19abeafca3386"
>
>

Thanks for the patch, LGTM

Reviewed-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124100): https://lists.openembedded.org/g/openembedde=
d-devel/message/124100
> Mute This Topic: https://lists.openembedded.org/mt/117617793/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

