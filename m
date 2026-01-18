Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B3AC9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 07:45:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10967.1768722317558594581
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 23:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvR8wrCM;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43246af170aso1839272f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 23:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768722316; x=1769327116; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQVHBhDfk9o7COSWnL1S2R0x+dQE2qNSVqg7gKFxxOg=;
        b=HvR8wrCMLCcMNpfnQl0wJi0WsQPEJZdP4zwa6RWNzaTmqeq3T1JDb7peILjibMQn6M
         R+Ze6Ius8xw9+9sOYmJGfRI0xvSFkHIS1GIbreFW7Rbt3xIHVy8Zx9h3zkx9UOv45PJ1
         Jk2WnsaRwKBMkcjfFJPognKVYecmuEg6NlbMKOd45BtYxgXeX5Z9nkwo7siO+Sgz2WXN
         vJygzwPfAS1C3IIq68AbNLum7VrEhLivSNva26cdd2VCCQkFKIwvPwx1jamGnWUUJDLc
         AW7OArCIHJ6XoZFR7AcjxvY/ImDfpm/m3ucoLAlkr/ZiUjMFMcuuvubPmP77W7rh0xs+
         JU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768722316; x=1769327116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQVHBhDfk9o7COSWnL1S2R0x+dQE2qNSVqg7gKFxxOg=;
        b=T6jF9z7q/QhjRmvs3elBjz4q+fqiPtTBX2z+E6qogCKHa2lt83G+8gvrbci+M48b/G
         z1yY+yEX/nEYM5Z8lK77hG+Lyik9wCkxyHkpheeyu8pDknLJoijVGLrZv/sf4bxR+xi3
         NSk0Z0/0/+ugG4GugAEkvmeSYUwseECLrWnrIy8H7L54+dqqhT/4NmMQ0ydZHU37LGe0
         KA1st/6KBm7eXLzBswAi45l8uGYPKd5kBGYsDexf92NEuPMPNGwTF5RuN8FPbH+bUAnW
         e2VW3jOY3/b/zQPfQmUBi5mlDbqhMnKzv7ZljwSoUq7fqV9mQIZV6XgleRPDvS01B8JI
         sT2w==
X-Gm-Message-State: AOJu0YzKLs3lKrSeIQtMP9TCoIDDiXlHNhjHoHhjlOqgxcyhgwUQU3FE
	1rsI3Hf8+1Gb2kjEqUPxsOHvO2/DpEyIwc5504Brn+zxH0nWLdRTvj9c
X-Gm-Gg: AY/fxX5jSaE2KjHJEZxNAaQ8VAo6Ycay3cCiAQ68Jxlh8X7xaDo0AobXIMIdcf6UujM
	r3lad/2iTGY2sp/n3Qt7e0pENu99TnQEc7S+OuYY/RS1cTiK8YfyEBeQIamM9s541akt0o51nu1
	souzPCvyYSEIIzhE2DhQ32xiXRY6jEgpekxvbs51off7QEeTQO8PqinJ9kRpvMy+G2JEhLvzv7X
	U5g7IbD87o5a+8Ts9T1JtAA49FDZnx4pKI9X2lLbrcA0VQDLugYJmMaWtV9LWE1MoRFUG4es1wy
	m0cGvpBQ+RxaRswQglRAC8dg9BZHCZ9uhODXmSWuJqRlqKk7ZSox4D+G98J3+YpAJ6JYjhaoueP
	NGx1SlHMBiykPISDGpfh6t4OjfeTGmna3Ur9D7xt9w4p6EW/n4SMDXRbbEkeskKLfmPomaxIRph
	vMyj/jOR4DVVJydvWTlDY=
X-Received: by 2002:a05:6000:2c08:b0:432:84f0:9683 with SMTP id ffacd0b85a97d-434df0ed4b4mr14610708f8f.24.1768722315426;
        Sat, 17 Jan 2026 23:45:15 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm15325916f8f.29.2026.01.17.23.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 23:45:14 -0800 (PST)
Message-ID: <e4561c7c-b3ac-484f-b095-2a083b5aa407@gmail.com>
Date: Sun, 18 Jan 2026 08:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-django: add ptest support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260116153311.3444648-1-skandigraun@gmail.com>
 <20260116153311.3444648-3-skandigraun@gmail.com>
 <CAMKF1spGqJUUakfq6r8Tr3_O7UjWZvvhCsS3OoqKDXHPSq2=Kg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spGqJUUakfq6r8Tr3_O7UjWZvvhCsS3OoqKDXHPSq2=Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 07:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123568

On 1/18/26 00:13, Khem Raj wrote:
> on qemuarm64 running on arm64 build host with kvm I am seeing this
>
> AssertionError:
> Failed ptests:
> {'python3-django': ['Applying_admin.0001_initial..._OK',
>                     'Applying_admin.0002_logentry_remove_auto_add..._OK',
>                    
> 'Applying_admin.0003_logentry_add_action_flag_choices..._OK',
>                     'Applying_db_functions.0001_setup_extensions..._OK',
>                     'Applying_db_functions.0002_create_test_models..._OK',
>                     'Applying_sites.0001_initial..._OK',
>                     'Applying_flatpages.0001_initial..._OK',
>                    
> 'Applying_migration_test_data_persistence.0001_initial..._OK',
>                    
> 'Applying_migration_test_data_persistence.0002_add_book..._OK',
>                     'Applying_postgres_tests.0001_setup_extensions..._OK',
>                    
> 'Applying_postgres_tests.0002_create_test_models..._OK',
>                     'Applying_redirects.0001_initial..._OK',
>                    
> 'Applying_redirects.0002_alter_redirect_new_path_help_text..._OK',
>                     'Applying_sites.0002_alter_domain_unique..._OK',
>                    
> 'PASS:_Regression_test_for_#10256..._If_there_is_a_values']}
>
> All tests seem to pass here but it still times out perhaps ?
>

No, it seems to be a problem with my sed that transforms the results.
Thanks for the heads up, will send an update later during the day.

> On Fri, Jan 16, 2026 at 7:33 AM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     Execute the standard, non-selenium tests. The execution is
>     on the slower side: on my idle machine, KVM enabled it takes
>     a bit more than 2.5 minutes to execute it (executing tests with
>     4 threads parallel, 1/core, the default configuration). If the
>     machine is
>     under load, it easily grows to over 10 minutes.
>
>     Added two backported patches for Django 5.2 to fix some tests that
>     would otherwise fail:
>
>     0001-Fix-test_strip_tags-test.patch: tag stripping tests failed due to
>     changed Python behavior
>
>     0001-fix-test_msgfmt_error_including_non_ascii-test.patch: tests were
>     updated to work with msgfmt 0.25
>
>     Most of the skipped tests require some specific database backend
>     (Postgres, MySQL, Oracle...) or are Selenium tests.
>
>     When the default parallelism is used for the execution, the package
>     needs 3GB RAM at least.
>
>     The output is very long (the suite contains way over 15k tests),
>     so I omit the example output here.
>
>     The current summary (for v5.2.9):
>     Ran 18121 tests in 140.891s
>     OK (skipped=1394, expected failures=5)
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      .../ptest-packagelists-meta-python.inc        |  1 +
>      .../images/meta-python-image-ptest.bb
>     <http://meta-python-image-ptest.bb>         |  1 +
>      .../python/python3-django.inc                 | 32 +++++++-
>      .../0001-Fix-test_strip_tags-test.patch       | 76
>     +++++++++++++++++++
>      ...sgfmt_error_including_non_ascii-test.patch | 71 +++++++++++++++++
>      .../python/python3-django/run-ptest           | 19 +++++
>      .../python/python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>            |  3 +
>      7 files changed, 202 insertions(+), 1 deletion(-)
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-django/run-ptest
>
>     diff --git
>     a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>     b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>     index 3b21c7cfa2..d62f138798 100644
>     --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
>     +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
>     @@ -129,6 +129,7 @@ PTESTS_FAST_META_PYTHON = "\
>
>      PTESTS_SLOW_META_PYTHON = "\
>          python3-arrow \
>     +    python3-django \
>          python3-ecdsa \
>          python3-fastapi \
>          python3-google-auth \
>     diff --git
>     a/meta-python/recipes-core/images/meta-python-image-ptest.bb
>     <http://meta-python-image-ptest.bb>
>     b/meta-python/recipes-core/images/meta-python-image-ptest.bb
>     <http://meta-python-image-ptest.bb>
>     index 794b9d1e4d..c5eb0b6403 100644
>     --- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
>     <http://meta-python-image-ptest.bb>
>     +++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
>     <http://meta-python-image-ptest.bb>
>     @@ -32,6 +32,7 @@ QB_MEM:virtclass-mcextend-python3-scrypt = "-m 2048"
>      # Needs atleast 5G to avoid OOMs
>      QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 5120"
>      QB_MEM:virtclass-mcextend-python3-pillow = "-m 2048"
>     +QB_MEM:virtclass-mcextend-python3-django = "-m 3072"
>
>      TEST_SUITES = "ping ssh parselogs ptest"
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django.inc
>     b/meta-python/recipes-devtools/python/python3-django.inc
>     index c6475d2079..317793abba 100644
>     --- a/meta-python/recipes-devtools/python/python3-django.inc
>     +++ b/meta-python/recipes-devtools/python/python3-django.inc
>     @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>      PYPI_PACKAGE = "django"
>      UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
>
>     -inherit pypi
>     +inherit pypi ptest
>     +
>     +SRC_URI += "file://run-ptest"
>
>      FILES:${PN} += "${datadir}/django"
>
>     @@ -31,3 +33,31 @@ RDEPENDS:${PN} += "\
>      "
>
>      CVE_PRODUCT = "django"
>     +
>     +do_install_ptest(){
>     +    install -d ${D}${PTEST_PATH}//docs/_ext
>     +    install -m 0644 ${S}/docs/_ext/github_links.py
>     ${D}${PTEST_PATH}/docs/_ext
>     +
>     +    cp -r ${S}/tests ${D}${PTEST_PATH}
>     +    sed -i 's,/usr/bin/env python,/usr/bin/env python3,'
>     ${D}${PTEST_PATH}/tests/runtests.py
>     +    ln -sr ${D}${libdir}/python3.*/site-packages/django
>     ${D}${PTEST_PATH}/django
>     +}
>     +
>     +RDEPENDS:${PN}-ptest += " \
>     +    gettext \
>     +    python3-asgiref \
>     +    python3-bcrypt \
>     +    python3-compile \
>     +    python3-docutils \
>     +    python3-fcntl \
>     +    python3-jinja2 \
>     +    python3-misc \
>     +    python3-numpy \
>     +    python3-pillow \
>     +    python3-pyyaml \
>     +    python3-sqlite3 \
>     +    python3-statistics \
>     +    python3-tblib \
>     +    python3-zoneinfo \
>     +    tzdata \
>     +"
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
>     b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
>     new file mode 100644
>     index 0000000000..f77c3b963a
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
>     @@ -0,0 +1,76 @@
>     +From 7b80b2186300620931009fd62c2969f108fe7a62 Mon Sep 17 00:00:00
>     2001
>     +From: Jacob Walls <jacobtylerwalls@gmail.com>
>     +Date: Thu, 11 Dec 2025 08:44:19 -0500
>     +Subject: [PATCH] Refs #36499 -- Adjusted test_strip_tags
>     following Python
>     + behavior change for incomplete entities.
>     +
>     +Upstream-Status: Backport
>     [https://github.com/django/django/commit/7b80b2186300620931009fd62c2969f108fe7a62]
>     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     +---
>     + tests/utils_tests/test_html.py | 25 ++++++++++++++++++++-----
>     + 1 file changed, 20 insertions(+), 5 deletions(-)
>     +
>     +diff --git a/tests/utils_tests/test_html.py
>     b/tests/utils_tests/test_html.py
>     +index 7412c2624c73..ee115aaf1cf2 100644
>     +--- a/tests/utils_tests/test_html.py
>     ++++ b/tests/utils_tests/test_html.py
>     +@@ -1,3 +1,4 @@
>     ++import math
>     + import os
>     + import sys
>     + from datetime import datetime
>     +@@ -124,7 +125,7 @@
>     +         # old and new results. The check below is temporary
>     until all supported
>     +         # Python versions and CI workers include the fix. See:
>     +         # https://github.com/python/cpython/commit/6eb6c5db
>     +-        min_fixed = {
>     ++        min_fixed_security = {
>     +             (3, 14): (3, 14),
>     +             (3, 13): (3, 13, 6),
>     +             (3, 12): (3, 12, 12),
>     +@@ -132,7 +133,21 @@
>     +             (3, 10): (3, 10, 19),
>     +             (3, 9): (3, 9, 24),
>     +         }
>     +-        htmlparser_fixed = sys.version_info >=
>     min_fixed[sys.version_info[:2]]
>     ++        # Similarly, there was a fix for terminating incomplete
>     entities. See:
>     ++        # https://github.com/python/cpython/commit/95296a9d
>     ++        min_fixed_incomplete_entities = {
>     ++            (3, 14): (3, 14, 1),
>     ++            (3, 13): (3, 13, 10),
>     ++            (3, 12): (3, 12, math.inf),  # not fixed in 3.12.
>     ++        }
>     ++        major_version = sys.version_info[:2]
>     ++        htmlparser_fixed_security = sys.version_info >=
>     min_fixed_security.get(
>     ++            major_version, major_version
>     ++        )
>     ++        htmlparser_fixed_incomplete_entities = (
>     ++            sys.version_info
>     ++            >= min_fixed_incomplete_entities.get(major_version,
>     major_version)
>     ++        )
>     +         items = (
>     +             (
>     +                 "<p>See: &#39;&eacute; is an apostrophe followed
>     by e acute</p>",
>     +@@ -159,16 +174,19 @@
>     +             # https://bugs.python.org/issue20288
>     +             ("&gotcha&#;<>", "&gotcha&#;<>"),
>     +             ("<sc<!-- -->ript>test<<!-- -->/script>", "ript>test"),
>     +-            ("<script>alert()</script>&h", "alert()h"),
>     ++            (
>     ++                "<script>alert()</script>&h",
>     ++                "alert()&h;" if
>     htmlparser_fixed_incomplete_entities else "alert()h",
>     ++            ),
>     +             (
>     +                 "><!" + ("&" * 16000) + "D",
>     +-                ">" if htmlparser_fixed else "><!" + ("&" *
>     16000) + "D",
>     ++                ">" if htmlparser_fixed_security else "><!" +
>     ("&" * 16000) + "D",
>     +             ),
>     +             ("X<<<<br>br>br>br>X", "XX"),
>     +             ("<" * 50 + "a>" * 50, ""),
>     +             (
>     +                 ">" + "<a" * 500 + "a",
>     +-                ">" if htmlparser_fixed else ">" + "<a" * 500 + "a",
>     ++                ">" if htmlparser_fixed_security else ">" + "<a"
>     * 500 + "a",
>     +             ),
>     +             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
>     +             ("<" + "a" * 1_002, "<" + "a" * 1_002),
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
>     b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
>     new file mode 100644
>     index 0000000000..6f887b3015
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
>     @@ -0,0 +1,71 @@
>     +From 1960ecd879ce351226b36e7ac0aa25616241b6f6 Mon Sep 17 00:00:00
>     2001
>     +From: Jericho Serrano
>     <118679068+jericho1050@users.noreply.github.com
>     <mailto:118679068%2Bjericho1050@users.noreply.github.com>>
>     +Date: Fri, 6 Jun 2025 04:58:29 +0800
>     +Subject: [PATCH] Fixed #36421 -- Made
>     test_msgfmt_error_including_non_ascii
>     + compatible with msgfmt 0.25.
>     +
>     +Upstream-Status: Backport
>     [https://github.com/django/django/commit/1960ecd879ce351226b36e7ac0aa25616241b6f6]
>     +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     +---
>     + tests/i18n/test_compilation.py | 25 +++++++++++++++++++++++--
>     + 1 file changed, 23 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/tests/i18n/test_compilation.py
>     b/tests/i18n/test_compilation.py
>     +index 4b0bb9f6bb16..3a57dbf0765f 100644
>     +--- a/tests/i18n/test_compilation.py
>     ++++ b/tests/i18n/test_compilation.py
>     +@@ -1,5 +1,6 @@
>     + import gettext as gettext_module
>     + import os
>     ++import re
>     + import stat
>     + import unittest
>     + from io import StringIO
>     +@@ -8,10 +9,12 @@
>     + from unittest import mock
>     +
>     + from django.core.management import CommandError, call_command,
>     execute_from_command_line
>     +-from django.core.management.utils import find_command
>     ++from django.core.management.utils import find_command, popen_wrapper
>     + from django.test import SimpleTestCase, override_settings
>     + from django.test.utils import captured_stderr, captured_stdout
>     + from django.utils import translation
>     ++from django.utils.encoding import DEFAULT_LOCALE_ENCODING
>     ++from django.utils.functional import cached_property
>     + from django.utils.translation import gettext
>     +
>     + from .utils import RunInTmpDirMixin, copytree
>     +@@ -254,6 +257,17 @@ def test_no_dirs_accidentally_skipped(self):
>     +
>     +
>     + class CompilationErrorHandling(MessageCompilationTests):
>     ++    @cached_property
>     ++    def msgfmt_version(self):
>     ++        # Note that msgfmt is installed via GNU gettext tools,
>     hence the msgfmt
>     ++        # version should align to gettext.
>     ++        out, err, status = popen_wrapper(
>     ++            ["msgfmt", "--version"],
>     ++            stdout_encoding=DEFAULT_LOCALE_ENCODING,
>     ++        )
>     ++        m = re.search(r"(\d+)\.(\d+)\.?(\d+)?", out)
>     ++        return tuple(int(d) for d in m.groups() if d is not None)
>     ++
>     +     def test_error_reported_by_msgfmt(self):
>     +         # po file contains wrong po formatting.
>     +         with self.assertRaises(CommandError):
>     +@@ -278,7 +292,14 @@ def test_msgfmt_error_including_non_ascii(self):
>     +                 call_command(
>     +                     "compilemessages", locale=["ko"],
>     stdout=StringIO(), stderr=stderr
>     +                 )
>     +-            self.assertIn("' cannot start a field name",
>     stderr.getvalue())
>     ++            if self.msgfmt_version < (0, 25):
>     ++                error_msg = "' cannot start a field name"
>     ++            else:
>     ++                error_msg = (
>     ++                    "a field name starts with a character that
>     is not alphanumerical "
>     ++                    "or underscore"
>     ++                )
>     ++            self.assertIn(error_msg, stderr.getvalue())
>     +
>     +
>     + class ProjectAndAppTests(MessageCompilationTests):
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django/run-ptest
>     b/meta-python/recipes-devtools/python/python3-django/run-ptest
>     new file mode 100644
>     index 0000000000..dd257cc843
>     --- /dev/null
>     +++ b/meta-python/recipes-devtools/python/python3-django/run-ptest
>     @@ -0,0 +1,19 @@
>     +#!/bin/sh
>     +useradd tester || echo test user exists already
>     +
>     +# We need $(pwd), because some tests import modules from the
>     actual tests folder
>     +# Also, there is one module in the docs/_ext folder that is
>     imported, and that
>     +# module accesses other modules by a relative path to itself.
>     +export PYTHONPATH=$(pwd):$(pwd)/docs/_ext:$PYTHONPATH
>     +
>     +cd tests
>     +
>     +su tester -c "./runtests.py --noinput -v 2" 2>&1 | \
>     +     tee ../testoutput.log | \
>     +     sed -e '/\.\.\. ok/ s/^/PASS: /g' \
>     +         -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' \
>     +         -e '/\.\.\. skipped/ s/^/SKIP: /g' \
>     +         -e 's/ \.\.\. ok//g' \
>     +         -e 's/ \.\.\. ERROR//g' \
>     +         -e 's/ \.\.\. FAIL//g' \
>     +         -e 's/ \.\.\. skipped//g'
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>
>     b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>
>     index c0aff44a78..fa9fb2e929 100644
>     --- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>
>     +++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
>     <http://python3-django_5.2.9.bb>
>     @@ -1,6 +1,9 @@
>      require python3-django.inc
>      inherit python_setuptools_build_meta
>
>     +SRC_URI +=
>     "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
>     +            file://0001-Fix-test_strip_tags-test.patch \
>     +"
>      SRC_URI[sha256sum] =
>     "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
>
>      RDEPENDS:${PN} += "\
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#123534):
>     https://lists.openembedded.org/g/openembedded-devel/message/123534
>     Mute This Topic: https://lists.openembedded.org/mt/117299234/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


