Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FCDC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 04:38:48 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.127937.1692074321979272262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 21:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZI4gJEFO;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bcaa6d5e2cso4383150a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692074321; x=1692679121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpgXjkmv1chK+dBMY9c5V0UeFs3s2DdPZbs2t0GZkgo=;
        b=ZI4gJEFOyaRHGkCXRwrJkVoL6xSfm0lLAw7g4PIC5g/2dIXQLIZaUdeVxeNGPO2w6z
         z2TH5HsC58qN+rCd10tuGKhaKAL6G/+juCgd4quduwNTjor4IzJDuyW2tTCZjQQ2VJkU
         PoUbJwjSje3nNnHKWHYHZS6LBSKSJiww73MwDflDjUg7IxTQT6W18qP2VUdj3icAk92L
         ncrc5GURQP4FsaaC7jBjMUqNRSiOuLzfswUll0P6myGDtcyOZpEZNyghP9HgHZxCDq01
         18ys3TZDochCoZynCgnvqFepPzwC/3XkWJSQc/fsze04AOMf8JcnYIrowiRRDx2txR1B
         tuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692074321; x=1692679121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpgXjkmv1chK+dBMY9c5V0UeFs3s2DdPZbs2t0GZkgo=;
        b=RAOunHKRAzNuD4QQjeeyL/TuPlTQn6v/8julDFjG1lKwrR1XrQUGE8nI+keD7tfAv9
         ciRwMIdFfR1Vug7bswjp4SwSzs4N44PmDhFOUtLtk+cY105LZu7r5cUVGYai7ohckKox
         URGGfozjadhipfyWd/An/ijGFICJjekFqtvp7Pl1KtejrcJJXO5BLs0XV1UUjosbmJEg
         LzLiJ9boaikLkA0R0YVP8OvQCrdyD5VZqlyMjgdZ8MX3ljg1trvcUm3yMpvLT5we2p2S
         Sh6+k4y8qxdh6wgrwXTo4DYYi3/lcAEY7PXUdUvOOvQOHxFhIXDW5hUXHkAWJwZBF6hh
         XLoQ==
X-Gm-Message-State: AOJu0YxNnsDEUyC4gD9arghcEnj+YowbVUqvHvTGmVMF6eUH4M5nFDjb
	pNl9LVBcU0doZod2L8xQrxds19whP/ekD56D54M=
X-Google-Smtp-Source: AGHT+IF8OgVJYCyAb0PxPqZ1ik2ik7KepLJXKuDrHBtTeayAUp8qg2Qpu5lc8elV3/PKdFR1UAGNGWT+Qq5haKQwCtE=
X-Received: by 2002:a05:6871:1c4:b0:1bf:5559:4aaf with SMTP id
 q4-20020a05687101c400b001bf55594aafmr11998225oad.34.1692074320879; Mon, 14
 Aug 2023 21:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230814235451.1288083-1-nicolas.marguet@windriver.com>
In-Reply-To: <20230814235451.1288083-1-nicolas.marguet@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Aug 2023 21:38:14 -0700
Message-ID: <CAMKF1sqz-x6bNj+2C2W-np1bskKzua=Ar3c0D=dPLR7mJZszNw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] librelp: add ptest
To: nicolas.marguet@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 04:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104354

There is a build error seen with clang which you wont get with gcc yet.

https://errors.yoctoproject.org/Errors/Details/731494/


On Mon, Aug 14, 2023 at 4:55=E2=80=AFPM nicolas.marguet via
lists.openembedded.org
<nicolas.marguet=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Nicolas Marguet <nicolas.marguet@windriver.com>
>
> Use internal test from librelp project as ptest.
>
> This work is largely inspired on the rsyslog ptest implementation,
> which copies the automake-based tests/Makefile to the target and runs
> 'make check-TESTS'. sed is used to fix a few Makefile paths or
> env-vars so 'make' can run on the target.
>
> Tested on qemux86_64 and qemuarm64:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    librelp 1.11.0: tests/test-suite.log
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> TOTAL: 30
> PASS:  27
> SKIP:  3
> XFAIL: 0
> FAIL:  0
> XPASS: 0
> ERROR: 0
>
> The 3 skipped tests are either self-identified as =E2=80=9Cnot do anythin=
g
> really useful=E2=80=9D or may need to port libtool to the target.
>
> Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
> ---
>  ...line-errors-in-debug-optimization-Og.patch |  0
>  .../rsyslog/librelp/run-ptest                 | 10 ++++
>  .../rsyslog/librelp_1.11.0.bb                 | 59 ++++++++++++++++++-
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/rsyslog/{files =3D> librelp}/0001-Fix-fu=
nction-inline-errors-in-debug-optimization-Og.patch (100%)
>  create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/run-ptest
>
> diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inl=
ine-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslo=
g/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
> similarity index 100%
> rename from meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
> rename to meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inli=
ne-errors-in-debug-optimization-Og.patch
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp/run-ptest b/meta-oe=
/recipes-extended/rsyslog/librelp/run-ptest
> new file mode 100644
> index 000000000..a649a5716
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/librelp/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +#
> +set -e
> +set -o pipefail
> +
> +SCRIPTPATH=3D"$( cd "$(dirname "$0")" ; pwd -P )"
> +cd ${SCRIPTPATH}
> +useradd tester  || echo "user already exists"
> +su tester -c "make -C tests -k check-TESTS"
> +userdel tester
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe=
/recipes-extended/rsyslog/librelp_1.11.0.bb
> index bac5abb05..cbbc31b7d 100644
> --- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
> @@ -8,10 +8,67 @@ DEPENDS =3D "gmp nettle libidn zlib gnutls openssl"
>
>  SRC_URI =3D "git://github.com/rsyslog/librelp.git;protocol=3Dhttps;branc=
h=3Dstable \
>             file://0001-Fix-function-inline-errors-in-debug-optimization-=
Og.patch \
> +           file://run-ptest \
>  "
>
>  SRCREV =3D "b421f56d9ee31a966058d23bd23c966221c91396"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
> +
> +# For ptests, copy source tests/*.sh scripts, Makefile and
> +# executables and run them with make on target.
> +TESTDIR =3D "tests"
> +do_compile_ptest() {
> +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> +    oe_runmake -C ${TESTDIR} buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # copy source tests/*.sh and python scripts
> +    cp -f ${S}/${TESTDIR}/*.{sh,py} ${D}${PTEST_PATH}/${TESTDIR}
> +    # install data files needed by the test scripts on the target
> +    cp -f ${S}/${TESTDIR}/*.supp ${D}${PTEST_PATH}/${TESTDIR}
> +    cp -rf ${S}/${TESTDIR}/tls-certs ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # copy executables
> +    find ${B}/${TESTDIR} -type f -executable -exec cp {} ${D}${PTEST_PAT=
H}/${TESTDIR} \;
> +    cp -rf ${B}/${TESTDIR}/.libs ${D}${PTEST_PATH}/${TESTDIR}
> +    # copy Makefile
> +    # run-ptest will run make which runs the executables
> +    cp -f ${B}/${TESTDIR}/Makefile ${D}${PTEST_PATH}/${TESTDIR}
> +    cp -f ${B}/${TESTDIR}/set-envvars ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # give permissions to all users
> +    # some tests need to write to this directory
> +    chmod 777 -R ${D}${PTEST_PATH}/${TESTDIR}
> +
> +    # do NOT need to rebuild Makefile or $(check_PROGRAMS)
> +    sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Mak=
efile
> +    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDI=
R}/Makefile
> +
> +    # fix the srcdir, top_srcdir, abs_top_builddir
> +    sed -i 's,^\(srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
> +    sed -i 's,^\(top_srcdir =3D \).*,\1${PTEST_PATH}/${TESTDIR},' ${D}${=
PTEST_PATH}/${TESTDIR}/Makefile
> +    sed -i 's,^\(abs_top_builddir =3D \).*,\1${PTEST_PATH}/,' ${D}${PTES=
T_PATH}/${TESTDIR}/Makefile
> +
> +    # install test-driver
> +    install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
> +
> +    # fix the python3 path for tests/set-envar
> +    sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g ${D}${PTEST_PATH}/${TESTDIR=
}/set-envvars
> +
> +    # these 2 scripts need help finding their /usr/lib/librelp/ptest/tes=
ts/.libs libraries
> +    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/send
> +    sed -i 's:${B}/src:${PTEST_PATH}/${TESTDIR}:' ${D}${PTEST_PATH}/${TE=
STDIR}/receive
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "\
> +  make bash coreutils libgcc util-linux gawk grep \
> +  python3-core python3-io \
> +"
> +
> +RRECOMMENDS:${PN}-ptest +=3D " valgrind"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104353): https://lists.openembedded.org/g/openembedde=
d-devel/message/104353
> Mute This Topic: https://lists.openembedded.org/mt/100749117/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

