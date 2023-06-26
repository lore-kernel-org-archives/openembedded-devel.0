Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A8EEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 12:12:33 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.6127.1687781552555165553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jun 2023 05:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CgCW7sgk;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-39e8a7701f0so2222962b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 05:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687781552; x=1690373552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PLCP7uXBF8TyJQYgz5qCXJByD6tNHPhn5O8TdLOkZY=;
        b=CgCW7sgkmBHPrRhfZs6PZLDkTXUYHMPLxzxSTncBZCAxdZ6W/ImSEuWVi3ONiEwprO
         xUK9bdOegOH1e6TkqiRuNsc0GbUjvS/FSS1kgaHy5VS0ynVXeu+UPnSj0s2piYQ2Cf4M
         cj3w3b71Q6K7CnaDAKP3AVCiQ3b7tt8JNlEVV3yaV9QUCBYYtPx52BU0e2VCpiTF+e09
         7j+Dp0rEPrXS3w7pq6hYzKi4FX6R0RVtj9V8wDAxruxwLu+0vDRJ+pm4YtwUkkp8v7uI
         zqBMD5yZQEsnVKLwaMo7V8DD4WC/sUYZ8OIURmzlVlpvJp/pORyHCuVR5Ssf2RXa6xGj
         PmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781552; x=1690373552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PLCP7uXBF8TyJQYgz5qCXJByD6tNHPhn5O8TdLOkZY=;
        b=Y28TK4rhEKdOWqWqIyOsu6Zt8G0BvvHtQx4jMCPD9FdVaOv4MKaFVXijxPFszB9sJ/
         r55eAgUNYfcHjR8Yvq35PGdLOpr4BvdcBr/4IiYJ8lLq6ZsbYfhZtUzxPCHZVLQ04uny
         BmhKkhL57CHGFRLvFPcvvoxlENq6E2roI2bT1NZz5A4JnB5tCIr1fpn+SMM5NORrDqwX
         xAWqmXvNy1AMFm1FxvnZltZZUHwF3G8ER9wrbdS7Nu07wsnXhSbtmauVeBek2Hvicezd
         /WX9ETnBtSsqAjBREQiG0XmdZ4eFCi2MgaYXiwBcnDT5JdPxe5nZ8DSWL7MjkFR+RmjM
         cmjQ==
X-Gm-Message-State: AC+VfDx6Eyr6dspgGKWwgyiEfM8lPvl//2ql1KLnPxccQzm/nXd69BVh
	wPCu9BL+ZPEWW4AW1g5dhR95cfl5h6b+xE63qnU=
X-Google-Smtp-Source: ACHHUZ6UBkumf79ulygLWIWibufs2NUKQmhAgjUzSfHK2kiP+5uykrFRFSGCnYGO4s6eXpkVyifxW1JGgeJd2P5wIhc=
X-Received: by 2002:a05:6808:1290:b0:3a1:da6a:772a with SMTP id
 a16-20020a056808129000b003a1da6a772amr2782206oiw.6.1687781551605; Mon, 26 Jun
 2023 05:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230626115040.71199-1-beniaminsandu@gmail.com>
In-Reply-To: <20230626115040.71199-1-beniaminsandu@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jun 2023 14:12:05 +0200
Message-ID: <CAMKF1sqjkTYpgJ5HZiy1mJix2gZiVEyHjm_oi-haq4EX0=GGTQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: fix builds with crypto extensions
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 12:12:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103585

On Mon, Jun 26, 2023 at 1:51=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++++++++++++
>  ...t-target-attribute-when-building-wit.patch | 34 +++++++++++++++++++
>  .../mbedtls/mbedtls_3.4.0.bb                  |  8 ++---
>  3 files changed, 70 insertions(+), 5 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
0002-aesce-use-correct-target-attribute-when-building-wit.patch
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ae=
sce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/=
recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-vers=
ion-when-enabling-c.patch
> new file mode 100644
> index 000000000..d98d8fa57
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-=
not-specify-an-arch-version-when-enabling-c.patch
> @@ -0,0 +1,33 @@
> +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Sun, 25 Jun 2023 19:58:08 +0300
> +Subject: [PATCH] aesce: do not specify an arch version when enabling cry=
pto
> + instructions
> +
> +Building mbedtls with different aarch64 tuning variations revealed
> +that we should use the crypto extensions without forcing a particular
> +architecture version or core, as that can create issues.
> +
> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/783=
4]
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + library/aesce.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/library/aesce.c b/library/aesce.c
> +index fe056dc4c..843de3973 100644
> +--- a/library/aesce.c
> ++++ b/library/aesce.c
> +@@ -60,7 +60,7 @@
> + #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> + #       endif
> + #       pragma GCC push_options
> +-#       pragma GCC target ("arch=3Darmv8-a+crypto")

I think you need so add something similar for clang case as well.

> ++#       pragma GCC target ("+crypto")
> + #       define MBEDTLS_POP_TARGET_PRAGMA
> + #   else
> + #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-ae=
sce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/=
recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribut=
e-when-building-wit.patch
> new file mode 100644
> index 000000000..4775c8ddb
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use=
-correct-target-attribute-when-building-wit.patch
> @@ -0,0 +1,34 @@
> +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Mon, 26 Jun 2023 12:07:21 +0300
> +Subject: [PATCH] aesce: use correct target attribute when building with =
clang
> +
> +Seems clang has its own issues when it comes to crypto extensions,
> +and right now the best way to avoid them is to accurately enable
> +the needed instructions instead of the broad crypto feature.
> +
> +E.g.: https://github.com/llvm/llvm-project/issues/61645
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> +---
> + library/aesce.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/library/aesce.c b/library/aesce.c
> +index 843de3973..7bea088ba 100644
> +--- a/library/aesce.c
> ++++ b/library/aesce.c
> +@@ -53,7 +53,7 @@
> + #       if __clang_major__ < 4
> + #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
> + #       endif
> +-#       pragma clang attribute push (__attribute__((target("crypto"))),=
 apply_to=3Dfunction)
> ++#       pragma clang attribute push (__attribute__((target("aes"))), ap=
ply_to=3Dfunction)
> + #       define MBEDTLS_POP_TARGET_PRAGMA
> + #   elif defined(__GNUC__)
> + #       if __GNUC__ < 6
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> index ebc6ba573..b8c9662de 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> @@ -25,8 +25,9 @@ SECTION =3D "libs"
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
>  SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmaster \
> -           file://run-ptest \
> -          "
> +       file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.=
patch \
> +       file://0002-aesce-use-correct-target-attribute-when-building-wit.=
patch \
> +       file://run-ptest"
>
>  inherit cmake update-alternatives ptest
>
> @@ -41,9 +42,6 @@ PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABL=
E_TESTING=3DOFF"
>
>  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
>
> -# Needs crypto instructions on aarch64
> -TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D "${@bb.utils.contains('TUNE_FE=
ATURES', 'crypto', '', '+crypto', d)}"
> -

It will be good to turn this into a parse warning or note and ignore
to build this recipe if crypro is not available on armv8+ tune
selection.

>  # For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
>  CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBED=
TLS_USE_PSA_CRYPTO', '', d)}"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103575): https://lists.openembedded.org/g/openembedde=
d-devel/message/103575
> Mute This Topic: https://lists.openembedded.org/mt/99785788/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

