Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CFFEB2701
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 19:19:31 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1328.1770751170578495920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 11:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gC2ClyM5;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-480706554beso47450215e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 11:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770751169; x=1771355969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO7Rx1zf1gxry5pdGsvNTQEbBc+vCAm1qXRHAjsYiww=;
        b=gC2ClyM5P0Y9Kv/bH+MHojf8jcqbc14MZdMS010F/UpQhmgKfb3B8LxHjD3qnUnJW6
         J0pFB3WS9EWzIWU5SACJEZqWfQNQude6x0gM+CnBJm9DRLcXy3E6MzfL3ZK6Jwjnor9Y
         cIiDbU16yldOi/xML49Fq0h4GJIQKSPGNyWRID3mPEZT4ofNuOoJOqXJsdh1gOmjMui9
         JxCNMad5xfXzI/Rfuyh+VYJoYVpP0+kXBhNW/0BdRGgwEgAK7cPQtQTM9Xo7fg9uynhu
         9zHq9c9cy4tuFqIPHmVg+NpAaR5OYb0h0aCEy8p+CMv2fDlM1u7iYl7JlbTwe2UM86yF
         V1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770751169; x=1771355969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO7Rx1zf1gxry5pdGsvNTQEbBc+vCAm1qXRHAjsYiww=;
        b=wmPGyY1HUnXKDYqyiPfOn92KcUvH08uW6EXMEZsUHD5l1mmq4Uy24L+REbJimzpQ64
         4pJJySAkhJqkRKP0NFRqcvDMl3s4QC4ujBCqeCHIx5J/cLdD76XYqaROLjPylan+1gZm
         rFM95N4fYcFTCrXZHOqm8gl1TwT0GpHbvuLeBvSFYZ8YMGnX+5KbvVVTbeMA3/A7gTRl
         BNFrowpY4Sl0FnK1iJLOnqgJiVSvwFVheJFGQ8el7xWs4rOsEMD/ttK7R0WOkSYz8s61
         33XAlarm7ZTezuORCFwYZztyejs6dxLxACmzgmK7PcMHMAQDeFINOTQMFQg9SZ+lF8Ri
         lGVA==
X-Gm-Message-State: AOJu0Yyuvs6MmwgtEJQJUeCTXoCzKnVkv8SF29ZapThASCM7Q2FJ0jVF
	nnTmvP1UhHbACDM0JaqNN3VgzFKMtfdfXO0bX+4/D7bFqpG5hvgYe7nNtxtLHQ==
X-Gm-Gg: AZuq6aIGgayEu5/0GSfb2cFG9jGFmDeZlPQlD3J2PXlwvkhQdbkGyWlSYJcF0/CZNHg
	KmgnAaYnJ/OEQ3+o6d2TJxGQulevTQ9acLzgm+sG0K5tRU6bLvJuAdCaAwhrye86CcHiUcCOlYB
	IZjsVQlOjkCZpytjxepNId+X5jEBW1W+Xttie8SeJtWNA715g5YIK9mS4skkBHs8MFWWUQmMoty
	lJi/07cxFvEN81nxR9J3lpVFBub155V6R3EBbukk2apoSpfn8kQTTv2sRhKQKskV8fepbd+ZaDt
	CizyJs2iwhKCOx/Qgj08xPxxKpIIPsT+jqdN7t3+cvfHb5h0/nw8YlP6OWiG/gJ1d//JNQHEGI+
	qvUTeuHo3DW6aRbq3+yf6InZGPHtuf5MNG4PqzdbbORK35mUhpMBbrLuzzRxDtsF7FaLllWNMm2
	+5dMvCK0A4OOhN9fTd2mRhKCLEku2/H/g=
X-Received: by 2002:a05:600c:4e8e:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-4835b95240fmr223115e9.18.1770751164586;
        Tue, 10 Feb 2026 11:19:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm83430455e9.7.2026.02.10.11.19.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:19:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 5.2.9 -> 5.2.11
Date: Tue, 10 Feb 2026 20:19:22 +0100
Message-ID: <20260210191923.4896-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 19:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124323

Dropped patch that is included in this release.

Ptests passed:
Ran 18131 tests in 450.882s

OK (skipped=1389, expected failures=5)

Changelog:
5.2.11:
Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207, CVE-2026-1285,
CVE-2026-1287 and CVE-2026-1312

5.2.10:
* Fixed a bug in Django 5.2 where data exceeding max_length was silently
  truncated by QuerySet.bulk_create on PostgreSQL.

* Fixed a bug where management command colorized help (introduced in
  Python 3.14) ignored the --no-color option and the DJANGO_COLORS setting.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Fix-test_strip_tags-test.patch       | 76 -------------------
 .../python/python3-django_5.2.11.bb           |  5 ++
 .../python/python3-django_5.2.9.bb            |  7 --
 3 files changed, 5 insertions(+), 83 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.11.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.9.bb

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch b/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
deleted file mode 100644
index f77c3b963a..0000000000
--- a/meta-python/recipes-devtools/python/python3-django/0001-Fix-test_strip_tags-test.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 7b80b2186300620931009fd62c2969f108fe7a62 Mon Sep 17 00:00:00 2001
-From: Jacob Walls <jacobtylerwalls@gmail.com>
-Date: Thu, 11 Dec 2025 08:44:19 -0500
-Subject: [PATCH] Refs #36499 -- Adjusted test_strip_tags following Python
- behavior change for incomplete entities.
-
-Upstream-Status: Backport [https://github.com/django/django/commit/7b80b2186300620931009fd62c2969f108fe7a62]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- tests/utils_tests/test_html.py | 25 ++++++++++++++++++++-----
- 1 file changed, 20 insertions(+), 5 deletions(-)
-
-diff --git a/tests/utils_tests/test_html.py b/tests/utils_tests/test_html.py
-index 7412c2624c73..ee115aaf1cf2 100644
---- a/tests/utils_tests/test_html.py
-+++ b/tests/utils_tests/test_html.py
-@@ -1,3 +1,4 @@
-+import math
- import os
- import sys
- from datetime import datetime
-@@ -124,7 +125,7 @@
-         # old and new results. The check below is temporary until all supported
-         # Python versions and CI workers include the fix. See:
-         # https://github.com/python/cpython/commit/6eb6c5db
--        min_fixed = {
-+        min_fixed_security = {
-             (3, 14): (3, 14),
-             (3, 13): (3, 13, 6),
-             (3, 12): (3, 12, 12),
-@@ -132,7 +133,21 @@
-             (3, 10): (3, 10, 19),
-             (3, 9): (3, 9, 24),
-         }
--        htmlparser_fixed = sys.version_info >= min_fixed[sys.version_info[:2]]
-+        # Similarly, there was a fix for terminating incomplete entities. See:
-+        # https://github.com/python/cpython/commit/95296a9d
-+        min_fixed_incomplete_entities = {
-+            (3, 14): (3, 14, 1),
-+            (3, 13): (3, 13, 10),
-+            (3, 12): (3, 12, math.inf),  # not fixed in 3.12.
-+        }
-+        major_version = sys.version_info[:2]
-+        htmlparser_fixed_security = sys.version_info >= min_fixed_security.get(
-+            major_version, major_version
-+        )
-+        htmlparser_fixed_incomplete_entities = (
-+            sys.version_info
-+            >= min_fixed_incomplete_entities.get(major_version, major_version)
-+        )
-         items = (
-             (
-                 "<p>See: &#39;&eacute; is an apostrophe followed by e acute</p>",
-@@ -159,16 +174,19 @@
-             # https://bugs.python.org/issue20288
-             ("&gotcha&#;<>", "&gotcha&#;<>"),
-             ("<sc<!-- -->ript>test<<!-- -->/script>", "ript>test"),
--            ("<script>alert()</script>&h", "alert()h"),
-+            (
-+                "<script>alert()</script>&h",
-+                "alert()&h;" if htmlparser_fixed_incomplete_entities else "alert()h",
-+            ),
-             (
-                 "><!" + ("&" * 16000) + "D",
--                ">" if htmlparser_fixed else "><!" + ("&" * 16000) + "D",
-+                ">" if htmlparser_fixed_security else "><!" + ("&" * 16000) + "D",
-             ),
-             ("X<<<<br>br>br>br>X", "XX"),
-             ("<" * 50 + "a>" * 50, ""),
-             (
-                 ">" + "<a" * 500 + "a",
--                ">" if htmlparser_fixed else ">" + "<a" * 500 + "a",
-+                ">" if htmlparser_fixed_security else ">" + "<a" * 500 + "a",
-             ),
-             ("<a" * 49 + "a" * 951, "<a" * 49 + "a" * 951),
-             ("<" + "a" * 1_002, "<" + "a" * 1_002),
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.11.bb b/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
new file mode 100644
index 0000000000..d18aa35169
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.11.bb
@@ -0,0 +1,5 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
+SRC_URI[sha256sum] = "7f2d292ad8b9ee35e405d965fbbad293758b858c34bbf7f3df551aeeac6f02d3"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb b/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
deleted file mode 100644
index 11f438d623..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.9.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
-            file://0001-Fix-test_strip_tags-test.patch \
-"
-SRC_URI[sha256sum] = "16b5ccfc5e8c27e6c0561af551d2ea32852d7352c67d452ae3e76b4f6b2ca495"

