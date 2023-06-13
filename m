Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15B2EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 18:50:03 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.28.1686682200742382599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 11:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rD5T0Iw1;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-56cf916aaa2so41340597b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686682200; x=1689274200;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JE6ZUUlBssuYLC4Zq9gCKffsRe6unQARcsyDbUVtgzE=;
        b=rD5T0Iw1Y715RaylG2zGIWNz2KK9HzTBYR/iBNzp9QBvHMyL55jKsVG/MTec3JrJ8W
         Va/EcpLCszoTCll+s7mIi9eS1YjOCTqQSyRsGIfB6OetTndEPwCctITfSZ52eLLTAV1e
         lCZFSuWp2OubYXV90kfovL+MjEG6KsjzZAkB+1DisX3d8dncXRiupvDycSMO+aMwCI8b
         ppYf13Co3lcuKP+v+CwA4IVQcRpesNZdqQb7ptxH2/dVvuhJQ+khUcd3dBDGC5DikSWI
         UwIR1IoHoA/KUYUvp+7pdm4bkV1Nx/hpSn9DEj4/L0KgkZdMNUOMN3QYki5wjEp/W/bn
         sZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686682200; x=1689274200;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JE6ZUUlBssuYLC4Zq9gCKffsRe6unQARcsyDbUVtgzE=;
        b=azxP4Vup/pr2JqbubbQti9KzmpSmikLGm4QYFIKue8F2FRjZY6pf8C88FeN2Bi5FCc
         xLiZcjQF41RA8LbTtLMkHx93T0/hGefFYSK8zS550npuZe78tEwPeNup8z5l/7qs1dZ4
         ISK0F21lUr61QDhXnfqpqL4345FQD1wbN1fYcVW67uGO51ilXPyjI2tgcBG1UeSfKYQ7
         cBM/lhx9ZJHG20AbjEeLgfXDOGsCiz6GzseRvqiG9I47Hjn3ZiYfV/TIZMcSgrll/E8M
         O1f7DkIwDlnxhcIcmCuXtB7wdbXriOGWIUOPS26xLXgsCE6VTq/+bJbqSy8ZWQj9skdB
         Dwzg==
X-Gm-Message-State: AC+VfDynQTbRaZKghD7Qf7zXs758bLGnXdBH7t5rqa4HZ//3pTSJMnn/
	QvpaKfE56r/wlr9XoE8jhC8=
X-Google-Smtp-Source: ACHHUZ6bMDRrHJpCd+i7ED04IkLkV1vlH6VtTeYuU4RruQWdVYB9i2j3nzCQeUfSYbw77dDLaFVsUw==
X-Received: by 2002:a81:7489:0:b0:56d:2bab:947e with SMTP id p131-20020a817489000000b0056d2bab947emr2451768ywc.43.1686682199765;
        Tue, 13 Jun 2023 11:49:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:c2e6:264f:c49e:31f6? ([2600:1700:9190:ba10:c2e6:264f:c49e:31f6])
        by smtp.gmail.com with ESMTPSA id n126-20020a817284000000b00561949f713fsm3333551ywc.39.2023.06.13.11.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:49:59 -0700 (PDT)
Message-ID: <b5aa26cd-11d5-f9e3-1b4c-2d51d600f9ab@gmail.com>
Date: Tue, 13 Jun 2023 14:49:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support for
 v3.x
Content-Language: en-US
To: Beniamin Sandu <beniaminsandu@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20230613160621.100974-1-beniaminsandu@gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230613160621.100974-1-beniaminsandu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 18:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103273



On 6/13/23 12:06 PM, Beniamin Sandu wrote:
> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> being initial support for PKCS7 CMS), but since this is a pretty
> big jump, let's keep both versions for a while, so the v2.x users
> can upgrade to 3.x in a timely manner if needed.

The Stable branch maintenance policy is not to allow package update 
unless they are bugfix or its an LTS version.

Master as at an older version so it should be updated first.

- armin
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>   .../mbedtls/mbedtls/run-ptest                 | 17 +++++
>   .../mbedtls/mbedtls_3.4.0.bb                  | 76 +++++++++++++++++++
>   2 files changed, 93 insertions(+)
>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
>   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
>
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
> index 000000000..351aa43ac
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> @@ -0,0 +1,76 @@
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
> +           file://run-ptest \
> +          "
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
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> +	sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> +	sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> +}
> +
> +do_install_ptest () {
> +	install -d ${D}${PTEST_PATH}/tests
> +	cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> +	find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> +	cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> +}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103271): https://lists.openembedded.org/g/openembedded-devel/message/103271
> Mute This Topic: https://lists.openembedded.org/mt/99508857/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


