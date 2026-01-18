Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CB0C9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 16:27:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17247.1768753664642813277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 08:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H7+07hZ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso16665015e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 08:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753663; x=1769358463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ty/S48qEDIk7Hb7wboEU35laqm6BuKQEpJ5NRRsVnYw=;
        b=H7+07hZ4Jx+V9vrfTApvJhwrbtAP81t7plA92A0YZUOKOguePpPQ4jfXhGpV6QSAvu
         CK4SCv3z2dmVfDCv7iWPPF5rq5Koj0ozp9dOAyCs0WGT7LLAHnv/2sAFjUFxLw4oMuFq
         JlKnjCss4dr/jgTZoMczwyxA13zYMmoicOyc6vFnk50b7LndL4NEbcVAfPuKbWYnB3WQ
         1i/W1iyhjkeDrV5PmrrfH3iRWJMsOvF4j+AutZArq2Y3/Up+akotff/bH+HhcAkHcBti
         WOIJsGV0gp+t30Ex/0NYGMHaBj/02b68F4faDgFbOv/rckF4PmgH2zh+2l6NrGGhHNHL
         +S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753663; x=1769358463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ty/S48qEDIk7Hb7wboEU35laqm6BuKQEpJ5NRRsVnYw=;
        b=WVGfUbL7iWlwiYcIR5f2KKZEWyJgAPssI2HA3XjKhuDszCSjyfVg2N0M+2vxHRhqjj
         QrEjdl6fbr3HR5yn23+hIdNBeY4BEEqK6SZ9hPJWV7JICC+pEm7nuR5KWKSKV1Zi4+hp
         ps+ip2kQfSQuc0T0TpqKuqr/LxiOAOC4PHNt6TepEBSoWcDu3B8ASFIevmr6FQM8sEe6
         xRaslb0LaiZ0uiClsSV6e5CGlKA+lPYQJ24SWKN9mRVuwDr6kGGG1BIw4t/DINayZSf5
         vw2+wIgIht8jG1w/xjEg6dvoUUKF/5xTW67dLajprKSwcdFaGWtMtwbTocnjoJaKlTho
         QslA==
X-Gm-Message-State: AOJu0YzAJHHhNWwJHGGeU5txrP7I8KxGHtYn9Q0g5YcWTJ7IU2GMH3s0
	skNFioULDjGf2oe0DU6HMtrDLRiv/SKNV9OjMdTdZPWZXASmSAssG1c76KxGAA==
X-Gm-Gg: AY/fxX7pu0p0h5pfFamVrXdLdN/mvLt8mF6gd4+ubL8EuxBb+6dVcvutKZKteh344dE
	us3v6MZK/2hYn1W6HgfN5EbeDMzICC1eBUNban9OyWW9m/drBbUIQT7jYFHNRGZOsSmBLOPz/eI
	H9VnZVhDPrZRHoKnz9lc4WqTM4wiyT+3+p5ei2L6xr2eWdy+2YQZoQypy5JT3Wm8/sRKeStHEWR
	jqQN1hb3wMRMjZpN8CZH/tpOSESY8wmOL5h99RusOe/MBipGrpuldOnfxOiPqMCgf1ZpfmStLpu
	ijVxrauTr0R+buxFW9QSXlOWq1O/Z5Huoc8cjynP2p3SlvO5/js96FAXhMlFOlrz9vMGa5aaJ6i
	QCV9qBv9jacfRBL4xBFXLXIvXHySWRyZ+yaIrGc4ArdxmgrN96BShhw9HjfypwMbdlSBxpV2peL
	LP2iTV21a+
X-Received: by 2002:a05:600c:e41a:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-48024b8a77bmr84835695e9.31.1768753662832;
        Sun, 18 Jan 2026 08:27:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe47dddsm61402165e9.13.2026.01.18.08.27.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:27:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 3/5] python3-django: add ptest support
Date: Sun, 18 Jan 2026 17:27:37 +0100
Message-ID: <20260118162739.3764017-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118162739.3764017-1-skandigraun@gmail.com>
References: <20260118162739.3764017-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 16:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123574

Execute the standard, non-selenium tests. The execution is
on the slower side: on my idle machine, KVM enabled it takes
a bit more than 2.5 minutes to execute it (executing tests with
4 threads parallel, 1/core, the default configuration). If the machine is
under load, it easily grows to over 10 minutes.

Added two backported patches for Django 5.2 to fix some tests that
would otherwise fail:

0001-Fix-test_strip_tags-test.patch: tag stripping tests failed due to
changed Python behavior

0001-fix-test_msgfmt_error_including_non_ascii-test.patch: tests were
updated to work with msgfmt 0.25

Most of the skipped tests require some specific database backend
(Postgres, MySQL, Oracle...) or are Selenium tests.

The output is very long (the suite contains way over 15k tests),
so I omit the example output here.

The current summary (for v5.2.9):
Ran 18121 tests in 140.891s
OK (skipped=1394, expected failures=5)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../images/meta-python-image-ptest.bb         |  1 +
 .../python/python3-django.inc                 | 32 +++++++-
 .../0001-Fix-test_strip_tags-test.patch       | 76 +++++++++++++++++++
 ...sgfmt_error_including_non_ascii-test.patch | 71 +++++++++++++++++
 .../python/python3-django/run-ptest           | 19 +++++
 .../python/python3-django_5.2.9.bb            |  3 +
 7 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/run-ptest

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 3b21c7cfa2..d62f138798 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -129,6 +129,7 @@ PTESTS_FAST_META_PYTHON = "\
 
 PTESTS_SLOW_META_PYTHON = "\
     python3-arrow \
+    python3-django \
     python3-ecdsa \
     python3-fastapi \
     python3-google-auth \
diff --git a/meta-python/recipes-core/images/meta-python-image-ptest.bb b/meta-python/recipes-core/images/meta-python-image-ptest.bb
index 794b9d1e4d..c5eb0b6403 100644
--- a/meta-python/recipes-core/images/meta-python-image-ptest.bb
+++ b/meta-python/recipes-core/images/meta-python-image-ptest.bb
@@ -32,6 +32,7 @@ QB_MEM:virtclass-mcextend-python3-scrypt = "-m 2048"
 # Needs atleast 5G to avoid OOMs
 QB_MEM:virtclass-mcextend-python3-fastjsonschema = "-m 5120"
 QB_MEM:virtclass-mcextend-python3-pillow = "-m 2048"
+QB_MEM:virtclass-mcextend-python3-django = "-m 3072"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index c6475d2079..317793abba 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 PYPI_PACKAGE = "django"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi
+inherit pypi ptest
+
+SRC_URI += "file://run-ptest"
 
 FILES:${PN} += "${datadir}/django"
 
@@ -31,3 +33,31 @@ RDEPENDS:${PN} += "\
 "
 
 CVE_PRODUCT = "django"
+
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}//docs/_ext
+    install -m 0644 ${S}/docs/_ext/github_links.py ${D}${PTEST_PATH}/docs/_ext
+
+    cp -r ${S}/tests ${D}${PTEST_PATH}
+    sed -i 's,/usr/bin/env python,/usr/bin/env python3,' ${D}${PTEST_PATH}/tests/runtests.py
+    ln -sr ${D}${libdir}/python3.*/site-packages/django ${D}${PTEST_PATH}/django
+}
+
+RDEPENDS:${PN}-ptest += " \
+    gettext \
+    python3-asgiref \
+    python3-bcrypt \
+    python3-compile \
+    python3-docutils \
+    python3-fcntl \
+    python3-jinja2 \
+    python3-misc \
+    python3-numpy \
+    python3-pillow \
+    python3-pyyaml \
+    python3-sqlite3 \
+    python3-statistics \
+    python3-tblib \
+    python3-zoneinfo \
+    tzdata \
+"
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
new file mode 100644
index 0000000000..f77c3b963a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
@@ -0,0 +1,76 @@
+From 7b80b2186300620931009fd62c2969f108fe7a62 Mon Sep 17 00:00:00 2001
+From: Jacob Walls <jacobtylerwalls@gmail.com>
+Date: Thu, 11 Dec 2025 08:44:19 -0500
+Subject: [PATCH] Refs #36499 -- Adjusted test_strip_tags following Python
+ behavior change for incomplete entities.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/7b80b2186300620931009fd62c2969f108fe7a62]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/utils_tests/test_html.py | 25 ++++++++++++++++++++-----
+ 1 file changed, 20 insertions(+), 5 deletions(-)
+
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 7412c2624c73..ee115aaf1cf2 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -1,3 +1,4 @@
++import math
+ import os
+ import sys
+ from datetime import datetime
+@@ -124,7 +125,7 @@
+         # old and new results. The check below is temporary until all supported
+         # Python versions and CI workers include the fix. See:
+         # https://github.com/python/cpython/commit/6eb6c5db
+-        min_fixed = {
++        min_fixed_security = {
+             (3, 14): (3, 14),
+             (3, 13): (3, 13, 6),
+             (3, 12): (3, 12, 12),
+@@ -132,7 +133,21 @@
+             (3, 10): (3, 10, 19),
+             (3, 9): (3, 9, 24),
+         }
+-        htmlparser_fixed = sys.version_info >= min_fixed[sys.version_info[:2]]
++        # Similarly, there was a fix for terminating incomplete entities. See:
++        # https://github.com/python/cpython/commit/95296a9d
++        min_fixed_incomplete_entities = {
++            (3, 14): (3, 14, 1),
++            (3, 13): (3, 13, 10),
++            (3, 12): (3, 12, math.inf),  # not fixed in 3.12.
++        }
++        major_version = sys.version_info[:2]
++        htmlparser_fixed_security = sys.version_info >= min_fixed_security.get(
++            major_version, major_version
++        )
++        htmlparser_fixed_incomplete_entities = (
++            sys.version_info
++            >= min_fixed_incomplete_entities.get(major_version, major_version)
++        )
+         items = (
+             (
+                 "<p>See: &#39;&eacute; is an apostrophe followed by e acute</p>",
+@@ -159,16 +174,19 @@
+             # https://bugs.python.org/issue20288
+             ("&gotcha&#;<>", "&gotcha&#;<>"),
+             ("<sc<!-- -->ript>test<<!-- -->/script>", "ript>test"),
+-            ("<script>alert()</script>&h", "alert()h"),
++            (
++                "<script>alert()</script>&h",
++                "alert()&h;" if htmlparser_fixed_incomplete_entities else "alert()h",
++            ),
+             (
+                 "><!" + ("&" * 16000) + "D",
+-                ">" if htmlparser_fixed else "><!" + ("&" * 16000) + "D",
++                ">" if htmlparser_fixed_security else "><!" + ("&" * 16000) + "D",
+             ),
+             ("X<<<<br>br>br>br>X", "XX"),
+             ("<" * 50 + "a>" * 50, ""),
+             (
+                 ">" + "<a" * 500 + "a",
+-                ">" if htmlparser_fixed else ">" + "<a" * 500 + "a",
++                ">" if htmlparser_fixed_security else ">" + "<a" * 500 + "a",
+             ),
+             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
+             ("<" + "a" * 1_002, "<" + "a" * 1_002),
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
new file mode 100644
index 0000000000..6f887b3015
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
@@ -0,0 +1,71 @@
+From 1960ecd879ce351226b36e7ac0aa25616241b6f6 Mon Sep 17 00:00:00 2001
+From: Jericho Serrano <118679068+jericho1050@users.noreply.github.com>
+Date: Fri, 6 Jun 2025 04:58:29 +0800
+Subject: [PATCH] Fixed #36421 -- Made test_msgfmt_error_including_non_ascii
+ compatible with msgfmt 0.25.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/1960ecd879ce351226b36e7ac0aa25616241b6f6]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/i18n/test_compilation.py | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/tests/i18n/test_compilation.py b/tests/i18n/test_compilation.py
+index 4b0bb9f6bb16..3a57dbf0765f 100644
+--- a/tests/i18n/test_compilation.py
++++ b/tests/i18n/test_compilation.py
+@@ -1,5 +1,6 @@
+ import gettext as gettext_module
+ import os
++import re
+ import stat
+ import unittest
+ from io import StringIO
+@@ -8,10 +9,12 @@
+ from unittest import mock
+ 
+ from django.core.management import CommandError, call_command, execute_from_command_line
+-from django.core.management.utils import find_command
++from django.core.management.utils import find_command, popen_wrapper
+ from django.test import SimpleTestCase, override_settings
+ from django.test.utils import captured_stderr, captured_stdout
+ from django.utils import translation
++from django.utils.encoding import DEFAULT_LOCALE_ENCODING
++from django.utils.functional import cached_property
+ from django.utils.translation import gettext
+ 
+ from .utils import RunInTmpDirMixin, copytree
+@@ -254,6 +257,17 @@ def test_no_dirs_accidentally_skipped(self):
+ 
+ 
+ class CompilationErrorHandling(MessageCompilationTests):
++    @cached_property
++    def msgfmt_version(self):
++        # Note that msgfmt is installed via GNU gettext tools, hence the msgfmt
++        # version should align to gettext.
++        out, err, status = popen_wrapper(
++            ["msgfmt", "--version"],
++            stdout_encoding=DEFAULT_LOCALE_ENCODING,
++        )
++        m = re.search(r"(\d+)\.(\d+)\.?(\d+)?", out)
++        return tuple(int(d) for d in m.groups() if d is not None)
++
+     def test_error_reported_by_msgfmt(self):
+         # po file contains wrong po formatting.
+         with self.assertRaises(CommandError):
+@@ -278,7 +292,14 @@ def test_msgfmt_error_including_non_ascii(self):
+                 call_command(
+                     "compilemessages", locale=["ko"], stdout=StringIO(), stderr=stderr
+                 )
+-            self.assertIn("' cannot start a field name", stderr.getvalue())
++            if self.msgfmt_version < (0, 25):
++                error_msg = "' cannot start a field name"
++            else:
++                error_msg = (
++                    "a field name starts with a character that is not alphanumerical "
++                    "or underscore"
++                )
++            self.assertIn(error_msg, stderr.getvalue())
+ 
+ 
+ class ProjectAndAppTests(MessageCompilationTests):
diff --git a/meta-python/recipes-devtools/python/python3-django/run-ptest b/meta-python/recipes-devtools/python/python3-django/run-ptest
new file mode 100644
index 0000000000..a7fe08cc83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+useradd tester || echo test user exists already
+
+# We need $(pwd), because some tests import modules from the actual tests folder
+# Also, there is one module in the docs/_ext folder that is imported, and that
+# module accesses other modules by a relative path to itself.
+export PYTHONPATH=$(pwd):$(pwd)/docs/_ext:$PYTHONPATH
+
+cd tests
+
+su tester -c "./runtests.py --noinput -v 2" 2>&1 | \
+     tee ../testoutput.log | \
+     sed -e '/\.\.\. ok/ s/^/PASS: /g' \
+         -e '/\.\.\. \(ERROR\|FAIL\)/ s/^/FAIL: /g' \
+         -e '/\.\.\. skipped/ s/^/SKIP: /g' \
+         -e 's/ \.\.\. ok//g' \
+         -e 's/ \.\.\. ERROR//g' \
+         -e 's/ \.\.\. FAIL//g' \
+         -e 's/ \.\.\. skipped//g'
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
index c0aff44a78..fa9fb2e929 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
@@ -1,6 +1,9 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
+SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
+            file://0001-Fix-test_strip_tags-test.patch \
+"
 SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"
 
 RDEPENDS:${PN} += "\

