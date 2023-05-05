Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C86C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 07:23:22 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.21492.1683271393358615260
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 May 2023 00:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gRRje0KG;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6a5f765d595so882403a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271392; x=1685863392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OUfu6bxbfH+gb70RpINuvfomOhLATBtqtjbtQmKt/g=;
        b=gRRje0KGAv1zqCQjJX2HpnZ/jU72Zr3kGZdtar8ybjAPeJk7scG9Y6FsX2qKJK6Pvv
         0XCCvMFcvd8eWqvhsmh50ktnlKiqrG4R91MLW1biERiLAZU+tMm6IoJXYYUB6BmkP2Ap
         gwCR3gnPIfZf4lAaNfTOwckcF2HRfuuudX+5MYYeHa0Q9eSmybsadHuUu2MAIpWCm+Sa
         +esKHEApIaXXgQMYRLEyyJGx4VjOJLbwIjD3+PQOUCFZjJpcKn5NvT2/md8dNATlmfTS
         kL+5aMnae3JuWNGlax0VR2q7bTqZA0+gG8HoOZae0yuQ6GgUqVC9Q/5vVcVJVMjGDiaU
         tvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271392; x=1685863392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OUfu6bxbfH+gb70RpINuvfomOhLATBtqtjbtQmKt/g=;
        b=XIAe/d+6HjOqSGfDK97WKpHWd21CIx6uV81/fQmIUtfG0xla3eBn45Bby2mIIM84Cl
         xGC3Umdk0CdZAqH579T+gbgwCFxpcHlnQIU2BsaZGV/DGUh0KZ3rsNklx5z7+gTFPGrb
         CG5eg+4CNuJCh4P9uAELAP29hDuKY83pHFIkk1dfFF3UNTtZOhHyRrfBGHENUDWNIk6d
         XmloJAXoTEmjHIZL/7bxybxGggcGugo6Blhmu52/jxkNYEgI981kl+qrtZ0fw2veitxm
         aPAPkiRN0Oi4qqueFeUJdc/2x99ceWxCRFoHNR1PdeoMvVcd7+nXXC37dA4g3q7HDIN2
         wzsQ==
X-Gm-Message-State: AC+VfDw86hB/pSf/A/8ZpCZqEGUg9Oh5oxkTPNudjn62nnXj/aUQSef6
	rIXmkwD1QRLFPgLXdTaYaOd3EC0nPv3DqSbl3PysB4YW+DU=
X-Google-Smtp-Source: ACHHUZ6dKGU5ZKWQzED2Kvy5qS6+0CzPcCNLVcU1c1sbV2FpX9okMdk+A40UkKDEP5x3lpyH6Vm7slxVl+lDNoH3YF8=
X-Received: by 2002:a05:6808:6045:b0:38b:d002:2744 with SMTP id
 dd5-20020a056808604500b0038bd0022744mr155074oib.16.1683271392438; Fri, 05 May
 2023 00:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230502165005.880470-1-tgamblin@baylibre.com>
 <20230502165005.880470-6-tgamblin@baylibre.com> <CAMKF1soGFGXhzgeDEEXTfeohtUcQDdhZnBtMPAfaY8oEcLQKng@mail.gmail.com>
In-Reply-To: <CAMKF1soGFGXhzgeDEEXTfeohtUcQDdhZnBtMPAfaY8oEcLQKng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 May 2023 00:22:46 -0700
Message-ID: <CAMKF1spd4u0FSa+NNsWN8zX-9wfb=mboOz9YinRqKTSyk6CcQg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-pylint: add ptest
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 May 2023 07:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102315

this patch reduces the failure number but these remaining ones need to
be checked and see why they fail - http://sprunge.us/kfu3Ak

Failed ptests:
{'python3-pylint':
['tests/test_check_parallel.py::TestCheckParallelFramework::test_linter_wit=
h_unpickleable_plugins_is_pickleable',

'tests/test_self.py::TestCallbackOptions::test_generate_toml_config',

'tests/test_self.py::TestCallbackOptions::test_generate_toml_config_disable=
_symbolic_names',

'tests/config/pylint_config/test_pylint_config_generate.py::test_generate_i=
nteractive_exitcode',

'tests/config/pylint_config/test_pylint_config_generate.py::test_format_of_=
output',

'tests/config/pylint_config/test_pylint_config_generate.py::test_writing_to=
_output_file',

'tests/config/pylint_config/test_pylint_config_generate.py::test_writing_mi=
nimal_file']}

On Thu, May 4, 2023 at 4:54=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> The ptests fail on musl/qemux86-64
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Failed test cases (sorted by testseries, ID)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -------------------------------------------------------------------------=
-------------------------------------
> testseries | result_id : oeqa |
> runtime_meta-python-ptest-image-python3-pylint_qemux86-64_20230504233302
>     ptestresult.python3-pylint.tests/benchmark/test_baseline_benchmarks.p=
y::TestEstablishBaselineBenchmarks::test_baseline_benchmark_j1_all_checks_s=
ingle_file
>     ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_con=
fig_generate.py::test_format_of_output
>     ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_con=
fig_generate.py::test_generate_interactive_exitcode
>     ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_con=
fig_generate.py::test_writing_minimal_file
>     ptestresult.python3-pylint.tests/config/pylint_config/test_pylint_con=
fig_generate.py::test_writing_to_output_file
>     ptestresult.python3-pylint.tests/test_check_parallel.py::TestCheckPar=
allelFramework::test_linter_with_unpickleable_plugins_is_pickleable
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
mccabe]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
missing_timeout]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
regression_3976]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
super_init_not_called_extensions_py310]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
typevar_naming_style_default]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
typevar_naming_style_rgx]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
typing_broken_noreturn]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
typing_broken_noreturn_future_import]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
typing_broken_noreturn_py372]
>     ptestresult.python3-pylint.tests/test_functional.py::test_functional[=
undefined_loop_variable]
>     ptestresult.python3-pylint.tests/test_self.py::TestCallbackOptions::t=
est_generate_toml_config
>     ptestresult.python3-pylint.tests/test_self.py::TestCallbackOptions::t=
est_generate_toml_config_disable_symbolic_names
> -------------------------------------------------------------------------=
-------------------------------------
>
> On Tue, May 2, 2023 at 9:50=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
> >
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> >  ....toml-Remove-hard-coded-dependencies.patch | 10 ++-----
> >  .../python/python3-pylint/run-ptest           |  3 ++
> >  .../python/python3-pylint_2.17.3.bb           | 30 +++++++++++++++++--
> >  3 files changed, 32 insertions(+), 11 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-pylint/=
run-ptest
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-py=
project.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-dev=
tools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependenc=
ies.patch
> > index 55d42b101..267e4c30d 100644
> > --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject=
.toml-Remove-hard-coded-dependencies.patch
> > +++ b/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject=
.toml-Remove-hard-coded-dependencies.patch
> > @@ -1,21 +1,15 @@
> > -From 843d050f1bf889b81fa8fc3e7a1350385c8348ec Mon Sep 17 00:00:00 2001
> > +From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
> >  From: Trevor Gamblin <tgamblin@baylibre.com>
> >  Date: Mon, 1 May 2023 11:32:24 -0400
> >  Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
> >
> > -The upstream pyproject.toml has hard-coded dependencies on specific
> > -versions of wheel and setuptools. This breaks builds of pylint
> > -2.17.3, so patch it to remove the pinned versions.
> > -
> > -Upstream-Status: Pending
> > -
> >  Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >  ---
> >   pyproject.toml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/pyproject.toml b/pyproject.toml
> > -index e4b63c660..0ee21e0eb 100644
> > +index bd542646b..2c0ed9485 100644
> >  --- a/pyproject.toml
> >  +++ b/pyproject.toml
> >  @@ -1,5 +1,5 @@
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint/run-pte=
st b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
> > new file mode 100644
> > index 000000000..b63c4de0d
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pylint/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]/=
/g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || =
$NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print=
}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.=
bb b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> > index b85f77503..58f0616fc 100644
> > --- a/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pylint_2.17.3.bb
> > @@ -3,10 +3,14 @@ HOMEPAGE=3D "http://www.pylint.org/"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e65755c42985a5d=
4e9c9"
> >
> > -SRC_URI +=3D "file://0001-pyproject.toml-Remove-hard-coded-dependencie=
s.patch"
> > -SRC_URI[sha256sum] =3D "761907349e699f8afdcd56c4fe02f3021ab5b3a0fc26d1=
9a9bfdc66c7d0d5cd5"
> > +SRC_URI +=3D " \
> > +        git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3Dht=
tps \
> > +        file://run-ptest \
> > +        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patc=
h \
> > +        "
> > +SRCREV ?=3D "389e14c36819cb87190fd412d3f366a3283f0078"
> >
> > -inherit pypi python_setuptools_build_meta
> > +inherit python_setuptools_build_meta ptest
> >
> >  RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
> >                     ${PYTHON_PN}-isort \
> > @@ -17,3 +21,23 @@ RDEPENDS:${PN} +=3D "${PYTHON_PN}-astroid \
> >                     ${PYTHON_PN}-difflib \
> >                     ${PYTHON_PN}-netserver \
> >                    "
> > +
> > +RDEPENDS:${PN}-ptest +=3D " \
> > +        ${PYTHON_PN}-core \
> > +        ${PYTHON_PN}-dill \
> > +        ${PYTHON_PN}-git \
> > +        ${PYTHON_PN}-platformdirs \
> > +        ${PYTHON_PN}-pytest \
> > +        ${PYTHON_PN}-pytest-benchmark \
> > +        ${PYTHON_PN}-statistics \
> > +        ${PYTHON_PN}-tomlkit \
> > +        ${PYTHON_PN}-tomllib \
> > +        "
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +    sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/t=
ests/data/ascript
> > +}
> > --
> > 2.40.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102270): https://lists.openembedded.org/g/openembed=
ded-devel/message/102270
> > Mute This Topic: https://lists.openembedded.org/mt/98643295/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

