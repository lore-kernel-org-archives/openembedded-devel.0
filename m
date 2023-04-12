Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FF9C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:02:59 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.51230.1681322579258504389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Apr 2023 11:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iKoRw1O4;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1878a0bf68fso181751fac.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681322578; x=1683914578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7+mSy44KBEsriii32wbtQTtDDhLltyDafHvDmt2Q1s=;
        b=iKoRw1O4dOlJpCwn6kihO7/aJ/UGZgt8wBLevu0QyG8Pkgb9A4Bp4RfusV7R6cZuL2
         KvTKoiXIq2OgwMmR464fJ+75AmRMv+9x9uj75AQonJW3oi/5XdDrf3woEoJAG/Rctazp
         EBK+EcfZ1T/KqbqjeeNIxsZ3l+sAv9k5m5zZ36fl4c5ipgJcIk8tSyXcONSGgNg62WxK
         Iujo8xFdDgx+fhPpSulBI9qegl4z8ICfoWqaTtHL0vmM66RE0CaIp3loOKtOn0Ari+aE
         /E/dEs9339vhizPxcaFbehuJZlcrRKHISLNPxzULNZH3u4IXBbYly4RzZ2yUqP0jkV+i
         GWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681322578; x=1683914578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7+mSy44KBEsriii32wbtQTtDDhLltyDafHvDmt2Q1s=;
        b=NZaff0yrfp/hzo7N5r8EmTjGwulCnDI0CM+b/Y0KkV+NhRo45+ivgyhNvQxzE+OauK
         Kb3HFLkbnhAHnBbRQPn9/yaoujhl7NdCZXDN5eopSKrapt9W7yTkbIBRPzcNjJQoLdtW
         eO0LSRHaymYaEZMXCfygwNdOakB+KoMMs6VAeFzmhhMTyGjrTFYkQ+pScdlxe2Nqv2U+
         jbjfLH1T65APe9Mut56QiqDpknYcWVnOaKljyhhZ1IbuH6kcH24eKMadmEBxzEZFavfw
         09YbUVsHgnUwqxHoQg1o9F3oVJRTZ2ILpw9tx5BsPTeUlmwjjM5+FxrtdvRw7SQk5fkq
         7b+w==
X-Gm-Message-State: AAQBX9c+Q1oi2mTQQIufRCZaN20inB0dEAamf95dAg1BjIF7Z9hMVkzS
	OsHPBeKudzceI835DxVP/Bcmir7c2Tva45kH+x4=
X-Google-Smtp-Source: AKy350aY3hudNf9sYiUxHXeI0MrK33WRw0A3EFjY/danSL2p5iRCLwCMpiYa9uH2QAfumVCX1t5Mx1qe4SY0EsMW+f0=
X-Received: by 2002:a05:6870:b608:b0:184:5ab4:804f with SMTP id
 cm8-20020a056870b60800b001845ab4804fmr1565483oab.2.1681322578355; Wed, 12 Apr
 2023 11:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412173157.365778-1-f_l_k@t-online.de>
In-Reply-To: <20230412173157.365778-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Apr 2023 11:02:32 -0700
Message-ID: <CAMKF1sq7JLbJuELSTUVBb+dA4WkGHL+zscT_v+ftW1=dSZmPgA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] xdg-desktop-portal-wlr: update
To: Markus Volk <f_l_k@t-online.de>, Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Apr 2023 18:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102066

We need this on mickledore as well.

On Wed, Apr 12, 2023 at 10:32=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:
>
> There is not a new version released yet, but this update has lots of fixe=
s
> and adds features for recent pipewire and hyprland support.
> But most important ... without the update it will cause a 30 sec. delay t=
o
> the start of various gtk apps in combination with current xdg-desktop-por=
tal
> release.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../xdg-desktop-portal-wlr/xdg-desktop-portal-wlr_0.6.0.bb      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-d=
esktop-portal-wlr_0.6.0.bb b/meta-multimedia/recipes-support/xdg-desktop-po=
rtal-wlr/xdg-desktop-portal-wlr_0.6.0.bb
> index a72116154..38389276f 100644
> --- a/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
> +++ b/meta-multimedia/recipes-support/xdg-desktop-portal-wlr/xdg-desktop-=
portal-wlr_0.6.0.bb
> @@ -19,7 +19,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl wayland"
>  SRC_URI =3D "git://github.com/emersion/xdg-desktop-portal-wlr.git;protoc=
ol=3Dhttps;nobranch=3D1"
>
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "0a8bfa14607022a080f8b6eabc4757d1918d3cd9"
> +SRCREV =3D "6737c209578e7f17536dbcb8fb2169dcf86ce528"
>
>  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
systemd', 'basu', d)}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102065): https://lists.openembedded.org/g/openembedde=
d-devel/message/102065
> Mute This Topic: https://lists.openembedded.org/mt/98224431/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

