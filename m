Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB49CCF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 16:19:17 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.34672.1728836349949299688
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 09:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C2PuljE6;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5e5b5715607so1814192eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 09:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728836349; x=1729441149; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2ljjT2qvlEWeWglADgggJD4MQdCpBR0iJ4hB/z0xCM=;
        b=C2PuljE64pQKoEFn6tG69LHZZ1bIB4R6Xy2wHdVWZtlTd0Prry9xsGEkrlF6rnduS6
         /qJcMdAOSJp/0taeK25zJuAbQHuBhSKFOGSwLgVCQgeFGmzKxwqQYKmo1sOCqw8iq6J2
         ouDElHIaEDG/orSap6osSgEVEVsqE8HZU6hue19TW9B3UZeMJ2ioL65Ywi5Q4pWLVPPe
         IbS9R2s/gx3WsyoywIiOxggffpHfNNaCZ5ll6i6MQpWwbw4YfoQLzwGYgmkozSdGd4vV
         fZ8c9widqpfPjYD9vJrknWKcDII+8ejXkNuwU+fDV3wWvkr9pf0pPc54CbNp/z05czg6
         BLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728836349; x=1729441149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2ljjT2qvlEWeWglADgggJD4MQdCpBR0iJ4hB/z0xCM=;
        b=U3JEZDUjP8ZPcwXCX7Hvt7SlvwxH07ji1W33wkp+PWJf+2IR0TamDbMTkGkmkZVBcy
         IRGaceNMqLS7EYo0CyNl/UJLAm+Azx/8cI90ddAktZbvxNV0F1uZhQ5DA3Ei+7LcBkfB
         T9DsQiw+t72Ykh9hlypqteL5t1swhMHqfNlu/6xQZr1Pt39WkPfF9+Abdg5RfYF8Xlcs
         Bx7lVIpb3+bZEyGQ/wc3Aqhc+QBtPqPvLE5iTUMg4O2mwYJX9XBANmIENBacAYaFfIV1
         3hTF44K0M+sH//IBUs+3cLp7fN5e4j0oqh7UdoQEIYchLdYu3QcI9VE3SncKWJ/txZ0Y
         p3hw==
X-Gm-Message-State: AOJu0YyHdhCJkRKB0uhOLdaQjVASjMwA+vsuY7SOK8zQVAKJeU+U4b7n
	jIPcrQ3YXmGW+qpXEsPLaONYRs/SFmyWD4CB5zCxGlMRdSsJAAOqU4Qt7fNkZ2hPyc9OatFxPwp
	ErAi6g7pRffIiDZxuxNjJ1eQqs9I=
X-Google-Smtp-Source: AGHT+IEea2fFYWIqz76eMsKlGA8Hmfb/i8s+P1PG1XSgSoHHpHhi8cp5A1pImtO39yOY1ctBQyXqE8h5NsA6nl4GcEE=
X-Received: by 2002:a05:6820:1ac6:b0:5d6:ab0:b9a6 with SMTP id
 006d021491bc7-5eb18d8d9eamr4309864eaf.4.1728836349124; Sun, 13 Oct 2024
 09:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241012100147.618578-1-mingli.yu@windriver.com> <20241012100147.618578-2-mingli.yu@windriver.com>
In-Reply-To: <20241012100147.618578-2-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Oct 2024 09:18:42 -0700
Message-ID: <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 16:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112838

ptests seems to be failing for qemux86-64 -  https://snips.sh/f/PWrmTR3-bm

bitbake meta-oe-image-ptest-tomlplusplus
bitbake meta-oe-image-ptest-tomlplusplus -ctestimage

On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openembedded.o=
rg
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
>  # ./run-ptest
> PASS: tomlplusplus_odr_test
> PASS: tomlplusplus_tests
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++++++++
>  .../tomlplusplus/tomlplusplus_git.bb              | 15 +++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>  create mode 100755 meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
>
> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b/meta=
-oe/recipes-devtools/tomlplusplus/files/run-ptest
> new file mode 100755
> index 000000000..4f682c5eb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in tomlplusplus_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? =3D 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/=
meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> index 0e8202bdc..245c309a2 100644
> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplus"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D90960f22c10049c117d56ed2ee5ee=
167"
>
> -SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;b=
ranch=3Dmaster"
> +SRC_URI =3D "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;b=
ranch=3Dmaster \
> +           file://run-ptest \
> +"
>
>  PV =3D "3.4.0"
>  SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
>
>  DEPENDS =3D "cmake-native"
>
> -inherit meson
> +inherit meson ptest
> +
> +EXTRA_OEMESON +=3D "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEATURE=
S", "ptest", "true", "false", d)} \
> +"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
> +}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112828): https://lists.openembedded.org/g/openembedde=
d-devel/message/112828
> Mute This Topic: https://lists.openembedded.org/mt/108964413/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

