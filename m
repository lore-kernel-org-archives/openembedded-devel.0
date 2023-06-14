Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F124CEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:22:23 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.7398.1686734533788510209
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TAywOIQv;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-543b17343baso3368112a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734533; x=1689326533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEN9sdimovHSt91wpeGTPHmHCtYacJAeU8ywha2tViM=;
        b=TAywOIQvjndsFOC8f+jeCHcXiSd6vCepQvEw+tkcpiuHzzokWVb6af0S3kaDI3shIG
         tL+sqbSxx/0U5rPZZIe06jzwk0gAHjRxSXSnYqR0vu5hCVKKXQDwN7W7Sl3sI6iCLzT+
         51pZI6Yqpa2MQ3bTMYzgeUX7mmyfvM2Sj2vQQCiJdtcsefy0V/zDaFvfdo6uSUwlOdxh
         UPhB/sMYbbZxGG/76571CHi5aiu5DZzaBmRoq9ysyOeuUWhN1IxDoaoYO+T2Dt8dDhby
         /7e8GOpc2LJw1vpTRmUskf3EZDpntOJaIXCU5k2Bkd1Q9R9N/SlYO04ebK8OYf3GrCK5
         M18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734533; x=1689326533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEN9sdimovHSt91wpeGTPHmHCtYacJAeU8ywha2tViM=;
        b=Jx6GqPq+DCs8aAnC29vB48ZFR6IEyBSJm/YtTN/OsqhGNlSr0IkiKs6RfJMFetlFhH
         iOD5QGewbYKBDzTNq1HLTJIjTQY9x79+BAsk+JDMDkkr5FyRV0GqY+N409JmtMAYbdpW
         vB14zQ7h06CIFUd82ehlsxWi0p3LtGWVD+0iLVMXlSeg68Mq/VqLNOMdpa6xfRAo6Wat
         D7301pmM1kc5Cl2d/yfN/OCy69lN9PBH6z9UVLv3zVPYF0YMNsJSuKTdw6AdWP7btA1C
         PPikrXWuR5Lz3BHPBH78WTBuEmVzdrLDCk6p9pF/b9/tTr+scaK+b29sckccWX7eQcep
         6cyw==
X-Gm-Message-State: AC+VfDyZaQQv7WKjPQWqAl5u62XDabr4xA8ytdHRK8iX6Pf8X+RFxQ+h
	I+0InCx8mdY+VYDASv2yF58rbbvqsVahsPpQzFQ=
X-Google-Smtp-Source: ACHHUZ5FY+QFUiJRfykJdIeDg6Ohoma2ZpDFXW1EqUE7WWnRz9jmU05oe6v1mL95mNqSPnFYTmbvQnSw5Ua72DW5dSQ=
X-Received: by 2002:a17:90b:2384:b0:247:ab52:d5d8 with SMTP id
 mr4-20020a17090b238400b00247ab52d5d8mr813328pjb.26.1686734532990; Wed, 14 Jun
 2023 02:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230613191758.29502-1-beniaminsandu@gmail.com> <CAMKF1sqp-BJd7xHrQ+nODHFuYGuCg4e9mC7LHX8ORrQ3mJ_f5w@mail.gmail.com>
In-Reply-To: <CAMKF1sqp-BJd7xHrQ+nODHFuYGuCg4e9mC7LHX8ORrQ3mJ_f5w@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 14 Jun 2023 12:22:01 +0300
Message-ID: <CABQJdOFbgL+uzz7GbwdSZTWUgUgsBh-GQWGiMg50_aNcwyA5Dg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: add support for v3.x
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 09:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103281

Thanks, looks like it. I will check as soon as possible.

Cheers,
Beni

On Wed, Jun 14, 2023 at 10:42=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> this might be the reason for a new build failure while building mdns
>
> | mbedtls.c:41:10: fatal error: mbedtls/certs.h: No such file or director=
y
> |    41 | #include <mbedtls/certs.h>
> |       |          ^~~~~~~~~~~~~~~~~
> | compilation terminated.
> | make[1]: *** [Makefile:510: objects/prod/mbedtls.c.o] Error 1
> | make[1]: Leaving directory
> '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-=
linux/mdns/1790.80.10-r0/git/mDNSPosix'
>
> for more details see
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2821/st=
eps/14/logs/stdio
>
> On Tue, Jun 13, 2023 at 12:19=E2=80=AFPM Beniamin Sandu <beniaminsandu@gm=
ail.com> wrote:
> >
> > Version 3.4.0 adds a lot of improvements and fixes (a notable one
> > being initial support for PKCS7 CMS), but since this is a pretty
> > big jump, let's keep both versions for a while, so the v2.x users
> > can upgrade to 3.x in a timely manner if needed.
> >
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> > ---
> >  .../mbedtls/mbedtls_3.4.0.bb                  | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtl=
s_3.4.0.bb
> >
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
> > +       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/share/=
mbedtls-source/library"
> > +       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/share/=
mbedtls-source/include"
> > +}
> > +
> > +do_install_ptest () {
> > +       install -d ${D}${PTEST_PATH}/tests
> > +       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> > +       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> > +       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> > +}
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103275): https://lists.openembedded.org/g/openembed=
ded-devel/message/103275
> > Mute This Topic: https://lists.openembedded.org/mt/99512869/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

