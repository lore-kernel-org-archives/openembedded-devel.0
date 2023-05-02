Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED83C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:47:35 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.3621.1683064046177095326
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 14:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GlpitdFH;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-187949fdb1cso3411541fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 14:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683064045; x=1685656045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjszgVfcB3ssFO/4zbamZTlTupJ1slkFzwst7xadNVo=;
        b=GlpitdFHinaX09BMfa++azthxL4qcPLBl6OE1mxhjzE5IDNGLI00lZysg5wNyE1yjZ
         z86lUQD+1ws3CREadr8DvGPZcAkFlGYILo/v3qwSgTGvLDW6KFRMDy9Y0WenS+0Bga1A
         DKX7ymAOCjhRtFQ7f1gjNEqVRXwhCNkXhy0uLNzAmOh9gkT2rmFaA/shvelQIHg/GwK5
         GKqG1EXmDe7gNihmRUqnWVkkKADNywCec3Yo9iN95Te4zoWj7iSXdBxkJKeIHJ7ppECJ
         USaQJ7fuav6A9gGSvZkkvsFW73UWO6YKB1MdaNhwua/uRgmFJQJqONKN7KlHRsMdZSya
         EmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683064045; x=1685656045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjszgVfcB3ssFO/4zbamZTlTupJ1slkFzwst7xadNVo=;
        b=D792uZUOJ7bzmmzXn62nUl2/s1y9Qup9SE3csuz6lCmDa/Y7KnjKoe7LBbwZ7TvzVm
         i2yHGK+/O6gJYLM3ImV5Sq5QUf5PcYiZegR+oOo2wAP99PnEl3s6jL6hPkd0m8QgROHh
         DXxoGa0J0xUwecgfOhgk1+Dc2p/kA584eeVoAGBUBmJvjquQU5+3g0U05lf2CjaOI1+b
         3L7imHmRTWKp4zlfFYKnENYtdZRad4r8vG81uaAbNpEUDcnOQHXdw2BptAprsx7TdRtk
         c6/HSFy83APj6elHnWtKGo8tPrSpvb5qFGPuQjObc06ruF7eRdHlS5CtFV54ohYpNz45
         uwcg==
X-Gm-Message-State: AC+VfDwstSj9am+IMPbq2oPFWxHwgHvAY8JwsMotRvje2eWYKkoAT/K0
	r7DCLu1v9x42H/+09kK5Z3MNBudS8yu1AqENlUaWZi5W0vXZug==
X-Google-Smtp-Source: ACHHUZ7OapJ26ex1FyotsCgNURqwTj5ag2aGqy7ql/d/58JuKbZXZYmXQ87aKatOuBFWq0dxjrt+9i0lBpX9VOLh8nQ=
X-Received: by 2002:a05:6870:1a97:b0:187:d229:2781 with SMTP id
 ef23-20020a0568701a9700b00187d2292781mr9714722oab.6.1683064045320; Tue, 02
 May 2023 14:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com> <20230502165005.880470-2-tgamblin@baylibre.com>
In-Reply-To: <20230502165005.880470-2-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 14:46:59 -0700
Message-ID: <CAMKF1sq9C+_1NeygZ-iuCE076gVbefYSSZFqYCNjZaBkj1J5pw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-platformdirs: Add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 21:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102280

I think it needs python3-hatchling or native variant of this. It fails to b=
uild

| ERROR Missing dependencies:
|       hatchling>=3D1.14

On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.co=
m> wrote:
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python/python3-platformdirs/run-ptest     |  3 ++
>  .../python/python3-platformdirs_3.5.0.bb      | 35 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-platformd=
irs/run-ptest
>  create mode 100644 meta-python/recipes-devtools/python/python3-platformd=
irs_3.5.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run=
-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKI=
P/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $N=
F=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}=
'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5=
.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
> new file mode 100644
> index 000000000..b5ff369d0
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.0.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "A small Python module for determining appropriate platform-=
specific dirs"
> +HOMEPAGE =3D "https://github.com/platformdirs/platformdirs"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4f5a41454746a9ed111e3d8723d=
17a"
> +
> +SRC_URI =3D " \
> +    git://github.com/platformdirs/platformdirs.git;branch=3Dmain;protoco=
l=3Dhttps \
> +    file://run-ptest \
> +"
> +
> +SRCREV ?=3D "dcb56802714f5570236c86d03773ff881be6e39f"
> +SRC_URI[sha256sum] =3D "7954a68d0ba23558d753f73437c55f89027cf8f5108c1984=
4d4b82e5af396335"
> +
> +inherit python_setuptools_build_meta ptest
> +
> +DEPENDS +=3D " \
> +    python3-hatch-vcs-native \
> +    python3-setuptools-scm-native \
> +    python3-toml-native \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    ${PYTHON_PN}-appdirs \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-pytest-mock \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/Tests
> +        cp -rf ${S}/tests ${D}${PTEST_PATH}/
> +}
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102266): https://lists.openembedded.org/g/openembedde=
d-devel/message/102266
> Mute This Topic: https://lists.openembedded.org/mt/98643291/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

