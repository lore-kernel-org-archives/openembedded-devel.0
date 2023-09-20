Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AC4CE79A8
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 00:34:47 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.26530.1695170084959269788
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 17:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CiJ+E2lG;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1bba7717d3bso4104770fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695170084; x=1695774884; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7e/OfT59rKAVtPRaz+GLXNbPzdxiFIBSYTlE4qm6SU=;
        b=CiJ+E2lG9bj5rvm8SD/nDA/mQNv2g9ZoTMhHIlYa+wSd0eMrbhF2vq8b5r9Mg6aTtC
         IIwGuWP9CBg0AYjeyK2TYLvJqehUID9RHsMQKeVrTmrIcLSrE418m2K+J+mKtSXwFnfU
         eAs/sTqchmhDrTvhHYpA2YrX7nfU6t9eC/3oBfUyUHiA6JzuXX5F6NGH+zIv6Pp++MKR
         OwlcLfs3hq0PbdJ9T5g+0hxzT7Wmg56HUbQhbaWMEDs20VJtFI9vBGErcQ7rootINhKn
         0BJ1SMlzPJkduuhwSuso6m+i8pnFU0/XkTsouqF+UiSMCilT/tUikINXe8R31+LIXPcc
         uQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695170084; x=1695774884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7e/OfT59rKAVtPRaz+GLXNbPzdxiFIBSYTlE4qm6SU=;
        b=p5Z+vU+Eip6UjJp15RHKfn7Ifh+WXl22YaGrMLcKMKuHYLpcVU6sr8pasdQdUcfg0S
         FC/13uEaa6YaXFS5nwK0o5gA4vRzIMoYNSkp1A0hxwln961Kuu8stA+iX0Ss+VBKUVX9
         laCMiQfTfVjshRObOzL3n7SbLeClEUSw5vqfD6VUrpsTAejTKQ/YFYpxVgUrYLur8Nko
         8KoVZg2o+t0dgcPb1CXcHGZPa76Z+1TlIZBVWei1m2HbuU5Vz+ebk/PRNvEDylJ5iHC0
         ypb22wncnxeIyZQAIxe5fjswvPa47T5xMWdaha9DDXNbckc5bBo43hm8BCODbwfonqTE
         uLVA==
X-Gm-Message-State: AOJu0Yzis+nEoOoiqo/m7n2l/8cEuLGz2bcxlLzelCco8VfDXEmnyFze
	lrPzl+dY89Lhhl08Dy4YwBx/1vBEOKJwE83cJJI=
X-Google-Smtp-Source: AGHT+IFxhYkMVTODQYaWL/JU3NYhV9pCmBGGwmWA+L2ek/F2A/ytqf1T39MYwCfBzQzq36P4Yas3BTxl6ulhgEZnMmM=
X-Received: by 2002:a05:6870:8a27:b0:1d5:bb9e:a30e with SMTP id
 p39-20020a0568708a2700b001d5bb9ea30emr1161389oaq.34.1695170084126; Tue, 19
 Sep 2023 17:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230918215156.1920452-1-f_l_k@t-online.de> <20230918215156.1920452-11-f_l_k@t-online.de>
In-Reply-To: <20230918215156.1920452-11-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Sep 2023 17:34:18 -0700
Message-ID: <CAMKF1soVDPpjCrJneNQVPwnSPOaMG86e5Xe7s=BzJ6Jh8Vh8vQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 11/18] gnome-calendar: upgrade 44.0 -> 45.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 00:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105004

buildpath QA warning is observed

WARNING: gnome-calendar-45.0-r0 do_package_qa: QA Issue: File
/usr/src/debug/gnome-calendar/45.0-r0
/src/gcal-enum-types.h in package gnome-calendar-src contains
reference to TMPDIR [buildpaths]

On Mon, Sep 18, 2023 at 2:52=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-calendar_44.0.bb =3D> gnome-calendar_45.0.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_44.0.bb =
=3D> gnome-calendar_45.0.bb} (86%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
> similarity index 86%
> rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.b=
b
> rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
> index dcf5ba7d6..7efd486b5 100644
> --- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
> @@ -23,7 +23,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
>
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>
> -SRC_URI[archive.sha256sum] =3D "96acd74cbf45652934515cc3447a3b895e933f86=
324ca92436f67ddd63c3a802"
> +SRC_URI[archive.sha256sum] =3D "8c1483cbba4388db410875ed09d64e9003f929b5=
55d704076a6fe7bd7c1e65b2"
>
>  FILES:${PN} +=3D " \
>      ${datadir}/gnome-shell \
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104938): https://lists.openembedded.org/g/openembedde=
d-devel/message/104938
> Mute This Topic: https://lists.openembedded.org/mt/101444169/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

