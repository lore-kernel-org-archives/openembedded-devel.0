Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A66CEE33B
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 17:54:23 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.23553.1728496458394281105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 10:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2iISHxq;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-287ca01c15fso91235fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728496457; x=1729101257; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aD/Z0ee+4D4FxpePkiCvdCkWWRijma3zpS5rCuDYRTU=;
        b=N2iISHxqR8wHG7TfEhU0+cAUF4r7aQGe1xyXW1KwINnWCkMfXHs4ce9a+0TavB/wmE
         hHRWT2zMj/TMaFMgxtHNyR99eXU+sz9m5zeb0vLk9mXy920FKVcPevVvj/uq/flUGtBV
         OeEaIb8Bg7FAzU8vKVoo9evHDK9CvbBx7cqGgy8YGiUDCh38zUQfQtzKjwI1obdIT+PX
         dzBO+C4bGQ6FGhcrWVbSjO+dUY+L/1YNqujo6sxf5Md4CxmJVJAz0sAxllMfcpcD0+wg
         oacvHX/7EI6XxtgVLhOw4XMvAe36oM5+QatOEk5+JeZMNcZzlp2ZLYw1CU6/hmBJA1nq
         vHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728496457; x=1729101257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aD/Z0ee+4D4FxpePkiCvdCkWWRijma3zpS5rCuDYRTU=;
        b=RPEnLrp/w7BOjAXtfsRjft/Cub6Q82PapNdtyYymfXed9APtrpb+RJEzv/7FrBKMfo
         044SEb7JQXXu6/htMRpYf4lJYQ46S3Dl3Aebk7UccJOORp2dazFC/UZ08PuPbj77wmqL
         CaV6Ft17YoiFSRyYOjtZHtLl8QUArH7Na0X8Lk6RGdSWMWA4EVWwk325OQW9YfRAY+CZ
         +4lf3+ZxcHbDHmTDkUa2aXTbLB4hOvvafcObALsTAHDxW8w6h4vZM/UOhyBxanD8Ojea
         JR/p9VLywRN7M4l0l7JcWbtFlTaILf8094VLdBv5CmaX597GRBQFc9ZhSQQHreaPCXV+
         ZuXg==
X-Gm-Message-State: AOJu0YwFiYzQcb10zFWQ3ZThZFUeJphvHz4mqgk1V6ZoNp4nN/DbjxHK
	qRvNzLX4KBcmqG76IsjxV5/GcibzLmWtuxyVv8eGzVHIQf18Ip4RqRslm4/RkLCiQfWWOCPRLVs
	QTa1nfzRL+P+3Y2AcUcnb4LqISUlqep2zYOk=
X-Google-Smtp-Source: AGHT+IGKnhY9LsaWaLhRF+SIlLlhD9Z+iPsVbUaJtskRVYW0dlBf0yi373s07Nqhx50iyVv4R0u/kR0XtHnzNqZlUMk=
X-Received: by 2002:a05:6870:7308:b0:27c:4f04:a1f1 with SMTP id
 586e51a60fabf-2883449e8d2mr2395003fac.32.1728496457645; Wed, 09 Oct 2024
 10:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241009092512.3615190-1-mingli.yu@windriver.com>
In-Reply-To: <20241009092512.3615190-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 10:53:51 -0700
Message-ID: <CAMKF1sor2yCfGJKLj+JDWH2-C_QOjpkfP7gMfbTVLuVR1iW+jA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] asio: Add ptest support
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 17:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112736

Thanks for adding the tests, this is really helpful in many ways to
keep quality of recipe. I would also suggest to add it
to per package ptest image mechanism in
meta-oe/conf/include/ptest-packagelists-meta-oe.inc, if it is quick
then put it
in PTESTS_FAST_META_OE else put it in PTESTS_SLOW_META_OE

After doing this you can run the ptest for just this recipe by doing

bitbake meta-oe-image-ptest-asio

On Wed, Oct 9, 2024 at 2:25=E2=80=AFAM Yu, Mingli via lists.openembedded.or=
g
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
>  # ./run-ptest
> PASS: address
> PASS: address_v4
> PASS: address_v4_iterator
> PASS: address_v4_range
> PASS: address_v6
> PASS: address_v6_iterator
> PASS: address_v6_range
> PASS: any_completion_executor
> PASS: any_completion_handler
> PASS: any_executor
> PASS: any_io_executor
> PASS: append
> PASS: as_tuple
> PASS: associated_allocator
> PASS: associated_cancellation_slot
> PASS: associated_executor
> PASS: associated_immediate_executor
> PASS: associator
> PASS: async_result
> [snip]
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta-oe/recipes-support/asio/asio/run-ptest | 19 +++++++++++++++++++
>  meta-oe/recipes-support/asio/asio_1.30.2.bb | 18 ++++++++++++++++--
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
>
> diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/recipe=
s-support/asio/asio/run-ptest
> new file mode 100644
> index 000000000..d37db0b31
> --- /dev/null
> +++ b/meta-oe/recipes-support/asio/asio/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +ptestdir=3D$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +tests=3D$(find * -type f -executable)
> +
> +rm -rf test.log
> +
> +for f in $tests
> +do
> +    if test -x ./"$f"; then
> +        if ./"$f" > test.log 2>&1; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    fi
> +done
> diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/recipe=
s-support/asio/asio_1.30.2.bb
> index 6930381ec..ae0baadc6 100644
> --- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
> @@ -8,9 +8,11 @@ LICENSE =3D "BSL-1.0"
>
>  DEPENDS =3D "openssl"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
> +           file://run-ptest \
> +"
>
> -inherit autotools
> +inherit autotools ptest
>
>  ALLOW_EMPTY:${PN} =3D "1"
>
> @@ -22,4 +24,16 @@ PACKAGECONFIG ??=3D "boost"
>
>  PACKAGECONFIG[boost] =3D "--with-boost=3D${STAGING_LIBDIR},--without-boo=
st,boost"
>
> +TESTDIR =3D "src/tests"
> +do_compile_ptest() {
> +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> +    oe_runmake -C ${TESTDIR} buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    # copy executables
> +    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${PTES=
T_PATH}/tests/ \;
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112724): https://lists.openembedded.org/g/openembedde=
d-devel/message/112724
> Mute This Topic: https://lists.openembedded.org/mt/108905838/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

