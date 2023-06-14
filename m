Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B6DEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 07:42:33 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.5953.1686728543189531589
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 00:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ePtmp4v0;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55b78f40301so332709eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686728542; x=1689320542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uXHBbxKdQwdraWqgix/mEIp/Fjpm41RueVm/ht0+Uw=;
        b=ePtmp4v0d2Gcw7csvHIY7PFbpaA/jjTn9qasLNhK+khsQ5/q1sh/Z8UtfMX8zp/qIA
         WnafSNa2PK9mLGBqeI3PvqxHXQbNBla84XAxLZXb6odB3yFjz/1KpTOB1GvmqU7HFbpU
         NGbZ5pUw0sqd1FUFwcM8VJ2dN06KxtGk8Hgvt9FFc0NbTR/PwXhxWgGghZO9lBAxmoNt
         lGvqAapUYkmx5H+VRwyBhv7WiL1Tqxwa08LNP8q7I54VKbbv0Ntd5DlfrR+GATBfFWeb
         mN9Y3FDUYFDrzae/6QeaBh0W1e5QaR1rFomnFeAgpb8Qd3Eldgj3HS4YaTjGPF9tHj4Q
         KYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686728542; x=1689320542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uXHBbxKdQwdraWqgix/mEIp/Fjpm41RueVm/ht0+Uw=;
        b=E2xBbC4Ho6sFKA4X1S5wB5xdA5yVFNysgZphaYyN8M9+xfgj+O2W1ZJNsech140aMa
         31MXNU5+d8sIM+kkepO3fLponIc8XD04Wa8FYaaW5eYHK3Vn3GecqX6ktK6EmL7qXtqg
         xHqHmCpt6O+daZFYm4q2f8bTL67txDI13UzBFVRqvv1b4DsFGj9JAKBSgDqQzj62hIx5
         kfpqCbr4cDeiDkjFJGZfwpt88sKH4MRt5bsytaRvKyFEA7tIl6KXNU/S1N4WgAPQsAdS
         9NxeT/1Gix8+IsnHT+LAv0QaKNh+ehj7Ji3sqbXunFN17WjBTSQ/pMcUchGBIMba0JwX
         E9Bg==
X-Gm-Message-State: AC+VfDzMyUvn+7sycE+sDoF9/foyYME6KytCMKgxVIa4TV3Gjh1AtXEY
	JwJZA7Wy8aWi2WKC3BdHufsJX8qrKhQR0Cojvs1oSbDfUGw=
X-Google-Smtp-Source: ACHHUZ6ppodOKHHUJIx0qERRo6HaJ+d8jw1H/xrD/0TZTRSb1YWpe4ckQnLggCVVpayX+LXX0UvZ/RWoWo3kNa6Q3T4=
X-Received: by 2002:a4a:4308:0:b0:558:b4b6:7f8c with SMTP id
 k8-20020a4a4308000000b00558b4b67f8cmr9276808ooj.6.1686728542212; Wed, 14 Jun
 2023 00:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230613191758.29502-1-beniaminsandu@gmail.com>
In-Reply-To: <20230613191758.29502-1-beniaminsandu@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Jun 2023 00:41:56 -0700
Message-ID: <CAMKF1sqp-BJd7xHrQ+nODHFuYGuCg4e9mC7LHX8ORrQ3mJ_f5w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: add support for v3.x
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 07:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103280

this might be the reason for a new build failure while building mdns

| mbedtls.c:41:10: fatal error: mbedtls/certs.h: No such file or directory
|    41 | #include <mbedtls/certs.h>
|       |          ^~~~~~~~~~~~~~~~~
| compilation terminated.
| make[1]: *** [Makefile:510: objects/prod/mbedtls.c.o] Error 1
| make[1]: Leaving directory
'/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-li=
nux/mdns/1790.80.10-r0/git/mDNSPosix'

for more details see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2821/step=
s/14/logs/stdio

On Tue, Jun 13, 2023 at 12:19=E2=80=AFPM Beniamin Sandu <beniaminsandu@gmai=
l.com> wrote:
>
> Version 3.4.0 adds a lot of improvements and fixes (a notable one
> being initial support for PKCS7 CMS), but since this is a pretty
> big jump, let's keep both versions for a while, so the v2.x users
> can upgrade to 3.x in a timely manner if needed.
>
> Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> ---
>  .../mbedtls/mbedtls_3.4.0.bb                  | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls_=
3.4.0.bb
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.b=
b b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> new file mode 100644
> index 000000000..351aa43ac
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> @@ -0,0 +1,76 @@
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103275): https://lists.openembedded.org/g/openembedde=
d-devel/message/103275
> Mute This Topic: https://lists.openembedded.org/mt/99512869/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

