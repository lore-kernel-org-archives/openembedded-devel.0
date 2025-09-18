Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1229CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:02:58 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.5175.1758164572476660826
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSAaz/qd;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d6051afbfso4392397b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 20:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758164571; x=1758769371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyHo3xOJiSv7NrDE3M7Jkj4GlxPxgD3XIjh6Tc+B+es=;
        b=FSAaz/qd5CotIT7iuDyhfoaIzPASxfTC1sfNdq2H5nY+6IGKnVHA73+YwY6YusH71G
         tOgkTCZfk03xgN1Bbws+QsRBVTpMATKw8hJ1ghydmn0Y0U2swgm771d+qfQ3st6W35tL
         nTGLt8b9I8QuMS7rHtrsltzqp/m8QBdZxao6VRmBxoNkat+ft5Ikt7Kryl6rcKl9gY66
         41K6ICmoVenlGrun9DYs+ok2JB+4R5H1CkNhQ6SvuBZurUS98pXoeAprZcjZlYh5ky2R
         uqpCLYRUFprsLdt78lbpZrBTyChoVtffbR3NWeodwRDkzSZ6nvjhCQ3UoYCMO9vGolX8
         qr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164571; x=1758769371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyHo3xOJiSv7NrDE3M7Jkj4GlxPxgD3XIjh6Tc+B+es=;
        b=RWsfMyXqP25267X5wClWyC8XrL3ar5jNh9/g3+aPDa31WloDWp1+jrgWN4+XTVWVtP
         G90Z48UKnongFByFY7Y0mbMg7bjAAC8Zm8lJgGt6XvWpMO0vEFO4doXe4Quc+fIe289D
         tBruwMkCLmINyoj3YNje0ULeQbI2DOEjw0jPG8Au4njgskCdUB0LkIn4OkrsUlTCzIcL
         hA60k4oKS3+zOm/7IIESxKbJOJm7XHq0XV3dhqQYBSyb8eyIUi/DTeuYaVOIujuQvPPS
         ePy04Btedsk2LA4dT/ALx1bjBa2Cor60h9DQp9uK4YWfXCp2nuLWl2S5Vrzz7IEDLwEB
         6xJQ==
X-Gm-Message-State: AOJu0Ywhckl2+0mBvOZi61Ls8ROhmWk8uFtqGitNcyBFP7NhkMdwOmN6
	oqarWbkOouA0D1JdbAAGL2CG/61e6jvBwMGCKUIEYHQVsnu2i4Gz+W4T9r0T2R0oTb2s6RKb1jE
	4hfNMXUFjiJaZcEcGVuFdQUioOzz90pk=
X-Gm-Gg: ASbGncuU4CPBePoFGabZ5G1/voTkLqF4ivMsfwvNyxUUJPghOGeW4Jz/zxpVJPVWV42
	e87x7gwBHWtE+rXXX4HFxF3I9RUkc/um/4E/xvfOgtnfICklwc7h5VAQgbV8+Iu2hI8loA8AX1l
	wrJi/NkBjfFDvap54WpHmuyxLEH0OGNQ+5vO1ivOWuY2DQ2tSKMqe30SRsYSL7015Ns0bLbKbNf
	MXftyI2vUnoaQ5d0ckS5N86CEzUZHmnK/0QWuXuaYdZKQNfKMm2i87n3RbuIM3TBdSpMGCbEnCy
	/cnq06taEy5QlMlGbtcAydNr6Gx8NwMNnJUDYFJfKNc=
X-Google-Smtp-Source: AGHT+IHQ1JKCONjl57m3kFHwNs2se35o8PX3N58hQSzrou6rJE+tNUNMIqlsXjbzqWI/h5Ja3MgUOMhNVnoOzi/Lsg8=
X-Received: by 2002:a05:690c:9:b0:738:7758:338 with SMTP id
 00721157ae682-73890bad0f3mr31263747b3.7.1758164571214; Wed, 17 Sep 2025
 20:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250918014442.1436475-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Sep 2025 20:02:25 -0700
X-Gm-Features: AS18NWAbKqjC-qazsYKkekhqB65I_Xcq5CegOFSQLqAT3NWNFC6AC9g7ZwqWBcw
Message-ID: <CAMKF1sr6v-ohV3LsB+Xot3z0L4woDddx7P9sVrtcDD-K1ko7Xw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/6] ocl-icd, opencl-icd-loader: drop
 RPROVIDES for virtual-opencl-icd
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 03:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119506

Hi Dmitry

Thanks for v2, it looks more complete. Sadly, it does not apply for
me. It will be helpful if you rebase it on master-next and resend

Thanks
-Khem


On Wed, Sep 17, 2025 at 6:44=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> These two packages don't provide ICD drivers at runtime. They provide
> the libOpenCL.so.1. Corresponding package is selected at the build time
> via the PROVIDES_virtual/opencl-icd. Drop the useless and incorrect
> RPROVIDES for virtual-opencl-icd.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta-oe/conf/layer.conf                                     | 1 -
>  meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb                | 1 -
>  meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 2 --
>  3 files changed, 4 deletions(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index bddfabc2195b..2f3da6170e89 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -59,7 +59,6 @@ PREFERRED_PROVIDER_android-tools-conf ?=3D "android-too=
ls-conf"
>  # Configures whether coreutils or uutils-coreutils is used.
>  PREFERRED_PROVIDER_coreutils =3D "coreutils"
>  PREFERRED_PROVIDER_virtual/opencl-icd ?=3D "opencl-icd-loader"
> -PREFERRED_RPROVIDER_virtual-opencl-icd ?=3D "opencl-icd-loader"
>  PREFERRED_RPROVIDER_virtual-redis ?=3D "redis"
>
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> diff --git a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb b/meta-oe/recip=
es-core/opencl/ocl-icd_2.3.2.bb
> index 9e32242e3151..b266d6af6d91 100644
> --- a/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> +++ b/meta-oe/recipes-core/opencl/ocl-icd_2.3.2.bb
> @@ -14,6 +14,5 @@ inherit autotools
>
>  DEPENDS =3D "ruby-native"
>  PROVIDES =3D "virtual/opencl-icd"
> -RPROVIDES:${PN} =3D "virtual-opencl-icd"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> index 2ff9a6ae7ea5..d5337af8e5fb 100644
> --- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
> @@ -9,8 +9,6 @@ inherit pkgconfig cmake
>  DEPENDS +=3D "opencl-headers"
>
>  PROVIDES =3D "virtual/opencl-icd"
> -RPROVIDES:${PN} =3D "virtual-opencl-icd"
> -
>
>  SRCREV =3D "861b68b290e76d08e7241608479c16431f529945"
>  SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git;branch=
=3Dmain;protocol=3Dhttps"
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119491): https://lists.openembedded.org/g/openembedde=
d-devel/message/119491
> Mute This Topic: https://lists.openembedded.org/mt/115303503/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

