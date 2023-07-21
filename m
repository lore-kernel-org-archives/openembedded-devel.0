Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA87EB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 15:48:30 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.10507.1689954510499299210
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 08:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aFQjaoCE;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a40b756eb0so1270489b6e.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689954510; x=1690559310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOu/KX/tid5uUaNzuXotB63+miATrlxiTbUBQh23DaU=;
        b=aFQjaoCEtVhJlngz7YLMMU2ALY2RtTLO7g8Oy0+eSZzIiFPE+WNe5ZZTPoO91142pr
         ChUMMUHUBIiYkMxSvxCkXt64Dz78KyOYvVwkCqLdSgI3TxcDRXo64LTPvJMHdKRmNMSO
         yH0/ooKoWpZPY8BC99Hg/FC/j/lkfazdB5l7QjQ/dk8qrRE7Ebv/AQVmZsP1Aw10dCGu
         DTtwV/m+bftPlBp6B9qvI8FvOAbkWGhLNUOa6Heq8fCs7d2U3Q58vnKktDy7MUimJFCx
         oaF6HKmrIPwNsQ4xCSONUvvljpJId564S0EYbYoirVURYA2ccmjK1TxQng8aUrOqq21L
         Z3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689954510; x=1690559310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOu/KX/tid5uUaNzuXotB63+miATrlxiTbUBQh23DaU=;
        b=VjL5lMwHUIygqaWdo6IKO6OaIu5PU2C8MpNg6E5xc19r07NeSD9n6dlBOOTNTYkHfX
         TYz7kc2XT4xhaW2gLepDCOtDvmwIwXpzxSmktcWtApjQhkDsrLFdYG3/fhmarc4tnnTv
         7T9WeDzJ1tTzpnm6N6m6q2W7dRGGXDZm7JSO2OOMO1srYUujQxbq7HHw6Cbjx0ezqfTf
         eA7zbmfN9icdqkJEIthf/o4fKlDU+5hDMt5V7bj0iHnoZrWpO+djY5oQ7lQ4K/euyP4A
         vFE7lB8cX1UAllaGd0oeDfZb+2Gc8xf8/5QaJDRDbZ9ZaeBIyCCw5vYC3ujUv3Riosbd
         PK7w==
X-Gm-Message-State: ABy/qLZw5LwDlEOqq3eJ3S8zThXQxRSz4zarX8R/ZgQzcVQPHUWjWlJo
	i5uWmHwPPdrdZK67OwL8JZNnKQLO39yMqzBcmCQ=
X-Google-Smtp-Source: APBJJlFUWVK4zPd2kdF0O27L+fic/HLPl8gQXR9gczKgK/CXYRl4ca/wO70Td9mFvn273H0v2NMoaZja7rOkoscoTTA=
X-Received: by 2002:a05:6808:ecc:b0:3a1:cbea:3bf2 with SMTP id
 q12-20020a0568080ecc00b003a1cbea3bf2mr2767333oiv.11.1689954509594; Fri, 21
 Jul 2023 08:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <1689755422-8405-1-git-send-email-wangmy@fujitsu.com> <1689755422-8405-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689755422-8405-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Jul 2023 08:48:03 -0700
Message-ID: <CAMKF1srFjvtHdWtkNV++2zZzgtew3kYhN1M05j5769vdVbtu5w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH v2] wtmpdb: add new recipe
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 15:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103971

this fails to build

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2918/step=
s/15/logs/stdio

On Wed, Jul 19, 2023 at 1:30=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...emove-lto-to-fix-link-error-of-clang.patch | 31 +++++++++++++++++
>  .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 33 +++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto=
-to-fix-link-error-of-clang.patch
>  create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
>
> diff --git a/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix=
-link-error-of-clang.patch b/meta-oe/recipes-extended/wtmpdb/files/0001-rem=
ove-lto-to-fix-link-error-of-clang.patch
> new file mode 100644
> index 0000000000..ef188e7a15
> --- /dev/null
> +++ b/meta-oe/recipes-extended/wtmpdb/files/0001-remove-lto-to-fix-link-e=
rror-of-clang.patch
> @@ -0,0 +1,31 @@
> +From 9840939789dec9153150e8f9ae34de4171a5c15e Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Wed, 19 Jul 2023 07:31:32 +0000
> +Subject: [PATCH] remove lto to fix link error of clang
> +
> +error message:
> +| tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format no=
t recognized
> +| clang-16: error: linker command failed with exit code 1 (use -v to see=
 invocation)
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + meson.build | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 6fe8045..166a15b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -28,7 +28,6 @@ add_project_arguments(['-D_GNU_SOURCE=3D1',
> +                        '-D_TIME_BITS=3D64'], language : 'c')
> +
> + possible_cc_flags =3D [
> +-                  '-flto=3Dauto',
> +                   '-ffat-lto-objects',
> +                 '-fstack-protector-strong',
> +                 '-funwind-tables',
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb b/meta-oe/re=
cipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> new file mode 100644
> index 0000000000..5e7f0d86da
> --- /dev/null
> +++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Y2038 safe version of wtmp"
> +HOMEPAGE =3D "https://github.com/thkukuk/wtmpdb"
> +DESCRIPTION =3D "last reports the login and logout times of users and wh=
en the machine got rebooted."
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003e=
a2c"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "502b19a41c7a3b1b5e70969b18088683825f71f8"
> +
> +SRC_URI =3D "git://github.com/thkukuk/wtmpdb.git;branch=3Dmain;protocol=
=3Dhttps \
> +           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd
> +
> +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> +
> +SYSTEMD_SERVICE:${PN} =3D "wtmpdb-update-boot.service wtmpdb-rotate.serv=
ice"
> +
> +EXTRA_OEMESON =3D " -Dpamlibdir=3D${libdir}"
> +
> +do_install:append () {
> +      # Fix makefile hardcoded path assumptions for systemd (assumes $pr=
efix)
> +      # without usrmerge distro feature enabled
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +}
> +
> +FILES:${PN} +=3D " ${systemd_system_unitdir} "
> +FILES:${PN} +=3D " ${libdir} "
> +FILES:${PN} +=3D " ${nonarch_libdir}/tmpfiles.d/* "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103957): https://lists.openembedded.org/g/openembedde=
d-devel/message/103957
> Mute This Topic: https://lists.openembedded.org/mt/100231710/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

