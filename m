Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F28CD8CB6
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 19:49:33 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web11.3795.1696967366216927778
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 12:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsnuvPvW;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: danismostlikely@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d9a398f411fso2072746276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696967365; x=1697572165; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuIsEJbDfnwtJQZM9/WrQepNlNg9BOqGfGGKDEi8+tU=;
        b=YsnuvPvWPGze8hMUUNgZ1TJ+fonT3Ne76tbxjRD4mIk9CGl1LHJqsdi5YSuGqfXq+3
         n1PJ7/geJSB6EAMVyjYUWzBtnxatFn5XV443XwSNfEeGuR1dS9A79j/GS3M6Pl6MRi58
         1919l7n82/AzEQfWMq6W+KLxzgnta1dqoe2wb9QF2LU1a0mCYFV/2W/MJ5C8ObD9t6Q0
         Xul9bLLPBzsygPLH1sMes0ZkRhwXIFWbbnsInst4samKuD1M2Bz0ux0H2/EGd3EYzXCK
         hY7DcKzkViZfaX9euN8FPxRRIPSSPIKpapjdNkcv5fSI9QEq6bzalLHcgrBcRMyK+IZv
         qUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696967365; x=1697572165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuIsEJbDfnwtJQZM9/WrQepNlNg9BOqGfGGKDEi8+tU=;
        b=GIJEvJ+BlbKcnnGa2rxe9zCwE0HkTCC5SbzjUzv1YeCG+8wKrCMuVa5Z9xSGQgQtcy
         iII08OLFTPNtVJH6zHZEjezrXObxaBkL69v7kYWJT+KX4tCEZxQKtDgEEFDGd0mVKTVw
         yCTZr4AGhXfbU9h+AMHDUncCpGCKgaDFNv95m5KHeS0IwZo+MWgPdNSnyPMTszn3DCic
         TPe5hlPz7Y4zB2k2JJ4+UWDpPj6eRceGqYIE8Ri6qFxklrSW322JsjyW788uSEVQ2kn3
         Hwc+GZbsa1+wtneeDXyvuprMgY0MJ+7chmyY00Y6UxV1WwA81xmijzzMKjT3IL57/U9O
         J0pA==
X-Gm-Message-State: AOJu0YzUweAA/Q9prpYNtnRJB20CggIh2Rkmq2ggbTmg9b+WbmldOReq
	28OQEMIGIX05bLgEwx8yi9hp2TFMhvR09MjsAtc=
X-Google-Smtp-Source: AGHT+IE25y/1b62A6ICUcow7NNkekVJU6I4OimsQobluL3TL3qs+LSNP7g8HPVHnm7B0tmB/WG6FFYsBZX1wAD3+qGU=
X-Received: by 2002:a25:4d55:0:b0:d84:da24:96de with SMTP id
 a82-20020a254d55000000b00d84da2496demr16248233ybb.33.1696967365232; Tue, 10
 Oct 2023 12:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231003042313.1153843-1-raj.khem@gmail.com> <20231003042313.1153843-3-raj.khem@gmail.com>
 <CACS+7ZRLbXSGrz75AdYYm7+kJU+7TiFokXHkXWC6Q5xxLaDwqg@mail.gmail.com> <CAMKF1sqUkDpqKCgHUP2oq=TVBKMFfoVsywrX=z3GszqGV71rZw@mail.gmail.com>
In-Reply-To: <CAMKF1sqUkDpqKCgHUP2oq=TVBKMFfoVsywrX=z3GszqGV71rZw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 10 Oct 2023 13:49:14 -0600
Message-ID: <CACS+7ZRGA6gU6sZ7NKE0sfN+dHE2R8DEFCFALjoma82cXjQ4uA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pylint: Upgrade to 3.0.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 19:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105417

On Tue, 10 Oct 2023 at 12:59, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 10, 2023 at 11:35=E2=80=AFAM Dan McGregor <danismostlikely@gm=
ail.com> wrote:
> >
> > I think these changes should be cherry-picked to nanbield. It's got
> > the update for astroid to v3.0.0, and that breaks pylint on that
> > branch.
> >
>
> yes Armin is working on syncing nanbield to latest master.
> have you tried nanbield-next ?

Not yet. I've been testing against nanbield. But so far nanbield-next
lacks pylint 3. If I revert the astroids change it works as expected,
though.

>
> > On Mon, 2 Oct 2023 at 22:23, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Package additional hidden files for ptests (test_primer.py)
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...001-pylint-remove-plugin-pickle-test.patch | 53 -----------------=
--
> > >  ....toml-Remove-hard-coded-dependencies.patch | 26 ---------
> > >  ...lint_2.17.4.bb =3D> python3-pylint_3.0.0.bb} |  5 +-
> > >  3 files changed, 2 insertions(+), 82 deletions(-)
> > >  delete mode 100644 meta-python/recipes-devtools/python/python3-pylin=
t/0001-pylint-remove-plugin-pickle-test.patch
> > >  delete mode 100644 meta-python/recipes-devtools/python/python3-pylin=
t/0001-pyproject.toml-Remove-hard-coded-dependencies.patch
> > >  rename meta-python/recipes-devtools/python/{python3-pylint_2.17.4.bb=
 =3D> python3-pylint_3.0.0.bb} (89%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-=
pylint-remove-plugin-pickle-test.patch b/meta-python/recipes-devtools/pytho=
n/python3-pylint/0001-pylint-remove-plugin-pickle-test.patch
> > > deleted file mode 100644
> > > index a7637a5ca6..0000000000
> > > --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pylint-=
remove-plugin-pickle-test.patch
> > > +++ /dev/null
> > > @@ -1,53 +0,0 @@
> > > -From 341e19dd69d847f84859e85cabff5846e7da24c4 Mon Sep 17 00:00:00 20=
01
> > > -From: Trevor Gamblin <tgamblin@baylibre.com>
> > > -Date: Mon, 15 May 2023 09:26:04 -0400
> > > -Subject: [PATCH] pylint: remove plugin pickle test
> > > -
> > > -Upstream-Status: Inappropriate (oe-specific)
> > > -
> > > -Upstream uses an assertion in the removed test to state that the tes=
t
> > > -needs changing if the plugin loading succeeds. The same failure wasn=
't
> > > -seen when running the tests on the host with pytest, so disable it b=
y
> > > -removing the test from the suite.
> > > -
> > > -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ----
> > > - tests/test_check_parallel.py | 22 ----------------------
> > > - 1 file changed, 22 deletions(-)
> > > -
> > > -diff --git a/tests/test_check_parallel.py b/tests/test_check_paralle=
l.py
> > > -index d56502eaf..34fec140f 100644
> > > ---- a/tests/test_check_parallel.py
> > > -+++ b/tests/test_check_parallel.py
> > > -@@ -257,28 +257,6 @@ class TestCheckParallelFramework:
> > > -         assert stats.statement =3D=3D 18
> > > -         assert stats.warning =3D=3D 0
> > > -
> > > --    def test_linter_with_unpickleable_plugins_is_pickleable(self) -=
> None:
> > > --        """The linter needs to be pickle-able in order to be passed=
 between workers"""
> > > --        linter =3D PyLinter(reporter=3DReporter())
> > > --        # We load an extension that we know is not pickle-safe
> > > --        linter.load_plugin_modules(["pylint.extensions.overlapping_=
exceptions"])
> > > --        try:
> > > --            dill.dumps(linter)
> > > --            raise AssertionError(
> > > --                "Plugins loaded were pickle-safe! This test needs a=
ltering"
> > > --            )
> > > --        except (KeyError, TypeError, PickleError, NotImplementedErr=
or):
> > > --            pass
> > > --
> > > --        # And expect this call to make it pickle-able
> > > --        linter.load_plugin_configuration()
> > > --        try:
> > > --            dill.dumps(linter)
> > > --        except KeyError as exc:
> > > --            raise AssertionError(
> > > --                "Cannot pickle linter when using non-pickleable plu=
gin"
> > > --            ) from exc
> > > --
> > > -     def test_worker_check_sequential_checker(self) -> None:
> > > -         """Same as test_worker_check_single_file_no_checkers with S=
equentialTestChecker."""
> > > -         linter =3D PyLinter(reporter=3DReporter())
> > > ---
> > > -2.40.1
> > > -
> > > diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-=
pyproject.toml-Remove-hard-coded-dependencies.patch b/meta-python/recipes-d=
evtools/python/python3-pylint/0001-pyproject.toml-Remove-hard-coded-depende=
ncies.patch
> > > deleted file mode 100644
> > > index 7950e72077..0000000000
> > > --- a/meta-python/recipes-devtools/python/python3-pylint/0001-pyproje=
ct.toml-Remove-hard-coded-dependencies.patch
> > > +++ /dev/null
> > > @@ -1,26 +0,0 @@
> > > -From c5c415a240189ac6730ba95de0bb5883dfb53609 Mon Sep 17 00:00:00 20=
01
> > > -From: Trevor Gamblin <tgamblin@baylibre.com>
> > > -Date: Mon, 1 May 2023 11:32:24 -0400
> > > -Subject: [PATCH] pyproject.toml: Remove hard-coded dependencies
> > > -
> > > -Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > > ----
> > > -Upstream-Status: Pending
> > > -
> > > - pyproject.toml | 2 +-
> > > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > > -
> > > -diff --git a/pyproject.toml b/pyproject.toml
> > > -index bd542646b..2c0ed9485 100644
> > > ---- a/pyproject.toml
> > > -+++ b/pyproject.toml
> > > -@@ -1,5 +1,5 @@
> > > - [build-system]
> > > --requires =3D ["setuptools~=3D62.6", "wheel~=3D0.37.1"]
> > > -+requires =3D ["setuptools", "wheel"]
> > > - build-backend =3D "setuptools.build_meta"
> > > -
> > > - [project]
> > > ---
> > > -2.40.0
> > > -
> > > diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.17.=
4.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > > similarity index 89%
> > > rename from meta-python/recipes-devtools/python/python3-pylint_2.17.4=
.bb
> > > rename to meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > > index 96fce2e048..413e6599db 100644
> > > --- a/meta-python/recipes-devtools/python/python3-pylint_2.17.4.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
> > > @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754=
550e65755c42985a5d4e9c9"
> > >  SRC_URI +=3D " \
> > >          git://github.com/pylint-dev/pylint;branch=3Dmain;protocol=3D=
https \
> > >          file://run-ptest \
> > > -        file://0001-pyproject.toml-Remove-hard-coded-dependencies.pa=
tch \
> > > -        file://0001-pylint-remove-plugin-pickle-test.patch \
> > >          "
> > > -SRCREV ?=3D "fc34a4b6abe56f3ac07ca15d846b1c1955545f85"
> > > +SRCREV ?=3D "4a7ad5ea9f1c5a98ccf736578a00554be0da6dc7"
> > >
> > >  inherit python_setuptools_build_meta ptest
> > >
> > > @@ -47,5 +45,6 @@ S =3D "${WORKDIR}/git"
> > >  do_install_ptest() {
> > >      install -d ${D}${PTEST_PATH}/tests
> > >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > > +    install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${=
PTEST_PATH}/tests/.pylint_primer_tests/.gitkeep
> > >      sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}=
/tests/data/ascript
> > >  }
> > > --
> > > 2.42.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#105316): https://lists.openembedded.org/g/openemb=
edded-devel/message/105316
> > > Mute This Topic: https://lists.openembedded.org/mt/101728502/3617261
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [danismostlikely@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

