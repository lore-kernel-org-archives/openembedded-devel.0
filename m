Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8712.1792580475860865279
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RZlV+8Xl;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so353004f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580474; x=1793185274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtHwlEy3VGelrKA9oIE/1LtcxD+5HxpulY4SUN0kdT0=;
        b=RZlV+8XlNkyavW9moxAJ9rJ3IjNPJKG/IqHSL+r42EonyjLDgSH583FlBVa9lnG62F
         ifLnM1i4pD2WOLYno7aDCOwbF4oxpqDvfkodXWyaA4jSvLWKzHLApJJcUFK5JfcpxEvx
         mCUA4mTKYKsHwJdVJhIY2JqmVQ0K88QSfQS4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580474; x=1793185274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtHwlEy3VGelrKA9oIE/1LtcxD+5HxpulY4SUN0kdT0=;
        b=K9DCLhp1Ri7tbhYQoPIhAkSpL/SnTc+zAsrcQasYvJHi1r2v+9Y9t9aDV9QGrJhsyA
         fR/izRtyJg4Qyc1tCy2izvggjdGjwP5LhU0I3CisNbLbQhewHmVFytLGtPsxPfEM6kMY
         3ZyY26F/JLtY6uQK6kmtqdLjIJ/3tK7hY4/Wq1629kVIGPMWiERwJr6fU528YBaAo0Zb
         8gFXfJnlPwLcdjA0xdoaaKFmxkegRH1dNc5LEoN03FMCxCKzzGn9a5iDTCnvfXdRT5Eg
         9q8MPBy62ZIuWhHfBVWeFym7xKuqkGOajqfse1vxd39/j9dfx5AiXYEBdXOoOJ4DEzWU
         A5WQ==
X-Gm-Message-State: AFq9FYIrW8Ix+cFRPudBzvZjCH8IdXPRg+73Ni9S0cNetKk9daCp6BgH
	l70GNR/jsubFIxTWccAKFSiP7DbaZvJ9BC5qudFnlQY9GX0BKyGYngp2XWTEEe0MWXAPv2whwG0
	dRGTs
X-Gm-Gg: AYBFou1jR0FfmUgV1P9G+Hlhg2TmEWEQ7ppUwin6KXXZqm5Y1BZPqViWyQxhbrN3VKW
	qpq+c6U4hmHHRqBQMM3fwiRE2GTjOmnovC1HihdXClLdICPFbXOmlkGJ+4RKYrVD+LIGL6wctDv
	gTopADLkAJOrEwVxIXMX1d1cOVTZBuc+E9/E8+YBaBrmzCqXka04GvRKrQ2WjrZZXr8wYuwL5PS
	AIubKn+7JxMZKUi3EcIrDxO2iNDVL8flS7IbxeuA1GBdqIVgQWi/+BCcbHS+bGtGXNQANUEmTip
	3tEZVC9KmOcx4/EzLNqQ6BbIxPk7lI8JVECTN+ud+KfWqMxmxY2lp7SiGk62vZ2ROiQFVAWipCJ
	aH3TxYAk1p1LcSnsDwkTleQ017JLkVGfg2fyp0fCZpLAVjxkejM7mPGdtcbayUD+n5NFR2IEhgn
	n6CsQihDuC0NXV7pgtIngyg82w9zfMeOasIVh/8JLMMEZIY7lsHidL2ApWLxu+kAojjYO4DrFYU
	ZDlzjLp3i30cWYkgGx+hqmX0kL6JLaJE/hMmnjD0CYIWW6qfT557SGHixeyJ2GweYH9k7rtG6M+
	TNx+7S+CFJfa6/Jq+ugg49nJcALHbbRiewdgDHuLn2zF7K9t5q/YJoGbIn+qpdtxuY/DjfMCLf0
	GfTf2Gg==
X-Received: by 2002:a05:6000:4552:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-48e264ce798mr2174727f8f.43.1792580472264;
        Wed, 21 Oct 2026 04:01:12 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/36] python3-django: Upgrade 5.2.18 -> 6.1.2
Date: Wed, 21 Oct 2026 14:00:27 +0300
Message-ID: <20261021110103.1943456-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131261
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.1.2 which fixes:

- CVE-2026-77050: Potential denial-of-service vulnerability in
  get_supported_language_variant()
- CVE-2026-84429: Potential denial-of-service vulnerability in
  HTTP header parsing
- CVE-2026-87890: Potential request forgery via spatial lookup
  byte values
- CVE-2026-87975: Privilege abuse in model formsets with editable
  primary keys

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...sgfmt_error_including_non_ascii-test.patch | 71 -------------------
 .../python/python3-django_5.2.18.bb           |  5 --
 .../python/python3-django_6.1.2.bb            |  4 ++
 3 files changed, 4 insertions(+), 76 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.18.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_6.1.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch b/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
deleted file mode 100644
index 6f887b3015..0000000000
--- a/meta-python/recipes-devtools/python/python3-django/0001-fix-test_msgfmt_error_including_non_ascii-test.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 1960ecd879ce351226b36e7ac0aa25616241b6f6 Mon Sep 17 00:00:00 2001
-From: Jericho Serrano <118679068+jericho1050@users.noreply.github.com>
-Date: Fri, 6 Jun 2025 04:58:29 +0800
-Subject: [PATCH] Fixed #36421 -- Made test_msgfmt_error_including_non_ascii
- compatible with msgfmt 0.25.
-
-Upstream-Status: Backport [https://github.com/django/django/commit/1960ecd879ce351226b36e7ac0aa25616241b6f6]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- tests/i18n/test_compilation.py | 25 +++++++++++++++++++++++--
- 1 file changed, 23 insertions(+), 2 deletions(-)
-
-diff --git a/tests/i18n/test_compilation.py b/tests/i18n/test_compilation.py
-index 4b0bb9f6bb16..3a57dbf0765f 100644
---- a/tests/i18n/test_compilation.py
-+++ b/tests/i18n/test_compilation.py
-@@ -1,5 +1,6 @@
- import gettext as gettext_module
- import os
-+import re
- import stat
- import unittest
- from io import StringIO
-@@ -8,10 +9,12 @@
- from unittest import mock
- 
- from django.core.management import CommandError, call_command, execute_from_command_line
--from django.core.management.utils import find_command
-+from django.core.management.utils import find_command, popen_wrapper
- from django.test import SimpleTestCase, override_settings
- from django.test.utils import captured_stderr, captured_stdout
- from django.utils import translation
-+from django.utils.encoding import DEFAULT_LOCALE_ENCODING
-+from django.utils.functional import cached_property
- from django.utils.translation import gettext
- 
- from .utils import RunInTmpDirMixin, copytree
-@@ -254,6 +257,17 @@ def test_no_dirs_accidentally_skipped(self):
- 
- 
- class CompilationErrorHandling(MessageCompilationTests):
-+    @cached_property
-+    def msgfmt_version(self):
-+        # Note that msgfmt is installed via GNU gettext tools, hence the msgfmt
-+        # version should align to gettext.
-+        out, err, status = popen_wrapper(
-+            ["msgfmt", "--version"],
-+            stdout_encoding=DEFAULT_LOCALE_ENCODING,
-+        )
-+        m = re.search(r"(\d+)\.(\d+)\.?(\d+)?", out)
-+        return tuple(int(d) for d in m.groups() if d is not None)
-+
-     def test_error_reported_by_msgfmt(self):
-         # po file contains wrong po formatting.
-         with self.assertRaises(CommandError):
-@@ -278,7 +292,14 @@ def test_msgfmt_error_including_non_ascii(self):
-                 call_command(
-                     "compilemessages", locale=["ko"], stdout=StringIO(), stderr=stderr
-                 )
--            self.assertIn("' cannot start a field name", stderr.getvalue())
-+            if self.msgfmt_version < (0, 25):
-+                error_msg = "' cannot start a field name"
-+            else:
-+                error_msg = (
-+                    "a field name starts with a character that is not alphanumerical "
-+                    "or underscore"
-+                )
-+            self.assertIn(error_msg, stderr.getvalue())
- 
- 
- class ProjectAndAppTests(MessageCompilationTests):
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb b/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
deleted file mode 100644
index eb84122116..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"
diff --git a/meta-python/recipes-devtools/python/python3-django_6.1.2.bb b/meta-python/recipes-devtools/python/python3-django_6.1.2.bb
new file mode 100644
index 0000000000..ff1ba01d68
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_6.1.2.bb
@@ -0,0 +1,4 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "a1e92451ccb8b514e91bbb3b6d186d20b4030558f116b5d9de6535455ff210b7"
-- 
2.47.3

