Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BA2CD8CB1
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 18:59:53 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.2570.1696964383347603554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 11:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+gGaqKp;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1dd1db54d42so4151099fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 11:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696964382; x=1697569182; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcO3aO4zQNJdWrcXEBRrVRT2P+LtdTPyMCmP9xsIsVQ=;
        b=h+gGaqKpYJpatQiez/zJfH2j966rP4D5dgoC/JQjHcM4gYs34AeGeKMMka44V0PCnk
         ye/glfPbOJBrblMeiXaVR85IaYmjNLzsSMl6bkvX3OAr+pysQ+eufU58IaVXpo3ILBSP
         ks6BHZe0quv4TWlK2+J2KYylJAKs/QLKG4x7UnwbxxpUD1W7SuFgLO4kfo5N6Jwdo1fL
         KsUevasSWdrLl7esjeFgKR+puIOsgMWMGduCGLQqu+MBBf+tD/Bji0kGE5Y7gD1Fj+/B
         vKp/guQtdZ8Wt+BNmBS+9bKttTPT5KjvqVecAZUIxXwh9mcZfefqzmMSMvPBP8XbthmF
         YDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696964382; x=1697569182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcO3aO4zQNJdWrcXEBRrVRT2P+LtdTPyMCmP9xsIsVQ=;
        b=piRsB+mX2sfXHkygJkYIsk1cj0rDorRAQd8tIcKoJXAyZgjY0jKSsIdwHqimiidIGY
         vNs4W4NC6PwsBACW+foi807pp1Mr4lk1BBOZ4fE0GpNQXDWH64P8nyu62Ekf/JIpBXjX
         /15baI+RD4j7tCFtU9DpSpKxLxKL8LDufONbC9VOqv1PLrPP4EGO4+mpjy+xWCToF4/2
         wHshIGFwgQ1/O0ZDZ67CcJeoaRy7g2HmBb8aSuY9VilEtCkqgHvkdJbNdZO6+XDTBkUJ
         V/RmYgqZ6ONbCZB3wj+L0MRfS+mkpZnhM2z5sqgXMcrstGgRVPFy5P2fwUEAvymy/G3e
         pAdQ==
X-Gm-Message-State: AOJu0YxLl7Tk3Ld3+O4Uddgfuh5MT1X8hMka719j0UQwXtnnQsewUOiS
	a3N355iFeg9V/KmU5qObPp/Cw9AcZvncmS491p8=
X-Google-Smtp-Source: AGHT+IF61a1YRulnhkNuktdgJ1XMY0CHx2a+MOxJczPHaCcnJxwqCrmFjBeJh5IQGzBXg7we9E2yJTKzy0gZk3YaaJw=
X-Received: by 2002:a05:6870:6c07:b0:1e9:8780:a0e with SMTP id
 na7-20020a0568706c0700b001e987800a0emr547329oab.28.1696964382444; Tue, 10 Oct
 2023 11:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231003042313.1153843-1-raj.khem@gmail.com> <20231003042313.1153843-3-raj.khem@gmail.com>
 <CACS+7ZRLbXSGrz75AdYYm7+kJU+7TiFokXHkXWC6Q5xxLaDwqg@mail.gmail.com>
In-Reply-To: <CACS+7ZRLbXSGrz75AdYYm7+kJU+7TiFokXHkXWC6Q5xxLaDwqg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2023 11:59:16 -0700
Message-ID: <CAMKF1sqUkDpqKCgHUP2oq=TVBKMFfoVsywrX=z3GszqGV71rZw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pylint: Upgrade to 3.0.0
To: Dan McGregor <danismostlikely@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 18:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105416

On Tue, Oct 10, 2023 at 11:35=E2=80=AFAM Dan McGregor <danismostlikely@gmai=
l.com> wrote:
>
> I think these changes should be cherry-picked to nanbield. It's got
> the update for astroid to v3.0.0, and that breaks pylint on that
> branch.
>

yes Armin is working on syncing nanbield to latest master.
have you tried nanbield-next ?

> On Mon, 2 Oct 2023 at 22:23, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Package additional hidden files for ptests (test_primer.py)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...001-pylint-remove-plugin-pickle-test.patch | 53 -------------------
> >  ....toml-Remove-hard-coded-dependencies.patch | 26 ---------
> >  ...lint_2.17.4.bb =3D> python3-pylint_3.0.0.bb} |  5 +-
> >  3 files changed, 2 insertions(+), 82 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/=
0001-pylint-remove-plugin-pickle-test.patch
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-pylint/=
0001-pyproject.toml-Remove-hard-coded-dependencies.patch
> >  rename meta-python/recipes-devtools/python/{python3-pylint_2.17.4.bb =
=3D> python3-pylint_3.0.0.bb} (89%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-py=
lint-remove-plugin-pickle-test.patch b/meta-python/recipes-devtools/python/=
python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
> > deleted file mode 100644
> > index a7637a5ca6..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-re=
move-plugin-pickle-test.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From 341e19dd69d847f84859e85cabff5846e7da24c4 Mon Sep 17 00:00:00 2001
> > -From: Trevor Gamblin <tgamblin@baylibre.com>
> > -Date: Mon, 15 May 2023 09:26:04 -0400
> > -Subject: [PATCH] pylint: remove plugin pickle test
> > -
> > -Upstream-Status: Inappropriate (oe-specific)
> > -
> > -Upstream uses an assertion in the removed test to state that the test
> > -needs changing if the plugin loading succeeds. The same failure wasn't
> > -seen when running the tests on the host with pytest, so disable it by
> > -removing the test from the suite.
> > -
> > -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ----
> > - tests/test_check_parallel.py | 22 ----------------------
> > - 1 file changed, 22 deletions(-)
> > -
> > -diff --git a/tests/test_check_parallel.py b/tests/test_check_parallel.=
py
> > -index d56502eaf..34fec140f 100644
> > ---- a/tests/test_check_parallel.py
> > -+++ b/tests/test_check_parallel.py
> > -@@ -257,28 +257,6 @@ class TestCheckParallelFramework:
> > -         assert stats.statement =3D=3D 18
> > -         assert stats.warning =3D=3D 0
> > -
> > --    def test_linter_with_unpickleable_plugins_is_pickleable(self) -> =
None:
> > --        """The linter needs to be pickle-able in order to be passed b=
etween workers"""
> > --        linter =3D PyLinter(reporter=3DReporter())
> > --        # We load an extension that we know is not pickle-safe
> > --        linter.load_plugin_modules(["pylint.extensions.overlapping_ex=
ceptions"])
> > --        try:
> > --            dill.dumps(linter)
> > --            raise AssertionError(
> > --                "Plugins loaded were pickle-safe! This test needs alt=
ering"
> > --            )
> > --        except (KeyError, TypeError, PickleError, NotImplementedError=
):
> > --            pass
> > --
> > --        # And expect this call to make it pickle-able
> > --        linter.load_plugin_configuration()
> > --        try:
> > --            dill.dumps(linter)
> > --        except KeyError as exc:
> > --            raise AssertionError(
> > --                "Cannot pickle linter when using non-pickleable plugi=
n"
> > --            ) from exc
> > --
> > -     def test_worker_check_sequential_checker(self) -> None:
> > -         """Same as test_worker_check_single_file_no_checkers with Seq=
uentialTestChecker."""
> > -         linter =3D PyLinter(reporter=3DReporter())
> > ---
> > -2.40.1
> > -
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-py=
project.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-dev=
tools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-dependenc=
ies.patch
> > deleted file mode 100644
> > index 7950e72077..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproject=
.toml-Remove-hard-coded-dependencies.patch
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 2001
> > -From: Trevor Gamblin <tgamblin@baylibre.com>
> > -Date: Mon, 1 May 2023 11:32:24 -0400
> > -Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
> > -
> > -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ----
> > -Upstream-Status: Pending
> > -
> > - pyproject.toml | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/pyproject.toml b/pyproject.toml
> > -index bd542646b..2c0ed9485 100644
> > ---- a/pyproject.toml
> > -+++ b/pyproject.toml
> > -@@ -1,5 +1,5 @@
> > - [build-system]
> > --requires =3D ["setuptools~=3D62.6", "wheel~=3D0.37.1"]
> > -+requires =3D ["setuptools", "wheel"]
> > - build-backend =3D "setuptools.build_meta"
> > -
> > - [project]
> > ---
> > -2.40.0
> > -
> > diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.=
bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > similarity index 89%
> > rename from meta-python/recipes-devtools/python/python3-pylint_2.17.4.b=
b
> > rename to meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > index 96fce2e048..413e6599db 100644
> > --- a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
> > +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf75455=
0e65755c42985a5d4e9c9"
> >  SRC_URI +=3D " \
> >          git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3Dht=
tps \
> >          file://run-ptest \
> > -        file://0001-pyproject.toml-Remove-hard-coded-dependencies.patc=
h \
> > -        file://0001-pylint-remove-plugin-pickle-test.patch \
> >          "
> > -SRCREV ?=3D "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
> > +SRCREV ?=3D "4a7ad5ea9f1c5a98ccf736578a00554be0da6dc7"
> >
> >  inherit python_setuptools_build_meta ptest
> >
> > @@ -47,5 +45,6 @@ S =3D "${WORKDIR}/git"
> >  do_install_ptest() {
> >      install -d ${D}${PTEST_PATH}/tests
> >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > +    install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PT=
EST_PATH}/tests/.pylint_primer_tests/.gitkeep
> >      sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/t=
ests/data/ascript
> >  }
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105316): https://lists.openembedded.org/g/openembed=
ded-devel/message/105316
> > Mute This Topic: https://lists.openembedded.org/mt/101728502/3617261
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[danismostlikely@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

