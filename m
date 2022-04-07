Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1036C433FE
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:13 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.863.1649290679337320084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVd/5FLw;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id i4so6894921qti.7
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zaK7I1xX0heaSF0DxHE4AHj6Z50VAssThBm44tkOIts=;
        b=hVd/5FLwBZ+wgn8LcGBOr1BKM89DffHQMN1hLNwOzGIWJR1WfLNmRXVFL9wCeuDwJr
         HruwUF2kZjhugTUc6ElGitBZcu4LU2oxLGDh+5lVzaeFklePT4M3do+2guBztUaSu5L8
         Vv68AMtGcnt64vVUMm7g94i03lxeEpJtsT4MZRkpnwYkPFegZaMCuAaFoJCYOpkqz1fC
         KlnEmeyWQmRGqZiRwBq6pUHChUfLNcQplQnhTbrc4BXiUBmsj5HZ6FFt28dAAGQ0CSS8
         wppZ1ljcewaq25Q3LFch/dz3wwlEGOCuQt+YN0z9Jv3P86R3AgfQofqsYKccFF6jMTsU
         5T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zaK7I1xX0heaSF0DxHE4AHj6Z50VAssThBm44tkOIts=;
        b=3rR9+wGo4b1hDDbh/VrXpTOfw+OfjNOMIxovGf/iBKpCBuvwHirEAOD9ApKgjeaezt
         g8rXaiNCeqVEyoC4ovCXvYIk1k6XncPnlbdcldodmMEF3grWxpic5wpzLQkKHe3HImq8
         DzjH4aKUUTw/IOGZH93/wcZ5CNufwHlG7YD7gzN9Wa1xeVq56YHuKRyK/daNfb+AmjpS
         PDBGf5w8a0pqrYU97XZEHkDMNbXX52a6NOHMpDgtcS3XYAh2ViKpctCVo8gus1262SQj
         OPTg+HZYiqBeHLdQBw59X7Fo3C0SeH8rnUF8aim1MmldzLT/VSehnnDDcAagn3bFw7DM
         hdAg==
X-Gm-Message-State: AOAM530S+0iQgrv5GddFRuVSy6fqNDAdNPzrS2Qp7XH7DyS7LfGUPVQc
	R1YTT2/4DsZjkxI614F0aIa6o480lgzXsNKbCYw=
X-Google-Smtp-Source: 
 ABdhPJwl77wMxrWrVoMJ2WP7V5o/iBfUSGYh9n8MXcdHdzT0MfC4a9ii54/4qlppd0K3hswT0nQeKwhM+V18uWhcz6M=
X-Received: by 2002:ac8:5a84:0:b0:2e1:4f1d:36fb with SMTP id
 c4-20020ac85a84000000b002e14f1d36fbmr9707228qtc.54.1649290678353; Wed, 06 Apr
 2022 17:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220404141948.3373-1-f_l_k@t-online.de>
In-Reply-To: <20220404141948.3373-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2022 20:17:32 -0400
Message-ID: 
 <CAMKF1srnu9-T4id=oC0wAvGVXtAu3AzaXPjj3_B=crcOtT12qg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gparted: update to v1.4.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96441

fails on musl

https://errors.yoctoproject.org/Errors/Details/654013/

On Mon, Apr 4, 2022 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> - remove x11 features-check because there aren't dependencies that would
>   explicilty require x11 as a DISTRO_FEATURE
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> GParted 1.4.0   (2022-03-28)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>
> Release Notes
> -------------
>   This release of GParted includes enhancements, bug fixes and
>   language translation updates.
>
>   * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems
>   * Fix detection of mount points for encrypted file systems
>   * Fix crash scrolling quickly in the drive selection combobox
>   * Add bcache detection
>   * Add JBD external EXT3/4 journal detection
>
> Bug Fixes
> ---------
>   * Add labelling of mounted btrfs, ext2/3/4 and xfs file systems (#163, =
!87)
>   * Fix detection of mount points for encrypted file systems (#162, !88)
>   * Fix unmount error when unmounting below a bind mount point (!89)
>   * Fix crash scrolling quickly in the drive selection combobox (#165, !9=
1)
>   * Add initial Indonesian translation of help (!90)
>   * Add accessibility relations for screen readers like Orca (!92)
>   * Fix partition creation at sector 2048 if partition before it (#172, !=
93)
>   * Make more getter methods use return-by-constant-reference (!94)
>   * Check copy destination instead of source (!95)
>   * Add bcache detection (#183, !96)
>   * Add JBD external EXT3/4 journal detection (#89, !97)
>   * Fix translation of DocBook markup tag of the GParted Manual (!98)
>
> Code Credits
> ------------
>   Code enhancements are courtesy of Movie Ma, Pascal Eng=C3=A9libert, and
>   Mike Fleetwood.
>
> Translations (new/updated)
> --------------------------
>   cs(Marek =C4=8Cernock=C3=BD), da(Alan Mortensen), eu(Asier Sarasua Garm=
endia),
>   fur(Fabio Tomat), he(Yaron Shahrabani), hr(Goran Vidovi=C4=87),
>   hu(Bal=C3=A1zs =C3=9Ar), id(Andika Triwidada), it(Milo Casagrande),
>   ko(Seong-ho Cho), lt(Aurimas =C4=8Cernius), lv(R=C5=ABdolfs Mazurs),
>   nb(Kjell Cato Heskjestad), nl(Nathan Follens), pa(A S Alam),
>   pt(Hugo Carvalho), ru(Aleksandr Melman, Sergej A), sk(Du=C5=A1an Kazik)=
,
>   sl(Matej Urban=C4=8Di=C4=8D), sr(=D0=9C=D0=B8=D1=80=D0=BE=D1=81=D0=BB=
=D0=B0=D0=B2 =D0=9D=D0=B8=D0=BA=D0=BE=D0=BB=D0=B8=D1=9B), zh_CN(Luming Zh)
>
> Dependencies (new/updated)
> --------------------------
>   * n/a
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gparted/{gparted_1.3.1.bb =3D> gparted_1.4.0.bb}           | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-extended/gparted/{gparted_1.3.1.bb =3D> gparte=
d_1.4.0.bb} (83%)
>
> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-=
gnome/recipes-extended/gparted/gparted_1.4.0.bb
> similarity index 83%
> rename from meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> rename to meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> index d1a975930..d1297b5a2 100644
> --- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
> +++ b/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb
> @@ -3,16 +3,15 @@ HOMEPAGE =3D "http://gparted.org/index.php"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
>
> -inherit features_check autotools pkgconfig python3native gnome-help gtk-=
icon-cache
> +inherit autotools pkgconfig python3native gnome-help gtk-icon-cache
>
> -REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  SRC_URI =3D " \
>      ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV=
}.tar.gz \
>      file://0001-Install-polkit-action-unconditionally-executable-pke.pat=
ch \
>      file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \
>  "
> -SRC_URI[sha256sum] =3D "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021e7=
d12a5a98a1d1e109"
> +SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330da93=
1a468bf3687887be"
>
>  UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gparted/files/g=
parted/"
>  UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96382): https://lists.openembedded.org/g/openembedded=
-devel/message/96382
> Mute This Topic: https://lists.openembedded.org/mt/90242693/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

