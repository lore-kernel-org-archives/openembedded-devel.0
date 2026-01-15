Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EE9D33A09
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:29:31 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31199.1768465761957947650
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JgSeeGsf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4327555464cso314668f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 00:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768465760; x=1769070560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLnidfzDQQENQVOtccrD8CC7KKoprRKmu9qbXvFhZik=;
        b=JgSeeGsfOtGu/+yjr7VO4CmSk+fxf46RYTwu107dlE1sjXkOvjK3I4PsaILaZJnh41
         GRLHFsSbEN1Y17TZHdkzZvZy0/CKV6QSvYvH3OaPFUCPxzBnRIQyFjEvHQB0tNrBvoi3
         +2kZXIUwgSE8UkHYDd9mKDqwIIMBpjg3JItHjPtwPWBDbDjQfJC8ZjT0izwd+s4YXuov
         Ymbe/iFqwY83jKME5LAGLWJpqYHRedoY/c5Yz3XIvhKMhH2SnIaocZiE/der9FwxAuL2
         MNVkx6IUcSiwGbL/FGfqEqFIs5zNKwe71VDtqUZDW+5x1UcRSLzNXlL8Mt1YqPzJnfzY
         fubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768465760; x=1769070560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLnidfzDQQENQVOtccrD8CC7KKoprRKmu9qbXvFhZik=;
        b=QxYJogZHGJ55swVHpayt1GJBEARI9vEF3g4FrUrb1n4dagt2hCqyjOC9qJ2CBNbGlu
         NTTYucXTptzvXQ1IlKJC0evoU5qpEhv0aUvRVEe9Jlk/xGG+WPWLPdXrDqpDQ6NR4wi9
         x2qOJXs0arg19HM71b6m4d5Qh3TFwo8vt53RTeooGMO6UjIe4AfUcYymEoMqePhBdDSB
         wKtEzO2frIAQtWJr6boIIq46f2yKew769/wx4Ppx6GnnSwZeZU21GqAIPCWSKWgOmdpu
         vz9tE9cO9WA/H3KgdHpH9/LdG0uXBHtel/kbTSFMhOIkYO0kb1lMFVbgKnN1vmABfa21
         JiQA==
X-Gm-Message-State: AOJu0YxGIz0IT8K2pHXRiANAKXO0ieXf1vqtB9CJi4jKDknJJFexSF6m
	QDdS95YkkYZuNUOKDC+yw9ii6xn1GoQvyw8vcbISKafNX0WI8NH8mOsLsdMyMw==
X-Gm-Gg: AY/fxX6TbzIdLX+JdIM9BtWhXJZ0gsW9zjTXPdlKPRmd00K9i2ZwtUyD+f/UzslSXKa
	U/leAsVlIQwyVskXJIjjgECTlUMLMbymzUU9p858FprI5sfT+Fcttj89n7PMPIw2BNchwJ+72eM
	ww6lXLJmLo1jS+RQeWn7o/CPO3jbQmPXfbAJiHw2bDJdXo838/k5y86VNSCFDqLu+iuuf2ChUTM
	vR38HgZ6RYFoceMs/k1aEbvA8vEnfodGxd1sHczHBIvxUZyqetOeRtDEuDfvX1B7Ny+uywbGbmL
	9HhtrIok/u1hdG0+hJtMdXoOksTEbrxev7nJjCJbHR6kdSo76P13Jov2+RJ1u5FL3qV9V2dq2Rp
	wgFF7rUIynN7IrdWk3f+N0RFFqYkaivu1ZiHDE0oFPmomDyojd2fcrtdxRE4tda8Nku+KngiafR
	VB2qpFarFf
X-Received: by 2002:a05:6000:2284:b0:42b:3b55:8929 with SMTP id ffacd0b85a97d-4342c4f492cmr6419934f8f.19.1768465760060;
        Thu, 15 Jan 2026 00:29:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d90aasm4310083f8f.29.2026.01.15.00.29.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:29:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-django: fix tests
Date: Thu, 15 Jan 2026 09:29:13 +0100
Message-ID: <20260115082915.2357544-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082915.2357544-1-skandigraun@gmail.com>
References: <20260115082915.2357544-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123497

These patches are for python3-django_2.2.28

These patches only touch the tests folder, which is normally not installed.

Most of these changes are backported patches, that adapt tests to modern(er)
Python environment than they were written for, and some other just fix a bug
in the tests that were always present.

0001-Fix-tag_strip-tests.patch: The html parser's behavior in Python has changed
since 3.9, making this testcase fail. This is a partial backport of the patch,
which handles only the Python version that is shipped with oe-core (The original
patch handles both old and new versions)

0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch: SQLite3's behavior
has changed also since the tests were written, making some testcases fail. This
backported patch fixes that.

0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch: this backported
patch makes a test-verification conform to html5 standard. Previously the test failed.

0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch: This backported
patch once again adapts a test to an evolved library. tblib's behavior has changed
in a way that the tests couldn't pickle the exceptions from the library, and the
tests that verify exceptions were failing due to this.

0001-fix-quote-type-in-expected-error-message.patch: This is not a backported patch.
Error messages are localized, and a test verifies an error message that contains
a quote. The test expects double quotes, but the default locale used with the testimage
is using single quotes. Since the test and the expected error message are correct
otherwise, just changed this expected quote in the test.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fix-tag_strip-tests.patch            | 37 ++++++++++++
 ...tests.InspectDBTestCase.test_custom_.patch | 45 ++++++++++++++
 ....tests.HTMLEqualTests.test_parsing_e.patch | 32 ++++++++++
 ...esultTest.test_pickle_errors_detecti.patch | 59 +++++++++++++++++++
 ...quote-type-in-expected-error-message.patch | 31 ++++++++++
 .../python/python3-django_2.2.28.bb           |  5 ++
 6 files changed, 209 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tests.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in-expected-error-message.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tests.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tests.patch
new file mode 100644
index 0000000000..be5d11e0ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tests.patch
@@ -0,0 +1,37 @@
+From bd3ffbbacceef7fabd3135ca90eba1397e2b5901 Mon Sep 17 00:00:00 2001
+From: Your Name <you@example.com>
+Date: Tue, 13 Jan 2026 20:07:35 +0000
+Subject: [PATCH] Fix tag_strip tests
+
+Python's htmlparser behavior changed between python versions, and
+the tests expect incorrect result due to this.
+
+This patch is a partial backport, to use only the results that are
+valid for the OE Python version.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/2980627502c84a9fd09272e1349dc574a2ff1fb1]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/utils_tests/test_html.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
+index 86f5562..71757ad 100644
+--- a/tests/utils_tests/test_html.py
++++ b/tests/utils_tests/test_html.py
+@@ -89,10 +89,10 @@ class TestUtilsHtml(SimpleTestCase):
+             ('&gotcha&#;<>', '&gotcha&#;<>'),
+             ('<sc<!-- -->ript>test<<!-- -->/script>', 'ript>test'),
+             ('<script>alert()</script>&h', 'alert()h'),
+-            ('><!' + ('&' * 16000) + 'D', '><!' + ('&' * 16000) + 'D'),
++            ('><!' + ('&' * 16000) + 'D', '>'),
+             ('X<<<<br>br>br>br>X', 'XX'),
+             ("<" * 50 + "a>" * 50, ""),
+-            (">" + "<a" * 500 + "a", ">" + "<a" * 500 + "a"),
++            (">" + "<a" * 500 + "a", ">"),
+             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
+             ("<" + "a" * 1_002, "<" + "a" * 1_002),
+         )
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch
new file mode 100644
index 0000000000..e84fc303bb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch
@@ -0,0 +1,45 @@
+From 1d3a464a2e7db2eaa6e63fa806cea45bff3365b2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 9 Dec 2021 20:24:38 +0100
+Subject: [PATCH] Fixed inspectdb.tests.InspectDBTestCase.test_custom_fields()
+ on SQLite 3.37+.
+
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+
+Use FlexibleFieldLookupDict which is case-insensitive mapping because
+SQLite 3.37+ returns some data type names upper-cased e.g. TEXT.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/974e3b8750fe96c16c9c0b115a72ee4a2171df34]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/inspectdb/tests.py | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/tests/inspectdb/tests.py b/tests/inspectdb/tests.py
+index bb5e457..a2519cf 100644
+--- a/tests/inspectdb/tests.py
++++ b/tests/inspectdb/tests.py
+@@ -256,18 +256,17 @@ class InspectDBTestCase(TestCase):
+         Introspection of columns with a custom field (#21090)
+         """
+         out = StringIO()
+-        orig_data_types_reverse = connection.introspection.data_types_reverse
+-        try:
+-            connection.introspection.data_types_reverse = {
++        with mock.patch(
++            'django.db.connection.introspection.data_types_reverse.base_data_types_reverse',
++            {
+                 'text': 'myfields.TextField',
+                 'bigint': 'BigIntegerField',
+-            }
++            },
++        ):
+             call_command('inspectdb', 'inspectdb_columntypes', stdout=out)
+             output = out.getvalue()
+             self.assertIn("text_field = myfields.TextField()", output)
+             self.assertIn("big_int_field = models.BigIntegerField()", output)
+-        finally:
+-            connection.introspection.data_types_reverse = orig_data_types_reverse
+ 
+     def test_introspection_errors(self):
+         """
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
new file mode 100644
index 0000000000..a84a118bcb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch
@@ -0,0 +1,32 @@
+From 744927154e6748db08f5232de78ee0d4a8be61a5 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 21 Jul 2025 15:23:32 -0300
+Subject: [PATCH] Fixed test_utils.tests.HTMLEqualTests.test_parsing_errors
+ following Python's HTMLParser fixed parsing.
+
+From: Natalia <124304+nessita@users.noreply.github.com>
+
+Further details about Python changes can be found in:
+https://github.com/python/cpython/commit/0243f97cbadec8d985e63b1daec5d1cbc850cae3.
+
+Thank you Clifford Gama for the thorough review!
+
+Upstream-Status: Backport [https://github.com/django/django/commit/e4515dad7a6d953c0bd2414127ba36e1446ff41a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_utils/tests.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test_utils/tests.py b/tests/test_utils/tests.py
+index a1a113a..d1a1e35 100644
+--- a/tests/test_utils/tests.py
++++ b/tests/test_utils/tests.py
+@@ -736,7 +736,7 @@ class HTMLEqualTests(SimpleTestCase):
+             "('Unexpected end tag `div` (Line 1, Column 6)', (1, 6))"
+         )
+         with self.assertRaisesMessage(AssertionError, error_msg):
+-            self.assertHTMLEqual('< div></ div>', '<div></div>')
++            self.assertHTMLEqual('< div></div>', '<div></div>')
+         with self.assertRaises(HTMLParseError):
+             parse_html('</p>')
+ 
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch b/meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch
new file mode 100644
index 0000000000..f515494254
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch
@@ -0,0 +1,59 @@
+From 80d06be0a5dc82d8cf8dd8105b6734c188743fae Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 21 Oct 2025 21:11:44 +0200
+Subject: [PATCH] Made RemoteTestResultTest.test_pickle_errors_detection()
+ compatible with tblib 3.2+.
+
+From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
+
+tblib 3.2+ makes exception subclasses with __init__() and the default
+__reduce__() picklable. This broke the test for
+RemoteTestResult._confirm_picklable(), which expects a specific
+exception to fail unpickling.
+
+https://github.com/ionelmc/python-tblib/blob/master/CHANGELOG.rst#320-2025-10-21
+
+This fix defines ExceptionThatFailsUnpickling.__reduce__() in a way
+that pickle.dumps(obj) succeeds, but pickle.loads(pickle.dumps(obj))
+raises TypeError.
+
+Refs #27301. This preserves the intent of the regression test from
+52188a5ca6bafea0a66f17baacb315d61c7b99cd without skipping it.
+
+Upstream-Status: Backport [https://github.com/django/django/commit/548209e620b3ca34396a360453f07c8dbb8aa6c7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_runner/test_parallel.py | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/tests/test_runner/test_parallel.py b/tests/test_runner/test_parallel.py
+index c1a89bd..7c72216 100644
+--- a/tests/test_runner/test_parallel.py
++++ b/tests/test_runner/test_parallel.py
+@@ -1,3 +1,4 @@
++import pickle
+ import unittest
+
+ from django.test import SimpleTestCase
+@@ -18,6 +19,12 @@ class ExceptionThatFailsUnpickling(Exception):
+     def __init__(self, arg):
+         super().__init__()
+ 
++    def __reduce__(self):
++        # tblib 3.2+ makes exception subclasses picklable by default.
++        # Return (cls, ()) so the constructor fails on unpickle, preserving
++        # the needed behavior for test_pickle_errors_detection.
++        return (self.__class__, ())
++
+ 
+ class ParallelTestRunnerTest(SimpleTestCase):
+     """
+@@ -59,6 +66,8 @@ class RemoteTestResultTest(SimpleTestCase):
+         result = RemoteTestResult()
+         result._confirm_picklable(picklable_error)
+ 
++        # The exception can be pickled but not unpickled.
++        pickle.dumps(not_unpicklable_error)
+         msg = '__init__() missing 1 required positional argument'
+         with self.assertRaisesMessage(TypeError, msg):
+             result._confirm_picklable(not_unpicklable_error)
diff --git a/meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in-expected-error-message.patch b/meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in-expected-error-message.patch
new file mode 100644
index 0000000000..617d63aa35
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in-expected-error-message.patch
@@ -0,0 +1,31 @@
+From 5cae184e0d57dacae25439e533c4e1ef6f6c4cae Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 13 Jan 2026 23:31:06 +0100
+Subject: [PATCH] fix quote type in expected error message
+
+Instead of double quotes the error is returned with single quotes.
+This is localization dependent, comes from a po file - some locales use
+single quotes, other are translated with double quotes. The default
+locale used with the OE ptest image uses single quotes - adapt the test
+to this.
+
+Upstream-Status: Inappropriate [This is not a nice solution. Hardcoding single quotes is not better than the original]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/forms_tests/field_tests/test_filefield.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/forms_tests/field_tests/test_filefield.py b/tests/forms_tests/field_tests/test_filefield.py
+index ba559ee..3880e11 100644
+--- a/tests/forms_tests/field_tests/test_filefield.py
++++ b/tests/forms_tests/field_tests/test_filefield.py
+@@ -144,7 +144,7 @@ class MultipleFileFieldTest(SimpleTestCase):
+             evil_files[i:] + evil_files[:i]  # Rotate by i.
+             for i in range(len(evil_files))
+         )
+-        msg = "File extension “sh” is not allowed. Allowed extensions are: "
++        msg = "File extension 'sh' is not allowed. Allowed extensions are: "
+         for rotated_evil_files in evil_rotations:
+             with self.assertRaisesMessage(ValidationError, msg):
+                 f.clean(rotated_evil_files)
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 0f6f8fc4d0..dedb2498cb 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -39,6 +39,11 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://0001-fix-ipv6-test.patch \
             file://0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch \
             file://0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch \
+            file://0001-Fix-tag_strip-tests.patch \
+            file://0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch \
+            file://0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch \
+            file://0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch \
+            file://0001-fix-quote-type-in-expected-error-message.patch \
             "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"

