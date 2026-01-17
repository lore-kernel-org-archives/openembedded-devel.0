Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0206BCA5FE8
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 23:14:10 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5830.1768691643440874176
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 15:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLB+o1U0;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fb5764382so32768847b3.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 15:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768691642; x=1769296442; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HcM0oedaKztxh+nY2tF688lKDs/pSZb+r9Zlt3iJwdk=;
        b=dLB+o1U06QnB6x4MfL2ol+50bm/4FYxma4g4Rl3DqQucKPMwrFl3Ip09iWZpbTOJiU
         Cd1163LMrBromYRFe5eNO6NI1EpIlQ1cLfkNUl5c9aKqHYBso3rLn5l/dvp1vxSPizyF
         yo0wRJNIjHg9IUTB4hXWnz5eOBSsXqwoiB3q97M6xIN1DcqjBxY9FTkX2QXQOhYlwD4X
         5C2udIlCeG05tkEl8aV1pdi7n9pTXCdNkgKY+tsWROwq4A4xCURiQVYX+EajCrCuWAlk
         5tQirDz3l1a6izqapvONctjMkt+y2bEZdoiKQMel5JI+SNQXUWSoA6Xj6YISX6nHDb9q
         +F5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768691642; x=1769296442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcM0oedaKztxh+nY2tF688lKDs/pSZb+r9Zlt3iJwdk=;
        b=m2zzf7u32IDfQDaF4iWBqLmryEiNhjfShls0umpvt84Y4DfVdxgZirdIRPsRXMW5vc
         vS0x2z6lD3JH/+vda5O7k2NqgmUGBT9RZ43+kQNck4IRotkyhXq+R3rBPu86UBstH8q9
         V1a44E/oRZ7wjvQh9q1V5KYpuRKvFyPs3IdiWAs6HpxlOxU9sJEpmFWmk4EzDf/RUC9x
         ws5Jt686SkP9AeBoe+hRN+5WuPZg7ABPD5xix1ChO2pU8/gAQfLj9c9uiZ/NW0qjzdys
         KmghIeQD+DNhM0ozPwMvWrTVNOeMY5wIHUKDseaKJNT0C5vy+xr6f+ma8YH+GwJXI2NI
         GEUw==
X-Gm-Message-State: AOJu0YwhgrQxVtSRx5dQLTcaQPd8qzd8QvR1o9iOooSioV0o9IonTCYK
	vV1nMMDS2Vm22pvxgzlkqnKyPKEef9QTsFD41VYAcDj3i4KLcRPwi1cUBQbalub6P9/0QONKB5S
	IiDxKt7VN3560nexZUadLVp1fCQ2ZWBc=
X-Gm-Gg: AY/fxX4EVXEmz2mh4E2D9RMEGmvfsu/Qw+jV4qvivkGoL3drO1mrbdKSh2EbYyJBuIs
	YwVZiep0I3QNKzKzzHeuRLH0aXvplSzb5FSyfnCM+BKiM6ltt8CG2xOAz8N33/1Qv5iHfvwoKCt
	gOVazvMI7b/rnJOKZrQvEJ5RF1NZ98J3sB+is5wX9gmjmN3btGEl26Xs8H51H59yCJsNnQp19Rw
	mguoWJMV946mEhmwPZeSo4pJV5COWYdTrcV5Ri9m61OmTxXDWCZuOwMNqlX2pS8WmXB9j1wkcAl
	N/Lhmp3WJ4VX/iN2xTv7ZLSZ0g+x3yqZoB9SnYtBooVI0XW0orM7j6Yp4RBlDiFpcAioXMhKOO6
	gdaWdxZexPY776JPM4vdQ9U3sCt+edKmRrtMZLQG/7LAsqA==
X-Received: by 2002:a05:690c:89:b0:792:7338:6981 with SMTP id
 00721157ae682-793c52a4a0bmr64084117b3.22.1768691642358; Sat, 17 Jan 2026
 15:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20260116153311.3444648-1-skandigraun@gmail.com> <20260116153311.3444648-3-skandigraun@gmail.com>
In-Reply-To: <20260116153311.3444648-3-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Jan 2026 15:13:36 -0800
X-Gm-Features: AZwV_QhzqswhysXMaDRFfgTl2eFypsYZcvkLOTnZS-LTjG78Y1Z7Qfhg6dQmquU
Message-ID: <CAMKF1spGqJUUakfq6r8Tr3_O7UjWZvvhCsS3OoqKDXHPSq2=Kg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-django: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000f5e5506489d9de9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 23:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123561

--0000000000000f5e5506489d9de9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

on qemuarm64 running on arm64 build host with kvm I am seeing this

AssertionError:
Failed ptests:
{'python3-django': ['Applying_admin.0001_initial..._OK',
                    'Applying_admin.0002_logentry_remove_auto_add..._OK',

'Applying_admin.0003_logentry_add_action_flag_choices..._OK',
                    'Applying_db_functions.0001_setup_extensions..._OK',
                    'Applying_db_functions.0002_create_test_models..._OK',
                    'Applying_sites.0001_initial..._OK',
                    'Applying_flatpages.0001_initial..._OK',

'Applying_migration_test_data_persistence.0001_initial..._OK',

'Applying_migration_test_data_persistence.0002_add_book..._OK',
                    'Applying_postgres_tests.0001_setup_extensions..._OK',
                    'Applying_postgres_tests.0002_create_test_models..._OK'=
,
                    'Applying_redirects.0001_initial..._OK',

'Applying_redirects.0002_alter_redirect_new_path_help_text..._OK',
                    'Applying_sites.0002_alter_domain_unique..._OK',

'PASS:_Regression_test_for_#10256..._If_there_is_a_values']}

All tests seem to pass here but it still times out perhaps ?

On Fri, Jan 16, 2026 at 7:33=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Execute the standard, non-selenium tests. The execution is
> on the slower side: on my idle machine, KVM enabled it takes
> a bit more than 2.5 minutes to execute it (executing tests with
> 4 threads parallel, 1/core, the default configuration). If the machine is
> under load, it easily grows to over 10 minutes.
>
> Added two backported patches for Django 5.2 to fix some tests that
> would otherwise fail:
>
> 0001-Fix-test_strip_tags-test.patch: tag stripping tests failed due to
> changed Python behavior
>
> 0001-fix-test_msgfmt_error_including_non_ascii-test.patch: tests were
> updated to work with msgfmt 0.25
>
> Most of the skipped tests require some specific database backend
> (Postgres, MySQL, Oracle...) or are Selenium tests.
>
> When the default parallelism is used for the execution, the package
> needs 3GB RAM at least.
>
> The output is very long (the suite contains way over 15k tests),
> so I omit the example output here.
>
> The current summary (for v5.2.9):
> Ran 18121 tests in 140.891s
> OK (skipped=3D1394, expected failures=3D5)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../images/meta-python-image-ptest.bb         |  1 +
>  .../python/python3-django.inc                 | 32 +++++++-
>  .../0001-Fix-test_strip_tags-test.patch       | 76 +++++++++++++++++++
>  ...sgfmt_error_including_non_ascii-test.patch | 71 +++++++++++++++++
>  .../python/python3-django/run-ptest           | 19 +++++
>  .../python/python3-django_5.2.9.bb            |  3 +
>  7 files changed, 202 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_ta=
gs-test.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_e=
rror_including_non_ascii-test.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/run-ptest
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index 3b21c7cfa2..d62f138798 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -129,6 +129,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>
>  PTESTS_SLOW_META_PYTHON =3D "\
>      python3-arrow \
> +    python3-django \
>      python3-ecdsa \
>      python3-fastapi \
>      python3-google-auth \
> diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb
> b/meta-python/recipes-core/images/meta-python-image-ptest.bb
> index 794b9d1e4d..c5eb0b6403 100644
> --- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
> +++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
> @@ -32,6 +32,7 @@ QB_MEM:virtclass-mcextend-python3-scrypt =3D "-m 2048"
>  # Needs atleast 5G to avoid OOMs
>  QB_MEM:virtclass-mcextend-python3-fastjsonschema =3D "-m 5120"
>  QB_MEM:virtclass-mcextend-python3-pillow =3D "-m 2048"
> +QB_MEM:virtclass-mcextend-python3-django =3D "-m 3072"
>
>  TEST_SUITES =3D "ping ssh parselogs ptest"
>
> diff --git a/meta-python/recipes-devtools/python/python3-django.inc
> b/meta-python/recipes-devtools/python/python3-django.inc
> index c6475d2079..317793abba 100644
> --- a/meta-python/recipes-devtools/python/python3-django.inc
> +++ b/meta-python/recipes-devtools/python/python3-django.inc
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Df09eb47206614a4954c51db8a94840fa"
>  PYPI_PACKAGE =3D "django"
>  UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
>
> -inherit pypi
> +inherit pypi ptest
> +
> +SRC_URI +=3D "file://run-ptest"
>
>  FILES:${PN} +=3D "${datadir}/django"
>
> @@ -31,3 +33,31 @@ RDEPENDS:${PN} +=3D "\
>  "
>
>  CVE_PRODUCT =3D "django"
> +
> +do_install_ptest(){
> +    install -d ${D}${PTEST_PATH}//docs/_ext
> +    install -m 0644 ${S}/docs/_ext/github_links.py
> ${D}${PTEST_PATH}/docs/_ext
> +
> +    cp -r ${S}/tests ${D}${PTEST_PATH}
> +    sed -i 's,/usr/bin/env python,/usr/bin/env python3,'
> ${D}${PTEST_PATH}/tests/runtests.py
> +    ln -sr ${D}${libdir}/python3.*/site-packages/django
> ${D}${PTEST_PATH}/django
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +    gettext \
> +    python3-asgiref \
> +    python3-bcrypt \
> +    python3-compile \
> +    python3-docutils \
> +    python3-fcntl \
> +    python3-jinja2 \
> +    python3-misc \
> +    python3-numpy \
> +    python3-pillow \
> +    python3-pyyaml \
> +    python3-sqlite3 \
> +    python3-statistics \
> +    python3-tblib \
> +    python3-zoneinfo \
> +    tzdata \
> +"
> diff --git
> a/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_=
tags-test.patch
> b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_=
tags-test.patch
> new file mode 100644
> index 0000000000..f77c3b963a
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_=
tags-test.patch
> @@ -0,0 +1,76 @@
> +From 7b80b2186300620931009fd62c2969f108fe7a62 Mon Sep 17 00:00:00 2001
> +From: Jacob Walls <jacobtylerwalls@gmail.com>
> +Date: Thu, 11 Dec 2025 08:44:19 -0500
> +Subject: [PATCH] Refs #36499 -- Adjusted test_strip_tags following Pytho=
n
> + behavior change for incomplete entities.
> +
> +Upstream-Status: Backport [
> https://github.com/django/django/commit/7b80b2186300620931009fd62c2969f10=
8fe7a62
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + tests/utils_tests/test_html.py | 25 ++++++++++++++++++++-----
> + 1 file changed, 20 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/utils_tests/test_html.py
> b/tests/utils_tests/test_html.py
> +index 7412c2624c73..ee115aaf1cf2 100644
> +--- a/tests/utils_tests/test_html.py
> ++++ b/tests/utils_tests/test_html.py
> +@@ -1,3 +1,4 @@
> ++import math
> + import os
> + import sys
> + from datetime import datetime
> +@@ -124,7 +125,7 @@
> +         # old and new results. The check below is temporary until all
> supported
> +         # Python versions and CI workers include the fix. See:
> +         # https://github.com/python/cpython/commit/6eb6c5db
> +-        min_fixed =3D {
> ++        min_fixed_security =3D {
> +             (3, 14): (3, 14),
> +             (3, 13): (3, 13, 6),
> +             (3, 12): (3, 12, 12),
> +@@ -132,7 +133,21 @@
> +             (3, 10): (3, 10, 19),
> +             (3, 9): (3, 9, 24),
> +         }
> +-        htmlparser_fixed =3D sys.version_info >=3D
> min_fixed[sys.version_info[:2]]
> ++        # Similarly, there was a fix for terminating incomplete
> entities. See:
> ++        # https://github.com/python/cpython/commit/95296a9d
> ++        min_fixed_incomplete_entities =3D {
> ++            (3, 14): (3, 14, 1),
> ++            (3, 13): (3, 13, 10),
> ++            (3, 12): (3, 12, math.inf),  # not fixed in 3.12.
> ++        }
> ++        major_version =3D sys.version_info[:2]
> ++        htmlparser_fixed_security =3D sys.version_info >=3D
> min_fixed_security.get(
> ++            major_version, major_version
> ++        )
> ++        htmlparser_fixed_incomplete_entities =3D (
> ++            sys.version_info
> ++            >=3D min_fixed_incomplete_entities.get(major_version,
> major_version)
> ++        )
> +         items =3D (
> +             (
> +                 "<p>See: &#39;&eacute; is an apostrophe followed by e
> acute</p>",
> +@@ -159,16 +174,19 @@
> +             # https://bugs.python.org/issue20288
> +             ("&gotcha&#;<>", "&gotcha&#;<>"),
> +             ("<sc<!-- -->ript>test<<!-- -->/script>", "ript>test"),
> +-            ("<script>alert()</script>&h", "alert()h"),
> ++            (
> ++                "<script>alert()</script>&h",
> ++                "alert()&h;" if htmlparser_fixed_incomplete_entities
> else "alert()h",
> ++            ),
> +             (
> +                 "><!" + ("&" * 16000) + "D",
> +-                ">" if htmlparser_fixed else "><!" + ("&" * 16000) + "D=
",
> ++                ">" if htmlparser_fixed_security else "><!" + ("&" *
> 16000) + "D",
> +             ),
> +             ("X<<<<br>br>br>br>X", "XX"),
> +             ("<" * 50 + "a>" * 50, ""),
> +             (
> +                 ">" + "<a" * 500 + "a",
> +-                ">" if htmlparser_fixed else ">" + "<a" * 500 + "a",
> ++                ">" if htmlparser_fixed_security else ">" + "<a" * 500 =
+
> "a",
> +             ),
> +             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
> +             ("<" + "a" * 1_002, "<" + "a" * 1_002),
> diff --git
> a/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt=
_error_including_non_ascii-test.patch
> b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt=
_error_including_non_ascii-test.patch
> new file mode 100644
> index 0000000000..6f887b3015
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt=
_error_including_non_ascii-test.patch
> @@ -0,0 +1,71 @@
> +From 1960ecd879ce351226b36e7ac0aa25616241b6f6 Mon Sep 17 00:00:00 2001
> +From: Jericho Serrano <118679068+jericho1050@users.noreply.github.com>
> +Date: Fri, 6 Jun 2025 04:58:29 +0800
> +Subject: [PATCH] Fixed #36421 -- Made
> test_msgfmt_error_including_non_ascii
> + compatible with msgfmt 0.25.
> +
> +Upstream-Status: Backport [
> https://github.com/django/django/commit/1960ecd879ce351226b36e7ac0aa25616=
241b6f6
> ]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + tests/i18n/test_compilation.py | 25 +++++++++++++++++++++++--
> + 1 file changed, 23 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/i18n/test_compilation.py
> b/tests/i18n/test_compilation.py
> +index 4b0bb9f6bb16..3a57dbf0765f 100644
> +--- a/tests/i18n/test_compilation.py
> ++++ b/tests/i18n/test_compilation.py
> +@@ -1,5 +1,6 @@
> + import gettext as gettext_module
> + import os
> ++import re
> + import stat
> + import unittest
> + from io import StringIO
> +@@ -8,10 +9,12 @@
> + from unittest import mock
> +
> + from django.core.management import CommandError, call_command,
> execute_from_command_line
> +-from django.core.management.utils import find_command
> ++from django.core.management.utils import find_command, popen_wrapper
> + from django.test import SimpleTestCase, override_settings
> + from django.test.utils import captured_stderr, captured_stdout
> + from django.utils import translation
> ++from django.utils.encoding import DEFAULT_LOCALE_ENCODING
> ++from django.utils.functional import cached_property
> + from django.utils.translation import gettext
> +
> + from .utils import RunInTmpDirMixin, copytree
> +@@ -254,6 +257,17 @@ def test_no_dirs_accidentally_skipped(self):
> +
> +
> + class CompilationErrorHandling(MessageCompilationTests):
> ++    @cached_property
> ++    def msgfmt_version(self):
> ++        # Note that msgfmt is installed via GNU gettext tools, hence th=
e
> msgfmt
> ++        # version should align to gettext.
> ++        out, err, status =3D popen_wrapper(
> ++            ["msgfmt", "--version"],
> ++            stdout_encoding=3DDEFAULT_LOCALE_ENCODING,
> ++        )
> ++        m =3D re.search(r"(\d+)\.(\d+)\.?(\d+)?", out)
> ++        return tuple(int(d) for d in m.groups() if d is not None)
> ++
> +     def test_error_reported_by_msgfmt(self):
> +         # po file contains wrong po formatting.
> +         with self.assertRaises(CommandError):
> +@@ -278,7 +292,14 @@ def test_msgfmt_error_including_non_ascii(self):
> +                 call_command(
> +                     "compilemessages", locale=3D["ko"], stdout=3DString=
IO(),
> stderr=3Dstderr
> +                 )
> +-            self.assertIn("' cannot start a field name",
> stderr.getvalue())
> ++            if self.msgfmt_version < (0, 25):
> ++                error_msg =3D "' cannot start a field name"
> ++            else:
> ++                error_msg =3D (
> ++                    "a field name starts with a character that is not
> alphanumerical "
> ++                    "or underscore"
> ++                )
> ++            self.assertIn(error_msg, stderr.getvalue())
> +
> +
> + class ProjectAndAppTests(MessageCompilationTests):
> diff --git a/meta-python/recipes-devtools/python/python3-django/run-ptest
> b/meta-python/recipes-devtools/python/python3-django/run-ptest
> new file mode 100644
> index 0000000000..dd257cc843
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django/run-ptest
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +useradd tester || echo test user exists already
> +
> +# We need $(pwd), because some tests import modules from the actual test=
s
> folder
> +# Also, there is one module in the docs/_ext folder that is imported, an=
d
> that
> +# module accesses other modules by a relative path to itself.
> +export PYTHONPATH=3D$(pwd):$(pwd)/docs/_ext:$PYTHONPATH
> +
> +cd tests
> +
> +su tester -c "./runtests.py --noinput -v 2" 2>&1 | \
> +     tee ../testoutput.log | \
> +     sed -e '/\.\.\. ok/ s/^/PASS: /g' \
> +         -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' \
> +         -e '/\.\.\. skipped/ s/^/SKIP: /g' \
> +         -e 's/ \.\.\. ok//g' \
> +         -e 's/ \.\.\. ERROR//g' \
> +         -e 's/ \.\.\. FAIL//g' \
> +         -e 's/ \.\.\. skipped//g'
> diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
> b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
> index c0aff44a78..fa9fb2e929 100644
> --- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
> @@ -1,6 +1,9 @@
>  require python3-django.inc
>  inherit python_setuptools_build_meta
>
> +SRC_URI +=3D
> "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
> +            file://0001-Fix-test_strip_tags-test.patch \
> +"
>  SRC_URI[sha256sum] =3D
> "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
>
>  RDEPENDS:${PN} +=3D "\
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123534):
> https://lists.openembedded.org/g/openembedded-devel/message/123534
> Mute This Topic: https://lists.openembedded.org/mt/117299234/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000f5e5506489d9de9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">on qemuarm64 running on arm64 build host with kvm I am see=
ing this<div><br></div><div>AssertionError: <br>Failed ptests:<br>{&#39;pyt=
hon3-django&#39;: [&#39;Applying_admin.0001_initial..._OK&#39;,<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applyin=
g_admin.0002_logentry_remove_auto_add..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_admin.0003_l=
ogentry_add_action_flag_choices..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_db_functions.0001_s=
etup_extensions..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_db_functions.0002_create_test_mod=
els..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;Applying_sites.0001_initial..._OK&#39;,<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_flat=
pages.0001_initial..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_migration_test_data_persistence.=
0001_initial..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_migration_test_data_persistence.0002=
_add_book..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Applying_postgres_tests.0001_setup_extensions..._=
OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;Applying_postgres_tests.0002_create_test_models..._OK&#39;,<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
Applying_redirects.0001_initial..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_redirects.0002_alte=
r_redirect_new_path_help_text..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;Applying_sites.0002_alter_do=
main_unique..._OK&#39;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &#39;PASS:_Regression_test_for_#10256..._If_there_is_=
a_values&#39;]}<br><br></div><div>All tests seem to pass here but it still =
times out perhaps ?</div></div><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 16, 2026 at 7:33=
=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@list=
s.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Execute the standard, n=
on-selenium tests. The execution is<br>
on the slower side: on my idle machine, KVM enabled it takes<br>
a bit more than 2.5 minutes to execute it (executing tests with<br>
4 threads parallel, 1/core, the default configuration). If the machine is<b=
r>
under load, it easily grows to over 10 minutes.<br>
<br>
Added two backported patches for Django 5.2 to fix some tests that<br>
would otherwise fail:<br>
<br>
0001-Fix-test_strip_tags-test.patch: tag stripping tests failed due to<br>
changed Python behavior<br>
<br>
0001-fix-test_msgfmt_error_including_non_ascii-test.patch: tests were<br>
updated to work with msgfmt 0.25<br>
<br>
Most of the skipped tests require some specific database backend<br>
(Postgres, MySQL, Oracle...) or are Selenium tests.<br>
<br>
When the default parallelism is used for the execution, the package<br>
needs 3GB RAM at least.<br>
<br>
The output is very long (the suite contains way over 15k tests),<br>
so I omit the example output here.<br>
<br>
The current summary (for v5.2.9):<br>
Ran 18121 tests in 140.891s<br>
OK (skipped=3D1394, expected failures=3D5)<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../images/<a href=3D"http://meta-python-image-ptest.bb" rel=3D"noref=
errer" target=3D"_blank">meta-python-image-ptest.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../python/python3-django.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 32 +++++++-<br>
=C2=A0.../0001-Fix-test_strip_tags-test.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7=
6 +++++++++++++++++++<br>
=C2=A0...sgfmt_error_including_non_ascii-test.patch | 71 +++++++++++++++++<=
br>
=C2=A0.../python/python3-django/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 19 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-django_5.2.9.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-django_5.2.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
=C2=A07 files changed, 202 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fix-test_strip_tags-test.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-fix-test_msgfmt_error_including_non_ascii-test.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/run-ptest<br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index 3b21c7cfa2..d62f138798 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -129,6 +129,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
<br>
=C2=A0PTESTS_SLOW_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-arrow \<br>
+=C2=A0 =C2=A0 python3-django \<br>
=C2=A0 =C2=A0 =C2=A0python3-ecdsa \<br>
=C2=A0 =C2=A0 =C2=A0python3-fastapi \<br>
=C2=A0 =C2=A0 =C2=A0python3-google-auth \<br>
diff --git a/meta-python/recipes-core/images/<a href=3D"http://meta-python-=
image-ptest.bb" rel=3D"noreferrer" target=3D"_blank">meta-python-image-ptes=
t.bb</a> b/meta-python/recipes-core/images/<a href=3D"http://meta-python-im=
age-ptest.bb" rel=3D"noreferrer" target=3D"_blank">meta-python-image-ptest.=
bb</a><br>
index 794b9d1e4d..c5eb0b6403 100644<br>
--- a/meta-python/recipes-core/images/<a href=3D"http://meta-python-image-p=
test.bb" rel=3D"noreferrer" target=3D"_blank">meta-python-image-ptest.bb</a=
><br>
+++ b/meta-python/recipes-core/images/<a href=3D"http://meta-python-image-p=
test.bb" rel=3D"noreferrer" target=3D"_blank">meta-python-image-ptest.bb</a=
><br>
@@ -32,6 +32,7 @@ QB_MEM:virtclass-mcextend-python3-scrypt =3D &quot;-m 204=
8&quot;<br>
=C2=A0# Needs atleast 5G to avoid OOMs<br>
=C2=A0QB_MEM:virtclass-mcextend-python3-fastjsonschema =3D &quot;-m 5120&qu=
ot;<br>
=C2=A0QB_MEM:virtclass-mcextend-python3-pillow =3D &quot;-m 2048&quot;<br>
+QB_MEM:virtclass-mcextend-python3-django =3D &quot;-m 3072&quot;<br>
<br>
=C2=A0TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-=
python/recipes-devtools/python/python3-django.inc<br>
index c6475d2079..317793abba 100644<br>
--- a/meta-python/recipes-devtools/python/python3-django.inc<br>
+++ b/meta-python/recipes-devtools/python/python3-django.inc<br>
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df09eb472066=
14a4954c51db8a94840fa&quot;<br>
=C2=A0PYPI_PACKAGE =3D &quot;django&quot;<br>
=C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;${PYPI_PACKAGE}&quot;<br>
<br>
-inherit pypi<br>
+inherit pypi ptest<br>
+<br>
+SRC_URI +=3D &quot;file://run-ptest&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${datadir}/django&quot;<br>
<br>
@@ -31,3 +33,31 @@ RDEPENDS:${PN} +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;django&quot;<br>
+<br>
+do_install_ptest(){<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}//docs/_ext<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/docs/_ext/github_links.py ${D}${PTEST_P=
ATH}/docs/_ext<br>
+<br>
+=C2=A0 =C2=A0 cp -r ${S}/tests ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/env python,/usr/bin/env python3,&#39;=
 ${D}${PTEST_PATH}/tests/runtests.py<br>
+=C2=A0 =C2=A0 ln -sr ${D}${libdir}/python3.*/site-packages/django ${D}${PT=
EST_PATH}/django<br>
+}<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 gettext \<br>
+=C2=A0 =C2=A0 python3-asgiref \<br>
+=C2=A0 =C2=A0 python3-bcrypt \<br>
+=C2=A0 =C2=A0 python3-compile \<br>
+=C2=A0 =C2=A0 python3-docutils \<br>
+=C2=A0 =C2=A0 python3-fcntl \<br>
+=C2=A0 =C2=A0 python3-jinja2 \<br>
+=C2=A0 =C2=A0 python3-misc \<br>
+=C2=A0 =C2=A0 python3-numpy \<br>
+=C2=A0 =C2=A0 python3-pillow \<br>
+=C2=A0 =C2=A0 python3-pyyaml \<br>
+=C2=A0 =C2=A0 python3-sqlite3 \<br>
+=C2=A0 =C2=A0 python3-statistics \<br>
+=C2=A0 =C2=A0 python3-tblib \<br>
+=C2=A0 =C2=A0 python3-zoneinfo \<br>
+=C2=A0 =C2=A0 tzdata \<br>
+&quot;<br>
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fix-te=
st_strip_tags-test.patch b/meta-python/recipes-devtools/python/python3-djan=
go/0001-Fix-test_strip_tags-test.patch<br>
new file mode 100644<br>
index 0000000000..f77c3b963a<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_stri=
p_tags-test.patch<br>
@@ -0,0 +1,76 @@<br>
+From 7b80b2186300620931009fd62c2969f108fe7a62 Mon Sep 17 00:00:00 2001<br>
+From: Jacob Walls &lt;<a href=3D"mailto:jacobtylerwalls@gmail.com" target=
=3D"_blank">jacobtylerwalls@gmail.com</a>&gt;<br>
+Date: Thu, 11 Dec 2025 08:44:19 -0500<br>
+Subject: [PATCH] Refs #36499 -- Adjusted test_strip_tags following Python<=
br>
+ behavior change for incomplete entities.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/django/django/com=
mit/7b80b2186300620931009fd62c2969f108fe7a62" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/django/django/commit/7b80b2186300620931009fd62c2=
969f108fe7a62</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ tests/utils_tests/test_html.py | 25 ++++++++++++++++++++-----<br>
+ 1 file changed, 20 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.=
py<br>
+index 7412c2624c73..ee115aaf1cf2 100644<br>
+--- a/tests/utils_tests/test_html.py<br>
++++ b/tests/utils_tests/test_html.py<br>
+@@ -1,3 +1,4 @@<br>
++import math<br>
+ import os<br>
+ import sys<br>
+ from datetime import datetime<br>
+@@ -124,7 +125,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# old and new results. The check below i=
s temporary until all supported<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Python versions and CI workers include=
 the fix. See:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://github.com/python/c=
python/commit/6eb6c5db" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/python/cpython/commit/6eb6c5db</a><br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 min_fixed =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 min_fixed_security =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3, 14): (3, 14),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3, 13): (3, 13, 6),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3, 12): (3, 12, 12),<br>
+@@ -132,7 +133,21 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3, 10): (3, 10, 19),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(3, 9): (3, 9, 24),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 htmlparser_fixed =3D sys.version_info &gt;=3D=
 min_fixed[sys.version_info[:2]]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Similarly, there was a fix for terminating =
incomplete entities. See:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://github.com/python/cpytho=
n/commit/95296a9d" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
python/cpython/commit/95296a9d</a><br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 min_fixed_incomplete_entities =3D {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (3, 14): (3, 14, 1),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (3, 13): (3, 13, 10),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (3, 12): (3, 12, math.inf),=C2=
=A0 # not fixed in 3.12.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 major_version =3D sys.version_info[:2]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 htmlparser_fixed_security =3D sys.version_inf=
o &gt;=3D min_fixed_security.get(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 major_version, major_version<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 htmlparser_fixed_incomplete_entities =3D (<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys.version_info<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=3D min_fixed_incomplete_en=
tities.get(major_version, major_version)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0items =3D (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&lt;p&=
gt;See: &amp;#39;&amp;eacute; is an apostrophe followed by e acute&lt;/p&gt=
;&quot;,<br>
+@@ -159,16 +174,19 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://bugs.=
python.org/issue20288" rel=3D"noreferrer" target=3D"_blank">https://bugs.py=
thon.org/issue20288</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;&amp;gotcha&amp;#;&=
lt;&gt;&quot;, &quot;&amp;gotcha&amp;#;&lt;&gt;&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;&lt;sc&lt;!-- --&gt=
;ript&gt;test&lt;&lt;!-- --&gt;/script&gt;&quot;, &quot;ript&gt;test&quot;)=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;&lt;script&gt;alert()&lt=
;/script&gt;&amp;h&quot;, &quot;alert()h&quot;),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;script&=
gt;alert()&lt;/script&gt;&amp;h&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;alert()&amp=
;h;&quot; if htmlparser_fixed_incomplete_entities else &quot;alert()h&quot;=
,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&gt;&l=
t;!&quot; + (&quot;&amp;&quot; * 16000) + &quot;D&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;&quot; =
if htmlparser_fixed else &quot;&gt;&lt;!&quot; + (&quot;&amp;&quot; * 16000=
) + &quot;D&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;&quot; =
if htmlparser_fixed_security else &quot;&gt;&lt;!&quot; + (&quot;&amp;&quot=
; * 16000) + &quot;D&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;X&lt;&lt;&lt;&lt;br=
&gt;br&gt;br&gt;br&gt;X&quot;, &quot;XX&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;&lt;&quot; * 50 + &=
quot;a&gt;&quot; * 50, &quot;&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&gt;&q=
uot; + &quot;&lt;a&quot; * 500 + &quot;a&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;&quot; =
if htmlparser_fixed else &quot;&gt;&quot; + &quot;&lt;a&quot; * 500 + &quot=
;a&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&gt;&quot; =
if htmlparser_fixed_security else &quot;&gt;&quot; + &quot;&lt;a&quot; * 50=
0 + &quot;a&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;&lt;a&quot; * 49 + =
&quot;a&quot; * 951, &quot;&lt;a&quot; * 49 + &quot;a&quot; * 951),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;&lt;&quot; + &quot;=
a&quot; * 1_002, &quot;&lt;&quot; + &quot;a&quot; * 1_002),<br>
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-fix-te=
st_msgfmt_error_including_non_ascii-test.patch b/meta-python/recipes-devtoo=
ls/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-tes=
t.patch<br>
new file mode 100644<br>
index 0000000000..6f887b3015<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgf=
mt_error_including_non_ascii-test.patch<br>
@@ -0,0 +1,71 @@<br>
+From 1960ecd879ce351226b36e7ac0aa25616241b6f6 Mon Sep 17 00:00:00 2001<br>
+From: Jericho Serrano &lt;<a href=3D"mailto:118679068%2Bjericho1050@users.=
noreply.github.com" target=3D"_blank">118679068+jericho1050@users.noreply.g=
ithub.com</a>&gt;<br>
+Date: Fri, 6 Jun 2025 04:58:29 +0800<br>
+Subject: [PATCH] Fixed #36421 -- Made test_msgfmt_error_including_non_asci=
i<br>
+ compatible with msgfmt 0.25.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/django/django/com=
mit/1960ecd879ce351226b36e7ac0aa25616241b6f6" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/django/django/commit/1960ecd879ce351226b36e7ac0a=
a25616241b6f6</a>]<br>
+Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
+---<br>
+ tests/i18n/test_compilation.py | 25 +++++++++++++++++++++++--<br>
+ 1 file changed, 23 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/i18n/test_compilation.py b/tests/i18n/test_compilation.=
py<br>
+index 4b0bb9f6bb16..3a57dbf0765f 100644<br>
+--- a/tests/i18n/test_compilation.py<br>
++++ b/tests/i18n/test_compilation.py<br>
+@@ -1,5 +1,6 @@<br>
+ import gettext as gettext_module<br>
+ import os<br>
++import re<br>
+ import stat<br>
+ import unittest<br>
+ from io import StringIO<br>
+@@ -8,10 +9,12 @@<br>
+ from unittest import mock<br>
+ <br>
+ from django.core.management import CommandError, call_command, execute_fr=
om_command_line<br>
+-from django.core.management.utils import find_command<br>
++from django.core.management.utils import find_command, popen_wrapper<br>
+ from django.test import SimpleTestCase, override_settings<br>
+ from django.test.utils import captured_stderr, captured_stdout<br>
+ from django.utils import translation<br>
++from django.utils.encoding import DEFAULT_LOCALE_ENCODING<br>
++from django.utils.functional import cached_property<br>
+ from django.utils.translation import gettext<br>
+ <br>
+ from .utils import RunInTmpDirMixin, copytree<br>
+@@ -254,6 +257,17 @@ def test_no_dirs_accidentally_skipped(self):<br>
+ <br>
+ <br>
+ class CompilationErrorHandling(MessageCompilationTests):<br>
++=C2=A0 =C2=A0 @cached_property<br>
++=C2=A0 =C2=A0 def msgfmt_version(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Note that msgfmt is installed via GNU gette=
xt tools, hence the msgfmt<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # version should align to gettext.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err, status =3D popen_wrapper(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&quot;msgfmt&quot;, &quot;--ve=
rsion&quot;],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout_encoding=3DDEFAULT_LOCAL=
E_ENCODING,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.search(r&quot;(\d+)\.(\d+)\.?(\d+)?&=
quot;, out)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return tuple(int(d) for d in m.groups() if d =
is not None)<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0def test_error_reported_by_msgfmt(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# po file contains wrong po formatting.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(CommandError):<br=
>
+@@ -278,7 +292,14 @@ def test_msgfmt_error_including_non_ascii(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call_command=
(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;compilemessages&quot;, locale=3D[&quot;ko&quot;], stdout=3DStringI=
O(), stderr=3Dstderr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(&quot;&#39; canno=
t start a field name&quot;, stderr.getvalue())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.msgfmt_version &lt; (0,=
 25):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D &qu=
ot;&#39; cannot start a field name&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D (<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;a field name starts with a character that is not alphanumerical &quot;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;or underscore&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(error_msg, stderr=
.getvalue())<br>
+ <br>
+ <br>
+ class ProjectAndAppTests(MessageCompilationTests):<br>
diff --git a/meta-python/recipes-devtools/python/python3-django/run-ptest b=
/meta-python/recipes-devtools/python/python3-django/run-ptest<br>
new file mode 100644<br>
index 0000000000..dd257cc843<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-django/run-ptest<br>
@@ -0,0 +1,19 @@<br>
+#!/bin/sh<br>
+useradd tester || echo test user exists already<br>
+<br>
+# We need $(pwd), because some tests import modules from the actual tests =
folder<br>
+# Also, there is one module in the docs/_ext folder that is imported, and =
that<br>
+# module accesses other modules by a relative path to itself.<br>
+export PYTHONPATH=3D$(pwd):$(pwd)/docs/_ext:$PYTHONPATH<br>
+<br>
+cd tests<br>
+<br>
+su tester -c &quot;./runtests.py --noinput -v 2&quot; 2&gt;&amp;1 | \<br>
+=C2=A0 =C2=A0 =C2=A0tee ../testoutput.log | \<br>
+=C2=A0 =C2=A0 =C2=A0sed -e &#39;/\.\.\. ok/ s/^/PASS: /g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/\.\.\. [ERROR|FAIL]/ s/^/FAIL: =
/g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;/\.\.\. skipped/ s/^/SKIP: /g&#3=
9; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/ \.\.\. ok//g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/ \.\.\. ERROR//g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/ \.\.\. FAIL//g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s/ \.\.\. skipped//g&#39;<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
django_5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9.=
bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-djan=
go_5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9.bb</=
a><br>
index c0aff44a78..fa9fb2e929 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9.bb</a><=
br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-django_=
5.2.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.9.bb</a><=
br>
@@ -1,6 +1,9 @@<br>
=C2=A0require python3-django.inc<br>
=C2=A0inherit python_setuptools_build_meta<br>
<br>
+SRC_URI +=3D &quot;file://0001-fix-test_msgfmt_error_including_non_ascii-t=
est.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-test_strip_tags-=
test.patch \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;16b5ccfc5e8c27e6c0561af551d2ea32852d7352=
c67d452ae3e76b4f6b2ca495&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;\<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123534): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123534" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123534</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117299234/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117299234/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000f5e5506489d9de9--

