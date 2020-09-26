Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web12.1300.1601078876866779777
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 17:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Epwncy65;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id o21so3149313qtp.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WNQm2NMGN8GDs83buURAhQuIwx8frOOzzz+pPwZv0r0=;
        b=Epwncy65sLt6Dahc5iDTmBeeT+dBPKwA2i4NcZolyBjVt1Q2BD8FaSks0ZOOQHUIul
         y2yOp/+hn6XRjCNRijV3VUqozkDfkVPzkGs5CIubJXSMN18QDv2xamETxPczq2UVVzmX
         CCGhotowZJ9/onpovlFgVQl3A019DCWRhYfC2Mm//0jNPG9PxONJSIGiMD4uIbNgF8nY
         7QRvKoI+hb2QRP8gzIjC9/ay4YvDEMFP9SxLT7dVKIuwhEESn0P6tyPp7yXHCggmuapz
         2DeEQuw0yVFAXTyVicuXbffzeGZiFdkB4JNNdF3ym/mobJAJ++hUj5Zrns/PTRUFN1dM
         KYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNQm2NMGN8GDs83buURAhQuIwx8frOOzzz+pPwZv0r0=;
        b=HWzEaZAEesXxgna5W9Di7wzymuzMa6IcyizOfkITFLKTfKEg7Bd178D3I06JfiP2CD
         2DKaWJcP5crlv90FLOIzg/zSVXgoYg1Xmh2+g2U7ewsucrmhS30l6mS69DwAbRocB+8b
         oDpc5mquDDnRNbi6/MWw4A6dxVtqCkmEzZqEiOMdvEJ288fM4BSoZ908BchctrF+Dki0
         Js4OQz2Ipj12oaDk7FeVNj6nRSDzOZPrr0+KBETVJLrr2zvnolY48LqjixP/o45rnt3w
         CdH6eK2ZC9ubME/r93LLUC0p1kXQlukxSEpa8dJACB4CANHIBM8qzjM2v3BcINRnbXAi
         rtWQ==
X-Gm-Message-State: AOAM5316TGJlJO4dcjJ/1yqdnuv3H5qZTQVWoNZfSkROVuMMYpU/UKy3
	LS71WtulhOQVpYIpanRmUAQ2KjPF5IhsX5UmN48=
X-Google-Smtp-Source: ABdhPJzpgHp7IG7lLB4m51tGqn2tU+nvpjy7wxrQxTg3adfB6AGgRmNMtaf5PsGOcabTVgxDmy5dqqdHOlTJoXqQpxg=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr2428532qtq.378.1601078875795;
 Fri, 25 Sep 2020 17:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200925212051.18414-1-akuster808@gmail.com>
In-Reply-To: <20200925212051.18414-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 25 Sep 2020 17:07:29 -0700
Message-ID: <CAMKF1sq_NeerBCsR1LKAMA0QMFtSWrZRm9czC8ALNSh8Xuk02Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cmocka: add recipe
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster@mvista.com>
Content-Type: text/plain; charset="UTF-8"

Can you add it to appropriate packagegroups too for testing purposes

On Fri, Sep 25, 2020 at 2:20 PM akuster <akuster808@gmail.com> wrote:
>
> From: Armin Kuster <akuster@mvista.com>
>
> includes ptest and bundling of examples that can be used for testing
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 37 +++++++++++++++++++++
>  meta-oe/recipes-test/cmocka/files/run-ptest | 10 ++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
>  create mode 100644 meta-oe/recipes-test/cmocka/files/run-ptest
>
> diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> new file mode 100644
> index 0000000000..6125d116cd
> --- /dev/null
> +++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
> @@ -0,0 +1,37 @@
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
> +           file://run-ptest "
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
