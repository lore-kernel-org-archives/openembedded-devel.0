Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E7DC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 15:05:34 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.13571.1743779133514845874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 08:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k146yW/V;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f9832f798aso1153402b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743779133; x=1744383933; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDasxBBPMUyLz5M61w4EHgcRAnFSBrRWR9jSOSot/LQ=;
        b=k146yW/VhePJxWeEfKcOzGAMaadtn+o4Q6UyecT8UatDd4qkTplvReEPK51+UdIevg
         KxE2aTVWO3R2sZvXasCNF0ubQ3urz5Nx/8qUoUu4dfXWPL/Gcei9EuoxyW1QzIB3GkfA
         Oxuicr1bwa4c8hRQibhmadhrIxjJStL8sWL6I0byB7B9zafqHhgH8/DcHo1SoaD9HVN5
         GV/uUpZtE7gaOptJ0BxdZ/vf7LqNnRBFP3mYzwB/TTErGK+xKdJL8TpueCa1rrOuEJUE
         nxJN4oCVkVL5Xnp95CLk0Q/31fBjaTZtqhhkE8S8zVmF5U57ZPGty3ezR53dIksUvY2x
         okrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743779133; x=1744383933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nDasxBBPMUyLz5M61w4EHgcRAnFSBrRWR9jSOSot/LQ=;
        b=k2a7+E3TL5SznZUSmnyBH+dt0sIXp2w7cKnoLqOXvmrKy4+Jlr3DDTtsI7lPNUIHqg
         OIHV6sMOhozP7mqtAllWt+aXUzhnHTchbEqWZ7H+U0yQ5BcmYKH2dsYkTO7X5S+h01Qi
         5kF5oYIM1frSqhwSrEcmX0eBcQgOWsjHxcVtnV5AVMxM5iQDqTVWVPHr/eECI/cDjdwV
         sQxvh709PEc77mWhPN3hkzEkHyp3Dy5vurKJZ+l60SBd2wGZ5Z1sUa3Z0mat/h9txX8m
         Iyj3J/q6unKmePXUyrbRqC3vIyX4o9Ihg+1fC1TvHrBPcK3DTDIEz59lRMltOgw/0g2g
         jBVQ==
X-Gm-Message-State: AOJu0YwNH466CoRnE1Ouij74GziWD0TOhx4YmEGMi9l8dqV+jGIuKEgO
	JkNRxRLopGT9wEWyKy9mD+fpyawJGCLXwiDyI/oT2wcezEB8UX5Xm5XtnU/QZBoohLono9aFIIe
	/11gJ8MKtf0yGQfHL4S01tMZPXNA=
X-Gm-Gg: ASbGncvzhduaarixMb3ky4xCDU6n7pvPeOnRR8gtfWaExwkOCeg40jvz+7gN+YeiAwg
	ps87oxdZjz6mAWr5BQ6+1WFwHUzLX/hlmqwTywLjejoVzrO2zd42KYg0yujGdQ75DujwH7uxCzy
	JR7PLl52vZ9BSroBqLvO0mx1UtEw==
X-Google-Smtp-Source: AGHT+IGeOtgepwOzXpOCSswIfRKQ+4CTWzG2tnh7geSIgbmDdYwTxqPzjKB14nGESHAj6i26rPE58wzpJ/oQqhZxhoc=
X-Received: by 2002:a05:6808:159a:b0:3f9:4bab:da6 with SMTP id
 5614622812f47-400455a3681mr2315671b6e.15.1743779132626; Fri, 04 Apr 2025
 08:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250403204412.1686638-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqQBe535z056kEL6RSHqnaAgELjTPRghwfQo_1N+UPkmw@mail.gmail.com>
 <c13725c6-ebda-46fc-8241-c15455425cf1@windriver.com> <CAMKF1sory-jGJB3QuboBfr9-9HP6VVWB_R-DmL+zxnSE9fVE2A@mail.gmail.com>
 <8a4ec48b-65ce-4d10-93cd-1cfaca18493b@windriver.com>
In-Reply-To: <8a4ec48b-65ce-4d10-93cd-1cfaca18493b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Apr 2025 08:05:05 -0700
X-Gm-Features: ATxdqUECZOHExU7hbupcXenM-Q94kfi9Tea_ug31jUSaAYOXlI4Mlmd1dE9TSsY
Message-ID: <CAMKF1spkaSYMajkTtcZ5Xr_RCKJn4eW=LE_oOkDjcU=F7UrC_g@mail.gmail.com>
Subject: Re: [oe] [PATCH] valkey: update from 8.0.2 -> 8.1.0 (Actually nano)
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 15:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116588

On Fri, Apr 4, 2025 at 7:39=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2025-04-03 8:56 p.m., Khem Raj wrote:
>
> On Thu, Apr 3, 2025 at 5:33=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>
> On 2025-04-03 5:03 p.m., Khem Raj wrote:
>
>
>
> On Thu, Apr 3, 2025 at 1:44=E2=80=AFPM Randy MacLeod via lists.openembedd=
ed.org <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Release notes:
>    https://github.com/valkey-io/valkey/releases/tag/8.1.0
>
> The license file checksum changed because upstream added the line:
>    SPDX-License-Identifier: BSD-3-Clause
> Add OECONF to avoid build-time checks for strcase[str|cmp], both of
> which have been in glibc and musl for > 10 years so it's sensible to
> default to yes.
>
> Why do they fail I wonder
>
> I dug a bit but wanted to get the package update in.
>
> I looked a bit and it seems that gnulib got updated
> https://git.savannah.gnu.org/cgit/nano.git/commit/?id=3Dc7033324a9e31d7b0=
0454db04496880e889d32f0
>
> Thanks.
>
> which perhaps added new logic which is not working in cross compile maybe=
 ?
>
> Lots of strcase* changes:
>
> =E2=9D=AF gl --grep strcase 4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1d=
aedcb4c6c653dfc2936847dfe55f5a076d94b
> 706178a93b   2025-02-21   getlocalename_l-simple: New module.
> e21236c305   2025-02-20   *_l: Fix mistake.
> 439b7f4de8   2025-02-17   strcasecmp, strncasecmp: Fix compilation error =
on MSVC.
> 9b269e666a   2025-02-16   strcasecmp_l: Add tests.
> 6fafa36c51   2025-02-16   strcasecmp_l: New module.
> a8fa6e6314   2025-02-16   strcasecmp, strncasecmp: Work around Solaris, C=
ygwin bug, part 3.
> ff91cd3ce3   2025-02-16   strncasecmp: Work around Solaris, Cygwin bug, p=
art 2.
> 557f0e4958   2025-02-16   strncasecmp: Work around Solaris, Cygwin bug.
> fc6bec11ff   2025-02-16   strcasecmp: Add tests.
> 9980b9e526   2025-02-16   strcasecmp: Work around Solaris, Cygwin bug.
> 6abed08f2c   2025-02-16   strcasecmp, strncasecmp: Fix header reference.
> f656293f0e   2025-02-16   c-strcasecmp, c-strncasecmp: New modules.
> c17d70aaae   2025-02-16   strings-h: Don't declare strcasecmp, strncasecm=
p without the module.
> b2927d1b1f   2025-02-16   strcasecmp, strncasecmp: New modules.
>
> =E2=9D=AF gl 4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1daedcb4c6c653dfc=
2936847dfe55f5a076d94b | wc -l
> 435
>
> =E2=9D=AF gl --grep strcase 4631e9b4d5d3bd5ba42864c7001cf3509a00c7b3..f1d=
aedcb4c6c653dfc2936847dfe55f5a076d94b | wc -l
> 13
>
> The old commit id was on:
> =E2=9D=AF git branch -a --contains 4631e9b4d5d3bd5ba42864c7001cf3509a00c7=
b3
> * master
>   remotes/origin/HEAD -> origin/master
>   remotes/origin/master
>   remotes/origin/stable-202501
>
>
> I'm busy today but sometime next week,
>
> I'll learn about gnulib, re-work this update and report the problem to up=
stream to gnulib devs if needed..

thanks for following up.

>
> ../Randy
>
>
>
>
>
> It's not a key package so whatever.
>
>
> ALSO: I need to resend with a corrected subject line!
>
> It's nano, not valkey - copy pasta!!!
>
> v2 sent.
>
> ../Randy
>
>
> Adjust the patches using devtool and manually munge the Upstream-Status-e=
s.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb}    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-support/nano/{nano_8.3.bb =3D> nano_8.4.bb} (75%)
>
> diff --git a/meta-oe/recipes-support/nano/nano_8.3.bb b/meta-oe/recipes-s=
upport/nano/nano_8.4.bb
> similarity index 75%
> rename from meta-oe/recipes-support/nano/nano_8.3.bb
> rename to meta-oe/recipes-support/nano/nano_8.4.bb
> index d1af89ef8d..1aae49d3b6 100644
> --- a/meta-oe/recipes-support/nano/nano_8.3.bb
> +++ b/meta-oe/recipes-support/nano/nano_8.4.bb
> @@ -13,10 +13,17 @@ RDEPENDS:${PN} =3D "ncurses-terminfo-base"
>  PV_MAJOR =3D "${@d.getVar('PV').split('.')[0]}"
>
>  SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz=
"
> -SRC_URI[sha256sum] =3D "551b717b2e28f7e90f749323686a1b5bbbd84cfa1390604d=
854a3ca3778f111e"
> +SRC_URI[sha256sum] =3D "5ad29222bbd55624d87ea677928b3106a743114d6c6f9b41=
f36c97be2a8e628d"
>
>  UPSTREAM_CHECK_URI =3D "https://ftp.gnu.org/gnu/nano"
>
>  inherit autotools gettext pkgconfig
>
> +EXTRA_OECONF =3D " \
> +    ac_cv_func_strcasestr=3Dyes \
> +    gl_cv_func_strcasecmp_works=3Dyes \
> +    ac_cv_func_strcasecmp=3Dyes \
> +"
> +
> +
>  PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116546): https://lists.openembedded.org/g/openembedde=
d-devel/message/116546
> Mute This Topic: https://lists.openembedded.org/mt/112047294/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux

