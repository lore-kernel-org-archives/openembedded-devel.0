Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04741C47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:26:40 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.5422.1705505191057234634
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aeDQb/cX;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2107f19e331so885430fac.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 07:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705505190; x=1706109990; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U79B0HwG9PECwMfsJkz99C0qClZcuFiOYiBb1NAYSOc=;
        b=aeDQb/cXfcM5PSjmWykd7U7HseuKgho9DGwIXAHJUOhQxk2dcbioREbfD1bM0Egd/R
         76eyI8TPnGBi5dH+up8cNaMTmyBI5VkR2RuiPGHnI0OB+s9flJHUTrLznPpSs5CcOw7D
         v38Y+ewpTgWeYwo2rYlbsRV0MIojJYYCZggOFjM4oUafw4cDzNh+I7I/cLwMYOs1odSz
         /8S55ohkyUTPsMDrQ1Pkb+hPCuotbvyxy//oJzdAGv3MWYA+mRYJEpX+PAHRF/b4yWUx
         g5Bxj7yoxHVIDGVvJm5fMnjkTtt6yaTiOmPKYmfnqVqdqSrt/u+OoChsxuNZ4cMPokxP
         knNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705505190; x=1706109990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U79B0HwG9PECwMfsJkz99C0qClZcuFiOYiBb1NAYSOc=;
        b=Zjo/yw90YKdrnOd0OarcPvdVgbX0qj1YJdU4lpiN6VXkjIPrLvPJGsYVgaUpRCAJjd
         FM8pW4rIlZV330xnmXpmy9y/LbDU/DJWioRatk7Wjfl1vPBw2INWnaSYR3O0ugg1CKiu
         sszVOIMylwjOdhfR4N3vgJRBE3dVRAjbrBVsvybfyvayi7VZ17IE8ZHtkxRS5QiCPmn3
         T5CoAMexTPi5yaXTLa7QNWsnyVI/PjLcePOJiz9hiDByyEWgsDKtJKWCoBcQT3AAJ/jz
         9GFLiqBsgYS99tvCk74pB1Y5uZc19FkA2go5UjW4a/1mWpGF2+4SUvtIRXUzjOQ0T4ml
         beXA==
X-Gm-Message-State: AOJu0Yya9ZcQq1ky7BPdH8Y/+PVlYq/GQiaKniox18mUItb5e8mAPqgT
	hJXmdRQaA5332hFsRfmx91k+gyiiGGY2Db16df0=
X-Google-Smtp-Source: AGHT+IF99luUr4OL61esEpVfACaqtlcjZvWYA2r9tjx3iXLDKnoeQMudpb7mdK2Y9YadPFdRksRacSr0VvapsmDYa8A=
X-Received: by 2002:a05:6871:5ce:b0:210:a8d8:4ff4 with SMTP id
 v14-20020a05687105ce00b00210a8d84ff4mr567882oan.54.1705505190184; Wed, 17 Jan
 2024 07:26:30 -0800 (PST)
MIME-Version: 1.0
References: <20240117082519.3037503-1-yoann.congal@smile.fr>
In-Reply-To: <20240117082519.3037503-1-yoann.congal@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jan 2024 07:26:03 -0800
Message-ID: <CAMKF1sqNjnpWcV8HTwnQiytkN5QJAufAgOv+zA1vvvh-+mF5MA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pytest-cov: Remove unbuildable BBCLASSEXTENDs
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Richard Leitner <dev@g0hl1n.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 15:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108333

how about we add

BBCLASSEXTEND =3D "native nativesdk"

to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb

On Wed, Jan 17, 2024 at 12:26=E2=80=AFAM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
> Since the python3-coverage dependency has neither native nor nativesdk
> BBCLASSEXTEND, remove these to avoid triggering warnings on universe
> builds.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> CC: Richard Leitner <dev@g0hl1n.net>
> This is related to this ML thread: https://lists.openembedded.org/g/opene=
mbedded-devel/topic/103499188#108305
> ---
>  meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
> index 3a68011f4..2591539ec 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
> @@ -11,5 +11,3 @@ inherit pypi setuptools3
>
>  DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
>  RDEPENDS:${PN} +=3D "python3-coverage"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108324): https://lists.openembedded.org/g/openembedde=
d-devel/message/108324
> Mute This Topic: https://lists.openembedded.org/mt/103782092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

