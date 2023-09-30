Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35012E748F0
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 22:50:47 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.50603.1696114244349550936
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Sep 2023 15:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nsTWExEP;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1e0ee4e777bso2465098fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 15:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696114243; x=1696719043; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dF57mR3TZXbkyM8gdfuqqAd9ZiIRiQlBxVGum+k8lg=;
        b=nsTWExEPzsEpLaXz6TnVBIKeuiTwFCWSeVEoWYQ985rJ0mFuo6+enaT2zDGI1pNbLT
         rsYCZJuZIZuWbkOZt+FpiGik+WBa6MIO0OZSJocSu+o2PCwLy+LB84xI9oxtB2t8zc8x
         /C/Gt7f8Kgo2++ikSYAz/UlPQfD+FZ/QtUdeaATJ2c7XFyhqR1p0dJC6xvJbl0+hZ8/w
         D6+dmQFrGNS+9ceBjztFodXiJ8+4WGAoYX9h1yBSgo5ze3tEPQjIiBMb5qwgrGU0l2c8
         tC6qXsSViq4Nlu8x84tygyBAWioHjqmdQyJgCRj1/rA2fIsbY+NcaAakUFv/jiBOrNxU
         1PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696114243; x=1696719043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dF57mR3TZXbkyM8gdfuqqAd9ZiIRiQlBxVGum+k8lg=;
        b=fuZ+mITpedQ5DdPXHvWxYzZRYNJ4b3y2DuhMNsRyA4ypO9/PKYuMOJtWgA8syThj+s
         bJoCTFM4+LWWbz34/vZYh/eYQvnHXrnEHSs7nXVJ0TLgAXhA+GJ12tGbVleXZmRssNDq
         pQJMtl5sRt1Aqao7rT9fJoflk9HTf1GJrKcMfN8BkdYJI3+bHThuXcdYQbc38ujeWIkl
         XwjymLhreKeismJ2lt5vsfmcrZbhS9LcwaQ4XKCrJb86X4ZK807VEY7nSGZ9YFPbHOib
         2boX1bcQ/W5uBuqnL9knm7T3tFNsEUk3KDt81V0AsxljS2gThe5KOoOyL/OPJjZSYn7M
         KytA==
X-Gm-Message-State: AOJu0YzZF+n8JcTGcMECKceb1Ic+38OtcbpxdN6Kbb077/zjuWXPkdLf
	/xWUNxPXxPlFuHnmrCaTMKom8sd62kgimQJKzgU=
X-Google-Smtp-Source: AGHT+IHAHaOxQf0BtSqxSHrnO4N/PrHQxvZZL3THNfglNx2qi2Uk/ej3YhyHEp/SG0Lcgg5z0PP8Hw9JXDEeh8GjXhY=
X-Received: by 2002:a05:6870:164d:b0:1b0:3cd4:76d5 with SMTP id
 c13-20020a056870164d00b001b03cd476d5mr9884498oae.37.1696114243512; Sat, 30
 Sep 2023 15:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230930105454.197209-1-cordlandwehr@kde.org>
In-Reply-To: <20230930105454.197209-1-cordlandwehr@kde.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Sep 2023 15:50:17 -0700
Message-ID: <CAMKF1srvGQC+RzPVpArOARiXOMhN_CkKpr52gATRcBprGyAd9w@mail.gmail.com>
Subject: Re: [oe] [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Sep 2023 22:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105289

Hi Andreas

Thanks for the patch, but since this component is part of core layer,
the patch for core layers should be sent to
openembedded-core@lists.openembedded.org see
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#finding=
-a-suitable-mailing-list

On Sat, Sep 30, 2023 at 3:37=E2=80=AFPM Andreas Cord-Landwehr
<cordlandwehr@kde.org> wrote:
>
> Fix pkgconfig find calls to find wayland protocol XML files.
> See discussion in:
> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
>
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>  ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
>  .../wayland/wayland_1.22.0.bb                 |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-p=
kgconfig-sysroot-for-pkgdatadir.patch
>
> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfi=
g-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/0002=
-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
> new file mode 100644
> index 0000000000..4573bb635a
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysro=
ot-for-pkgdatadir.patch
> @@ -0,0 +1,46 @@
> +From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
> +From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> +Date: Sun, 6 Feb 2022 17:23:46 +0100
> +Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
> +
> +For libs/cflags this is done automatically, but not for manually accesse=
d
> +variables. This matches what wayland-protocols does.
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayla=
nd/-/merge_requests/272]
> +---
> + src/meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index a8a1d2b..721e151 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -65,7 +65,7 @@ if get_option('scanner')
> +               version: meson.project_version(),
> +               variables: [
> +                       'datarootdir=3D' + join_paths('${prefix}', get_op=
tion('datadir')),
> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', me=
son.project_name()),
> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${d=
atarootdir}', meson.project_name()),
> +                       'bindir=3D' + join_paths('${prefix}', get_option(=
'bindir')),
> +                       'wayland_scanner=3D${bindir}/wayland-scanner'
> +               ],
> +@@ -211,7 +211,7 @@ if get_option('libraries')
> +               filebase: 'wayland-server',
> +               variables: [
> +                       'datarootdir=3D' + join_paths('${prefix}', get_op=
tion('datadir')),
> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', me=
son.project_name())
> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${d=
atarootdir}', meson.project_name())
> +               ]
> +       )
> +
> +@@ -250,7 +250,7 @@ if get_option('libraries')
> +               filebase: 'wayland-client',
> +               variables: [
> +                       'datarootdir=3D' + join_paths('${prefix}', get_op=
tion('datadir')),
> +-                      'pkgdatadir=3D' + join_paths('${datarootdir}', me=
son.project_name())
> ++                      'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${d=
atarootdir}', meson.project_name())
> +               ]
> +       )
> +
> +--
> +2.37.2
> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.22.0.bb
> index 26bad580eb..17e4a0cd98 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
> @@ -15,6 +15,7 @@ DEPENDS =3D "expat libffi wayland-native"
>  SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/$=
{PV}/downloads/${BPN}-${PV}.tar.xz \
>             file://run-ptest \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
>             "
>  SRC_URI[sha256sum] =3D "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936=
ebb7e7cbc2425842"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105288): https://lists.openembedded.org/g/openembedde=
d-devel/message/105288
> Mute This Topic: https://lists.openembedded.org/mt/101683693/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

