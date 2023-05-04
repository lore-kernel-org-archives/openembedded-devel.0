Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A0CC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 23:55:20 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.15709.1683244515039602699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 May 2023 16:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=R2CyTJQa;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6a60630574aso761397a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 16:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683244514; x=1685836514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81GI0dnfLyyjQznHxFYq+HoZ/8li+VB7eUaNTkf8Kug=;
        b=R2CyTJQac1JFv/jiLrMDPJET28gzSbjoemq/sNzS9VfUrcPffNFWTrxtctLnTpIplk
         dG+XO8ReWq4OJmUCJOlagXTC5h3AYn+gvW5bAQFG1qtxZoWCiI9KaKkL3qFhSbZ2olh4
         LPUos43VzOdQSoT7TsAn29Ahu5tqmyDQC/D2k9Izml0auQgkHI5xq/SGu1cZnJussjMc
         clY/RqztfK53IxvUi7TKbjTl66aOlIRMyfvjq2li7pxuLjZv/yjTM76G+G8TDhpN+QB9
         NGzHMCjYQAEe/WaSJrcJDsoR0J1e9s1fm0EkfDrLEDkHNXckcrdKQ4vzEX4BUMCGzqq9
         nV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683244514; x=1685836514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81GI0dnfLyyjQznHxFYq+HoZ/8li+VB7eUaNTkf8Kug=;
        b=Mec2AjV1sJBdcODQknaTayES5CPjuKeZgTUkulYMtitQHUpYOy0C5fCFISEksPmZHl
         /ZGz/SUtYRqNHgsCF/8f7VClk/k/zddG4ybOJhYa6od8vxj8VEDe0wdljhSIYejY75nK
         8YlcNyJ66au+0iYrORYiQCp1f7X1Cfs24AyFaRETl7IPuMlxvgKB8BJ9slkfVH6Av67X
         rV96LOdXdYRGPSC311rJjdRSMRAOUvc1surerfJe69XFgL2iq5pS86db6/R0fpSP6TCz
         ZLTBQ9GV7NDlPJAJP6ismNahZLJpDJ+AGoVnRoKecxaS37jNVnnAytTOJzBOm54rNWh/
         utZg==
X-Gm-Message-State: AC+VfDy4kBW0uLBpE9GhZjvHj56k7XCUNtfB7v8a9x/rr6muFqjqG5hc
	nCBqSncRqn+JRM0ZRzGyCwBoB0WkzBZWw3elnDQdagvW62A=
X-Google-Smtp-Source: ACHHUZ5YxstUY0C+Styk08yVhFqXjd/CI50MtUL0ZUjYN+UMIspd9XF4X10C87YOGYX1Ddz1kvwnP+kRxFQ3or+c/r8=
X-Received: by 2002:aca:1909:0:b0:38e:8d7a:f2a1 with SMTP id
 l9-20020aca1909000000b0038e8d7af2a1mr2441465oii.43.1683244513993; Thu, 04 May
 2023 16:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com> <20230502165005.880470-6-tgamblin@baylibre.com>
In-Reply-To: <20230502165005.880470-6-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 May 2023 16:54:48 -0700
Message-ID: <CAMKF1soGFGXhzgeDEEXTfeohtUcQDdhZnBtMPAfaY8oEcLQKng@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-pylint: add ptest
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 May 2023 23:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102314

The ptests fail on musl/qemux86-64

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Failed test cases (sorted by testseries, ID)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---------------------------------------------------------------------------=
-----------------------------------
testseries | result_id : oeqa |
runtime_meta-python-ptest-image-python3-pylint_qemux86-64_20230504233302
    ptestresult.python3-pylint.tests/benchmark/test_baseline_benchmarks.py:=
:TestEstablishBaselineBenchmarks::test_baseline_benchmark_j1_all_checks_sin=
gle_file
    ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_confi=
g_generate.py::test_format_of_output
    ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_confi=
g_generate.py::test_generate_interactive_exitcode
    ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_confi=
g_generate.py::test_writing_minimal_file
    ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_confi=
g_generate.py::test_writing_to_output_file
    ptestresult.python3-pylint.tests/test_check_parallel.py::TestCheckParal=
lelFramework::test_linter_with_unpickleable_plugins_is_pickleable
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[mc=
cabe]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[mi=
ssing_timeout]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[re=
gression_3976]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[su=
per_init_not_called_extensions_py310]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[ty=
pevar_naming_style_default]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[ty=
pevar_naming_style_rgx]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[ty=
ping_broken_noreturn]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[ty=
ping_broken_noreturn_future_import]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[ty=
ping_broken_noreturn_py372]
    ptestresult.python3-pylint.tests/test_functional.py::test_functional[un=
defined_loop_variable]
    ptestresult.python3-pylint.tests/test_self.py::TestCallbackOptions::tes=
t_generate_toml_config
    ptestresult.python3-pylint.tests/test_self.py::TestCallbackOptions::tes=
t_generate_toml_config_disable_symbolic_names
---------------------------------------------------------------------------=
-----------------------------------

On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.co=
m> wrote:
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ....toml-Remove-hard-coded-dependencies.patch | 10 ++-----
>  .../python/python3-pylint/run-ptest           |  3 ++
>  .../python/python3-pylint_2.17.3.bb           | 30 +++++++++++++++++--
>  3 files changed, 32 insertions(+), 11 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pylint/ru=
n-ptest
>
> diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-pypr=
oject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-devto=
ols/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependencie=
s.patch
> index 55d42b101..267e4c30d 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.t=
oml-Remove-hard-coded-dependencies.patch
> +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject.t=
oml-Remove-hard-coded-dependencies.patch
> @@ -1,21 +1,15 @@
> -From 843d050f1bf889b81fa8fc3e7a1350385c8348ec Mon Sep 17 00:00:00 2001
> +From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
>  From: Trevor Gamblin <tgamblin@baylibre.com>
>  Date: Mon, 1 May 2023 11:32:24 -0400
>  Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
>
> -The upstream pyproject.toml has hard-coded dependencies on specific
> -versions of wheel and setuptools. This breaks builds of pylint
> -2.17.3, so patch it to remove the pinned versions.
> -
> -Upstream-Status: Pending
> -
>  Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>  ---
>   pyproject.toml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/pyproject.toml b/pyproject.toml
> -index e4b63c660..0ee21e0eb 100644
> +index bd542646b..2c0ed9485 100644
>  --- a/pyproject.toml
>  +++ b/pyproject.toml
>  @@ -1,5 +1,5 @@
> diff --git a/meta-python/recipes-devtools/python/python3-pylint/run-ptest=
 b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
> new file mode 100644
> index 000000000..b63c4de0d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKI=
P/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $N=
F=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}=
'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb=
 b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> index b85f77503..58f0616fc 100644
> --- a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> @@ -3,10 +3,14 @@ HOMEPAGE=3D "http://www.pylint.org/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d4e=
9c9"
>
> -SRC_URI +=3D "file://0001-pyproject.toml-Remove-hard-coded-dependencies.=
patch"
> -SRC_URI[sha256sum] =3D "761907349e699f8afdcd56c4fe02f3021ab5b3a0fc26d19a=
9bfdc66c7d0d5cd5"
> +SRC_URI +=3D " \
> +        git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3Dhttp=
s \
> +        file://run-ptest \
> +        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patch =
\
> +        "
> +SRCREV ?=3D "389e14c36819cb87190fd412d3f366a3283f0078"
>
> -inherit pypi python_setuptools_build_meta
> +inherit python_setuptools_build_meta ptest
>
>  RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
>                     ${PYTHON_PN}-isort \
> @@ -17,3 +21,23 @@ RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
>                     ${PYTHON_PN}-difflib \
>                     ${PYTHON_PN}-netserver \
>                    "
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +        ${PYTHON_PN}-core \
> +        ${PYTHON_PN}-dill \
> +        ${PYTHON_PN}-git \
> +        ${PYTHON_PN}-platformdirs \
> +        ${PYTHON_PN}-pytest \
> +        ${PYTHON_PN}-pytest-benchmark \
> +        ${PYTHON_PN}-statistics \
> +        ${PYTHON_PN}-tomlkit \
> +        ${PYTHON_PN}-tomllib \
> +        "
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> +    sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tes=
ts/data/ascript
> +}
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102270): https://lists.openembedded.org/g/openembedde=
d-devel/message/102270
> Mute This Topic: https://lists.openembedded.org/mt/98643295/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

