Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C585BE82CC8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 19:13:17 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.25672.1695841989068964195
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 12:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCntS+73;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so4398457fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 12:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695841988; x=1696446788; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YLiJf1uTAENQhy2WShMMsGIrc4jJYNhadtIMyVboG4=;
        b=bCntS+73uSaxAsPoaNdNGi/UBhjVx77a2+rw9Fddq+GmdyKGDlx8QWttdwJrLZcOy0
         QWRtMC4UW7ghLccxRiOKsaDyrwdDING2ZCoqiE9oFyH+T5AdMuJps+Ve3OpsOYChVvmE
         lMLE+u8BiK/CX2mRLrxcq/z9tEmtxB14EEXeRD02no+JranOvBCpoiIE9kAZeztG/YWw
         IBboGskWVY/8hBAHjGjGcUP3ENTbrVnekdluHTCKvxX5pI4xYhShJWD9bSWjL4aOVgXl
         zEz5P6Geaci584AvFOBUZsnCVcInUJPBMGlex6XqZakHeC439yG/pGI4NTiW9aKX2ULP
         OZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695841988; x=1696446788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YLiJf1uTAENQhy2WShMMsGIrc4jJYNhadtIMyVboG4=;
        b=CU8fU9mTpuZcd7s5weKzUwVkrrmwVG1iP8hr3vPj4yD+f9EYH/KF9eYVmm6YnSiCF2
         obw2LnQk9couvWnVw3P2vSjRe/8sUKNAzRVZ4ikg9Gxy8xNwvRU7PQd+XqAWPykfUKz+
         1qNxYJ6xlSQ54zW+sS63PfMHyFzmn11O6EDdAkIl4LaKnuhNybUjnGMNOtvwlyAwjhjS
         nTxbhNOVM/hXCl79dsuP+GoomKFaw9Q4DSRK0A4a9SpiR0VfEPs7PET13wxIoj4wnN+r
         W9SRitZ7b0H/jFdcYhvzWgKud7ptqfwU1H+Q3llQKyT5FPhesdQW/m0hP6JAy/sGTDC7
         bKGA==
X-Gm-Message-State: AOJu0Yw+OuNAMesbIiaDn8CEFE2HNMvmNCGLhZ5SU/GOUmQsYgszKURv
	94kQ02ZVsex9VthcyWR5dJlMi+990HLGC2KJDG5UNexZ/5M=
X-Google-Smtp-Source: AGHT+IEVZeF4LTX3x2rOQR6ba9YQMPqC0uhpq9HxIH9gENT5cEcZeqeoO5MGjbU2+I8o2yvxE/EBF6ylqXzL5o9uTvc=
X-Received: by 2002:a05:6870:9691:b0:1dc:6f48:504e with SMTP id
 o17-20020a056870969100b001dc6f48504emr3629732oaq.8.1695841988262; Wed, 27 Sep
 2023 12:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230927104920.2052173-1-martin.jansa@gmail.com> <20230927104920.2052173-4-martin.jansa@gmail.com>
In-Reply-To: <20230927104920.2052173-4-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 12:12:42 -0700
Message-ID: <CAMKF1sqibkfMscHLKBu1mphXDgGZk2SK=yPHB=-Zt_kBg6K-MQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 4/4] mozjs: use PV in MULTILIB_SCRIPTS
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 19:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105197

Can you rebase on master-next and resend.

On Wed, Sep 27, 2023 at 3:49=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> * to avoid possible issue next time new mozjs version recipe is
>   introduced (as multilib isn't as well tested as other build configs)
>
> * this depends on oe-core change to expand script name in MULTILIB_SCRIPT=
S:
>   https://lists.openembedded.org/g/openembedded-core/message/188301
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb | 7 ++++---
>  meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb  | 7 ++++---
>  2 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
> index 08cfededa7..f2781d7096 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.15.0.bb
> @@ -66,12 +66,13 @@ do_install() {
>
>  inherit multilib_script multilib_header
>
> -MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js102-config"
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
> +MULTILIB_SCRIPTS +=3D "${PN}-dev:${bindir}/js${MAJ_VER}-config"
>
>  do_install:append() {
> -    oe_multilib_header mozjs-102/js-config.h
> +    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
>      sed -e 's@${STAGING_DIR_HOST}@@g' \
> -        -i ${D}${bindir}/js102-config
> +        -i ${D}${bindir}/js${MAJ_VER}-config
>      rm -f ${D}${libdir}/libjs_static.ajs
>  }
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> index b029c5f4ec..fcdf64c932 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
> @@ -66,12 +66,13 @@ do_install() {
>
>  inherit multilib_script multilib_header
>
> -MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js115-config"
> +MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
> +MULTILIB_SCRIPTS +=3D "${PN}-dev:${bindir}/js${MAJ_VER}-config"
>
>  do_install:append() {
> -    oe_multilib_header mozjs-115/js-config.h
> +    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
>      sed -e 's@${STAGING_DIR_HOST}@@g' \
> -        -i ${D}${bindir}/js115-config
> +        -i ${D}${bindir}/js${MAJ_VER}-config
>      rm -f ${D}${libdir}/libjs_static.ajs
>  }
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105189): https://lists.openembedded.org/g/openembedde=
d-devel/message/105189
> Mute This Topic: https://lists.openembedded.org/mt/101614706/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

