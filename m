Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880D5EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 18:29:25 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.15156.1687199357625234761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 11:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cy8jPuBm;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-25df7944f60so2914549a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687199357; x=1689791357;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9Gk3QrUOTnFwykrjJeGjjDxCemgmnmAF+l3iEwjPNc=;
        b=cy8jPuBmWXQ02qsy98N8ZfVftEwFxvVITfdR6ugYpk+BrDSr+GL+y4WJG+iTXu9+Sb
         ES0xo/i9X06uyjq7gWr4/ogEVPZTez9p+iyS0Z9Dk4/atbMB1+3E5ZH6QBkSAwGLxuec
         NKi8UHjFJztvsurpH8YU8Mq0k4f7P70KL2m3Exzx9zwO2EIO4rddK2X3jgKvc1VTpRuU
         nQzJjHIAJ83gkZ9lwkVMIyQnZX64wpyVGCTMsg7DoP98IVX2CuKd0z5YLaRNsrfwdDE+
         1bK1d4Raz00W4VhXLsUtxQz2xyuj773TrYGdgqbzYblaJZeTSbj57htZGRbXjp+Mkb++
         Fwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687199357; x=1689791357;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9Gk3QrUOTnFwykrjJeGjjDxCemgmnmAF+l3iEwjPNc=;
        b=AilAYQp6JoAMHSNuFV2/jdlmk2LMF9xnqibZHT4Z92wldNt4tzosenBVrfo7vD0giF
         aDtY0XLbOBnDIhlzlrri+yBeAU1tWTTqQeYnas/8WGQ6IJBMfjs3EWD489l9zPw5gEY9
         DY7PhdS4PxRp9vtXc+33AWDU4p0amYx5k210lQTRftnl+UA94OICGbLvLQ8fGCPnqaxk
         wtvIS1IKGu5hVji8KE1Yr1fbu7XdhToQ/hP6hqOhDYp0Jsq2aE1f21JoXLJ0/QMFbVDa
         yB7pD0NjaWAZMWx3zMu+Yfv/RiuPFUzyevoKxkfnUbyIobreEKeB18YYbH0ptqm2YbKC
         6ESg==
X-Gm-Message-State: AC+VfDzMxelhhIrjqRq/o4ZOd+LXkiROEAGthAZMqhqLDMCzwYvU1Yaq
	rKK1XRFyHOCvV4MhHi+ifnw49o8qnijucKxmFmI7szdQ8ZXIl0JT
X-Google-Smtp-Source: ACHHUZ53OF30LLC6ZZ5Ja7pt4hHf1OhbTLcrf7p7O10K+3zFdszUnuHl0dW8R8SEYEfuncwlfNNR1nkobIB6anY7oMg=
X-Received: by 2002:a17:90b:147:b0:25c:571:8670 with SMTP id
 em7-20020a17090b014700b0025c05718670mr10019896pjb.46.1687199356831; Mon, 19
 Jun 2023 11:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230619182559.104504-1-beniaminsandu@gmail.com>
In-Reply-To: <20230619182559.104504-1-beniaminsandu@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Mon, 19 Jun 2023 21:29:05 +0300
Message-ID: <CABQJdOH+a5s+FP=Yrktc=Hm9p=fw-PJhx7OPAgq4vsfjvS9Q9g@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v2] mbedtls: add support for v3.x
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 18:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103443

Could you please test together with this one?
https://lists.openembedded.org/g/openembedded-devel/topic/meta_networking_p=
atch/99629056?p=3D,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,99629056,prev=
id%3D1687199177764126333,nextid%3D1687180982017382829&previd=3D168719917776=
4126333&nextid=3D1687180982017382829

It should fix the mdns build.

Thanks,
Beni

On Mon, Jun 19, 2023 at 9:26=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmail=
.com> wrote:
>
> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> being initial support for PKCS7 CMS), but since this is a pretty
> big jump, let's keep both versions for a while, so the v2.x users
> can upgrade to 3.x in a timely manner if needed.
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../mbedtls/mbedtls_3.4.0.bb                  | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_=
3.4.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> new file mode 100644
> index 000000000..ebc6ba573
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> @@ -0,0 +1,85 @@
> +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> +DESCRIPTION =3D "mbedtls is a lean open source crypto library          \
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
> +HOMEPAGE =3D "https://tls.mbed.org/"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
> +
> +SECTION =3D "libs"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
> +SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmaster \
> +           file://run-ptest \
> +          "
> +
> +inherit cmake update-alternatives ptest
> +
> +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTEST_EN=
ABLED', '1', 'tests', '', d)}"
> +PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_=
SHARED_MBEDTLS_LIBRARY=3DOFF"
> +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3D=
OFF"
> +PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FATAL=
_WARNINGS=3DOFF"
> +# Make X.509 and TLS calls use PSA
> +# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-cryp=
to.md
> +PACKAGECONFIG[psa] =3D ""
> +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF"
> +
> +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
> +
> +# Needs crypto instructions on aarch64
> +TUNE_CCARGS_MARCH_OPTS:append:aarch64 =3D "${@bb.utils.contains('TUNE_FE=
ATURES', 'crypto', '', '+crypto', d)}"
> +
> +# For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
> +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBED=
TLS_USE_PSA_CRYPTO', '', d)}"
> +
> +PROVIDES +=3D "polarssl"
> +RPROVIDES:${PN} =3D "polarssl"
> +
> +PACKAGES =3D+ "${PN}-programs"
> +FILES:${PN}-programs =3D "${bindir}/"
> +
> +ALTERNATIVE:${PN}-programs =3D "hello"
> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +CVE_PRODUCT =3D "mbed_tls"
> +
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
> +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c6=
6a48edfe9ece03c7e4a53310adf73a86c
> +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
> +
> +# Strip host paths from autogenerated test files
> +do_compile:append() {
> +       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> +       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> +}
> +
> +# Export source files/headers needed by Arm Trusted Firmware
> +sysroot_stage_all:append() {
> +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/library"
> +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/include"
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

