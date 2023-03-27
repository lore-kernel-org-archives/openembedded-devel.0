Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A48C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:24:50 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.38531.1679930684450224414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 08:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VNlc0osT;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17ab3a48158so9646817fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679930683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKhJDA1zvugJXUNE4s3mR4S9s7WesE4RuKT9Jw9VrV8=;
        b=VNlc0osTenS99m5VjVio0du22SUW+ApRofsCNpUyxlLPXH/fuuAMdI5P8gutzhNspP
         rPAIXITvKQGmK5E3Iqig9SP8EqU9ULg47Rx3F1LXh3TMA226MXltYd9XpQZ557EPmMOv
         FrocS9/4XYEDuYsnOtBDaafruq6OVo1EgwIDiJMzmqC8X38TrptqGjjvtmh8Zv/CJZUE
         guu/ex8+xydZ8+pPe/32V3wbvkm4vSSpVPrCfln1rJgUubaBZP47l61OPeu3B98dZWMZ
         hnn8eKzMg45fYFEOj0ruiELePuaOFlXEP0RNHwzTrWOLzlGZ2ixY3zbA9eEcOAHCdRKt
         F4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679930683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKhJDA1zvugJXUNE4s3mR4S9s7WesE4RuKT9Jw9VrV8=;
        b=WOr2LZpvfzhGLfggl7IpNopOzLu2oLO17Q5DAUFKIEShsQTO57w+mthUsms+nbf4ge
         RUa4qBQaDbgFom+v+d/faMr6ySeqRXxb3ZhA/SMk2FVY7Ud5wZ+iR+SaNyAoQ4uWC1FJ
         gzCYMWZsvZ3HMc6N7OPuIOUGN01AqdeUBx88eHVsLFyqKig/dXq88jntOuXy/UD2UnFa
         muJEGTrBPyaxG/5P1k/MrD2qDoUYTXYlurQCfrhpLLGxHIjQCuDVWCTMq1SXSdCfigjo
         gjl6COJFmLeE+syPeSz0tz0KxE7dHejROMFGSGhTmrrlVIllP+ohV7noaXbOLC0kW+nB
         Vowg==
X-Gm-Message-State: AAQBX9etovAW2tv9J4dysrvKikU39kv6DREq7Dwe4K08gkweXrqzuYYW
	2O8QHKAUjdO6C8zxaVq4xX+yJITVG9Rkbp1daSbZhp5TC3o=
X-Google-Smtp-Source: AKy350ZJ4BSSzIsPpu83eqj+iH67u83RrOMJYZIaRg4G4vJDyW99E/GkSmuSyxSHG401f13Z9iDDjJMWi6xlNwltSIc=
X-Received: by 2002:a05:6870:55:b0:177:c436:feb8 with SMTP id
 21-20020a056870005500b00177c436feb8mr4557413oaz.4.1679930683155; Mon, 27 Mar
 2023 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1679886213-20913-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Mar 2023 08:24:17 -0700
Message-ID: <CAMKF1spQzLNAwG_7xEVdoVMwcWXKts545QuTjma=-7HDXh=g=w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.98 -> 0.1.102
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 15:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101787

This also would need updating gimp perhaps
https://errors.yoctoproject.org/Errors/Details/698787/

On Sun, Mar 26, 2023 at 8:04=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Brown paper bag release - LUT code-paths now disabled by default.
> Stop double processing with LUT+normal fishes.
> Support for non-ASCII characters in file paths on windows. Improved wrap =
build
> support.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-gimp/babl/{babl_0.1.98.bb =3D> babl_0.1.102.bb}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gimp/babl/{babl_0.1.98.bb =3D> babl_0.1.102.bb=
} (87%)
>
> diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb b/meta-gnome/rec=
ipes-gimp/babl/babl_0.1.102.bb
> similarity index 87%
> rename from meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
> rename to meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
> index a9e192b75..b12dc162f 100644
> --- a/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
> +++ b/meta-gnome/recipes-gimp/babl/babl_0.1.102.bb
> @@ -15,6 +15,6 @@ CFLAGS:append:toolchain-clang:mipsarch =3D " -ffp-excep=
tion-behavior=3Dignore "
>  CFLAGS:append:toolchain-clang:riscv64 =3D " -ffp-exception-behavior=3Dig=
nore "
>
>  SRC_URI =3D "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
> -SRC_URI[sha256sum] =3D "f3b222f84e462735de63fa9c3651942f2b78fd314c73a22e=
05ff7c73afd23af1"
> +SRC_URI[sha256sum] =3D "a88bb28506575f95158c8c89df6e23686e50c8b9fea412bf=
49fe8b80002d84f0"
>
>  BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101754): https://lists.openembedded.org/g/openembedde=
d-devel/message/101754
> Mute This Topic: https://lists.openembedded.org/mt/97874710/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

