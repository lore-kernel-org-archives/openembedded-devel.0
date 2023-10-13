Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BD6CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:15:11 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.44487.1697217306684242915
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2cChvhv;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57b9231e91dso1296711eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697217306; x=1697822106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKYmxRnyNW2TBHVJ0c8pJ+U9bigQtEorctxep+8Vq8I=;
        b=N2cChvhvhVMAaEYA2GWZ8pjjWk4VamPdvRHXemfVAtOujqvbDFDUxAkbUlNErqnfFP
         9VrS0ORNHei3t3+zNqYw0RhahKgf7Zo0WIt02pfSs1pAYOcShj2Qvl0dKhgrUVyCoDGQ
         4ksEXp2Wk7ABhePj564o6LrxrGVgKoz8e1XtRTFKkhKzqTO3fnz16r1BrymndW4ENcP0
         nUOBKzJBlhoiTeZvotLlPnDpxj8JP8ldT6vI12wVEP8JGPnovuRhSOmp6yDZbyjJH/Iz
         IAAUs1JoXY8gEEXE1Wcrf2UsTcKqc/YuA+0odRH6z31/tXvASMOU7rvHG6A3ZwRH+JDY
         ATkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697217306; x=1697822106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKYmxRnyNW2TBHVJ0c8pJ+U9bigQtEorctxep+8Vq8I=;
        b=b5bx1GGR2as8ZrmPvmKHO50a471X1PKb6pO26ZV6Mk4FcXYxk+l5fB5MHPma9kmg8c
         ieuw2oHEYrpcbyMWfdP3tBA+ezo/LGjc3lTe/Txp1QjimvsRwFAhmhGhVp9JIRf8LFa/
         UpeU4ardOS4bAWh+/My/T6TlMbvdricoRl5safGPP3qj5PqFxTBjVWTbd6+tFaSy23Uv
         sBbqNC+ZNxtOvmVRj3ud7hCk3o56aPL8VLeM7k2BsxxIqWrguS5fs8t0VePI1gBUnHVg
         nkEy3mdrTX1FsrGXmclJWL0/GOmRzNPAE+q9SqwhFMbQyyLG3zBAj5Ywo17R/sAnpINH
         19HA==
X-Gm-Message-State: AOJu0Yy8Olz4qIz74nsQP2okA9yDZoZRsVDvxIOC/rYsRpQv+6pJp+zw
	7knqbcYFkQ58EUDc4jnN/zK8j336M47mdBa8MFU=
X-Google-Smtp-Source: AGHT+IGq++G6fbZJzF3X8tCsl43mZJi/7HBLEYIOf4hRgEzI/LGTPm5vlAumMZ3PVN/7SeY1mITKqEfMvHP9Lis7vao=
X-Received: by 2002:a05:6870:bacd:b0:1e9:c86f:4d72 with SMTP id
 js13-20020a056870bacd00b001e9c86f4d72mr4862754oab.45.1697217305882; Fri, 13
 Oct 2023 10:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231013170801.3966008-1-tgamblin@baylibre.com> <20231013170801.3966008-3-tgamblin@baylibre.com>
In-Reply-To: <20231013170801.3966008-3-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Oct 2023 10:14:40 -0700
Message-ID: <CAMKF1sog+AsVzejf0xfK3YEpWY7+EV612RDP6h-u4ZFnjF+E+Q@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-py-cpuinfo: disable broken ptests
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105484

On Fri, Oct 13, 2023 at 10:08=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
>
> There are a handful of CLI-related ptests that consistently fail with an
> apparent permissions issue, but making the
> .../site-packages/cpuinfo/cpuinfo.py script executable does not seem to
> fix the problem. Skip these tests for now, and make sure that the right
> /usr/bin/env line is present in py-cpuinfo's scripts on the image.
>

Good. Can you also move it out of PTESTS_PROBLEMS_META_PYTHON into
either PTESTS_FAST_META_PYTHON or PTESTS_SLOW_META_PYTHON


> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../0001-test_cli.py-disable.patch            | 32 +++++++++++++++++++
>  .../python/python3-py-cpuinfo_9.0.0.bb        |  8 +++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-py-cpuinf=
o/0001-test_cli.py-disable.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo/0001-=
test_cli.py-disable.patch b/meta-python/recipes-devtools/python/python3-py-=
cpuinfo/0001-test_cli.py-disable.patch
> new file mode 100644
> index 0000000000..e4165d2d66
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo/0001-test_cl=
i.py-disable.patch
> @@ -0,0 +1,32 @@
> +From 620cb80b0bb5ec58fe15592f033487a4e1cd3859 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Thu, 12 Oct 2023 16:46:53 -0400
> +Subject: [PATCH] test_cli.py: disable
> +
> +These tests fail if .../site-packages/cpuinfo/cpuinfo.py isn't
> +executable, but setting it so during do_install doesn't seem to work.
> +Disable them for now so that the ptests work with the remaining ~150
> +successes.
> +
> +Upstream-Status: Inappropriate [OE-Specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + tests/test_cli.py | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/test_cli.py b/tests/test_cli.py
> +index a6b1985..43c4334 100644
> +--- a/tests/test_cli.py
> ++++ b/tests/test_cli.py
> +@@ -6,6 +6,7 @@ import helpers
> +
> +
> +
> ++@unittest.skip("Disable while permissions issues are figured out")
> + class TestCLI(unittest.TestCase):
> +       def setUp(self):
> +               helpers.backup_data_source(cpuinfo)
> +--
> +2.41.0
> +
> diff --git a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0=
.bb b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
> index 5fbac03ac0..84172c058e 100644
> --- a/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-py-cpuinfo_9.0.0.bb
> @@ -11,8 +11,16 @@ SRC_URI[sha256sum] =3D "3cdbbf3fac90dc6f118bfd64384f30=
9edeadd902d7c8fb17f02ffa1fc3
>  inherit ptest pypi setuptools3
>
>  SRC_URI +=3D "file://run-ptest \
> +            file://0001-test_cli.py-disable.patch \
>             "
>
> +do_install:append() {
> +    # Make sure we use /usr/bin/env python3
> +    for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
> +        sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
> +    done
> +}
> +
>  do_install_ptest() {
>      install -d ${D}${PTEST_PATH}/tests
>      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105482): https://lists.openembedded.org/g/openembedde=
d-devel/message/105482
> Mute This Topic: https://lists.openembedded.org/mt/101944756/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

