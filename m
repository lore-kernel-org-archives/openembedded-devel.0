Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5556CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:19:31 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.44610.1697217564482259742
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIKmXq4H;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1e10ba12fd3so1317388fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697217564; x=1697822364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja9NtlC4k6YEHbO+ntxTrGbnZ3olMsKVNm02umRse/c=;
        b=fIKmXq4HQBt2h/u1BU7DBQyeDQrgNsKNu+T6QENnXdO91GX2DlUvrpzPh2Ungq8D08
         ZBKRFuBiwR8F29h5IJxomiiufYTkW1tkkUxBvtUEAWynSX8c5XLA0k3UxjzIcz8bXCYd
         GckYGZnUTZLHBP5/bPBdLyr/9upFd6LKLHHmzG3X2p7LxmMxNl7FnIL5n0mTk5Vs3rN3
         tSa/7lxdZhoxYdmksQfV9TsT8y40PRRaeF1DVZQx+sQ6MrSOj91LGRasATp69TqxOE3N
         GbePwILh9bH5YK3zb6XYmPhg7GGGX5TryU5B+YAQjkmLK4J/IUrzc3XfKsLPxpiWf7Eq
         bNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697217564; x=1697822364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja9NtlC4k6YEHbO+ntxTrGbnZ3olMsKVNm02umRse/c=;
        b=lNndYQhc7oMMv3Xh0080WuC8C6WXouCohpGbvckZLOz5EHByBgxDarwfENUI1Vw5Ju
         q/KsqTE8L2uetOjwuu/3LUfD3jWML0lUjPg/0bPu6mK5XzPhjZvonqp4NPxtF8dyXELm
         nNCG1YPzEkiPRZpD0T01W4ba8H2klLPui7RjRCqoQ8BN+UPGgQkZfF1FyTspiG3Iz9fw
         u5Mif5wvLDcnfxP2bPL8XDrZ3iotkoujSB/W+/LbDDCwiwRPiTwtremILSgTaOPw9tMw
         cT8wilYHCWS1jwFVpbPBtD18d5g2rGq/8wsB3M+Zke+hP0RC7qhmS0DZeZIsmfu2inhP
         jLeQ==
X-Gm-Message-State: AOJu0YxIY+LaBtrcHXnbr8Ley927t7j3fgHkFKGm2B+TAOILYveb78bh
	3TFsVjv+gwEBMr8GkKlHmNVdPKYKFXo5yuRz1Dk=
X-Google-Smtp-Source: AGHT+IGhcRyQinUzPyVXyPC3iYx+ZiIiHo8+mtcL4A4thYMgsO2VKkNhP7oIn0d97Xts9SOjZnPvN+OPrCDlCeALI0M=
X-Received: by 2002:a05:6870:1351:b0:1e9:e02e:f4cc with SMTP id
 17-20020a056870135100b001e9e02ef4ccmr2386348oac.29.1697217563647; Fri, 13 Oct
 2023 10:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231013140719.344880-1-beniaminsandu@gmail.com>
In-Reply-To: <20231013140719.344880-1-beniaminsandu@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 10:18:57 -0700
Message-ID: <CAMKF1so9ZzJr0jbrOWEOoHdChUkz6JHa7CZH75LDxtEAb45uMg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v3] mbedtls: upgrade 3.4.1 -> 3.5.0
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105486

fails to compile on x86
https://errors.yoctoproject.org/Errors/Details/739887/

On Fri, Oct 13, 2023 at 7:15=E2=80=AFAM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> * Includes security fix for CVE-2023-43615 - Buffer overread in TLS strea=
m cipher suites
> * Includes security fix for CVE-2023-45199 - Buffer overflow in TLS hands=
hake parsing with ECDH
> * Includes aesce compilation fixes
>
> Full changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-=
3.5.0
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...cify-an-arch-version-when-enabling-c.patch | 33 ------------------
>  ...t-target-attribute-when-building-wit.patch | 34 -------------------
>  .../{mbedtls_3.4.1.bb =3D> mbedtls_3.5.0.bb}    |  4 +--
>  3 files changed, 1 insertion(+), 70 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
>  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/=
0002-aesce-use-correct-target-attribute-when-building-wit.patch
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.4.1.bb =
=3D> mbedtls_3.5.0.bb} (93%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-ae=
sce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/=
recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-vers=
ion-when-enabling-c.patch
> deleted file mode 100644
> index 44d74754c..000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-=
not-specify-an-arch-version-when-enabling-c.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Sun, 25 Jun 2023 19:58:08 +0300
> -Subject: [PATCH] aesce: do not specify an arch version when enabling cry=
pto
> - instructions
> -
> -Building mbedtls with different aarch64 tuning variations revealed
> -that we should use the crypto extensions without forcing a particular
> -architecture version or core, as that can create issues.
> -
> -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/47=
1a975942dec76bf0ccb92b6c6da055385683fb]
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - library/aesce.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/library/aesce.c b/library/aesce.c
> -index fe056dc4c..843de3973 100644
> ---- a/library/aesce.c
> -+++ b/library/aesce.c
> -@@ -60,7 +60,7 @@
> - #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> - #       endif
> - #       pragma GCC push_options
> --#       pragma GCC target ("arch=3Darmv8-a+crypto")
> -+#       pragma GCC target ("+crypto")
> - #       define MBEDTLS_POP_TARGET_PRAGMA
> - #   else
> - #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-ae=
sce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/=
recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribut=
e-when-building-wit.patch
> deleted file mode 100644
> index c8f6cb750..000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use=
-correct-target-attribute-when-building-wit.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> -From: Beniamin Sandu <beniaminsandu@gmail.com>
> -Date: Mon, 26 Jun 2023 12:07:21 +0300
> -Subject: [PATCH] aesce: use correct target attribute when building with =
clang
> -
> -Seems clang has its own issues when it comes to crypto extensions,
> -and right now the best way to avoid them is to accurately enable
> -the needed instructions instead of the broad crypto feature.
> -
> -E.g.: https://github.com/llvm/llvm-project/issues/61645
> -
> -Upstream-Status: Backport [https://github.com/Mbed-TLS/mbedtls/commit/aa=
4f6219014d863bed51453e5261178adc66be34]
> -
> -Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ----
> - library/aesce.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/library/aesce.c b/library/aesce.c
> -index 843de3973..7bea088ba 100644
> ---- a/library/aesce.c
> -+++ b/library/aesce.c
> -@@ -53,7 +53,7 @@
> - #       if __clang_major__ < 4
> - #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
> - #       endif
> --#       pragma clang attribute push (__attribute__((target("crypto"))),=
 apply_to=3Dfunction)
> -+#       pragma clang attribute push (__attribute__((target("aes"))), ap=
ply_to=3Dfunction)
> - #       define MBEDTLS_POP_TARGET_PRAGMA
> - #   elif defined(__GNUC__)
> - #       if __GNUC__ < 6
> ---
> -2.25.1
> -
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> similarity index 93%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> index a6f8583b2..1fd187ab2 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.1.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.5.0.bb
> @@ -23,10 +23,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387=
f14655fc854ddc3c6bd57"
>  SECTION =3D "libs"
>
>  S =3D "${WORKDIR}/git"
> -SRCREV =3D "72718dd87e087215ce9155a826ee5a66cfbe9631"
> +SRCREV =3D "1ec69067fa1351427f904362c1221b31538c8b57"
>  SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmaster \
> -       file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.=
patch \
> -       file://0002-aesce-use-correct-target-attribute-when-building-wit.=
patch \
>         file://run-ptest"
>
>  inherit cmake update-alternatives ptest
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105470): https://lists.openembedded.org/g/openembedde=
d-devel/message/105470
> Mute This Topic: https://lists.openembedded.org/mt/101940558/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

