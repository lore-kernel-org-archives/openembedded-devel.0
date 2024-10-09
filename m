Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA01ACEE35A
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 22:07:54 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.29871.1728511672342150803
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 15:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FFIOsggD;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e5a0519d00so111262eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 15:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728511671; x=1729116471; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp6TReOq/EMu+d0tukRufzMJ60bswi5sQUqfKLWJjWI=;
        b=FFIOsggDPTh/Zkd0M6Qc5kxk8wbccU5paNbHD8uFxIMiymzHU5nzbwA5tfvvyOvspt
         geuQlnXtSqaA77V3yhhnW0Ca9Wnb1lKdJ+TzBC+OIjJAw0V5SFw4O/3KXkVQQBux/0T4
         j1XvuoKiQaEWsbIy4YLSjZho1a+PlmjyhJthyf4TaX6xNFEJtE6s89I8mgb7g6ENn0/F
         qQ/YOJmnAik4qL/zQpwiEMZ0M8kjWoiGSqucx0Cn/rXkK4AifRIkAmhq0859deQRI4GF
         bSNPlTN8bc1/OTU/zLDzm8UYD/0VaEnnBgHgAWYJVFNIfgZKlxrmuBTifPGZmnV8TWdF
         Ulsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728511671; x=1729116471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp6TReOq/EMu+d0tukRufzMJ60bswi5sQUqfKLWJjWI=;
        b=O9+fzoDCDv3z5fKEgkeZp4OEBNjeGLyr91HiX0bfWDL5yeHDquNMsjzPrljHGu2hgU
         dV+2lRm5OOOnen306vNjTaRDiCx9TNDVg66oe+aT+JB/lq+kRrG//oQKztBNcnpD/p+z
         I1BZw3o9c2iIzsXI4VVSVmtlaQssvCMlmX6G063uxTx4+iuSLk6EaahAIQFEMKJ65GUe
         TzXCo0fbX6P68TbD4XU7KYJNJVuh2ALh5jWct9uTTP6bFUcTznAiZWIfcW7XLn2/lJaF
         UfbvBehR9U8032SfRG+JYS8MRYUrxkGtcwqchsYdcbTbO/u4IgkTtd0NnDxi8Oh6xgMk
         k20g==
X-Gm-Message-State: AOJu0YzkXOwkx1l+7dhZLuRIc0RKFSX3G5thcslU0Jn9mJfPZcJbyfLR
	FUyi8RUjsjQSxEPiMaqIzAwIkyNv2qSAbNmUnCOISPeiFXQDYMUeQMTRVfWJ/juVbwyB8iP9MnM
	Zl6b7Tyvb5AEEKYfwNfRGXzkKADM=
X-Google-Smtp-Source: AGHT+IFBBdGQj58gDOFQqf4xp8ouAylVPNCMHPnWPdU62NKnGaVor85dv6K9G65v4uinZ5asUYomalAHkqxJNj9ZuVg=
X-Received: by 2002:a05:6870:1586:b0:277:fdb5:9ce5 with SMTP id
 586e51a60fabf-28834359562mr3411512fac.27.1728511671444; Wed, 09 Oct 2024
 15:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241009213046.3065769-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20241009213046.3065769-2-t.f.g.geelen@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 15:07:24 -0700
Message-ID: <CAMKF1sqvZywamEicsj90WHPRevd4yEHqyq3eKvT=VGrC_Nusqg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] New recipe: python3-pytest-aiohttp 1.0.5
To: t.f.g.geelen@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 22:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112746

Thanks for the patches, however these patches are missing

1. Certificate of origin ( Sign-off-by )
2. The subject field is not per guidelines

https://docs.yoctoproject.org/dev/contributor-guide/recipe-style-guide.html=
#

is a good resource to know about these.

On Wed, Oct 9, 2024 at 2:31=E2=80=AFPM Tom Geelen via lists.openembedded.or=
g
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:
>
> Based on https://pypi.org/project/pytest-aiohttp/
> ---
>  .../python/python3-pytest-aiohttp_1.0.5.bb            | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pytest-ai=
ohttp_1.0.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1=
.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.=
bb
> new file mode 100644
> index 000000000..977ce807f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
> @@ -0,0 +1,11 @@
> +SUMMARY =3D "pytest plugin for aiohttp support"
> +HOMEPAGE =3D "https://github.com/aio-libs/pytest-aiohttp"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc251ea89d32d196dddd14c669ed3d=
482"
> +
> +DEPENDS =3D "python3-setuptools-scm-native"
> +SRC_URI[sha256sum] =3D "880262bc5951e934463b15e3af8bb298f11f7d4d3ebac970=
aab425aff10a780a"
> +
> +inherit pypi python_setuptools_build_meta
> +
> +PYPI_PACKAGE =3D "pytest-aiohttp"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112744): https://lists.openembedded.org/g/openembedde=
d-devel/message/112744
> Mute This Topic: https://lists.openembedded.org/mt/108918200/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

