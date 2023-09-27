Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DE1E82CA8
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 15:50:14 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.20708.1695829810983996002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 08:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3C4e+kj;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1dceaa7aeffso3904764fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695829810; x=1696434610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZbDmuiFRgmayQz+dZlnAcsuSrwsiS+QNnWUSHmL8Yg=;
        b=X3C4e+kjjfwEaycY9m6X4bMuIMXqUDrVcwOMK5e5izYCGY+Y0yfokGhOuSmRSw59OY
         /U8ZNJNVkFYGtGBbquZdLpIFsKJBjBStMezf56YXzDTRUOKA8CKGDPVoOURseeWaZ6KS
         pAc3F8IkNnheckp6t0r2GMeo20qKXatgyo8X4kaNyKtTA0j/IozZGjJCWAOPUR9Lkf95
         SiGKMGK7VYU6OQUZaUSp0KJKK41nyj4j9bpPFmtrA8KrI5DAswSpCHjZwZBEoksPND+C
         l3pzoOzp1jBsqMHd9SqLxE23q0aqYh16tY3XjsT5gPTAZg216dEpwtO0xyvj9nK+oQbj
         gDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695829810; x=1696434610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZbDmuiFRgmayQz+dZlnAcsuSrwsiS+QNnWUSHmL8Yg=;
        b=dAAakwCoNWVurzuGITMZUOg7opYtdJtEYCUBtTEBnuY7W/E9s5NBJp7es0yo3nLtb7
         jF9lrqfhLJrOA52QJdkhY8eEkpp/2k2ZzV0e2rlrTuFt1J8b1Lr2ltN1BngZpVqE4Nck
         hiRkxQf/Y9As0pXfgEzs3l3B8eyydiPRBJxypKsQbl5aTTSePSmvutrOmkeCpzOAqvCm
         BkZ8kosjZY0xrW2asrbyot2LqbImpqcRlHuzW75JneA8xBHaIyx62oow4JY3OJKbMDyO
         uGHY0yZCeeQ8Uw3G+AppXYsPTHK8dYxWQiuKO1sMozNnGdI7XF1FKuRR2uLGnUkxv/+7
         rlpg==
X-Gm-Message-State: AOJu0Yw44xV2KENdL+dfm59tkMzFe4TWcdzseqqZ7Db4837dW3XK3cq9
	ob8GfztwjFxXDe7c+pohdCplDtJglNkIU9l2zLo=
X-Google-Smtp-Source: AGHT+IFq58H1NPDw9miRgfPlTvrkId7L4Xl5JmpOCxREqX+YbnLLTcoqw2aFH/1Jaysgu8co2wJRNYq/6r1Rfl/ypTw=
X-Received: by 2002:a05:6870:171b:b0:1bf:f50f:6e2 with SMTP id
 h27-20020a056870171b00b001bff50f06e2mr4164667oae.10.1695829810127; Wed, 27
 Sep 2023 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230926175354.2297242-1-martin.jansa@gmail.com>
In-Reply-To: <20230926175354.2297242-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2023 08:49:44 -0700
Message-ID: <CAMKF1sqWvB-YHMJaXeeOyydHXbJxzErjYxgqOPX4srpT70rj3A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gupnp: fix build with meson-1.2.0
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 15:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105193

I think we need same/simiilar fix for gupnp-tools as well. See
https://errors.yoctoproject.org/Errors/Details/738235/

On Tue, Sep 26, 2023 at 10:54=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...roperly-spell-provide-in-.wrap-files.patch | 25 +++++++++++++++++++
>  .../recipes-connectivity/gupnp/gupnp_1.4.1.bb |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001=
-build-properly-spell-provide-in-.wrap-files.patch
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-=
properly-spell-provide-in-.wrap-files.patch b/meta-multimedia/recipes-conne=
ctivity/gupnp/gupnp/0001-build-properly-spell-provide-in-.wrap-files.patch
> new file mode 100644
> index 0000000000..66f07094c5
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-build-properl=
y-spell-provide-in-.wrap-files.patch
> @@ -0,0 +1,25 @@
> +From 7a4515a356a3d5eb2af1f602c77a42a544e71efa Mon Sep 17 00:00:00 2001
> +From: Jan Beich <jbeich@FreeBSD.org>
> +Date: Sun, 9 Jul 2023 03:30:47 +0000
> +Subject: [PATCH] build: properly spell [provide] in *.wrap files
> +
> +meson.build:1:0: ERROR: Unexpected "[provides]" section, did you mean "[=
provide]"?
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp/-/commit=
/884639bd29323cbb8fbd36bc69d08097a2ae2cd1]
> +---
> + subprojects/gssdp-1.2.wrap | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
> +index 469c75d..466b83b 100644
> +--- a/subprojects/gssdp-1.2.wrap
> ++++ b/subprojects/gssdp-1.2.wrap
> +@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gssdp.git
> + revision =3D gssdp-1.4
> + depth =3D 1
> +
> +-[provides]
> ++[provide]
> + dependency_name =3D gssdp-1.2
> +
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> index c21e7a05bf..efeb66f28f 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.4.1.bb
> @@ -9,6 +9,7 @@ inherit meson pkgconfig vala gobject-introspection
>
>  SRC_URI =3D "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz \
>      file://0001-all-Drop-xmlRecoverMemory.patch \
> +    file://0001-build-properly-spell-provide-in-.wrap-files.patch \
>  "
>  SRC_URI[sha256sum] =3D "899196b5e66f03b8e25f046a7a658cd2a6851becb83f2d55=
345ab3281655dc0c"
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105145): https://lists.openembedded.org/g/openembedde=
d-devel/message/105145
> Mute This Topic: https://lists.openembedded.org/mt/101601703/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

