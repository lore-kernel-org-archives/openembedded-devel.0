Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC880EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 18:46:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1900.1687977994488025896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 11:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=K3E3TQfK;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so161013a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 11:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687977994; x=1690569994;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XnzAr9NPaGnXmYviUrPxxYTJ8YOznczrCf0SBwGvYZ8=;
        b=K3E3TQfKgMHmb5vQzJG7vHUNnZ1adck6xEOi1jinMIK63J26a8WNUVF9tSikjVGFly
         IcXA6xfyO/mGmOsR8H1IEDg5f1OJrvukh/+ES6JkGuI1bltVVeRVazPZCZwwkLsT9rg2
         fdMoexoSu6dX+MjQITi5O2w4Cc9/KZ8OWjsxR/aBgoIB1BOY+s8QQkJr1KN0dN2hMlXz
         jn4LHwXLnPcVQROAjunuZxL7xC61XOIrNB47jVGuLh28lhnGw+o5xAK0lxgDabiEBizS
         cvUG0nFAaewRZpv6LpOJxnF2RqzisT55TB3Pp1GKWiTDYAqBmyOJBs3pZFMQKbhF76+u
         kaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687977994; x=1690569994;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XnzAr9NPaGnXmYviUrPxxYTJ8YOznczrCf0SBwGvYZ8=;
        b=M2CrV59YJcxY2NV8D1w2FZSX7Nks60uDuifwuiTgULG4q1mnjQlWKgQLtfHAVuC6u7
         WB1ac18P3g0+UctKBUAHbm6qnMlMwu7DlGCc1qKV2+R7iBkFzXg7bd1X4i41pB0ORXOj
         vZz40HW605tDCkBPnwGQdR4b8zEv2D4Yvy7UWPYg6qsoyveVeFhqUYdM1pCcYsa3WqbO
         cATVcSRO5XINwsRsvuYxew0eDaNKVDejlh85rpd3YNiZZOeWe6WryMRAWZrZb+kMZpYJ
         A3l9iyvtItFXXjfUt+gAFyjcZpQoaXDsKnBaLEa2MNQ5tnjXAsA6V1682ionxbYMRpo5
         +IqQ==
X-Gm-Message-State: AC+VfDzoeOBpbxqnLJf2K3fbUh+lMTeqP0rspHS+qVoJyJrkU/MdICMr
	iYCoVJAuLyo7x3zomAYNTt7qQ9gJiciRIDXw0CIFW+4Webg=
X-Google-Smtp-Source: ACHHUZ4vIiRqKdbENqRh41tZhUF+Pr9Y4L7Bz+R3H+dIHaT2/wiEg2Tm21H4HL37EE7IeFj+mfTskaVPblwRc2A2AWo=
X-Received: by 2002:a17:90a:bd06:b0:262:fa59:2908 with SMTP id
 y6-20020a17090abd0600b00262fa592908mr2959594pjr.1.1687977993773; Wed, 28 Jun
 2023 11:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230628184046.121775-1-beniaminsandu@gmail.com>
In-Reply-To: <20230628184046.121775-1-beniaminsandu@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 28 Jun 2023 21:46:22 +0300
Message-ID: <CABQJdOFSBfwwKh9dcMuTnrKdTpjc+cXo5q5N0iD_Q-Gx6o0QMg@mail.gmail.com>
Subject: Re: [meta-networking][kirkstone][PATCH v2] mbedtls: add support for v3.x
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 18:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103632

Hey Armin,

This is the same recipe from master, which now has support for both v2
and v3 mbedtls. Since both versions would be supported and it's not a
major package upgrade, we should not be breaking policy.
This is also not an isolated case from a quick look, since there are
other packages that do this (e.g. redis), so it would be great to get
it on kirkstone too.

Thanks,
Beni

On Wed, 28 Jun 2023 at 21:41, Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> being initial support for PKCS7 CMS), but since this is a pretty
> big jump, let's keep both versions for a while, so the v2.x users
> can upgrade to 3.x in a timely manner if needed.
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  ...cify-an-arch-version-when-enabling-c.patch | 33 ++++++++
>  ...t-target-attribute-when-building-wit.patch | 34 ++++++++
>  .../mbedtls/mbedtls/run-ptest                 | 17 ++++
>  .../mbedtls/mbedtls_3.4.0.bb                  | 83 +++++++++++++++++++
>  4 files changed, 167 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> new file mode 100644
> index 000000000..d98d8fa57
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch
> @@ -0,0 +1,33 @@
> +From 2246925e3cb16183e25d4e2cfd13fb800df86270 Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Sun, 25 Jun 2023 19:58:08 +0300
> +Subject: [PATCH] aesce: do not specify an arch version when enabling crypto
> + instructions
> +
> +Building mbedtls with different aarch64 tuning variations revealed
> +that we should use the crypto extensions without forcing a particular
> +architecture version or core, as that can create issues.
> +
> +Upstream-Status: Submitted [https://github.com/Mbed-TLS/mbedtls/pull/7834]
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
> +-#       pragma GCC target ("arch=armv8-a+crypto")
> ++#       pragma GCC target ("+crypto")
> + #       define MBEDTLS_POP_TARGET_PRAGMA
> + #   else
> + #       error "Only GCC and Clang supported for MBEDTLS_AESCE_C"
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> new file mode 100644
> index 000000000..4775c8ddb
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/0002-aesce-use-correct-target-attribute-when-building-wit.patch
> @@ -0,0 +1,34 @@
> +From 03d3523f974536f2358047382aadb0d4cc762f8a Mon Sep 17 00:00:00 2001
> +From: Beniamin Sandu <beniaminsandu@gmail.com>
> +Date: Mon, 26 Jun 2023 12:07:21 +0300
> +Subject: [PATCH] aesce: use correct target attribute when building with clang
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
> +-#       pragma clang attribute push (__attribute__((target("crypto"))), apply_to=function)
> ++#       pragma clang attribute push (__attribute__((target("aes"))), apply_to=function)
> + #       define MBEDTLS_POP_TARGET_PRAGMA
> + #   elif defined(__GNUC__)
> + #       if __GNUC__ < 6
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> new file mode 100644
> index 000000000..059ab4ecb
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +
> +ptestdir=$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +tests=$(find * -type f -name 'test_suite_*')
> +
> +for f in $tests
> +do
> +    if test -x ./"$f"; then
> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    fi
> +done
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> new file mode 100644
> index 000000000..b8c9662de
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> @@ -0,0 +1,83 @@
> +SUMMARY = "Lightweight crypto and SSL/TLS library"
> +DESCRIPTION = "mbedtls is a lean open source crypto library          \
> +for providing SSL and TLS support in your programs. It offers        \
> +an intuitive API and documented header files, so you can actually    \
> +understand what the code does. It features:                          \
> +                                                                     \
> + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> +   Camellia and XTEA                                                 \
> + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> +   ECDSA and ECDH                                                    \
> + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> + - Abstraction layers for ciphers, hashes, public key operations,    \
> +   platform abstraction and threading                                \
> +"
> +
> +HOMEPAGE = "https://tls.mbed.org/"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SECTION = "libs"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
> +SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=master \
> +       file://0001-aesce-do-not-specify-an-arch-version-when-enabling-c.patch \
> +       file://0002-aesce-use-correct-target-attribute-when-building-wit.patch \
> +       file://run-ptest"
> +
> +inherit cmake update-alternatives ptest
> +
> +PACKAGECONFIG ??= "shared-libs programs ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> +PACKAGECONFIG[shared-libs] = "-DUSE_SHARED_MBEDTLS_LIBRARY=ON,-DUSE_SHARED_MBEDTLS_LIBRARY=OFF"
> +PACKAGECONFIG[programs] = "-DENABLE_PROGRAMS=ON,-DENABLE_PROGRAMS=OFF"
> +PACKAGECONFIG[werror] = "-DMBEDTLS_FATAL_WARNINGS=ON,-DMBEDTLS_FATAL_WARNINGS=OFF"
> +# Make X.509 and TLS calls use PSA
> +# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.md
> +PACKAGECONFIG[psa] = ""
> +PACKAGECONFIG[tests] = "-DENABLE_TESTING=ON,-DENABLE_TESTING=OFF"
> +
> +EXTRA_OECMAKE = "-DLIB_INSTALL_DIR:STRING=${libdir}"
> +
> +# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS
> +CFLAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> +
> +PROVIDES += "polarssl"
> +RPROVIDES:${PN} = "polarssl"
> +
> +PACKAGES =+ "${PN}-programs"
> +FILES:${PN}-programs = "${bindir}/"
> +
> +ALTERNATIVE:${PN}-programs = "hello"
> +ALTERNATIVE_LINK_NAME[hello] = "${bindir}/hello"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_PRODUCT = "mbed_tls"
> +
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> +CVE_CHECK_IGNORE += "CVE-2021-43666"
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c
> +CVE_CHECK_IGNORE += "CVE-2021-45451"
> +
> +# Strip host paths from autogenerated test files
> +do_compile:append() {
> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> +}
> +
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> +}
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}/tests
> +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> +}
> --
> 2.25.1
>

