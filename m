Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B928CC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 16:25:54 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.45.1690820750924216579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jul 2023 09:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KKsJDi6L;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a1ebb85f99so3666343b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690820750; x=1691425550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1Z3lm/gYxnt0+sPwgbRfQnaMdVKImmN2mjqBCYVvHI=;
        b=KKsJDi6LGphKYOOA0CA3jTvs8do0IFwT9KInYOD2UsJaJxHZEzLDxHNbPxsVtaAYg9
         tTk94x2RCbUdHol+ccANrymDMxKDEjTNgBaKWI7iKawZpi/hphXowINjnnKadIeMm9pW
         UkyjCbo2WDywk7pmRJ3B7Kevz5bLihlOAx8ooB0LP/d0vHyLNFvmKDSQyl77aw/LBuTf
         tcc6csisNBW738MvEIW03Wv2c9Clo0JYtKE3ig7W/1/TrsWzXOJe6t0ooeo8ug4oYkJH
         ZqNt1rggWxXMUQhwQ9iiFmm1JWFZ6JWVJo7jypScpmxhiV/wBuQ4/l7p5xL9Inw+2EqG
         hy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690820750; x=1691425550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1Z3lm/gYxnt0+sPwgbRfQnaMdVKImmN2mjqBCYVvHI=;
        b=R72UFjSlPyvJb8nC06R/Wkw06QkR9PnQC23JU7f7ehoIk6PuBkiHJxF0reuXLsbEBW
         z5yoza6BsFlHMna4qb3llTFOZjsCPcTJOjpZ8YsKVv2albW03flfITYkVqrt36vVAgSA
         3sMN+VEEgrAaBG5NLDN7ZyHAcwR/CghEFUaUoLjJH7lYRQHF9oYhCifmffhbQjj7Nhb9
         PVRwHnsrrCZHNgSdsYWGGbtFozHrakz2IzW0kFyEGkl/HdLEqFy8Z5WWkx6mOU62Bueq
         GWmidzw1ZDJ8jN+NSasE9FCk/SIfVv1SibUrPsZzxZqBawWyghoSUGr+vRd3tLXysuUX
         4V5Q==
X-Gm-Message-State: ABy/qLaxX0fVJWdSmwKe/x73pdQNUS7tpahQlzp3MrtVn53n+oUxuh/O
	L94SW1YQwjJmwl6xYptUfxwI4DAyDzNjavANQJw=
X-Google-Smtp-Source: APBJJlH6q0fsFGZhrU/4hzysi/zf/Y7ZN6qGni/fEt31vodMMu3EwcQMJ/tvc/QJVXlocfSZYfwguxuDMfDq8MIAXDw=
X-Received: by 2002:a05:6808:1449:b0:3a1:eb47:a943 with SMTP id
 x9-20020a056808144900b003a1eb47a943mr12752130oiv.10.1690820750071; Mon, 31
 Jul 2023 09:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <211582fb-9571-aede-3aa3-0af6b43e1390@gmail.com>
In-Reply-To: <211582fb-9571-aede-3aa3-0af6b43e1390@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2023 09:25:24 -0700
Message-ID: <CAMKF1srJwCNd7cEX_kvg7ejTFxoog9qAiF7a3iZZpB+imWkQ5g@mail.gmail.com>
Subject: Re: kirkstone merge request: July 31st
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 16:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104161

merged now Thanks Armin.

On Mon, Jul 31, 2023 at 3:33=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit 346753705e49a2486867dc150181a1c7f4d693=
77:
>
>    webserver: nginx: Add stream Signed-off-by: Luke Schaefer
> <lukeschafer17@gmail.com> (2023-07-04 10:20:46 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded kirkstone-next
>
> for you to fetch changes up to 4da92ed9be41734f6ced46b981958e2e868cbff2:
>
>    python3-gcovr: Fix parsing of gcc-11 gcov metadata (2023-07-25
> 07:24:25 -0400)
>
> ----------------------------------------------------------------
> Beniamin Sandu (1):
>        mbedtls: build with v2 version by default
>
> Jasper Orschulko (2):
>        yaml-cpp: Fix cmake export
>        python3-gcovr: Fix parsing of gcc-11 gcov metadata
>
> Narpat Mali (1):
>        frr: fix for CVE-2023-31490
>
> Polampalli, Archana (1):
>        nodejs: upgrade 16.19.1 -> 16.20.1
>
> Urade, Yogita (1):
>        libyang: fix CVE-2023-26917
>
>   meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb   | 3 +
>   meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch  | 160
> ++++++++++++++++++++++++++++
>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb              | 1 +
>   .../oe-npm-cache                                                | 0
>   ...oe-cache-native_16.19.bb =3D> nodejs-oe-cache-native_16.20.bb} |   0
>   meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch              | 75
> -------------
>   .../nodejs/{nodejs_16.19.1.bb =3D> nodejs_16.20.1.bb} |   3 +-
>   meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch   | 40
> +++++++
>   meta-oe/recipes-extended/libyang/libyang_2.0.164.bb             | 1 +
>   .../yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-1077.patch    | 117
> ++++++++++++++++++++
>   meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.7.0.bb              | 1 +
>   .../python3-gcovr/0001-Fix-parsing-of-gcov-metadata-601.patch   | 84
> +++++++++++++++
>   meta-python/recipes-devtools/python/python3-gcovr_5.1.bb        | 1 +
>   13 files changed, 409 insertions(+), 77 deletions(-)
>   create mode 100644
> meta-networking/recipes-protocols/frr/frr/CVE-2023-31490.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.19 =3D>
> nodejs-oe-cache-16.20}/oe-npm-cache (100%)
>   rename
> meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.19.bb =3D>
> nodejs-oe-cache-native_16.20.bb} (100%)
>   delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/gcc13.patch
>   rename meta-oe/recipes-devtools/nodejs/{nodejs_16.19.1.bb =3D>
> nodejs_16.20.1.bb} (98%)
>   create mode 100644
> meta-oe/recipes-extended/libyang/libyang/CVE-2023-26917.patch
>   create mode 100644
> meta-oe/recipes-support/yaml-cpp/yaml-cpp/0001-Fix-CMake-export-files-107=
7.patch
>   create mode 100644
> meta-python/recipes-devtools/python/python3-gcovr/0001-Fix-parsing-of-gco=
v-metadata-601.patch
>

