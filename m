Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCC4C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 07:54:34 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.78577.1701935667567320532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 23:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8KejoPN;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d852e06b07so351175a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 23:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701935666; x=1702540466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opmjt/JmPEwhSUo5urC2Luqw1s1csikQ3Z743WZtKnQ=;
        b=M8KejoPNtHUjFlwdMgf88EYxQo2Bx5QLL2xsVmUqrqbMvFXWoCrJE1I/xyr2UFooyX
         TgNtlgcBlcmcpnIIOdCtSkqTaMhtoVJYYh7LQmyexbdbq0OasadvpfLu+NEG89t4XTxV
         tsFmi85TKWJCMcjJTRTmESJx5BsIgQf6fVXR0g0lPdWgyEx9o91qU0ChAjLvIorN8fW7
         EV/gHFAI8LLYuBzJU/nMTvZkQd+k4F3KKfpmtaczF2WYZAt+pga2Htoiv2DwNBwKLAjz
         1J+W3UGqZ2NRwyolhzGSJmzIpAWfH2yGSY+IA/+Rl+ri4/2pNN/lsVHfyeRR0Ftkiz5A
         zGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701935666; x=1702540466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opmjt/JmPEwhSUo5urC2Luqw1s1csikQ3Z743WZtKnQ=;
        b=hCBgdVAcbOnIcQsHBU6QZMiITSUQGfrcTwkCe0zDxo93w+oAEgsIBsbLUTAad91csd
         Y2RDV4oVatohaVgE26CZb93sCj/HQpY+GKBE4CNtMqHsgCQoQkjzMid0wDuRAn6kxS5n
         kxii4rUc5WWLq0yxes1f0bkmQEQEIq7OrlClV1sERxb4ycEcWhOW79wYffVGrlTdIjVo
         MvMoYMnJtl9NApJAbkHfo/CG4ScOF14AlAJnGEWLznZ+9lQ1mrwVUo+Ielt6bYdYktIS
         Hk7/fwx9JZL6FHmPBBXuNsqb+i7G6kGT4I7zUCX9jeM39SiFJeGZBPGikvMRXe6w+3lV
         zBLA==
X-Gm-Message-State: AOJu0YwVaQxJAm67aXIskRq/6RY4BFTWKJdzAIEKofNb4YyQaWb7Fro6
	05Dxpb6wZmvoTmyq6EI7WYbmqzBTRvKXX3ehiB0=
X-Google-Smtp-Source: AGHT+IHObPKIzff7OmdOltwhSblIAPVW/TPMfwYA5rv0P37WnQAbyDjwWsQOYYKxm5FN5kITP0nhzW/bHFHZ4hu8TNI=
X-Received: by 2002:a05:6870:592:b0:1fb:75b:2b85 with SMTP id
 m18-20020a056870059200b001fb075b2b85mr2081635oap.65.1701935666420; Wed, 06
 Dec 2023 23:54:26 -0800 (PST)
MIME-Version: 1.0
References: <20231207074508.18228-1-alperyasinak1@gmail.com>
In-Reply-To: <20231207074508.18228-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Dec 2023 23:54:00 -0800
Message-ID: <CAMKF1soB+5uEiG8CMgp0qoEA4nMRKnAS=7fRc-N2NhuSSWGGvw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xorg-sgml-doctools: update summary depends
 and inc file
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 07:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107272

On Wed, Dec 6, 2023 at 11:45=E2=80=AFPM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc    | 9 +++++----
>  .../recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb | 5 ++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc b/meta=
-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> index aa4795edc..042db48ac 100644
> --- a/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> +++ b/meta-oe/recipes-graphics/xorg-doc/xorg-doc-common.inc
> @@ -3,10 +3,11 @@ HOMEPAGE =3D "http://www.x.org"
>  SECTION =3D "x11/docs"
>  LICENSE =3D "MIT"
>
> -SRC_URI =3D "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.bz2"
> +DEPENDS =3D "util-macros-native"
>
> -S =3D "${WORKDIR}/${BPN}-${PV}"
> -
> -INC_PR =3D "r1"
> +SRC_URI_EXT =3D "bz2"
> +SRC_URI =3D "${XORG_MIRROR}/individual/doc/${BPN}-${PV}.tar.${SRC_URI_EX=
T}"
>
>  inherit autotools pkgconfig
> +
> +
> diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb=
 b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
> index 050cb2982..eef02a43e 100644
> --- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
> +++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.12.bb
> @@ -1,10 +1,9 @@
>  require xorg-doc-common.inc
> -PE =3D "1"

we can not drop PE without major version upgrade.

>
> -DEPENDS +=3D "util-macros"
> +SUMMARY =3D "SGML entities and XML/CSS stylesheets used in X.Org docs"
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8c6c808cd3c797a07b24e443af1c=
449"
>
>  SRC_URI[sha256sum] =3D "65a9fdddedc17bd5e9c0b00d904960f03f047c3a62de5458=
989d493c29fec806"
>
> -FILES:${PN} +=3D " /usr/share/sgml/X11"
> +FILES:${PN} +=3D "${datadir}/sgml/X11"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107270): https://lists.openembedded.org/g/openembedde=
d-devel/message/107270
> Mute This Topic: https://lists.openembedded.org/mt/103030393/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

