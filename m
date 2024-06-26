Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0D2C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:53:02 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.30684.1719417178488997327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KeCRC6dI;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ce6a9fd5cso3559238e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417177; x=1720021977; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDAE3S4mRrZAGI6/UIjDM7YX1iZbzWPUqInml1pIBik=;
        b=KeCRC6dIjIjZdLibYuOodO/xOCC9LxNUvH2gdO/u/6zB5kLuOPQ/v2zuW2UuSRXZ+Y
         kS/7xiERvKSj1TroTvI2O+L4ZgeXaosAM7SVMW3ww7vZm6oBVLw+kvGjq7kE8B/aKE8U
         K535/Z2kOp5Gmb40ky4v4mtDEPqtBoiihPu+Zxez7sq8kXjKCtSjZ/wIYjqNFECy2x09
         C83/HS1cmx/tBcJ0T7F7hYB8h+Ow3zTOyadqA1QCZSftgnJ8eXFPM10x44hOUM3sIvpQ
         RB00kqHDQ3kugd6LZ21s4GeRPKBBYLKRYVRXG8RPAKkDndGwTfU3H6q0L0Y2n3fUvVkN
         oRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417177; x=1720021977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDAE3S4mRrZAGI6/UIjDM7YX1iZbzWPUqInml1pIBik=;
        b=AScTqWpxGANGZ3LUdJeF0BlV2EHc9qffV1XjgBFKDLEljSRNR927JHZ+y7npz3yZu7
         xK6DJ0ru0RI2W810CCAraRchPBalZEzN8TJEXlRgBDIoAmGjpSkn96LNf/yuZRDGqvUk
         e4zGc6j7hTMUsLPQaJnrgZClTLUgF8Ysg068GQ3UyMsR+EiOUPbxuq840MgjpLL/04uX
         Ohljun/Xe6Be3uL7sqXjNRczBw4CGWzhIL/a9QZ69JNsK0cmhD6RGECl8YHHL4Etm4nj
         XfItVaJuSBn2HF/pMISSWvwQbyVwbjvuoG75kY5k7VNorV780Lq68NF1RaH3JowWBUTd
         HGDg==
X-Gm-Message-State: AOJu0YzbjH1Oe/tTWk96ykmqebsqAlaSdd+yqWxCGuaxYhcxS0I3X9DJ
	U2ORfPOEWAO//fYtyOQZNtxHsOhThcP9n6n7HHYPksaeOIaAA99v0zPDSpqY+m93xibe9VG2Foi
	vXbXst7Y2OKWgqBt6A3WVadIh/K8=
X-Google-Smtp-Source: AGHT+IGsK1ZsEQ8gOdB7FBiQxy8unAffY/rOEZeKzkQ+LbEPpKF/nMDt+HkiYcS5fmO65R3ipz7wN+60hBJGqIfI+vA=
X-Received: by 2002:ac2:4c38:0:b0:52c:9bb3:6656 with SMTP id
 2adb3069b0e04-52ce185cfbcmr6812378e87.44.1719417176346; Wed, 26 Jun 2024
 08:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240619094547.30863-1-mark.jonas@de.bosch.com>
In-Reply-To: <20240619094547.30863-1-mark.jonas@de.bosch.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Jun 2024 17:52:42 +0200
Message-ID: <CA+chaQfw=Uj30UAbC7m6eoN_0ZhzFYqoJKL1vdAkTZe13vukAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] magic-enum: add recipe
To: mark.jonas@de.bosch.com
Cc: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 15:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111110

ptest seems to fail building

lib32-magic-enum/0.9.5/git/test/test_containers.cpp:290:89: error:
value computed is not used [-Werror=3Dunused-value]
  290 |   magic_enum::containers::set color_set_not_const {Color::RED,
Color::GREEN, Color::BLUE};
      |
                         ^

On Wed, Jun 19, 2024 at 11:47=E2=80=AFAM Mark Jonas via lists.openembedded.=
org
<mark.jonas=3Dde.bosch.com@lists.openembedded.org> wrote:
>
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>
> magic-enum is a header-only C++17 library provides static reflection
> for enums, works with any enum type without any macro or boilerplate
> code.
>
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  .../magic-enum/magic-enum/run-ptest           | 27 ++++++++++++
>  .../magic-enum/magic-enum_0.9.5.bb            | 44 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/magic-enum/magic-enum/run-pt=
est
>  create mode 100644 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.=
bb
>
> diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest b/m=
eta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
> new file mode 100644
> index 000000000..865da9f69
> --- /dev/null
> +++ b/meta-oe/recipes-extended/magic-enum/magic-enum/run-ptest
> @@ -0,0 +1,27 @@
> +#!/bin/sh
> +
> +# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
> +#
> +# SPDX-License-Identifier: MIT
> +
> +fail_count=3D0
> +all_count=3D0
> +
> +for test_suite in tests/test_*
> +do
> +    if "./$test_suite"
> +    then
> +        echo "PASS: $test_suite"
> +    else
> +        echo "FAIL: $test_suite"
> +        fail_count=3D$((fail_count + 1))
> +    fi
> +    all_count=3D$((all_count + 1))
> +done
> +
> +if [ $fail_count -eq 0 ]
> +then
> +    echo "PASS: All $all_count tests passed"
> +else
> +    echo "FAIL: $fail_count of $all_count tests failed"
> +fi
> diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb b/me=
ta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> new file mode 100644
> index 000000000..096f869c3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
> @@ -0,0 +1,44 @@
> +# SPDX-FileCopyrightText: 2024 Bosch Sicherheitssysteme GmbH
> +#
> +# SPDX-License-Identifier: MIT
> +
> +SUMMARY =3D "Static reflection for enums"
> +DESCRIPTION =3D "Header-only C++17 library provides static reflection fo=
r enums, works \
> +with any enum type without any macro or boilerplate code."
> +BUGTRACKER =3D "https://github.com/Neargye/magic_enum/issues"
> +HOMEPAGE =3D "https://github.com/Neargye/magic_enum"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15f48588464ec8ef87d2b560aad2=
caa"
> +
> +SRC_URI =3D " \
> +    git://github.com/Neargye/magic_enum.git;protocol=3Dhttps;branch=3Dma=
ster \
> +    file://run-ptest \
> +"
> +
> +SRCREV =3D "e55b9b54d5cf61f8e117cafb17846d7d742dd3b4"
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE =3D "\
> +    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=3DOFF \
> +"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    install -m 0755 ${B}/test/test_* ${D}${PTEST_PATH}/tests
> +}
> +
> +# Add catkin and colcon (ROS build system) support
> +FILES:${PN}-dev +=3D "\
> +    ${datadir}/magic_enum/package.xml \
> +"
> +
> +# Header-only library
> +# ${PN} is empty so we need to tweak -dev and -dbg package dependencies
> +RDEPENDS:${PN}-dev =3D ""
> +RDEPENDS:${PN}-ptest =3D ""
> +RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110963): https://lists.openembedded.org/g/openembedde=
d-devel/message/110963
> Mute This Topic: https://lists.openembedded.org/mt/106757432/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

