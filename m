Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.361.1601314119845771809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 10:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=thROGmUk;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id c18so1381763qtw.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rg2wSemCkqYL5SmYj1SfGXP4cLP/97Oiv/FYZL3ppk=;
        b=thROGmUk5r4lG2jjnAG9leLM4HDcwQNFYmsrUheiCOkQIHcLqAxFBV0iiVWfIP+Ahe
         /C/yXOVm9JCx1SO+cMuuKyAuwo79CK2FtyspaPYPqqzw1qoP9EB6ZDJ4tnBwdxCdGTpz
         GyqyphrDeePJif4EyScWnI3rzhAtGY0qSjkSCdj2fktYl2KUkNovS6hnzU6oR0PiLwoX
         f5pCdd7F94ibcJcUWixVN9lwBgXEI318u3opqF7oK0k4gwqSOeACT33DRGeYcn+8qWCd
         HiAtdF4bzHsDhULvdXOsnRy+DGrdL4Th0q71BWEQMti5+NFu0bw1al3cjlBTle8bcUZ0
         FbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rg2wSemCkqYL5SmYj1SfGXP4cLP/97Oiv/FYZL3ppk=;
        b=CtQdk4jj5Ib8eZpysD/YTKlyAXSuVJ1LjmXiPuPN7+i19xeQGPcA/dscvt591ARfO3
         Yoj/XvF5UWauELWe/yJlJRcFbFWmzjYdhrQEM+GIZdbrg9LB6Gl9t0ShZk4gZ5Pk0LKr
         S6OHbA3I++5kHtEnPNm++ZZ7PpN4fM5Oxq5cKwjduNyaVhu2pbL//Bzg3rYNFvO5uv7O
         8ubxZAvaKjvtMsAHjWF3jwVYH1UqZsiyGPDMbEOToy3P4hOxC6MlFr0UC/zIWBnpbKLR
         C6y1M1v19Fnzu3OaMWzEqDXN+c3LXHA2IOetwk2M2K3maT4qlq36ZKrKbmu6cdMC0Dml
         DQgw==
X-Gm-Message-State: AOAM5336d/xebAoR7zY4KMd5Lw7/6PG/xMWY2y6CY/XGyGH5oQREdx4/
	avjBIXVP9yZMsPAPBBSFFyq+XBM9AmjukfjF4Ns=
X-Google-Smtp-Source: ABdhPJyFm2zMTXQi8JP1UD0XJWyp/T2CHcE4j3ysVelyA7daQVKgTeo/U/88IAef/+H/PFmXjJg/I6Kv4V8j7oHQO/c=
X-Received: by 2002:aed:2646:: with SMTP id z64mr2706548qtc.194.1601314118836;
 Mon, 28 Sep 2020 10:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200928141559.13494-1-akuster808@gmail.com>
In-Reply-To: <20200928141559.13494-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Sep 2020 10:28:12 -0700
Message-ID: <CAMKF1soRko=jx5KQ0=FLjvq0zG7mKxr27FDae7ConJDJkNAdQg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v3][PATCH] cmocka: add recipe
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks for v3, staged it

On Mon, Sep 28, 2020 at 7:16 AM akuster <akuster808@gmail.com> wrote:
>
> includes ptest and bundling of examples that can be used for testing
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> --
> V2]
> Backport the OE Samba fix
> amba: fix build on qemumips64 with musl
> https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba?id=b758150d30a5fbdc47c465d0e9dca3a7e6d71f3c
>
> The cmocka fix "Don't redefine uintptr_t" did not address the musl failure.
> https://git.cryptomilk.org/projects/cmocka.git/commit/?id=28ce16b29911e5adc60140b572dee177adc7a178
>
> WIll have to submit the samba fix to cmacka and see how it goes.
>
> v3]
> add pkg to pkg-groups
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  2 +
>  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb   | 39 ++++++++++++++
>  .../cmocka/files/cmocka-uintptr_t.patch       | 53 +++++++++++++++++++
>  meta-oe/recipes-test/cmocka/files/run-ptest   | 10 ++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
>  create mode 100644 meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
>  create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 46cc935c66..9bfc8ffaa4 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -886,6 +886,7 @@ RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi"
>
>  RDEPENDS_packagegroup-meta-oe-test ="\
>      bats \
> +    cmocka \
>      cppunit \
>      cukinia \
>      cunit \
> @@ -916,6 +917,7 @@ RDEPENDS_packagegroup-meta-oe-ptest-packages = "\
>      uthash-ptest \
>      libee-ptest \
>      poco-ptest \
> +    cmocka-ptest \
>  "
>  RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86 = " mcelog-ptest"
>  RDEPENDS_packagegroup-meta-oe-ptest-packages_append_x86-64 = " mcelog-ptest"
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> new file mode 100644
> index 0000000000..5aee5ef931
> --- /dev/null
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION = "cmocka is an elegant unit testing framework for C with support for mock \
> +objects. It only requires the standard C library, works on a range of computing \
> +platforms (including embedded) and with different compilers."
> +HOMEPAGE = "https://cmocka.org/"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRCREV = "56eb3a183fc222120f86d0c54fd033992c30135e"
> +SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git \
> +           file://run-ptest \
> +           file://cmocka-uintptr_t.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE=Debug -DUNIT_TESTING=ON', '', d)}"
> +
> +do_install_append () {
> +    install -d ${D}${datadir}/${BPN}/example
> +    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
> +    install -d ${D}${datadir}/${BPN}/example/mock/uptime
> +
> +    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
> +    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
> +    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> +    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
> +}
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -m 0755 ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> +
> +PACKAGE_BEFORE_PN += "${PN}-examples"
> +
> +FILES_${PN}-examples = "${datadir}/${BPN}/example"
> diff --git a/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch b/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
> new file mode 100644
> index 0000000000..8d3b73b631
> --- /dev/null
> +++ b/meta-oe/recipes-test/cmocka/files/cmocka-uintptr_t.patch
> @@ -0,0 +1,53 @@
> +From 5bd7b5d04435bd593349825973ce32290f5f604d Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 25 Jul 2018 09:55:25 +0800
> +Subject: [PATCH] samba: cmocka.h: fix musl libc conflicting types error
> +
> +Fix build on qemumips64(el)
> +
> +taken from:
> +[PATCH] libldb: fix musl libc conflicting types error
> +
> +/third_party/cmocka/cmocka.h:126:28: error: conflicting types for 'uintptr_t'
> +            typedef unsigned int uintptr_t;
> +                                 ^~~~~~~~~
> +use __DEFINED_uintptr_t in alltypes.h to check if uintptr already defined
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> +
> +Taken from [PATCH] samba: cmocka.h: fix musl libc conflicting types error
> +https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-connectivity/samba?id=b758150d30a5fbdc47c465d0e9dca3a7e6d71f3c
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +This fix is not in cmocka, so pending pending??
> +
> +
> +Index: git/include/cmocka.h
> +===================================================================
> +--- git.orig/include/cmocka.h
> ++++ git/include/cmocka.h
> +@@ -116,7 +116,7 @@ typedef uintmax_t LargestIntegralType;
> +     ((LargestIntegralType)(value))
> +
> + /* Smallest integral type capable of holding a pointer. */
> +-#if !defined(_UINTPTR_T) && !defined(_UINTPTR_T_DEFINED)
> ++#if !defined(__DEFINED_uintptr_t)
> + # if defined(_WIN32)
> +     /* WIN32 is an ILP32 platform */
> +     typedef unsigned int uintptr_t;
> +@@ -140,9 +140,8 @@ typedef uintmax_t LargestIntegralType;
> + #  endif /* __WORDSIZE */
> + # endif /* _WIN32 */
> +
> +-# define _UINTPTR_T
> +-# define _UINTPTR_T_DEFINED
> +-#endif /* !defined(_UINTPTR_T) || !defined(_UINTPTR_T_DEFINED) */
> ++# define __DEFINED_uintptr_t
> ++#endif /* !defined(__DEFINED_uintptr_t) */
> +
> + /* Perform an unsigned cast to uintptr_t. */
> + #define cast_to_pointer_integral_type(value) \
> diff --git a/meta-oe/recipes-test/cmocka/files/run-ptest b/meta-oe/recipes-test/cmocka/files/run-ptest
> new file mode 100644
> index 0000000000..48b9cd9fc5
> --- /dev/null
> +++ b/meta-oe/recipes-test/cmocka/files/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +
> +cd tests
> +for i in `ls *`; do
> +   if [ ./$i ] ; then
> +       echo "PASS: $i"
> +   else
> +       echo "FAIL: $i"
> +   fi
> +done
> --
> 2.17.1
>
>
> 
>
