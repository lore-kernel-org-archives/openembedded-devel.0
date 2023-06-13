Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B68EB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 19:04:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.34.1686683049721896377
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 12:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fewkZzM3;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1b3db8f3d07so13055405ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686683049; x=1689275049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhEEGRSqk/QkH1b+eNb69TG/paxtD/wUHvyrPCCw8QU=;
        b=fewkZzM3HkfvT8APZq/AgeA+PDlTi41r818iBMor7GGu5lo2YOgqt2BRvf39nv1yjj
         wAT8IlC58C1CsYAzkU/I4AZ6W3ifRE3Lvmq5BrAlvetlrQ/uX3oRM9gXKPyH1PtsjhzM
         Rtlge32v6R8Kn0AO/19InW7U5uZN5MQUOAtggw03Gcwi187RxFSA2mLLw2ywl30/h8iv
         /Z9LuD1fUwEsbKpZz6yP7fngbivabqx5oKq/jcBYeLhURLGnzmvLWGOIGzLh4Ig3DZiZ
         kdNG+ythljOcAKuqyJ3JQ2NUUqXHPHsMbgAjYB3MClN7RbViSQzD3GNjOY1FRe+LWD00
         lp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683049; x=1689275049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhEEGRSqk/QkH1b+eNb69TG/paxtD/wUHvyrPCCw8QU=;
        b=k5l7xFtQlHWgAQfozifWaQjrLF8XLwiqlnAgJr86aHdB9g9l4gFRbxU2WPgpcpPCIz
         UlOkWDTxciSY2Pms+1d8Yahm8ALNZqHoozNtc2BUP3BhtE6cJOYdFln3wxX7Qdk+4hqS
         CyyJSujlJn5ewDgMMiwX1JTJ8Ptu5LAO/ij+I7bV0M/OEkV3qUwWCqwvXq8ER+wLnafp
         EPx1DMR4WNyd3Fa3zxUaltxDGP+8iAJnOtfmjeuCulkPQXC0mNdt1DurCYE2Ab3Dw56V
         9jHQp/oXiw3T7/ql8qosulEElUTIvV1h+WZSyFF90FCLoIVBSo4tJmPIrKdE0Qhgrr6i
         TwgA==
X-Gm-Message-State: AC+VfDzMZB8Ld5VRq8NsL2G5pIAipdJvnCL9Y3EIpJfTqZL2dWEwvgNJ
	Y2WA+OAV9rriX14l3BQg6p5IsdJ4yXhRGDP+xts=
X-Google-Smtp-Source: ACHHUZ4SJttPnD6AUW0Ou/MzeAkmNaxReZBGR9aWiwmlK7JoYcPRZ/TviI0/YIKcpzfsE2P4tDkphb0Q6R/6hX0KbJQ=
X-Received: by 2002:a17:90a:d486:b0:25b:df69:e740 with SMTP id
 s6-20020a17090ad48600b0025bdf69e740mr5544400pju.34.1686683049030; Tue, 13 Jun
 2023 12:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230613160621.100974-1-beniaminsandu@gmail.com> <b5aa26cd-11d5-f9e3-1b4c-2d51d600f9ab@gmail.com>
In-Reply-To: <b5aa26cd-11d5-f9e3-1b4c-2d51d600f9ab@gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Tue, 13 Jun 2023 22:03:58 +0300
Message-ID: <CABQJdOEWXKkkZnHVcfWOgR2gg6Exx5dbijWAHwGq9=if0B1WHw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] mbedtls: add support for v3.x
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 19:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103274

Thanks for the feedback, I was about to follow up with a similar patch
on the master branch.

Is there any chance we can include it on kirkstone too after it gets on mas=
ter?

Cheers,
Beni

On Tue, Jun 13, 2023 at 9:50=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:
>
>
>
> On 6/13/23 12:06 PM, Beniamin Sandu wrote:
> > Version 3.4.0 adds a lot of improvements and fixes (a notable one
> > being initial support for PKCS7 CMS), but since this is a pretty
> > big jump, let's keep both versions for a while, so the v2.x users
> > can upgrade to 3.x in a timely manner if needed.
>
> The Stable branch maintenance policy is not to allow package update
> unless they are bugfix or its an LTS version.
>
> Master as at an older version so it should be updated first.
>
> - armin
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >   .../mbedtls/mbedtls/run-ptest                 | 17 +++++
> >   .../mbedtls/mbedtls_3.4.0.bb                  | 76 ++++++++++++++++++=
+
> >   2 files changed, 93 insertions(+)
> >   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedt=
ls/run-ptest
> >   create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedt=
ls_3.4.0.bb
> >
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-p=
test b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> > new file mode 100644
> > index 000000000..059ab4ecb
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls/run-ptest
> > @@ -0,0 +1,17 @@
> > +#!/bin/sh
> > +
> > +ptestdir=3D$(dirname "$(readlink -f "$0")")
> > +cd "$ptestdir"/tests || exit
> > +
> > +tests=3D$(find * -type f -name 'test_suite_*')
> > +
> > +for f in $tests
> > +do
> > +    if test -x ./"$f"; then
> > +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> > +            echo "PASS: $f"
> > +        else
> > +            echo "FAIL: $f"
> > +        fi
> > +    fi
> > +done
> > diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0=
.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > new file mode 100644
> > index 000000000..351aa43ac
> > --- /dev/null
> > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.4.0.bb
> > @@ -0,0 +1,76 @@
> > +SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> > +DESCRIPTION =3D "mbedtls is a lean open source crypto library         =
 \
> > +for providing SSL and TLS support in your programs. It offers        \
> > +an intuitive API and documented header files, so you can actually    \
> > +understand what the code does. It features:                          \
> > +                                                                     \
> > + - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> > +   Camellia and XTEA                                                 \
> > + - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> > + - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> > + - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> > +   ECDSA and ECDH                                                    \
> > + - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> > + - Abstraction layers for ciphers, hashes, public key operations,    \
> > +   platform abstraction and threading                                \
> > +"
> > +
> > +HOMEPAGE =3D "https://tls.mbed.org/"
> > +
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> > +
> > +SECTION =3D "libs"
> > +
> > +S =3D "${WORKDIR}/git"
> > +SRCREV =3D "1873d3bfc2da771672bd8e7e8f41f57e0af77f33"
> > +SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;bra=
nch=3Dmaster \
> > +           file://run-ptest \
> > +          "
> > +
> > +inherit cmake update-alternatives ptest
> > +
> > +PACKAGECONFIG ??=3D "shared-libs programs ${@bb.utils.contains('PTEST_=
ENABLED', '1', 'tests', '', d)}"
> > +PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUS=
E_SHARED_MBEDTLS_LIBRARY=3DOFF"
> > +PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=
=3DOFF"
> > +PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FAT=
AL_WARNINGS=3DOFF"
> > +# Make X.509 and TLS calls use PSA
> > +# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-cr=
ypto.md
> > +PACKAGECONFIG[psa] =3D ""
> > +PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF=
"
> > +
> > +EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
> > +
> > +# For now the only way to enable PSA is to explicitly pass a -D via CF=
LAGS
> > +CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMB=
EDTLS_USE_PSA_CRYPTO', '', d)}"
> > +
> > +PROVIDES +=3D "polarssl"
> > +RPROVIDES:${PN} =3D "polarssl"
> > +
> > +PACKAGES =3D+ "${PN}-programs"
> > +FILES:${PN}-programs =3D "${bindir}/"
> > +
> > +ALTERNATIVE:${PN}-programs =3D "hello"
> > +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +CVE_PRODUCT =3D "mbed_tls"
> > +
> > +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/pull/5310
> > +CVE_CHECK_IGNORE +=3D "CVE-2021-43666"
> > +# Fix merged upstream https://github.com/Mbed-TLS/mbedtls/commit/9a4a9=
c66a48edfe9ece03c7e4a53310adf73a86c
> > +CVE_CHECK_IGNORE +=3D "CVE-2021-45451"
> > +
> > +# Export source files/headers needed by Arm Trusted Firmware
> > +sysroot_stage_all:append() {
> > +     sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/library"
> > +     sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/mb=
edtls-source/include"
> > +}
> > +
> > +do_install_ptest () {
> > +     install -d ${D}${PTEST_PATH}/tests
> > +     cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> > +     find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> > +     cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> > +}
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103271): https://lists.openembedded.org/g/openembed=
ded-devel/message/103271
> > Mute This Topic: https://lists.openembedded.org/mt/99508857/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

