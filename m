Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E17ECF256C
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 15:25:40 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.13061.1728746739916441931
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 08:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLbtnuJN;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-28847f4207dso1569169fac.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 08:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728746739; x=1729351539; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4vbuSdJOkakRYyT57KWNyXE1NMq53tornfBuHflvB4=;
        b=gLbtnuJNoUHx12yq/2fMH9eSQpD7tsD4bFp86Kka8h6o0HVS2sV91e4JpQPVCt8VS3
         xTkIP2BoNW3uO+2fGJuupaKlFSOx0hHb3LjZ3y6sjmb9o+7NPpbK02qdGlaT6mf987g5
         FVtQp5ULj9SfYOPEs3NkoGOuPYeXvt4XbL/0Tbg62OHNjG/IYdEivDKDFz192FPcDoRf
         W3P+avWTK4r+ddxex1Vb+p3RgifETolg34d5HaE9iq/7pO/ApSuR8Iv71K/BYi7LF57a
         MeqEeNxTFDVBBJX38EXx1vKlnLjHRqbD9F3ggDTiEo19Axr1Th6jKLPuI59na+m7/k3/
         RTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728746739; x=1729351539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4vbuSdJOkakRYyT57KWNyXE1NMq53tornfBuHflvB4=;
        b=wcnxsVip0Ib9ohK9kJqbMfDSjlexkkl2px0W+5yf+z4uN/Nw2fx4aOcpipheh0ViVE
         MkW3p8P15f1rIiQSr8qHBdJqc+FcgYLRNqudncN6fGMKxk7AwuHKmrJSfp1CSkDeuHMg
         YgsOsIIXTn++OZ4GUUj1syHuy7qc79azSQZTW/CBxtjcVQ/ppvnD7UzokIsaLWw6sy1X
         9pJ3NQdRTc/xz4JzfrwMeK84i7YOI5KYll75HnOnbNt0vj62TwlarkFW+CDIvh9rXMjQ
         zEInt9QLxgizONvOcLpMBt2qpUvkE1jL4sXWMo8P2h1cWP/11G+w/cCx/03QGX1SXLBB
         Y3lQ==
X-Gm-Message-State: AOJu0Yzm2MawpGAw2pnHSWuPV7oo6RneKKgGNmXx+fsi6sWyPw7udMNi
	A7AqYjWKrppprkzNhPS3vl7ekRh2CQx3dB156Aa4UK86y998kAKfuK89p6lxn0CUU8PgR0WccFZ
	QOFVOxek4xMUkDaHKtVCfHzoqO+o=
X-Google-Smtp-Source: AGHT+IEioA7KahFHtxj1rc+XWEW93E6eep5y6S8PHBGVjOQPHy9hM+2vVV5Eo7ZRAXoM+6OpO85eGkxMDugXWzSQywg=
X-Received: by 2002:a05:6870:8306:b0:270:5f17:b34 with SMTP id
 586e51a60fabf-2886ddc7051mr4696096fac.11.1728746739054; Sat, 12 Oct 2024
 08:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241012075347.1549781-1-mingli.yu@windriver.com>
In-Reply-To: <20241012075347.1549781-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Oct 2024 08:25:12 -0700
Message-ID: <CAMKF1sqDiCicxZNtHjQ7x6JTzVCYqoys5vk2hQ=d+6xeNQuRjA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libtoml11: Add new recipe
To: mingli.yu@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 15:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112830

On Sat, Oct 12, 2024 at 12:53=E2=80=AFAM Yu, Mingli via lists.openembedded.=
org
<mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> toml11 is a feature-rich TOML language library for C++11/14/17/20 [1].
>
>  # ./run-ptest
> PASS: test_comments
> PASS: test_datetime
> PASS: test_error_message
> PASS: test_find
> PASS: test_find_or
> PASS: test_format_floating
> PASS: test_format_integer
> PASS: test_format_table
> PASS: test_get
> PASS: test_get_or
> PASS: test_literal
> PASS: test_location
> PASS: test_parse_array
> PASS: test_parse_boolean
> PASS: test_parse_datetime
> [snip]
>
> [1] https://github.com/ToruNiina/toml11
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...issing-zero-initialization-to-region.patch | 34 ++++++++++++++++
>  .../libtoml11/files/run-ptest                 | 12 ++++++
>  .../libtoml11/libtoml11_4.2.0.bb              | 39 +++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/libtoml11/files/0001-fix-add=
-missing-zero-initialization-to-region.patch
>  create mode 100755 meta-oe/recipes-devtools/libtoml11/files/run-ptest
>  create mode 100644 meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
>
> diff --git a/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missin=
g-zero-initialization-to-region.patch b/meta-oe/recipes-devtools/libtoml11/=
files/0001-fix-add-missing-zero-initialization-to-region.patch
> new file mode 100644
> index 000000000..b779d493a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/files/0001-fix-add-missing-zero-=
initialization-to-region.patch
> @@ -0,0 +1,34 @@
> +From 9c7cef94a551cfdbbe2cce262c29221e22643d84 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Ale=3DC5=3DA1=3D20Mat=3DC4=3D9Bj?=3D <amatej@redhat.co=
m>
> +Date: Mon, 19 Aug 2024 06:35:03 +0200
> +Subject: [PATCH] fix: add missing zero initialization to region
> +
> +Fixes below error:
> +
> +/build/tmp-glibc/work/core2-64-wrs-linux/libtoml11/1_4.2.0-r0/git/includ=
e/toml11/fwd/../fwd/../fwd/region_fwd.hpp:49:5: error: '<unnamed>.toml::det=
ail::region::first_' is used uninitialized [-Werror=3Duninitialized]
> +   49 |     region(region&&)      =3D default;
> +      |     ^~~~~~
> +
> +Upstream-Status: Backport [https://github.com/ToruNiina/toml11/commit/9c=
7cef94a551cfdbbe2cce262c29221e22643d84]
> +
> +---
> + include/toml11/fwd/region_fwd.hpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/toml11/fwd/region_fwd.hpp b/include/toml11/fwd/regi=
on_fwd.hpp
> +index b40317d..26f1a9b 100644
> +--- a/include/toml11/fwd/region_fwd.hpp
> ++++ b/include/toml11/fwd/region_fwd.hpp
> +@@ -34,7 +34,8 @@ class region
> +     // a value that is constructed manually does not have input stream =
info
> +     region()
> +         : source_(nullptr), source_name_(""), length_(0),
> +-          first_line_(0), first_column_(0), last_line_(0), last_column_=
(0)
> ++          first_(0), first_line_(0), first_column_(0), last_(0), last_l=
ine_(0),
> ++          last_column_(0)
> +     {}
> +
> +     // a value defined in [first, last).
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-devtools/libtoml11/files/run-ptest b/meta-oe=
/recipes-devtools/libtoml11/files/run-ptest
> new file mode 100755
> index 000000000..9bc480aa7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? =3D 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb b/meta=
-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
> new file mode 100644
> index 000000000..758e258a5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.2.0.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "TOML for Modern C++"
> +DESCRIPTION =3D "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE =3D "https://github.com/ToruNiina/toml11"
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf7be=
fa3"
> +
> +PE =3D "1"

Why do we need PE in a newly added recipe ?

> +
> +SRCREV =3D "cc0bee4fd46ea1f5db147d63ea545208cc9e8405"
> +SRCREV_json =3D "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
> +SRCREV_doctest =3D "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
> +
> +SRC_URI =3D "git://github.com/ToruNiina/toml11;branch=3Dmain;protocol=3D=
https \
> +           git://github.com/nlohmann/json;destsuffix=3Dgit/tests/extlib/=
json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps \
> +           git://github.com/doctest/doctest;destsuffix=3Dgit/tests/extli=
b/doctest;name=3Ddoctest;branch=3Dmaster;protocol=3Dhttps \
> +           file://0001-fix-add-missing-zero-initialization-to-region.pat=
ch \
> +           file://run-ptest \
> +"
> +SRCREV_FORMAT =3D "json_doctest"

Perhaps it will be good to define name=3D for the first entry in SRC_URI as=
 well.

> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> +                  -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FE=
ATURES", "ptest", "ON", "OFF", d)} \
> +"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112822): https://lists.openembedded.org/g/openembedde=
d-devel/message/112822
> Mute This Topic: https://lists.openembedded.org/mt/108963713/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

