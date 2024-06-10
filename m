Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E48D9C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 18:27:42 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.27211.1718044060643937115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 11:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bj0taxw4;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-254a370e7a4so813120fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718044060; x=1718648860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BBheLhPjPMPVRoaKEjMuDNRcmhpr7gYyAsP9XhUDUY=;
        b=bj0taxw4EFCfrR35FplvwcIKBUgFSpJ1BA0yWxEoXMDq+iTr9CvE1TCQolCw7nsz2I
         5ANkJcjNkUTWupdXwZ2uc+GVGVoqwCP3F0qY0W/7L5OCDxb4xgmvumycRT2xe+bgFJAx
         fjU9/+8kiEkkSPBpPpIeiEJumZd13wXGZEUNEtERr6CLXWCcTuBIAE19N5X+CxsPWPVR
         dLZNensNFLH+bHBa/uuESOILzsBcXWxdI84kNiQOE2T0ZffLQGtLBdyp3E9p3pFJu+VF
         xeGQq9PSO4tfITShjOdBD+5fZQKMpYQIfFbdS17pWO2+zSAMlBjvAi3x0u0oqJi83YaZ
         /ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718044060; x=1718648860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BBheLhPjPMPVRoaKEjMuDNRcmhpr7gYyAsP9XhUDUY=;
        b=Q54dQnbxdP7f+3xfxPzF2tJycRNv0Mpgq3HHc47CDsXjGUQ9AvDtBZh9G5Eje1Ppy0
         +rYjwPknG8cRZDZBdR0sBSZiBvUzyVa+0KyJrDYx5ViwaVKeqKgmrfsUet0kmOd0FQO1
         meqdIX3XFNDjUzsLz80FVNgJgQpufCOYb/qHrUywFctAI/5asGrnbd/T9hm8AIOC3opv
         TuHugvDtB3D9gSNhQ2wpcH+jZeL6R99yzbotrPc62+9xWkUTBB1TYuxNIRu4iD3QIirD
         0XHNxKMp5MA2ijFLZi7rljdqjoave8c0vcvmcV/x6UAIP3FNrMrAssnuUR/KZl5TbS6U
         /Ybw==
X-Gm-Message-State: AOJu0YwEVj/5Ao8JN03+6ywWqhMiHBOpYY1AUqVFnd0lus1RjWB7af8l
	J8xmUZHSgNZzJj2DWk50dek2y9lQNpQ3CuE3aNVaDlXOF9E9UnZ3LAI/L7lp0TaXPpB02CEt+6R
	j23EYK4H6APIrsQ+F1JKXMc3V9/s=
X-Google-Smtp-Source: AGHT+IENiGJA8SHaxJdlIiAEO7QjWGpJhzm6JSxvFlRns0UxJ97QWlGBh0BHfqqrHC22eruLVlIPrphUGiVksJt0lig=
X-Received: by 2002:a05:6870:1602:b0:254:a157:651a with SMTP id
 586e51a60fabf-254ecca1ccfmr197603fac.9.1718044059804; Mon, 10 Jun 2024
 11:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240610102455.2252749-1-zboszor@gmail.com> <CAMKF1soUxJJPbw-_-+28pzv_KQOO=BU60_-kUs_TwCgAPe8A8g@mail.gmail.com>
 <29127de3-0cb0-45c7-8498-6a2ec9399b3a@gmail.com>
In-Reply-To: <29127de3-0cb0-45c7-8498-6a2ec9399b3a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Jun 2024 11:27:13 -0700
Message-ID: <CAMKF1spnDxXygu3LUWHOA8cL_bG-t3X7YSLLubSLXTXOQaA-qg@mail.gmail.com>
Subject: Re: [meta-initramfs][PATCH] dracut: Drop an unnecessary patch
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 18:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110801

On Mon, Jun 10, 2024 at 10:59=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2024. 06. 10. 16:34 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >
> >
> > On Mon, Jun 10, 2024 at 3:24=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=
=C3=A9nyi <zboszor@gmail.com> wrote:
> >
> >     Dropped 0001-util.h-include-sys-reg.h-when-libc-glibc.patch
> >     that's unnecessary for a long time now, because dracut
> >     (since version 049) does not rely on __WORDSIZE.
> >
> >
> > Does this still build on musl without this patch
>
> It should. The patch description had this:
>

OK, thanks for the pointer, although I was asking if you have
built/tested it on musl
or not.

> "For musl libc it is required to include <sys/reg.h> to
> have __WORDSIZE defined to e.g. 32 for arm*-musl."
>
> Since this commit in version 049, dracut doesn't actually
> use __WORDSIZE:
>
> commit 838f22259a50e5f92429ecdd24b897c1128edc98
> Author: Alexander Tsoy <alexander@tsoy.me>
> Date:   Sun Sep 9 02:47:09 2018 +0300
>
>      install: avoid non-portable __WORDSIZE
>
>      Lets not unnecessarily rely on __WORDSIZE, which is not clearly spec=
ified
>      by any spec. Use explicit size comparisons if we're not interested i=
n the
>      WORDSIZE, anyway.
>
>      Patch ported from systemd.
>      (commit 8507eb20b64010b26f23822cbf442bb0bf96511c)
>
>      Original-patch-by: Emil Renner Berthing <systemd@esmil.dk>
>      Bug: https://bugs.gentoo.org/602122
>
> >
> >
> >     Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> >     ---
> >      ....h-include-sys-reg.h-when-libc-glibc.patch | 35 ---------------=
----
> >      .../recipes-devtools/dracut/dracut_102.bb <http://dracut_102.bb>  =
  |  1 -
> >      2 files changed, 36 deletions(-)
> >      delete mode 100644
> >     meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-s=
ys-reg.h-when-libc-glibc.patch
> >
> >     diff --git
> >     a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include=
-sys-reg.h-when-libc-glibc.patch
> >     b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include=
-sys-reg.h-when-libc-glibc.patch
> >     deleted file mode 100644
> >     index 68ec2b8fd..000000000
> >     ---
> >     a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include=
-sys-reg.h-when-libc-glibc.patch
> >     +++ /dev/null
> >     @@ -1,35 +0,0 @@
> >     -From 9f7740c4c2fda64029c23674e9858ce8bd4367df Mon Sep 17 00:00:00 =
2001
> >     -From: Khem Raj <raj.khem@gmail.com>
> >     -Date: Thu, 13 Jul 2017 17:14:05 -0700
> >     -Subject: [PATCH] util.h: include <sys/reg.h> when libc !=3D glibc
> >     -
> >     -For musl libc it is required to include <sys/reg.h> to
> >     -have __WORDSIZE defined to e.g. 32 for arm*-musl.
> >     -
> >     -Taken from void-linux
> >     -https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dra=
cut/patches/musl-__wordsize.patch
> >     -
> >     -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >     ----
> >     -Upstream-Status: Pending
> >     -
> >     - src/install/util.h | 3 +++
> >     - 1 file changed, 3 insertions(+)
> >     -
> >     -diff --git a/src/install/util.h b/src/install/util.h
> >     -index a6f9a184..82732913 100644
> >     ---- a/src/install/util.h
> >     -+++ b/src/install/util.h
> >     -@@ -36,6 +36,9 @@
> >     - #include <sys/stat.h>
> >     - #include <dirent.h>
> >     - #include <sys/resource.h>
> >     -+#if !defined(__GLIBC__)
> >     -+#include <sys/reg.h>
> >     -+#endif
> >     -
> >     - #include "macro.h"
> >     -
> >     ---
> >     -2.17.1
> >     -
> >     diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb
> >     <http://dracut_102.bb> b/meta-initramfs/recipes-devtools/dracut/dra=
cut_102.bb
> >     <http://dracut_102.bb>
> >     index 496380a0f..39ff265a3 100644
> >     --- a/meta-initramfs/recipes-devtools/dracut/dracut_102.bb <http://=
dracut_102.bb>
> >     +++ b/meta-initramfs/recipes-devtools/dracut/dracut_102.bb <http://=
dracut_102.bb>
> >     @@ -9,7 +9,6 @@ PE =3D "1"
> >
> >      SRCREV =3D "1a8ee6e00bbe017717a5ef9e9bcfefb3b88f629e"
> >      SRC_URI =3D "git://github.com/dracut-ng/dracut-ng.git;protocol=3Dh=
ttp;branch=3Dmain
> >     <http://github.com/dracut-ng/dracut-ng.git;protocol=3Dhttp;branch=
=3Dmain> \
> >     -  file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
> >     file://0001-feat-dracut-install-split-ldd-command-arguments-for-.pa=
tch \
> >                 "
> >
> >     --
> >     2.45.2
> >
>

