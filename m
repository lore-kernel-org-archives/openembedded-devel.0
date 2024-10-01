Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA87CEACE7
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:25:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.86191.1727799902138336543
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzeaGCWt;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2870bd5e1f7so2213782fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 09:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727799901; x=1728404701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD8p4nG2GJCrQrjqJ4m7A705ErjmTemlFbqpYaaVLUo=;
        b=RzeaGCWtwvGpIAuQLVH/xzPW7w6kRd63C5OiO3FMSGWFZwkPFzwPjt1f+hFMnYXVUe
         tSzxaS1SHmb/FEhp+uZywtQfoJiuAjg/aIwv6Jjcejo8pR3lhgotFOnty0ctWyBeVkLJ
         doxkeyvwFc9rVYXNKPS3qwrZAZAQ3R7jAZu6p0cyXmWzx16olW8fPufmoq7x4/YT4tmJ
         m2EwVOLdySFiufvavSpalqZ3dQnmZton4M1X36oB13QQaZlqGHbzkcpmdU9IeZce08Wu
         50qy17M1qiadNcamEC6CD1+gUJgVP56bRM84+9zbdfNEHwjf2DwVN7KoFPKzWLORr1BK
         Scvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727799901; x=1728404701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tD8p4nG2GJCrQrjqJ4m7A705ErjmTemlFbqpYaaVLUo=;
        b=G+ds2BOTZ3iNhvkspoXNyV8NCCDoao8o0Mxs0zkek1luRex+klV/rNEuHmnSuRH5np
         xOVD7+SUawnwZSvZr8XeBPrTuaRtSOc7pn8gzpEa0Iq3dnxsA1+pnIpg68tCxTlgx4lD
         8o2wlFSc0zW9xyekjqP7wxeFNRid53wett/C2sJMYUt+3ZskLdK8FTPzl11kTxTHgCuX
         xTcyYpZmKaTxjH8fOXXQXkTd43JiKT+1gynXo9Gf7xalCiBjlGhgDHzdNrZOvrzECc0g
         Qb7t3oeybzNoUjJR15gFQrZbPvbbCBk7xkBdS5RYrLvYF+T6aCb1pHmfwP/4Sqy3ddNm
         Zf1w==
X-Gm-Message-State: AOJu0YxJzVCgBdnOPzTHcu99M1dOFoyAHQjKVAEQy5W3lLPBMmB0fG2G
	TB2rawDxGEIeGC/eM3LVYPJvoYR+RRbkSORjBMeMPfEfxWHGCFJ7jGf95B/dZ3H6rsmq8Q68Lem
	xspwXMYufYLIgGEVO91/MjFRT6dI=
X-Google-Smtp-Source: AGHT+IGfBKSH0346oZjisqWP+El3qGAyfuuf/ssApmEidyo1YY7Fjieipo8leIAjYdrSzeW3/HolQfSxb0Ii0BB8MYU=
X-Received: by 2002:a05:6870:c6a8:b0:277:c3e6:7889 with SMTP id
 586e51a60fabf-28710bcce41mr10373608fac.30.1727799901301; Tue, 01 Oct 2024
 09:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241001141352.54484-1-mikko.rapeli@linaro.org>
In-Reply-To: <20241001141352.54484-1-mikko.rapeli@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2024 09:24:35 -0700
Message-ID: <CAMKF1so9hOSn2vrFFaBUEyfQBQfpm5AM-nyoUbjbKvoPempZ4A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] python3-pefile: remove recipe
To: mikko.rapeli@linaro.org
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 16:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112635

Hi Mikko,

I had a similar patch staged in master-next for a while, I have taken that =
one.

On Tue, Oct 1, 2024 at 7:14=E2=80=AFAM Mikko Rapeli via lists.openembedded.=
org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
>
> It has been moved to oe-core.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../include/ptest-packagelists-meta-oe.inc    |  1 -
>  .../python/python3-pefile/run-ptest           |  3 --
>  .../python/python3-pefile_2024.8.26.bb        | 28 -------------------
>  3 files changed, 32 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile/run-pt=
est
>  delete mode 100644 meta-oe/recipes-devtools/python/python3-pefile_2024.8=
.26.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index f20eff219..ff48e9d14 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -36,7 +36,6 @@ PTESTS_FAST_META_OE =3D "\
>      pegtl \
>      protobuf \
>      pv \
> -    python3-pefile \
>      sdbus-c++ \
>      uthash \
>      xmlsec1 \
> diff --git a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest b/m=
eta-oe/recipes-devtools/python/python3-pefile/run-ptest
> deleted file mode 100644
> index 95ae72306..000000000
> --- a/meta-oe/recipes-devtools/python/python3-pefile/run-ptest
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -#!/bin/sh
> -
> -pytest --automake --ignore=3D./tests/pefile_test.py
> diff --git a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb =
b/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
> deleted file mode 100644
> index 87e651d9d..000000000
> --- a/meta-oe/recipes-devtools/python/python3-pefile_2024.8.26.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY =3D "Python PE parsing module"
> -DESCRIPTION =3D "A multi-platform Python module to parse and work with P=
ortable Executable (PE) files."
> -HOMEPAGE =3D "https://github.com/erocarrera/pefile"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De34c75178086aca0a17551ffbacac=
a53"
> -
> -inherit setuptools3 ptest
> -SRCREV =3D "4b3b1e2e568a88d4f1897d694d684f23d9e270c4"
> -SRC_URI =3D "git://github.com/erocarrera/pefile;branch=3Dmaster;protocol=
=3Dhttps \
> -           file://run-ptest"
> -S =3D "${WORKDIR}/git"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -do_install_ptest() {
> -   install -d ${D}${PTEST_PATH}/tests
> -   cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> -}
> -
> -RDEPENDS:${PN} +=3D " \
> -    python3-mmap \
> -    python3-netclient \
> -    python3-stringold \
> -"
> -RDEPENDS:${PN}-ptest +=3D "\
> -    python3-pytest \
> -    python3-unittest-automake-output \
> -"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112632): https://lists.openembedded.org/g/openembedde=
d-devel/message/112632
> Mute This Topic: https://lists.openembedded.org/mt/108759567/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

