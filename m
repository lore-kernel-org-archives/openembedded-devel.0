Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F098CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.8325.1761175640038029723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0FZpkse;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b67ae7e76abso71501a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175639; x=1761780439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0Ef9LyEqdvsrtN5iG8KCnNN2K2eTiET77lXwT7yEhU=;
        b=E0FZpksenOQbak1XygKj+Z7fATs/U1q2yUO8iyXu2wdZSBwx+FtVikBZpjKM5H62Tg
         wl0n9panLYWnvKMIzZI01fBD0T8/3qlESfBfJdKBA/ZXmIZGwHWoTqsfu9y6aqSxCrNl
         DLJou55E7/qwA5OzXCrfulla89to8k3rQLHJK43u7/mticZpWDF0ndUj0ecG0tldLlLg
         QTRN0fI/h0cVF45GVaUJ+/uzwvZvgu/Adf2mMNLueCdt4Z3UovQk4bCz1i0ffavf+0tv
         enaDRRixTE5bmOe1fgTAhOpZeDg0w75LkjK4p5CVLbTSxV+wZfsducvqscXU80e5OK5F
         UWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175639; x=1761780439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0Ef9LyEqdvsrtN5iG8KCnNN2K2eTiET77lXwT7yEhU=;
        b=Z6Ure04D8wpoTe8hD4ueqej+ODXIrJqqTuzbPclL6akU2zkwMQ152Gl0GaIHGeciVn
         RFGHvsGMc0V3sJMElpLmCbRzemF5ZxYonoVbINuyO0QGRkCwXTo1GHVOScKb7jacVR9A
         MOSSSTUO5rkzhxyVzQgoYwAJwu6EG/O1p2EViKVhxMEzFiDmPCYSBW3Otl2M502sJO/k
         /HrcubNRA2Wsl/2Rv+addaDwWCd0T3Hci/TisahGEclmqmDcC7WdoGOuPzLKFTRY3Mtv
         7FmyHw262C6VeD3qp10JOUBz+Kg0T8vmjQVzkj4n5Jf2RygjprooDcC8xQbHH9v4ynnu
         xuvg==
X-Gm-Message-State: AOJu0YxN3L6UbJoQW8Ao8i5ZN5WmhpLovTZCzJ5jjyK+g2UbpaSxF7dX
	cE8T0IFpAwWH3BR6FhMGKJOEZpBl0tb4bFdehKX4UUJeOFbpLVHqZzs1xgLFfw==
X-Gm-Gg: ASbGnctHv3fV12ppKNLAoRHYEG5cVHhnffbXuxpxh8cZxfyNrfI/N8ZyNKe+NmLfr0w
	6uefqw3uFij0FlSVgEIFARwv2ueB9Wpv0stvaBeJzloe1v+T827LJWbZbJFp4/IeP7Dj2/blkq+
	NjEWhDoogGjBmN5a7mMF7CvN8t5sqNb502HBFZZflcDnxu84CpdrUl3G5z5Sdzq2e1oFUqruMNe
	jbHsQxNedRWUqlicpMWclm1mvxDNPh4VTwOd03NQbNCFceVaRTIuoJoBVrNzMMgjXu+qjyz3Zwe
	424B7twiMP7p+O9S1yJNdpADms+VwOL0PdEDrM+1POErgpIhWL1fOQ4/97MWtkVxrBlqrqqkHmc
	EdqwdfsujMIBrCr6yeKNkYedKTWB8e8UW8UMrgvHvjTWXKYOgNrbdcdgKWZIqWiyAfWGEB9ZBqN
	V/6fAAk/jQBQrEbA==
X-Google-Smtp-Source: AGHT+IEya9K1RzvKspxhlzbdpbTn8STGGIqE9fId+wL/W/kguhDFfoN5KrdK2V09g/d8qBdLT6HBLQ==
X-Received: by 2002:a17:903:8c6:b0:28d:18fb:bb93 with SMTP id d9443c01a7336-290c9c8968cmr308770925ad.7.1761175638850;
        Wed, 22 Oct 2025 16:27:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:18 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 4/8] python3-django: patch CVE-2025-48432
Date: Thu, 23 Oct 2025 12:26:27 +1300
Message-ID: <20251022232633.1703690-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120905

Details https://nvd.nist.gov/vuln/detail/CVE-2025-48432

Following patches are needed to avoid cherry-pick conflicts
 - CVE-2025-48432-1.patch
 - CVE-2025-48432-2.patch
 - CVE-2025-48432-4.patch

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-48432-1.patch                    | 166 +++++++++++++
 .../CVE-2025-48432-2.patch                    | 225 ++++++++++++++++++
 .../CVE-2025-48432-3.patch                    | 165 +++++++++++++
 .../CVE-2025-48432-4.patch                    | 193 +++++++++++++++
 .../CVE-2025-48432-5.patch                    |  76 ++++++
 .../CVE-2025-48432-6.patch                    | 167 +++++++++++++
 .../python/python3-django_4.2.20.bb           |   6 +
 7 files changed, 998 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-4.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-5.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-6.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-1.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-1.patch
new file mode 100644
index 0000000000..b7a6379660
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-1.patch
@@ -0,0 +1,166 @@
+From be9a242fadb72bbb678095b958605d74543f112c Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 19 May 2025 22:45:38 -0300
+Subject: [PATCH] [4.2.x] Refs #26688 -- Added tests for `log_response()`
+ internal helper.
+
+Backport of 897046815944cc9a2da7ed9e8082f45ffe8110e3 from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/acbe655a0fa1200d2de31c6020f310ba9aa2f636]
+(cherry picked from commit acbe655a0fa1200d2de31c6020f310ba9aa2f636)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/logging_tests/tests.py | 121 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 121 insertions(+)
+
+diff --git a/tests/logging_tests/tests.py b/tests/logging_tests/tests.py
+index c73a3acd6d..2138a7fe50 100644
+--- a/tests/logging_tests/tests.py
++++ b/tests/logging_tests/tests.py
+@@ -1,6 +1,7 @@
+ import logging
+ from contextlib import contextmanager
+ from io import StringIO
++from unittest import TestCase
+ 
+ from admin_scripts.tests import AdminScriptTestCase
+ 
+@@ -9,6 +10,7 @@ from django.core import mail
+ from django.core.exceptions import DisallowedHost, PermissionDenied, SuspiciousOperation
+ from django.core.files.temp import NamedTemporaryFile
+ from django.core.management import color
++from django.http import HttpResponse
+ from django.http.multipartparser import MultiPartParserError
+ from django.test import RequestFactory, SimpleTestCase, override_settings
+ from django.test.utils import LoggingCaptureMixin
+@@ -19,6 +21,7 @@ from django.utils.log import (
+     RequireDebugFalse,
+     RequireDebugTrue,
+     ServerFormatter,
++    log_response,
+ )
+ from django.views.debug import ExceptionReporter
+ 
+@@ -646,3 +649,121 @@ class LogFormattersTests(SimpleTestCase):
+             self.assertRegex(
+                 logger_output.getvalue(), r"^\[[/:,\w\s\d]+\] %s\n" % log_msg
+             )
++
++
++class LogResponseRealLoggerTests(TestCase):
++    request = RequestFactory().get("/test-path/")
++
++    def assertResponseLogged(self, logger_cm, msg, levelno, status_code, request):
++        self.assertEqual(
++            records_len := len(logger_cm.records),
++            1,
++            f"Unexpected number of records for {logger_cm=} in {levelno=} (expected 1, "
++            f"got {records_len}).",
++        )
++        record = logger_cm.records[0]
++        self.assertEqual(record.getMessage(), msg)
++        self.assertEqual(record.levelno, levelno)
++        self.assertEqual(record.status_code, status_code)
++        self.assertEqual(record.request, request)
++
++    def test_missing_response_raises_attribute_error(self):
++        with self.assertRaises(AttributeError):
++            log_response("No response provided", response=None, request=self.request)
++
++    def test_missing_request_logs_with_none(self):
++        response = HttpResponse(status=403)
++        with self.assertLogs("django.request", level="INFO") as cm:
++            log_response(msg := "Missing request", response=response, request=None)
++        self.assertResponseLogged(cm, msg, logging.WARNING, 403, request=None)
++
++    def test_logs_5xx_as_error(self):
++        response = HttpResponse(status=508)
++        with self.assertLogs("django.request", level="ERROR") as cm:
++            log_response(
++                msg := "Server error occurred", response=response, request=self.request
++            )
++        self.assertResponseLogged(cm, msg, logging.ERROR, 508, self.request)
++
++    def test_logs_4xx_as_warning(self):
++        response = HttpResponse(status=418)
++        with self.assertLogs("django.request", level="WARNING") as cm:
++            log_response(
++                msg := "This is a teapot!", response=response, request=self.request
++            )
++        self.assertResponseLogged(cm, msg, logging.WARNING, 418, self.request)
++
++    def test_logs_2xx_as_info(self):
++        response = HttpResponse(status=201)
++        with self.assertLogs("django.request", level="INFO") as cm:
++            log_response(msg := "OK response", response=response, request=self.request)
++        self.assertResponseLogged(cm, msg, logging.INFO, 201, self.request)
++
++    def test_custom_log_level(self):
++        response = HttpResponse(status=403)
++        with self.assertLogs("django.request", level="DEBUG") as cm:
++            log_response(
++                msg := "Debug level log",
++                response=response,
++                request=self.request,
++                level="debug",
++            )
++        self.assertResponseLogged(cm, msg, logging.DEBUG, 403, self.request)
++
++    def test_logs_only_once_per_response(self):
++        response = HttpResponse(status=500)
++        with self.assertLogs("django.request", level="ERROR") as cm:
++            log_response("First log", response=response, request=self.request)
++            log_response("Second log", response=response, request=self.request)
++        self.assertResponseLogged(cm, "First log", logging.ERROR, 500, self.request)
++
++    def test_exc_info_output(self):
++        response = HttpResponse(status=500)
++        try:
++            raise ValueError("Simulated failure")
++        except ValueError as exc:
++            with self.assertLogs("django.request", level="ERROR") as cm:
++                log_response(
++                    "With exception",
++                    response=response,
++                    request=self.request,
++                    exception=exc,
++                )
++        self.assertResponseLogged(
++            cm, "With exception", logging.ERROR, 500, self.request
++        )
++        self.assertIn("ValueError", "\n".join(cm.output))  # Stack trace included
++
++    def test_format_args_are_applied(self):
++        response = HttpResponse(status=500)
++        with self.assertLogs("django.request", level="ERROR") as cm:
++            log_response(
++                "Something went wrong: %s (%d)",
++                "DB error",
++                42,
++                response=response,
++                request=self.request,
++            )
++        msg = "Something went wrong: DB error (42)"
++        self.assertResponseLogged(cm, msg, logging.ERROR, 500, self.request)
++
++    def test_logs_with_custom_logger(self):
++        handler = logging.StreamHandler(log_stream := StringIO())
++        handler.setFormatter(logging.Formatter("%(levelname)s:%(name)s:%(message)s"))
++
++        custom_logger = logging.getLogger("my.custom.logger")
++        custom_logger.setLevel(logging.DEBUG)
++        custom_logger.addHandler(handler)
++        self.addCleanup(custom_logger.removeHandler, handler)
++
++        response = HttpResponse(status=404)
++        log_response(
++            msg := "Handled by custom logger",
++            response=response,
++            request=self.request,
++            logger=custom_logger,
++        )
++
++        self.assertEqual(
++            f"WARNING:my.custom.logger:{msg}", log_stream.getvalue().strip()
++        )
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-2.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-2.patch
new file mode 100644
index 0000000000..853d57c3ed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-2.patch
@@ -0,0 +1,225 @@
+From b0b78910bf659fd33d101d99fee02b19f8dc346c Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Mon, 19 May 2025 22:46:00 -0300
+Subject: [PATCH] [4.2.x] Added helpers in csrf_tests and logging_tests to
+ assert logs from `log_response()`.
+
+Backport of ad6f99889838ccc2c30b3c02ed3868c9b565e81b from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/32fd8dec5618bd09eccdeb9dbf512043193d68ef]
+(cherry picked from commit 32fd8dec5618bd09eccdeb9dbf512043193d68ef)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/csrf_tests/tests.py    | 53 ++++++++++++++++++------------------
+ tests/logging_tests/tests.py | 42 ++++++++++++++++++++--------
+ 2 files changed, 57 insertions(+), 38 deletions(-)
+
+diff --git a/tests/csrf_tests/tests.py b/tests/csrf_tests/tests.py
+index ba8f87d6ac..b8d928151e 100644
+--- a/tests/csrf_tests/tests.py
++++ b/tests/csrf_tests/tests.py
+@@ -1,3 +1,4 @@
++import logging
+ import re
+ 
+ from django.conf import settings
+@@ -57,6 +58,21 @@ class CsrfFunctionTestMixin:
+         actual = _unmask_cipher_token(masked_secret)
+         self.assertEqual(actual, secret)
+ 
++    def assertForbiddenReason(
++        self, response, logger_cm, reason, levelno=logging.WARNING
++    ):
++        self.assertEqual(
++            records_len := len(logger_cm.records),
++            1,
++            f"Unexpected number of records for {logger_cm=} in {levelno=} (expected 1, "
++            f"got {records_len}).",
++        )
++        record = logger_cm.records[0]
++        self.assertEqual(record.getMessage(), "Forbidden (%s): " % reason)
++        self.assertEqual(record.levelno, levelno)
++        self.assertEqual(record.status_code, 403)
++        self.assertEqual(response.status_code, 403)
++
+ 
+ class CsrfFunctionTests(CsrfFunctionTestMixin, SimpleTestCase):
+     def test_unmask_cipher_token(self):
+@@ -347,8 +363,7 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         mw.process_request(req)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             resp = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(403, resp.status_code)
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % expected)
++        self.assertForbiddenReason(resp, cm, expected)
+ 
+     def test_no_csrf_cookie(self):
+         """
+@@ -373,9 +388,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         mw.process_request(req)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             resp = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(403, resp.status_code)
+         self.assertEqual(resp["Content-Type"], "text/html; charset=utf-8")
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % expected)
++        self.assertForbiddenReason(resp, cm, expected)
+ 
+     def test_csrf_cookie_bad_or_missing_token(self):
+         """
+@@ -480,18 +494,12 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         mw = CsrfViewMiddleware(post_form_view)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             resp = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(403, resp.status_code)
+-        self.assertEqual(
+-            cm.records[0].getMessage(), "Forbidden (%s): " % REASON_NO_CSRF_COOKIE
+-        )
++        self.assertForbiddenReason(resp, cm, REASON_NO_CSRF_COOKIE)
+ 
+         req = self._get_request(method="DELETE")
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             resp = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(403, resp.status_code)
+-        self.assertEqual(
+-            cm.records[0].getMessage(), "Forbidden (%s): " % REASON_NO_CSRF_COOKIE
+-        )
++        self.assertForbiddenReason(resp, cm, REASON_NO_CSRF_COOKIE)
+ 
+     def test_put_and_delete_allowed(self):
+         """
+@@ -879,11 +887,7 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         mw.process_request(req)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             resp = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(resp.status_code, 403)
+-        self.assertEqual(
+-            cm.records[0].getMessage(),
+-            "Forbidden (%s): " % REASON_CSRF_TOKEN_MISSING,
+-        )
++        self.assertForbiddenReason(resp, cm, REASON_CSRF_TOKEN_MISSING)
+ 
+     def test_reading_post_data_raises_os_error(self):
+         """
+@@ -908,9 +912,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         self.assertIs(mw._origin_verified(req), False)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             response = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(response.status_code, 403)
+         msg = REASON_BAD_ORIGIN % req.META["HTTP_ORIGIN"]
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % msg)
++        self.assertForbiddenReason(response, cm, msg)
+ 
+     @override_settings(ALLOWED_HOSTS=["www.example.com"])
+     def test_bad_origin_null_origin(self):
+@@ -923,9 +926,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         self.assertIs(mw._origin_verified(req), False)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             response = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(response.status_code, 403)
+         msg = REASON_BAD_ORIGIN % req.META["HTTP_ORIGIN"]
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % msg)
++        self.assertForbiddenReason(response, cm, msg)
+ 
+     @override_settings(ALLOWED_HOSTS=["www.example.com"])
+     def test_bad_origin_bad_protocol(self):
+@@ -939,9 +941,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         self.assertIs(mw._origin_verified(req), False)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             response = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(response.status_code, 403)
+         msg = REASON_BAD_ORIGIN % req.META["HTTP_ORIGIN"]
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % msg)
++        self.assertForbiddenReason(response, cm, msg)
+ 
+     @override_settings(
+         ALLOWED_HOSTS=["www.example.com"],
+@@ -966,9 +967,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         self.assertIs(mw._origin_verified(req), False)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             response = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(response.status_code, 403)
+         msg = REASON_BAD_ORIGIN % req.META["HTTP_ORIGIN"]
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % msg)
++        self.assertForbiddenReason(response, cm, msg)
+         self.assertEqual(mw.allowed_origins_exact, {"http://no-match.com"})
+         self.assertEqual(
+             mw.allowed_origin_subdomains,
+@@ -992,9 +992,8 @@ class CsrfViewMiddlewareTestMixin(CsrfFunctionTestMixin):
+         self.assertIs(mw._origin_verified(req), False)
+         with self.assertLogs("django.security.csrf", "WARNING") as cm:
+             response = mw.process_view(req, post_form_view, (), {})
+-        self.assertEqual(response.status_code, 403)
+         msg = REASON_BAD_ORIGIN % req.META["HTTP_ORIGIN"]
+-        self.assertEqual(cm.records[0].getMessage(), "Forbidden (%s): " % msg)
++        self.assertForbiddenReason(response, cm, msg)
+ 
+     @override_settings(ALLOWED_HOSTS=["www.example.com"])
+     def test_good_origin_insecure(self):
+diff --git a/tests/logging_tests/tests.py b/tests/logging_tests/tests.py
+index 2138a7fe50..4ffa49a1b8 100644
+--- a/tests/logging_tests/tests.py
++++ b/tests/logging_tests/tests.py
+@@ -94,6 +94,28 @@ class DefaultLoggingTests(
+ 
+ 
+ class LoggingAssertionMixin:
++
++    def assertLogRecord(
++        self,
++        logger_cm,
++        level,
++        msg,
++        status_code,
++        exc_class=None,
++    ):
++        self.assertEqual(
++            records_len := len(logger_cm.records),
++            1,
++            f"Wrong number of calls for {logger_cm=} in {level=} (expected 1, got "
++            f"{records_len}).",
++        )
++        record = logger_cm.records[0]
++        self.assertEqual(record.getMessage(), msg)
++        self.assertEqual(record.status_code, status_code)
++        if exc_class:
++            self.assertIsNotNone(record.exc_info)
++            self.assertEqual(record.exc_info[0], exc_class)
++
+     def assertLogsRequest(
+         self, url, level, msg, status_code, logger="django.request", exc_class=None
+     ):
+@@ -102,17 +124,7 @@ class LoggingAssertionMixin:
+                 self.client.get(url)
+             except views.UncaughtException:
+                 pass
+-            self.assertEqual(
+-                len(cm.records),
+-                1,
+-                "Wrong number of calls for logger %r in %r level." % (logger, level),
+-            )
+-            record = cm.records[0]
+-            self.assertEqual(record.getMessage(), msg)
+-            self.assertEqual(record.status_code, status_code)
+-            if exc_class:
+-                self.assertIsNotNone(record.exc_info)
+-                self.assertEqual(record.exc_info[0], exc_class)
++            self.assertLogRecord(cm, level, msg, status_code, exc_class)
+ 
+ 
+ @override_settings(DEBUG=True, ROOT_URLCONF="logging_tests.urls")
+@@ -135,6 +147,14 @@ class HandlerLoggingTests(
+             msg="Not Found: /does_not_exist/",
+         )
+ 
++    async def test_async_page_not_found_warning(self):
++        logger = "django.request"
++        level = "WARNING"
++        with self.assertLogs(logger, level) as cm:
++            await self.async_client.get("/does_not_exist/")
++
++        self.assertLogRecord(cm, level, "Not Found: /does_not_exist/", 404)
++
+     def test_page_not_found_raised(self):
+         self.assertLogsRequest(
+             url="/does_not_exist_raised/",
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-3.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-3.patch
new file mode 100644
index 0000000000..0517662d50
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-3.patch
@@ -0,0 +1,165 @@
+From 4ac54529e08371c3c20511167258ed18e0a3a7d6 Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Tue, 20 May 2025 15:29:52 -0300
+Subject: [PATCH] [4.2.x] Fixed CVE-2025-48432 -- Escaped formatting arguments
+ in `log_response()`.
+
+Suitably crafted requests containing a CRLF sequence in the request
+path may have allowed log injection, potentially corrupting log files,
+obscuring other attacks, misleading log post-processing tools, or
+forging log entries.
+
+To mitigate this, all positional formatting arguments passed to the
+logger are now escaped using "unicode_escape" encoding.
+
+Thanks to Seokchan Yoon (https://ch4n3.kr/) for the report.
+
+Co-authored-by: Carlton Gibson <carlton@noumenal.es>
+Co-authored-by: Jake Howard <git@theorangeone.net>
+
+Backport of a07ebec5591e233d8bbb38b7d63f35c5479eef0e from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/ac03c5e7df8680c61cdb0d3bdb8be9095dba841e]
+(cherry picked from commit ac03c5e7df8680c61cdb0d3bdb8be9095dba841e)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/utils/log.py          |  7 +++-
+ tests/logging_tests/tests.py | 79 +++++++++++++++++++++++++++++++++++-
+ 2 files changed, 84 insertions(+), 2 deletions(-)
+
+diff --git a/django/utils/log.py b/django/utils/log.py
+index fd0cc1bdc1..d7465f73d7 100644
+--- a/django/utils/log.py
++++ b/django/utils/log.py
+@@ -238,9 +238,14 @@ def log_response(
+         else:
+             level = "info"
+ 
++    escaped_args = tuple(
++        a.encode("unicode_escape").decode("ascii") if isinstance(a, str) else a
++        for a in args
++    )
++
+     getattr(logger, level)(
+         message,
+-        *args,
++        *escaped_args,
+         extra={
+             "status_code": response.status_code,
+             "request": request,
+diff --git a/tests/logging_tests/tests.py b/tests/logging_tests/tests.py
+index 4ffa49a1b8..cda0a62f2c 100644
+--- a/tests/logging_tests/tests.py
++++ b/tests/logging_tests/tests.py
+@@ -94,7 +94,6 @@ class DefaultLoggingTests(
+ 
+ 
+ class LoggingAssertionMixin:
+-
+     def assertLogRecord(
+         self,
+         logger_cm,
+@@ -147,6 +146,14 @@ class HandlerLoggingTests(
+             msg="Not Found: /does_not_exist/",
+         )
+ 
++    def test_control_chars_escaped(self):
++        self.assertLogsRequest(
++            url="/%1B[1;31mNOW IN RED!!!1B[0m/",
++            level="WARNING",
++            status_code=404,
++            msg=r"Not Found: /\x1b[1;31mNOW IN RED!!!1B[0m/",
++        )
++
+     async def test_async_page_not_found_warning(self):
+         logger = "django.request"
+         level = "WARNING"
+@@ -155,6 +162,16 @@ class HandlerLoggingTests(
+ 
+         self.assertLogRecord(cm, level, "Not Found: /does_not_exist/", 404)
+ 
++    async def test_async_control_chars_escaped(self):
++        logger = "django.request"
++        level = "WARNING"
++        with self.assertLogs(logger, level) as cm:
++            await self.async_client.get(r"/%1B[1;31mNOW IN RED!!!1B[0m/")
++
++        self.assertLogRecord(
++            cm, level, r"Not Found: /\x1b[1;31mNOW IN RED!!!1B[0m/", 404
++        )
++
+     def test_page_not_found_raised(self):
+         self.assertLogsRequest(
+             url="/does_not_exist_raised/",
+@@ -686,6 +703,7 @@ class LogResponseRealLoggerTests(TestCase):
+         self.assertEqual(record.levelno, levelno)
+         self.assertEqual(record.status_code, status_code)
+         self.assertEqual(record.request, request)
++        return record
+ 
+     def test_missing_response_raises_attribute_error(self):
+         with self.assertRaises(AttributeError):
+@@ -787,3 +805,62 @@ class LogResponseRealLoggerTests(TestCase):
+         self.assertEqual(
+             f"WARNING:my.custom.logger:{msg}", log_stream.getvalue().strip()
+         )
++
++    def test_unicode_escape_escaping(self):
++        test_cases = [
++            # Control characters.
++            ("line\nbreak", "line\\nbreak"),
++            ("carriage\rreturn", "carriage\\rreturn"),
++            ("tab\tseparated", "tab\\tseparated"),
++            ("formfeed\f", "formfeed\\x0c"),
++            ("bell\a", "bell\\x07"),
++            ("multi\nline\ntext", "multi\\nline\\ntext"),
++            # Slashes.
++            ("slash\\test", "slash\\\\test"),
++            ("back\\slash", "back\\\\slash"),
++            # Quotes.
++            ('quote"test"', 'quote"test"'),
++            ("quote'test'", "quote'test'"),
++            # Accented, composed characters, emojis and symbols.
++            ("café", "caf\\xe9"),
++            ("e\u0301", "e\\u0301"),  # e + combining acute
++            ("smile🙂", "smile\\U0001f642"),
++            ("weird ☃️", "weird \\u2603\\ufe0f"),
++            # Non-Latin alphabets.
++            ("Привет", "\\u041f\\u0440\\u0438\\u0432\\u0435\\u0442"),
++            ("你好", "\\u4f60\\u597d"),
++            # ANSI escape sequences.
++            ("escape\x1b[31mred\x1b[0m", "escape\\x1b[31mred\\x1b[0m"),
++            (
++                "/\x1b[1;31mCAUTION!!YOU ARE PWNED\x1b[0m/",
++                "/\\x1b[1;31mCAUTION!!YOU ARE PWNED\\x1b[0m/",
++            ),
++            (
++                "/\r\n\r\n1984-04-22 INFO    Listening on 0.0.0.0:8080\r\n\r\n",
++                "/\\r\\n\\r\\n1984-04-22 INFO    Listening on 0.0.0.0:8080\\r\\n\\r\\n",
++            ),
++            # Plain safe input.
++            ("normal-path", "normal-path"),
++            ("slash/colon:", "slash/colon:"),
++            # Non strings.
++            (0, "0"),
++            ([1, 2, 3], "[1, 2, 3]"),
++            ({"test": "🙂"}, "{'test': '🙂'}"),
++        ]
++
++        msg = "Test message: %s"
++        for case, expected in test_cases:
++            with self.assertLogs("django.request", level="ERROR") as cm:
++                with self.subTest(case=case):
++                    response = HttpResponse(status=318)
++                    log_response(msg, case, response=response, level="error")
++
++                    record = self.assertResponseLogged(
++                        cm,
++                        msg % expected,
++                        levelno=logging.ERROR,
++                        status_code=318,
++                        request=None,
++                    )
++                    # Log record is always a single line.
++                    self.assertEqual(len(record.getMessage().splitlines()), 1)
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-4.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-4.patch
new file mode 100644
index 0000000000..0ddae4425f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-4.patch
@@ -0,0 +1,193 @@
+From 94e4f9cb936d53d03c65bcc3f28f5f4d82498fdc Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Wed, 4 Jun 2025 16:12:13 -0300
+Subject: [PATCH] [4.2.x] Refactored logging_tests to reuse assertions for log
+ records.
+
+Backport of 9d72e7daf7299ef1ece56fd657a02f77a469efe9 from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/ba24ee34f98cb17d99b1f82bc1ede45ff311a70b]
+(cherry picked from commit ba24ee34f98cb17d99b1f82bc1ede45ff311a70b)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ tests/logging_tests/tests.py | 61 ++++++++++++++----------------------
+ 1 file changed, 24 insertions(+), 37 deletions(-)
+
+diff --git a/tests/logging_tests/tests.py b/tests/logging_tests/tests.py
+index cda0a62f2c..03409094f2 100644
+--- a/tests/logging_tests/tests.py
++++ b/tests/logging_tests/tests.py
+@@ -97,23 +97,28 @@ class LoggingAssertionMixin:
+     def assertLogRecord(
+         self,
+         logger_cm,
+-        level,
+         msg,
++        levelno,
+         status_code,
++        request=None,
+         exc_class=None,
+     ):
+         self.assertEqual(
+             records_len := len(logger_cm.records),
+             1,
+-            f"Wrong number of calls for {logger_cm=} in {level=} (expected 1, got "
++            f"Wrong number of calls for {logger_cm=} in {levelno=} (expected 1, got "
+             f"{records_len}).",
+         )
+         record = logger_cm.records[0]
+         self.assertEqual(record.getMessage(), msg)
++        self.assertEqual(record.levelno, levelno)
+         self.assertEqual(record.status_code, status_code)
++        if request is not None:
++            self.assertEqual(record.request, request)
+         if exc_class:
+             self.assertIsNotNone(record.exc_info)
+             self.assertEqual(record.exc_info[0], exc_class)
++        return record
+ 
+     def assertLogsRequest(
+         self, url, level, msg, status_code, logger="django.request", exc_class=None
+@@ -123,7 +128,9 @@ class LoggingAssertionMixin:
+                 self.client.get(url)
+             except views.UncaughtException:
+                 pass
+-            self.assertLogRecord(cm, level, msg, status_code, exc_class)
++            self.assertLogRecord(
++                cm, msg, getattr(logging, level), status_code, exc_class=exc_class
++            )
+ 
+ 
+ @override_settings(DEBUG=True, ROOT_URLCONF="logging_tests.urls")
+@@ -155,21 +162,17 @@ class HandlerLoggingTests(
+         )
+ 
+     async def test_async_page_not_found_warning(self):
+-        logger = "django.request"
+-        level = "WARNING"
+-        with self.assertLogs(logger, level) as cm:
++        with self.assertLogs("django.request", "WARNING") as cm:
+             await self.async_client.get("/does_not_exist/")
+ 
+-        self.assertLogRecord(cm, level, "Not Found: /does_not_exist/", 404)
++        self.assertLogRecord(cm, "Not Found: /does_not_exist/", logging.WARNING, 404)
+ 
+     async def test_async_control_chars_escaped(self):
+-        logger = "django.request"
+-        level = "WARNING"
+-        with self.assertLogs(logger, level) as cm:
++        with self.assertLogs("django.request", "WARNING") as cm:
+             await self.async_client.get(r"/%1B[1;31mNOW IN RED!!!1B[0m/")
+ 
+         self.assertLogRecord(
+-            cm, level, r"Not Found: /\x1b[1;31mNOW IN RED!!!1B[0m/", 404
++            cm, r"Not Found: /\x1b[1;31mNOW IN RED!!!1B[0m/", logging.WARNING, 404
+         )
+ 
+     def test_page_not_found_raised(self):
+@@ -688,23 +691,9 @@ class LogFormattersTests(SimpleTestCase):
+             )
+ 
+ 
+-class LogResponseRealLoggerTests(TestCase):
++class LogResponseRealLoggerTests(LoggingAssertionMixin, TestCase):
+     request = RequestFactory().get("/test-path/")
+ 
+-    def assertResponseLogged(self, logger_cm, msg, levelno, status_code, request):
+-        self.assertEqual(
+-            records_len := len(logger_cm.records),
+-            1,
+-            f"Unexpected number of records for {logger_cm=} in {levelno=} (expected 1, "
+-            f"got {records_len}).",
+-        )
+-        record = logger_cm.records[0]
+-        self.assertEqual(record.getMessage(), msg)
+-        self.assertEqual(record.levelno, levelno)
+-        self.assertEqual(record.status_code, status_code)
+-        self.assertEqual(record.request, request)
+-        return record
+-
+     def test_missing_response_raises_attribute_error(self):
+         with self.assertRaises(AttributeError):
+             log_response("No response provided", response=None, request=self.request)
+@@ -713,7 +702,7 @@ class LogResponseRealLoggerTests(TestCase):
+         response = HttpResponse(status=403)
+         with self.assertLogs("django.request", level="INFO") as cm:
+             log_response(msg := "Missing request", response=response, request=None)
+-        self.assertResponseLogged(cm, msg, logging.WARNING, 403, request=None)
++        self.assertLogRecord(cm, msg, logging.WARNING, 403, request=None)
+ 
+     def test_logs_5xx_as_error(self):
+         response = HttpResponse(status=508)
+@@ -721,7 +710,7 @@ class LogResponseRealLoggerTests(TestCase):
+             log_response(
+                 msg := "Server error occurred", response=response, request=self.request
+             )
+-        self.assertResponseLogged(cm, msg, logging.ERROR, 508, self.request)
++        self.assertLogRecord(cm, msg, logging.ERROR, 508, self.request)
+ 
+     def test_logs_4xx_as_warning(self):
+         response = HttpResponse(status=418)
+@@ -729,13 +718,13 @@ class LogResponseRealLoggerTests(TestCase):
+             log_response(
+                 msg := "This is a teapot!", response=response, request=self.request
+             )
+-        self.assertResponseLogged(cm, msg, logging.WARNING, 418, self.request)
++        self.assertLogRecord(cm, msg, logging.WARNING, 418, self.request)
+ 
+     def test_logs_2xx_as_info(self):
+         response = HttpResponse(status=201)
+         with self.assertLogs("django.request", level="INFO") as cm:
+             log_response(msg := "OK response", response=response, request=self.request)
+-        self.assertResponseLogged(cm, msg, logging.INFO, 201, self.request)
++        self.assertLogRecord(cm, msg, logging.INFO, 201, self.request)
+ 
+     def test_custom_log_level(self):
+         response = HttpResponse(status=403)
+@@ -746,14 +735,14 @@ class LogResponseRealLoggerTests(TestCase):
+                 request=self.request,
+                 level="debug",
+             )
+-        self.assertResponseLogged(cm, msg, logging.DEBUG, 403, self.request)
++        self.assertLogRecord(cm, msg, logging.DEBUG, 403, self.request)
+ 
+     def test_logs_only_once_per_response(self):
+         response = HttpResponse(status=500)
+         with self.assertLogs("django.request", level="ERROR") as cm:
+             log_response("First log", response=response, request=self.request)
+             log_response("Second log", response=response, request=self.request)
+-        self.assertResponseLogged(cm, "First log", logging.ERROR, 500, self.request)
++        self.assertLogRecord(cm, "First log", logging.ERROR, 500, self.request)
+ 
+     def test_exc_info_output(self):
+         response = HttpResponse(status=500)
+@@ -767,9 +756,7 @@ class LogResponseRealLoggerTests(TestCase):
+                     request=self.request,
+                     exception=exc,
+                 )
+-        self.assertResponseLogged(
+-            cm, "With exception", logging.ERROR, 500, self.request
+-        )
++        self.assertLogRecord(cm, "With exception", logging.ERROR, 500, self.request)
+         self.assertIn("ValueError", "\n".join(cm.output))  # Stack trace included
+ 
+     def test_format_args_are_applied(self):
+@@ -783,7 +770,7 @@ class LogResponseRealLoggerTests(TestCase):
+                 request=self.request,
+             )
+         msg = "Something went wrong: DB error (42)"
+-        self.assertResponseLogged(cm, msg, logging.ERROR, 500, self.request)
++        self.assertLogRecord(cm, msg, logging.ERROR, 500, self.request)
+ 
+     def test_logs_with_custom_logger(self):
+         handler = logging.StreamHandler(log_stream := StringIO())
+@@ -855,7 +842,7 @@ class LogResponseRealLoggerTests(TestCase):
+                     response = HttpResponse(status=318)
+                     log_response(msg, case, response=response, level="error")
+ 
+-                    record = self.assertResponseLogged(
++                    record = self.assertLogRecord(
+                         cm,
+                         msg % expected,
+                         levelno=logging.ERROR,
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-5.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-5.patch
new file mode 100644
index 0000000000..802ee7ab6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-5.patch
@@ -0,0 +1,76 @@
+From b9a4ffb7297db5746cbc7894fb5bf3b835503e2c Mon Sep 17 00:00:00 2001
+From: Natalia <124304+nessita@users.noreply.github.com>
+Date: Thu, 5 Jun 2025 10:07:17 -0300
+Subject: [PATCH] [4.2.x] Refs CVE-2025-48432 -- Made SuspiciousOperation
+ logging use log_response() for consistency.
+
+Backport of ff835f439cb1ecd8d74a24de12e3c03e5477dc9d from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/10ba3f78da2e22bd232dc085e2a8a7c293c3fb73]
+(cherry picked from commit 10ba3f78da2e22bd232dc085e2a8a7c293c3fb73)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/core/handlers/exception.py | 21 +++++++++++----------
+ tests/logging_tests/tests.py      |  9 +++++++++
+ 2 files changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/django/core/handlers/exception.py b/django/core/handlers/exception.py
+index a63291f3b9..1243734705 100644
+--- a/django/core/handlers/exception.py
++++ b/django/core/handlers/exception.py
+@@ -116,16 +116,6 @@ def response_for_exception(request, exc):
+             # exception would be raised.
+             request._mark_post_parse_error()
+ 
+-        # The request logger receives events for any problematic request
+-        # The security logger receives events for all SuspiciousOperations
+-        security_logger = logging.getLogger(
+-            "django.security.%s" % exc.__class__.__name__
+-        )
+-        security_logger.error(
+-            str(exc),
+-            exc_info=exc,
+-            extra={"status_code": 400, "request": request},
+-        )
+         if settings.DEBUG:
+             response = debug.technical_500_response(
+                 request, *sys.exc_info(), status_code=400
+@@ -134,6 +124,17 @@ def response_for_exception(request, exc):
+             response = get_exception_response(
+                 request, get_resolver(get_urlconf()), 400, exc
+             )
++        # The logger is set to django.security, which specifically captures
++        # SuspiciousOperation events, unlike the default django.request logger.
++        security_logger = logging.getLogger(f"django.security.{exc.__class__.__name__}")
++        log_response(
++            str(exc),
++            exception=exc,
++            request=request,
++            response=response,
++            level="error",
++            logger=security_logger,
++        )
+ 
+     else:
+         signals.got_request_exception.send(sender=None, request=request)
+diff --git a/tests/logging_tests/tests.py b/tests/logging_tests/tests.py
+index 03409094f2..bc88749fb7 100644
+--- a/tests/logging_tests/tests.py
++++ b/tests/logging_tests/tests.py
+@@ -597,6 +597,15 @@ class SecurityLoggerTest(LoggingAssertionMixin, SimpleTestCase):
+         self.assertEqual(len(mail.outbox), 1)
+         self.assertIn("SuspiciousOperation at /suspicious/", mail.outbox[0].body)
+ 
++    def test_response_logged(self):
++        with self.assertLogs("django.security.SuspiciousOperation", "ERROR") as handler:
++            response = self.client.get("/suspicious/")
++
++        self.assertLogRecord(
++            handler, "dubious", logging.ERROR, 400, request=response.wsgi_request
++        )
++        self.assertEqual(response.status_code, 400)
++
+ 
+ class SettingsCustomLoggingTest(AdminScriptTestCase):
+     """
diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-6.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-6.patch
new file mode 100644
index 0000000000..5c7d171eb1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-48432-6.patch
@@ -0,0 +1,167 @@
+From 0d9ccded8c0e3a7acf608d48de2cedf6b44e6b01 Mon Sep 17 00:00:00 2001
+From: Jake Howard <git@theorangeone.net>
+Date: Wed, 4 Jun 2025 16:08:46 +0100
+Subject: [PATCH] [4.2.x] Refs CVE-2025-48432 -- Prevented log injection in
+ remaining response logging.
+
+Migrated remaining response-related logging to use the `log_response()`
+helper to avoid potential log injection, to ensure untrusted values like
+request paths are safely escaped.
+
+Co-authored-by: Natalia <124304+nessita@users.noreply.github.com>
+
+Backport of 957951755259b412d5113333b32bf85871d29814 from main.
+
+CVE: CVE-2025-48432
+Upstream-Status: Backport [https://github.com/django/django/commit/b597d46bb19c8567615e62029210dab16c70db7d]
+(cherry picked from commit b597d46bb19c8567615e62029210dab16c70db7d)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/views/generic/base.py     | 15 ++++++------
+ docs/releases/4.2.23.txt         | 14 +++++++++++
+ tests/generic_views/test_base.py | 40 ++++++++++++++++++++++++++++++--
+ 3 files changed, 60 insertions(+), 9 deletions(-)
+ create mode 100644 docs/releases/4.2.23.txt
+
+diff --git a/django/views/generic/base.py b/django/views/generic/base.py
+index 8f8f9397e8..8412288be1 100644
+--- a/django/views/generic/base.py
++++ b/django/views/generic/base.py
+@@ -14,6 +14,7 @@ from django.template.response import TemplateResponse
+ from django.urls import reverse
+ from django.utils.decorators import classonlymethod
+ from django.utils.functional import classproperty
++from django.utils.log import log_response
+ 
+ logger = logging.getLogger("django.request")
+ 
+@@ -143,13 +144,14 @@ class View:
+         return handler(request, *args, **kwargs)
+ 
+     def http_method_not_allowed(self, request, *args, **kwargs):
+-        logger.warning(
++        response = HttpResponseNotAllowed(self._allowed_methods())
++        log_response(
+             "Method Not Allowed (%s): %s",
+             request.method,
+             request.path,
+-            extra={"status_code": 405, "request": request},
++            response=response,
++            request=request,
+         )
+-        response = HttpResponseNotAllowed(self._allowed_methods())
+ 
+         if self.view_is_async:
+ 
+@@ -261,10 +263,9 @@ class RedirectView(View):
+             else:
+                 return HttpResponseRedirect(url)
+         else:
+-            logger.warning(
+-                "Gone: %s", request.path, extra={"status_code": 410, "request": request}
+-            )
+-            return HttpResponseGone()
++            response = HttpResponseGone()
++            log_response("Gone: %s", request.path, response=response, request=request)
++            return response
+ 
+     def head(self, request, *args, **kwargs):
+         return self.get(request, *args, **kwargs)
+diff --git a/docs/releases/4.2.23.txt b/docs/releases/4.2.23.txt
+new file mode 100644
+index 0000000000..e4232f9bea
+--- /dev/null
++++ b/docs/releases/4.2.23.txt
+@@ -0,0 +1,14 @@
++===========================
++Django 4.2.23 release notes
++===========================
++
++*June 10, 2025*
++
++Django 4.2.23 fixes a potential log injection issue in 4.2.22.
++
++Bugfixes
++========
++
++* Fixed a log injection possibility by migrating remaining response logging
++  to ``django.utils.log.log_response()``, which safely escapes arguments such
++  as the request path to prevent unsafe log output (:cve:`2025-48432`).
+diff --git a/tests/generic_views/test_base.py b/tests/generic_views/test_base.py
+index add485245a..3cd1ae6a5c 100644
+--- a/tests/generic_views/test_base.py
++++ b/tests/generic_views/test_base.py
+@@ -1,5 +1,8 @@
++import logging
+ import time
+ 
++from logging_tests.tests import LoggingAssertionMixin
++
+ from django.core.exceptions import ImproperlyConfigured
+ from django.http import HttpResponse
+ from django.test import RequestFactory, SimpleTestCase, override_settings
+@@ -63,7 +66,7 @@ class InstanceView(View):
+         return self
+ 
+ 
+-class ViewTest(SimpleTestCase):
++class ViewTest(LoggingAssertionMixin, SimpleTestCase):
+     rf = RequestFactory()
+ 
+     def _assert_simple(self, response):
+@@ -297,6 +300,25 @@ class ViewTest(SimpleTestCase):
+         response = view.dispatch(self.rf.head("/"))
+         self.assertEqual(response.status_code, 405)
+ 
++    def test_method_not_allowed_response_logged(self):
++        for path, escaped in [
++            ("/foo/", "/foo/"),
++            (r"/%1B[1;31mNOW IN RED!!!1B[0m/", r"/\x1b[1;31mNOW IN RED!!!1B[0m/"),
++        ]:
++            with self.subTest(path=path):
++                request = self.rf.get(path, REQUEST_METHOD="BOGUS")
++                with self.assertLogs("django.request", "WARNING") as handler:
++                    response = SimpleView.as_view()(request)
++
++                self.assertLogRecord(
++                    handler,
++                    f"Method Not Allowed (BOGUS): {escaped}",
++                    logging.WARNING,
++                    405,
++                    request,
++                )
++                self.assertEqual(response.status_code, 405)
++
+ 
+ @override_settings(ROOT_URLCONF="generic_views.urls")
+ class TemplateViewTest(SimpleTestCase):
+@@ -425,7 +447,7 @@ class TemplateViewTest(SimpleTestCase):
+ 
+ 
+ @override_settings(ROOT_URLCONF="generic_views.urls")
+-class RedirectViewTest(SimpleTestCase):
++class RedirectViewTest(LoggingAssertionMixin, SimpleTestCase):
+     rf = RequestFactory()
+ 
+     def test_no_url(self):
+@@ -549,6 +571,20 @@ class RedirectViewTest(SimpleTestCase):
+         response = view.dispatch(self.rf.head("/foo/"))
+         self.assertEqual(response.status_code, 410)
+ 
++    def test_gone_response_logged(self):
++        for path, escaped in [
++            ("/foo/", "/foo/"),
++            (r"/%1B[1;31mNOW IN RED!!!1B[0m/", r"/\x1b[1;31mNOW IN RED!!!1B[0m/"),
++        ]:
++            with self.subTest(path=path):
++                request = self.rf.get(path)
++                with self.assertLogs("django.request", "WARNING") as handler:
++                    RedirectView().dispatch(request)
++
++                self.assertLogRecord(
++                    handler, f"Gone: {escaped}", logging.WARNING, 410, request
++                )
++
+ 
+ class GetContextDataTest(SimpleTestCase):
+     def test_get_context_data_super(self):
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 39451dd07e..ae99758543 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -4,6 +4,12 @@ inherit setuptools3
 SRC_URI += " \
     file://fix-regression-introduced-when-fixing-CVE-2025-26699.patch \
     file://CVE-2025-32873.patch \
+    file://CVE-2025-48432-1.patch \
+    file://CVE-2025-48432-2.patch \
+    file://CVE-2025-48432-3.patch \
+    file://CVE-2025-48432-4.patch \
+    file://CVE-2025-48432-5.patch \
+    file://CVE-2025-48432-6.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

