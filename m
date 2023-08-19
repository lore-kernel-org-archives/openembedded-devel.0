Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8750DEE49A7
	for <webhook@archiver.kernel.org>; Sat, 19 Aug 2023 06:39:19 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.4981.1692427154539753928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 23:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fPiD29NL;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c0fa9dd74fso977893fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692427154; x=1693031954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwLNh0t2Ak+Pq2JU0eyETjPzs8a7VmYVegjAUGg1eX0=;
        b=fPiD29NLkS3bL7ZfYF5CYgr5z6rqkOfg8rwFmpkaTfazFQwa7JCBLsQYWii+7nSX/S
         Rt8Aj9d81taAmbT0f5ykE7+b6xVRQ/KTehJWc0vyKKceB5m/E/Q7558YXqr64CniDvXM
         Bm0T1QvZ+3SbiA7Mpz11tzasLWf0MNxPzPafG+j9IcYIyAnVUOjCcb5/0EvTBD5LyLMZ
         /qxLNjEo0i57gPrMjMxQSzxKS0WDDDnl7TK2lj5YBBpvHRrSCXtp2fE7mYBjPW8x9/wY
         RM1ygdUNycoY2cICun3odBCxAKKz+tfNeIvyMHXlx6tV5fQbPDL5FksXQya8c/RdDa7R
         hHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692427154; x=1693031954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwLNh0t2Ak+Pq2JU0eyETjPzs8a7VmYVegjAUGg1eX0=;
        b=Qup2vLQXjcR+GuKQnxJ04qXN7q7EWDpZO2EXF3khJo14OSElOcVfxgwXhC/V0xkWxu
         yvKTxfB8mD+x2mZcxp9Dk7vRHZ4HVqB5xamaMgPdMvBnqnsJmVlp23PJHA3EEOHHDtQ5
         aivAdR3JKWZpXtnMem57SbWNt517eB0Vd411S9OWLfLAUkzoa78/JYf/+Eg6iN3nj/BK
         VUu2jyvVLPE0khtZ9MPPKuKoO+TcQiYRNCeBdVVEL1SHL/Sp0DKQjPgEne5a1enQXnBs
         NOr6SqAXVNHM0d1VxoUlxPKh1YeCBdJ1hlOmjJOW5eD0dij0IJlmK6m8m2YSQ6ZRon7M
         VfpQ==
X-Gm-Message-State: AOJu0YyMO1qpP73d6qKovGTBbkb/Llw4ptd2ewmmUhMEHCFmapS4dBNr
	XUukmk7536myLY1XrxdALyzWd3udGCRyTu4wiiZNRgHmF7nGkA==
X-Google-Smtp-Source: AGHT+IHdKqggavngmcXmq0AfFz+LNp8tXayIfVFA8ufvVg3fZY8HbSj+Heyoc1wpduzJYles4THnlJaSVkoY1NoFjs0=
X-Received: by 2002:a05:6870:d250:b0:1b7:3432:9ec4 with SMTP id
 h16-20020a056870d25000b001b734329ec4mr1950834oac.10.1692427153645; Fri, 18
 Aug 2023 23:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20230818105212.34481-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2023 23:38:47 -0700
Message-ID: <CAMKF1sriZM2ykf_b4Yfn+ZnQ1G7-LU-Fp+4_WY45T4ch3sv83w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] libfaketime: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Aug 2023 06:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104494

fails to build with clang
https://errors.yoctoproject.org/Errors/Details/732361/

On Fri, Aug 18, 2023 at 3:52=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> This commit adds the libfaketime library recipe, which provides time
> manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
> developers to modify the system time reported to applications, aiding in =
scenarios
> where accurate time emulation is required.
>
> GitHub Repository: https://github.com/wolfcw/libfaketime
>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> ---
>  .../libfaketime/libfaketime_0.9.10.bb         | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.b=
b
>
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb b/met=
a-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> new file mode 100644
> index 000000000000..f26e5b0db872
> --- /dev/null
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime_0.9.10.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
> +SECTION =3D "libs"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +SRCREV =3D "d475b925943ad404c6c728ac868dc73949e7281c"
> +SRC_URI =3D "\
> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;protocol=
=3Dhttps \
> +    "
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE +=3D "\
> +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
> +    "
> +
> +do_configure[noexec] =3D "1"
> +do_compile () {
> +    oe_runmake
> +}
> +do_install () {
> +    install -d ${D}${libdir}/faketime
> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> +    install -d ${D}${bindir}
> +    install -m 0755 src/faketime ${D}${bindir}
> +}
> +
> +PACKAGES =3D+ "lib${PN}"
> +
> +FILES:${PN} =3D "${bindir}/faketime"
> +FILES:lib${PN} =3D "${libdir}/faketime/*"
> +
> +INSANE_SKIP:${PN} +=3D "dev-so"
> +INSANE_SKIP:lib${PN} +=3D "dev-so"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104485): https://lists.openembedded.org/g/openembedde=
d-devel/message/104485
> Mute This Topic: https://lists.openembedded.org/mt/100817966/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

