Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EBAC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:23:48 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.5225.1741811025142792526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSY1E3h8;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f3ecfa7a76so150345b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741811024; x=1742415824; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzjQBUkuoTZRSuFMPqkCfq50FDqMbIBR7cl3wkpeEyA=;
        b=hSY1E3h8hbymMBY6boAKb/FKqKLpvVMeq0bidYsy2a7XooK83kVkteAErIpxm2n7ud
         aC/FvVnJ/m4webiBbA/hqSmwAgWau7X7HuevGzcx5MqbCQ2L9IqAGJqevfsONsY8B0/4
         kQo7vLoJjLgYBdSTBemPxSXvPwEvEtE4PnfszmtNllOE+ofoSkXQaMxlV1f8ILCThwPg
         Ec/aEKUdE5ZIqIzo6KT4r1U/qnszuLVO7s47L7l2Y/coCdcXchgYN5cPAWjS6JCOBa2D
         TnfbMmT3jJgNV0+LcjIrlTjCAWT0AUv5K4dWT2WR7IFkonPwM6+Z7phry+yy/0d8tBi2
         FYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741811024; x=1742415824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzjQBUkuoTZRSuFMPqkCfq50FDqMbIBR7cl3wkpeEyA=;
        b=bRzpvRJFaLjUf8kOxKcWyQ+OoeVGE9NZe+rmF/RT2n7o3uQhHQBceWn7Z4s6RfN2IG
         aVPS6A83XZF7bResPvFKMtt4JJlnwmENSBom0CabmOzsbjc4Jfk1Lm4y25QZGXeiir4e
         tHNOTP+lYdbDkCLx+KyZtg53n0a6bePbAIRBcPrML5Zp8u15NxuK8jocnVeeebmFZc1y
         vepVH9guZERNJyipfD21u/fNoPncSLY4zj8+hMB2UD5ALdMtNJDzr21HIjGg8T4gGQL0
         9g3srXTm3c9o+ywVWmMNGLpKzHzYvQwe2HS/SdEIMAQ9X9qivHLUUr+9TXiSyCrZsT3u
         l/hg==
X-Gm-Message-State: AOJu0YyR8xtdiWvk4I7g/EOdK/842Rp+zYSJ3b0fedKIzZUt3vz5uU7p
	qFNXZUBhc0v/BYTsbimjnv6Yswf6PtomfH2PjtXMnQ1Lnv0wn2m965bCjGD86dPKn3hbX6lYZ9L
	CMEjt2DLTlLOPsP1r3+4uQ9BLBnQ6k9vj
X-Gm-Gg: ASbGnctbHCEsxwYuyd+xxsblZJLP81HpkKsNfaw+cXq+s7v67NR4VkSvnYMD1pgOMBE
	aTwfN9RgnMYwhYLuebqc3TVxZAWZqyzNZBjZGPEjEXwde73MKQGutXWO7sEqTGlY7aU1xQuwCKE
	jBUvBQlzNWvW6LSuimg+4R7vqO5E6CHWYTJCjBVKmEtXw1DjYYzw5SYYc=
X-Google-Smtp-Source: AGHT+IHY9cbNPuYfgyyuVhmKTP344qzVOy0wA1NKhkLo755A0BMamYr+i/AkmMOEzsEl3/rbBRK1noS0X7KB2G9jdaM=
X-Received: by 2002:a05:6808:2393:b0:3fa:c549:cff6 with SMTP id
 5614622812f47-3fac549f07amr3197272b6e.36.1741811024318; Wed, 12 Mar 2025
 13:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250312183133.3403868-1-awais.belal@gmail.com>
In-Reply-To: <20250312183133.3403868-1-awais.belal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Mar 2025 13:23:18 -0700
X-Gm-Features: AQ5f1Jq3-y9CdjOSqeQYcSaXuiOE6prp7mmhCT_DvC-D6PB1-n18siLRcWkiPWo
Message-ID: <CAMKF1srLtOMByK_sE=Xd48nB+B=7bu-P+HmKz5WRR2DbMnxBog@mail.gmail.com>
Subject: Re: [oe] [meta-oe][meta-python][PATCH 1/2] python3-legacy-cgi:
 introduce recipe
To: awais.belal@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 20:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115941

On Wed, Mar 12, 2025 at 11:31=E2=80=AFAM Awais Belal via
lists.openembedded.org <awais.belal=3Dgmail.com@lists.openembedded.org>
wrote:
>
> With the cgi module being dropped in python3.13 a stop
> gap solution for modules relying on cgi is to use the
> legacy-cgi module. Introduce the recipe so it could be
> leveraged in the upcoming changes.
>
> Signed-off-by: Awais Belal <awais.belal@gmail.com>
> ---
>  ...py-fixup-interpreter-according-to-OE.patch | 28 +++++++++++++++++++
>  .../python/python3-legacy-cgi_2.6.2.bb        | 22 +++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-legacy-cg=
i/0001-cgi.py-fixup-interpreter-according-to-OE.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-legacy-cg=
i_2.6.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi/0001-=
cgi.py-fixup-interpreter-according-to-OE.patch b/meta-python/recipes-devtoo=
ls/python/python3-legacy-cgi/0001-cgi.py-fixup-interpreter-according-to-OE.=
patch
> new file mode 100644
> index 0000000000..0af8ef4842
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-legacy-cgi/0001-cgi.py-=
fixup-interpreter-according-to-OE.patch
> @@ -0,0 +1,28 @@
> +From eaa9964cd6d22564fa5f1270d194eb65ebaef57c Mon Sep 17 00:00:00 2001
> +From: Your Name <you@example.com>
> +Date: Wed, 12 Mar 2025 17:44:39 +0000
> +Subject: [PATCH] cgi.py: fixup interpreter according to OE
> +
> +The underlying distribution is required to update the interpreter
> +by design. This can be referenced from the notice that is found
> +on top of the same file being patched here.
> +
> +Upstream-Status: Inappropriate [OE specific]

I think you could try sending this patch upstream, it should make
things better for the legacy-cgi project.

> +Signed-off-by: Awais Belal <awais.belal@gmail.com>
> +---
> + cgi.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cgi.py b/cgi.py
> +index 22897a1..f86db84 100755
> +--- a/cgi.py
> ++++ b/cgi.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/local/bin/python
> ++#!/usr/bin/env python
> +
> + # NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
> + # intentionally NOT "/usr/bin/env python".  On many systems
> +--
> +2.43.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2=
.bb b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
> new file mode 100644
> index 0000000000..2b2840ae14
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-legacy-cgi_2.6.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Fork of the standard library cgi and cgitb modules, being d=
eprecated in PEP-594"
> +HOMEPAGE =3D "https://github.com/jackrosenthal/legacy-cgi"
> +LICENSE =3D "PSF-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4b8801e752a2c70ac41a5f9aa243f=
766"
> +
> +PYPI_PACKAGE =3D "legacy_cgi"
> +
> +inherit python_poetry_core pypi
> +
> +SRC_URI +=3D "\
> +    file://0001-cgi.py-fixup-interpreter-according-to-OE.patch \
> +"
> +
> +DEPENDS +=3D "\
> +    ${PYTHON_PN}-setuptools-scm-native \
> +"
> +
> +#RDEPENDS:${PN} =3D "python3-core"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +SRC_URI[sha256sum] =3D "9952471ceb304043b104c22d00b4f333cac27a6abe446d8a=
528fc437cf13c85f"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115938): https://lists.openembedded.org/g/openembedde=
d-devel/message/115938
> Mute This Topic: https://lists.openembedded.org/mt/111665521/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

