Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012EDCED611
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 22:42:55 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.30689.1728513770108382031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 15:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VPVBmgJ0;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e3e2687200so149531b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728513769; x=1729118569; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnlryMF8rIeveW6MDLHQBfT5aqXTSewyPuAJo3h6G6M=;
        b=VPVBmgJ0d62hfrRUIiPR98R5jHk826lir/4+4dka4PZjvmOaqCw12hDGqLL4zwiMIl
         2fEJtFQyoCItQD/PtAl0b00UasJhZqFO3m9CHGpn/8NA4UiQthjiBChw6keagdTfFb2P
         DYgak6xtMRKZ4ZHLYpA6RFk+fmIiECUzymmU6Avw9BDzw6xaYYGCeI1lSZvPMtzBtezq
         kt/+qrf2Q9YN1r6t8ZoqKOavGcUt2imS5+t49BGlJD2StH/5PiM1yLI+G70UXGMijoP0
         7LEbLWomiFNccpPkJ888Hs5KcxDBzPE2FA+X0u64axYf5BFsf5cia4z2fVVIUZG6ab3/
         dZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728513769; x=1729118569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnlryMF8rIeveW6MDLHQBfT5aqXTSewyPuAJo3h6G6M=;
        b=veINTQxStlmTCfeKYVfqnYa+Ti2b/keMmFADMv5I/DNkj0G9enXhKcGDnxWIMrS0UR
         1uSAYKuMc5Uk+YV3g2Yu8cmchofDwndGcZDOLc+sy1xeO84DYUeIOnisrp11WL+RtEVF
         XkwjEdq5cBkASjCk3bspMMSDGxIOP4hMnzx73acXxRfxiXczrDqrI0xfnbcwjJtAdY2A
         YPv0Tzy1wOyoEeH9JPgI5zmc5lrUAvwAZrsI7tsk76TApduAN69hJ+s7jffvEZcw6UtB
         MuJURC70RDP794D2htD3VhkmQRom/knUd9ATWWLoqtEG3YDKOp/7kKOeRhbvlrT6hwSe
         pR/w==
X-Gm-Message-State: AOJu0YzjNr8oO1O8Bsc/lRGJV79V3UszRPz+jKAl7iFM9A9Ujb9LYrhO
	GDXVzzL1nY2V29/kZXvr/sXkIoW97yaw8o3T9fqe0r9GYaK7Q0Vmx6qKy/07dhH1nhTsHqwoPyM
	frmcpKhcJQ3pX31zG/UZS2chBxjuhbLTdZgo=
X-Google-Smtp-Source: AGHT+IE8qgZfz4eWZWT7xDpleVjsINf6CBKeIcNjz7qJaQzE7/GlCJYfu08ljj9v92jlzIiJkcv1SYYrzE0k8+72/fk=
X-Received: by 2002:a05:6870:6c09:b0:288:4b92:8ac0 with SMTP id
 586e51a60fabf-2884b928c21mr1449740fac.44.1728513769307; Wed, 09 Oct 2024
 15:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241009092512.3615190-1-mingli.yu@windriver.com> <CAMKF1sor2yCfGJKLj+JDWH2-C_QOjpkfP7gMfbTVLuVR1iW+jA@mail.gmail.com>
In-Reply-To: <CAMKF1sor2yCfGJKLj+JDWH2-C_QOjpkfP7gMfbTVLuVR1iW+jA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Oct 2024 15:42:23 -0700
Message-ID: <CAMKF1sq4kG88rsstW+nxCpqz5RPoWC1indsPTkuaRWjdAp0SPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] asio: Add ptest support
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 22:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112748

also fails to build with clang

https://errors.yoctoproject.org/Errors/Details/807571/

On Wed, Oct 9, 2024 at 10:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Thanks for adding the tests, this is really helpful in many ways to
> keep quality of recipe. I would also suggest to add it
> to per package ptest image mechanism in
> meta-oe/conf/include/ptest-packagelists-meta-oe.inc, if it is quick
> then put it
> in PTESTS_FAST_META_OE else put it in PTESTS_SLOW_META_OE
>
> After doing this you can run the ptest for just this recipe by doing
>
> bitbake meta-oe-image-ptest-asio
>
> On Wed, Oct 9, 2024 at 2:25=E2=80=AFAM Yu, Mingli via lists.openembedded.=
org
> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> >  # ./run-ptest
> > PASS: address
> > PASS: address_v4
> > PASS: address_v4_iterator
> > PASS: address_v4_range
> > PASS: address_v6
> > PASS: address_v6_iterator
> > PASS: address_v6_range
> > PASS: any_completion_executor
> > PASS: any_completion_handler
> > PASS: any_executor
> > PASS: any_io_executor
> > PASS: append
> > PASS: as_tuple
> > PASS: associated_allocator
> > PASS: associated_cancellation_slot
> > PASS: associated_executor
> > PASS: associated_immediate_executor
> > PASS: associator
> > PASS: async_result
> > [snip]
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta-oe/recipes-support/asio/asio/run-ptest | 19 +++++++++++++++++++
> >  meta-oe/recipes-support/asio/asio_1.30.2.bb | 18 ++++++++++++++++--
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/asio/asio/run-ptest
> >
> > diff --git a/meta-oe/recipes-support/asio/asio/run-ptest b/meta-oe/reci=
pes-support/asio/asio/run-ptest
> > new file mode 100644
> > index 000000000..d37db0b31
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/asio/asio/run-ptest
> > @@ -0,0 +1,19 @@
> > +#!/bin/sh
> > +
> > +ptestdir=3D$(dirname "$(readlink -f "$0")")
> > +cd "$ptestdir"/tests || exit
> > +
> > +tests=3D$(find * -type f -executable)
> > +
> > +rm -rf test.log
> > +
> > +for f in $tests
> > +do
> > +    if test -x ./"$f"; then
> > +        if ./"$f" > test.log 2>&1; then
> > +            echo "PASS: $f"
> > +        else
> > +            echo "FAIL: $f"
> > +        fi
> > +    fi
> > +done
> > diff --git a/meta-oe/recipes-support/asio/asio_1.30.2.bb b/meta-oe/reci=
pes-support/asio/asio_1.30.2.bb
> > index 6930381ec..ae0baadc6 100644
> > --- a/meta-oe/recipes-support/asio/asio_1.30.2.bb
> > +++ b/meta-oe/recipes-support/asio/asio_1.30.2.bb
> > @@ -8,9 +8,11 @@ LICENSE =3D "BSL-1.0"
> >
> >  DEPENDS =3D "openssl"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2 \
> > +           file://run-ptest \
> > +"
> >
> > -inherit autotools
> > +inherit autotools ptest
> >
> >  ALLOW_EMPTY:${PN} =3D "1"
> >
> > @@ -22,4 +24,16 @@ PACKAGECONFIG ??=3D "boost"
> >
> >  PACKAGECONFIG[boost] =3D "--with-boost=3D${STAGING_LIBDIR},--without-b=
oost,boost"
> >
> > +TESTDIR =3D "src/tests"
> > +do_compile_ptest() {
> > +    echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
> > +    oe_runmake -C ${TESTDIR} buildtest-TESTS
> > +}
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    # copy executables
> > +    find ${B}/${TESTDIR}/unit -type f -executable -exec cp {} ${D}${PT=
EST_PATH}/tests/ \;
> > +}
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112724): https://lists.openembedded.org/g/openembed=
ded-devel/message/112724
> > Mute This Topic: https://lists.openembedded.org/mt/108905838/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

