Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE68BC77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 15:41:35 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.11866.1680882088769920817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 08:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SyTFnp5o;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-17aa62d0a4aso46017348fac.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680882088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpEIxhUZZTXQxyYpNTJzTA3zGsT1YhCU+p0g+AS+/9s=;
        b=SyTFnp5ooL78qzgOIo5EnQD9Mhv9sZUrgWIVaYYCKGcT0xUF+Y7nl0SwJiPKrvdgoT
         44DQUxS110rm7NUaec4vfGM46M4zyS0TYHo8oI6516zAt7hreVVgVGS6e09ZX9IqqyfU
         BPmdWuwX0xmd3FynG1iqOYYqmU57t76APDddMQO6IhTj4JP+kvR4EdFBI6EMHfr3AksI
         ogf/2j85VSdVeVRWdyItWTBscZHYSHk3j1Gso0D6FXUzHI1JKpiWUsm6a8dYSglsZI3R
         19T/YHDRx7A+W9DFaXVKJ40lCXgxyRKiJWJKB0tJJ6mfUfPGH40MAbNma1iqLvX+ZLcZ
         oWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680882088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpEIxhUZZTXQxyYpNTJzTA3zGsT1YhCU+p0g+AS+/9s=;
        b=anXQzPKH6xEGI7Z98CJdOdqofZTJa2JuxCYTuUpNQkNrLpl6qO4WX/aCAXlcjllyhu
         OnWtcnTLfaxZuYtEGPSHBMD78jMIX25qdg1n55uzGAffwEpngFhYBmlGaSJrrUmZ+q9Z
         RqHUf5tMYD3fUfcFFPJbRCGJpac7hV1ldhqQrEnVKQI4FsEv5g6nv1jSlQacipriNrz0
         QMDb+ug0fOlST4set6QnAZjyfDOO2jZ/psrfbnXCpl+c/ZIvMtuuylimTDEIZmud+I7n
         r/Nd/4MWR58RyhFRW3ew+hx1hQicn5aVD0qmZY3yfFclRaSwlZ03qhalYPEiRDjIqhNL
         3esg==
X-Gm-Message-State: AAQBX9e9q0FPuhjF0+K56lCOfDur/GW/TXq5zIjQCrM3NIxf4XZEI8FG
	/309sHYb+l45+YL/x+x0v3bdQv/AwXnnSCOUScHxpOoC
X-Google-Smtp-Source: AKy350bDmecz8gIPq/K2/CcAObfeIxHHZt9KHEAt6tK0f3iC6CqnNV8Tu0e3tYZFGMpmRVh18VR6PWnVNAfQn1Zq70s=
X-Received: by 2002:a05:6870:55:b0:177:c436:feb8 with SMTP id
 21-20020a056870005500b00177c436feb8mr1263844oaz.4.1680882087799; Fri, 07 Apr
 2023 08:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230407091722.5576-1-kai.kang@windriver.com> <20230407091722.5576-4-kai.kang@windriver.com>
In-Reply-To: <20230407091722.5576-4-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Apr 2023 08:41:01 -0700
Message-ID: <CAMKF1sqBB86gAtOkPZ=8WBPxup8Y46TzMc_LKJ0GC3rih9_jag@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 4/4] xfce4-screenshooter: 1.9.10 -> 1.10.3
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 15:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101987

On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriver.com=
> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update xfce4-screenshooter from 1.9.10 to 1.10.3
>
> * update HOMEPAGE that goodies.xfce.org has been decommissioning
> * content of license file has been updated

Its vague and does not state what has changed. Can you add some more
info towards what has changed ?

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...creenshooter_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1=
.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} (66%)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.10.3.bb
> similarity index 66%
> rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoote=
r_1.9.10.bb
> rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_=
1.10.3.bb
> index bb44ec782..10427dab3 100644
> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.=
10.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10=
.3.bb
> @@ -1,13 +1,13 @@
>  SUMMARY =3D "Application to take screenshots"
> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-screen=
shooter"
> +HOMEPAGE =3D "https://docs.xfce.org/apps/xfce4-screenshooter/start"
>  SECTION =3D "x11/application"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599=
855"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  DEPENDS =3D "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2=
.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-perl-native"
>
>  inherit xfce-app perlnative
>
> -SRC_URI[sha256sum] =3D "04b4178527f5b98cfe76ae427e95581067edf262a530639d=
332f6db9a68292d7"
> +SRC_URI[sha256sum] =3D "a454159847becfeca274a5b58c0e5817d4a260a29345a37b=
bc3b4ff46f8f3818"
>
>  do_compile:prepend() {
>      mkdir -p lib
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101981): https://lists.openembedded.org/g/openembedde=
d-devel/message/101981
> Mute This Topic: https://lists.openembedded.org/mt/98121607/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

