Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E4CEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 00:12:36 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.2012.1688688752576324617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 17:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jV2HBFY5;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: beniaminsandu@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so3113068e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jul 2023 17:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688688750; x=1691280750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMbxcY/b0MQDNnr+Ewe1/gtB3BkPzSw1ZhC0rR/woTs=;
        b=jV2HBFY5+P8ge64OpvitsXra3DrnR3oMUodXaByGT47B927CU+vDpYiM02AZwFnbu9
         y+T8j1Y+4VPcWsF4ESBnD/CXyx/I8zYqILHQXzM5jRYzs3amq1TNMWntzDo217/D8bvK
         mX9F/qp2Y/ayz+1k6idpr3fa6LoCWJXmDip1bK53/M0QJqFSup9haCNve50T8a0MGvmc
         FqmJUyKDuGVfbGIo07SswUCiYWbKQdxQbO17mi54foXdB97uQDamthL6EHrVnzW80o90
         4icxlAxLIhS5yLe1H+Mme4Z6MVaGoiv409ntty0yQ/Nclmughlhn7w0UBhY8dU0edNEH
         E/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688688750; x=1691280750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMbxcY/b0MQDNnr+Ewe1/gtB3BkPzSw1ZhC0rR/woTs=;
        b=WorE5FLg8tPNtGm08NbFq+VrXLf5crTR1/Dp5Xhx9KGhPV181Va/lbYLK+pg+3677G
         Nf0fVl3hiK7oWp+68MDcoUSh2ZUdstJcgi7oNsn4ScrS/X95HMuMh+YdejxOBpbkVSOi
         DBe6595nsVqy24zdRNe3gPFZm4hm8FuFNydaz2B+LQS2Q1f93TbohplZk1TnbyOrqgwl
         H7/nVXTpcPdYv4oHUakLBgcD2wcjrxRnqpwbD9dqXK92fJn0aABGgeSxKTZTyz/j5Xa7
         LzKvaQ7kBNqrPX5AkO75wmEf+qP7lzpn0xBlHhjWgP2XTJyVC/6JoVA+ESVibf0c1Pfc
         jQLA==
X-Gm-Message-State: ABy/qLb4erhtTXUNpl8gIWKrH3K8FKz9nHkTPbKXcNoTPn6JLKsV+fde
	VTGJR6uOWnBEQw4/9TOLUUC8wO1+4jKnFTRKtc4=
X-Google-Smtp-Source: APBJJlFKXI/QnrljfPGQcpD0JH6QyvnEp8F0cdisMqVSCBqPXe5K2fDI3sCznRvdEdqJmGC+fQjAVBICiz7LsDuIPks=
X-Received: by 2002:a05:6512:2255:b0:4f8:453f:732f with SMTP id
 i21-20020a056512225500b004f8453f732fmr1514855lfu.2.1688688750251; Thu, 06 Jul
 2023 17:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230628184046.121775-1-beniaminsandu@gmail.com>
 <CABQJdOFSBfwwKh9dcMuTnrKdTpjc+cXo5q5N0iD_Q-Gx6o0QMg@mail.gmail.com> <20230706213623.GG1518@denix.org>
In-Reply-To: <20230706213623.GG1518@denix.org>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Fri, 7 Jul 2023 03:12:16 +0300
Message-ID: <CABQJdOG1FmeJ8oQVdx+76FpLrP5CrYbFhxRicUhxmdZ8pWXqWA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH v2] mbedtls: add support
 for v3.x
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 00:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103685

Hi Denys,

I was thinking that since it is not replacing the old version but just
providing the v3 one as an extra option, it is not really an upgrade.
While there are noticeable differences between the versions, both of
them are still available for building.

Isn't PREFERRED_VERSION a simple and convenient way to select the
desired one? I don't know if there is a better way to handle this
scenario, but did not consider this to be too much of a hassle, it's
just one variable and its use is quite straightforward.

Cheers,
Beni

On Fri, 7 Jul 2023 at 00:36, Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, Jun 28, 2023 at 09:46:22PM +0300, Beniamin Sandu wrote:
> > Hey Armin,
> >
> > This is the same recipe from master, which now has support for both v2
> > and v3 mbedtls. Since both versions would be supported and it's not a
> > major package upgrade, we should not be breaking policy.
>
> Well, it is actually a *major* upgrade and there are some incompatible API
> changes in v3 vs v2! E.g. entropy_poll.h is no longer provided among others.
>
> With this backport one needs to scramble and set PREFERRED_VERSION to v2
> explicitly, which is not nice. This is exactly why there's a policy for not
> allowing major version backports to stable releases w/o a strong reason!
>
> --
> Denys
>
>
> > This is also not an isolated case from a quick look, since there are
> > other packages that do this (e.g. redis), so it would be great to get
> > it on kirkstone too.
> >
> > Thanks,
> > Beni
> >
> > On Wed, 28 Jun 2023 at 21:41, Beniamin Sandu <beniaminsandu@gmail.com> wrote:
> > >
> > > Version 3.4.0 adds a lot of improvements and fixes (a notable one
> > > being initial support for PKCS7 CMS), but since this is a pretty
> > > big jump, let's keep both versions for a while, so the v2.x users
> > > can upgrade to 3.x in a timely manner if needed.
> > >
> > > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > ---
> > >  ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++
> > >  ...t-target-attribute-when-building-wit.patch | 34 ++++++++
> > >  .../mbedtls/mbedtls/run-ptest                 | 17 ++++
> > >  .../mbedtls/mbedtls_3.4.0.bb                  | 83 +++++++++++++++++++
> > >  4 files changed, 167 insertions(+)
> > >  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> > >  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> > >  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> > >  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > >
> > > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> > > new file mode 100644
> > > index 000000000..d98d8fa57
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> > > @@ -0,0 +1,33 @@
> > > +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> > > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > +Date: Sun, 25 Jun 2023 19:58:08 +0300
> > > +Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
> > > + instructions
> > > +
> > > +Building mbedtls with different aarch64 tuning variations revealed
> > > +that we should use the crypto extensions without forcing a particular
> > > +architecture version or core, as that can create issues.
> > > +
> > > +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/7834]
> > > +
> > > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > +---
> > > + library/aesce.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/library/aesce.c b/library/aesce.c
> > > +index fe056dc4c..843de3973 100644
> > > +--- a/library/aesce.c
> > > ++++ b/library/aesce.c
> > > +@@ -60,7 +60,7 @@
> > > + #           error "A more recent GCC is required for MBEDTLS_AESCE_C"
> > > + #       endif
> > > + #       pragma GCC push_options
> > > +-#       pragma GCC target ("arch=armv8-a+crypto")
> > > ++#       pragma GCC target ("+crypto")
> > > + #       define MBEDTLS_POP_TARGET_PRAGMA
> > > + #   else
> > > + #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> > > new file mode 100644
> > > index 000000000..4775c8ddb
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> > > @@ -0,0 +1,34 @@
> > > +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> > > +From: Beniamin Sandu <beniaminsandu@gmail.com>
> > > +Date: Mon, 26 Jun 2023 12:07:21 +0300
> > > +Subject: [PATCH] aesce: use correct target attribute when building with clang
> > > +
> > > +Seems clang has its own issues when it comes to crypto extensions,
> > > +and right now the best way to avoid them is to accurately enable
> > > +the needed instructions instead of the broad crypto feature.
> > > +
> > > +E.g.: https://github.com/llvm/llvm-project/issues/61645
> > > +
> > > +Upstream-Status: Pending
> > > +
> > > +Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > > +---
> > > + library/aesce.c | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/library/aesce.c b/library/aesce.c
> > > +index 843de3973..7bea088ba 100644
> > > +--- a/library/aesce.c
> > > ++++ b/library/aesce.c
> > > +@@ -53,7 +53,7 @@
> > > + #       if __clang_major__ < 4
> > > + #           error "A more recent Clang is required for MBEDTLS_AESCE_C"
> > > + #       endif
> > > +-#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
> > > ++#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
> > > + #       define MBEDTLS_POP_TARGET_PRAGMA
> > > + #   elif defined(__GNUC__)
> > > + #       if __GNUC__ < 6
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> > > new file mode 100644
> > > index 000000000..059ab4ecb
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> > > @@ -0,0 +1,17 @@
> > > +#!/bin/sh
> > > +
> > > +ptestdir=$(dirname "$(readlink -f "$0")")
> > > +cd "$ptestdir"/tests || exit
> > > +
> > > +tests=$(find * -type f -name 'test_suite_*')
> > > +
> > > +for f in $tests
> > > +do
> > > +    if test -x ./"$f"; then
> > > +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> > > +            echo "PASS: $f"
> > > +        else
> > > +            echo "FAIL: $f"
> > > +        fi
> > > +    fi
> > > +done
> > > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > > new file mode 100644
> > > index 000000000..b8c9662de
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > > @@ -0,0 +1,83 @@
> > > +SUMMARY = "Lightweight crypto and SSL/TLS library"
> > > +DESCRIPTION = "mbedtls is a lean open source crypto library          \
> > > +for providing SSL and TLS support in your programs. It offers        \
> > > +an intuitive API and documented header files, so you can actually    \
> > > +understand what the code does. It features:                          \
> > > +                                                                     \
> > > + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> > > +   Camellia and XTEA                                                 \
> > > + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> > > + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> > > + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> > > +   ECDSA and ECDH                                                    \
> > > + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> > > + - Abstraction layers for ciphers, hashes, public key operations,    \
> > > +   platform abstraction and threading                                \
> > > +"
> > > +
> > > +HOMEPAGE = "https://tls.mbed.org/"
> > > +
> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> > > +
> > > +SECTION = "libs"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
> > > +SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
> > > +       file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
> > > +       file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
> > > +       file://run-ptest"
> > > +
> > > +inherit cmake update-alternatives ptest
> > > +
> > > +PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> > > +PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
> > > +PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
> > > +PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
> > > +# Make X.509 and TLS calls use PSA
> > > +# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md
> > > +PACKAGECONFIG[psa] = ""
> > > +PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
> > > +
> > > +EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
> > > +
> > > +# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
> > > +CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> > > +
> > > +PROVIDES += "polarssl"
> > > +RPROVIDES:${PN} = "polarssl"
> > > +
> > > +PACKAGES =+ "${PN}-programs"
> > > +FILES:${PN}-programs = "${bindir}/"
> > > +
> > > +ALTERNATIVE:${PN}-programs = "hello"
> > > +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > +
> > > +CVE_PRODUCT = "mbed_tls"
> > > +
> > > +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> > > +CVE_CHECK_IGNORE += "CVE-2021-43666"
> > > +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
> > > +CVE_CHECK_IGNORE += "CVE-2021-45451"
> > > +
> > > +# Strip host paths from autogenerated test files
> > > +do_compile:append() {
> > > +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> > > +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> > > +}
> > > +
> > > +# Export source files/headers needed by Arm Trusted Firmware
> > > +sysroot_stage_all:append() {
> > > +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> > > +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> > > +}
> > > +
> > > +do_install_ptest () {
> > > +       install -d ${D}${PTEST_PATH}/tests
> > > +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> > > +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> > > +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> > > +}
> > > --
> > > 2.25.1
> > >

