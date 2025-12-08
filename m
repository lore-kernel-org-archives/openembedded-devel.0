Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9314D3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 18:57:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.533.1765220270224572736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 10:57:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCv8doSz;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so3202310b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765220269; x=1765825069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zzdF8Y1zM5gf6lhAiWe1q6p4OPuVWQ2beEBwzeY4/0Q=;
        b=QCv8doSzXecXc6mkKP9mPK21GhnuDt3jnJydW6tYLAxR6WTYwi6CrRxzv59yHaRMDW
         0L9MRVw8DnkFSx/c4rfI6AmBOm2yuxcYKD0T2LlOOit945t1MbBpd4diqxiTzA039v7k
         ZNhJendqAded7xrTOko40IOgQUYpYDEtJ3fhpv6UGMPr5Xoti+/gycYx/JC3azIYoCyz
         Fpnj5i7hSChe/z4jS4L2mqDUTWL58Xj/q4V7qEn9EL7ITYuDF6f1Lb0tDc4R7wpNGuDc
         ghkGwZ2k/YNJK3xq9padMiw5dvmyhuG5SkRHZ6UzW1Aib2eUNxpBRP2b7HtwEvoUcenp
         UNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765220269; x=1765825069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzdF8Y1zM5gf6lhAiWe1q6p4OPuVWQ2beEBwzeY4/0Q=;
        b=tJ5lgDRuEef5MpxIVzmJKCHJE4G0VTGgBjz5jSQ9iKiPL4WKScHVXhUGfghMD+BI+B
         /yVfkxWNxMrGzX7Q8fTN7YWWSN9laA+2Qb5njLNjelK1VzsdB80MiOqLeskp7UmKL78u
         2w8oDw0MZzBW+g2+BqlLRDt0BwcrVPVX3gFbYUnNWcste0ODI1e9kZqBe74opmO1Gx08
         QhgQ8Cu67Hd3Jm4r5XsVUI+PH0mhMAhh16+1Dv+d+UPR27QNTB4HoECrhIOM+bxZAzKT
         KhcaPkZ9r2MnjFqmNv0E+2V4GQ8r+JZNWN05/l8dwrNpxGaEOUish33dFsULksCV0oRf
         ELNA==
X-Gm-Message-State: AOJu0Yx8wlk0x91195qU/+9uL1kxPe0suwvSyTBj7+Ya2WpdXWbrmD7S
	Y6FVc7vA7k+ou0zmb3rA9pM+Wqwo1NVXgCPlH/pVpHayvBVF4TM1VshGcW03iQ==
X-Gm-Gg: ASbGnctVcoEHNuaLqXehSbvfA2rMHUf8O7+k6DpohQdGzvwuHnn7H/WiOxJM0d8xJZL
	uZyp0CQgWXL8gaXQxpEMgVt7l4QrAE0nEi0C96xOi4Q4Yg3XXBO/5urRcn2G3fFttkoEjIkrSV7
	m7swW4HKWtRGKlIFMYZp962cw9YheKtFsN8s+3WclH0AYi+dN4rdMBuzQvYIkFlZ/lGLwAeBxnM
	vtV02FsrKuFiT8kgDztkcAsp74QWarbyPAvQ5CZ48nEL41CPbJMPD3YVsvKAApDJs7S8eGNz85I
	z0PXKp/djIeWbiITorwTWFeymE2YzKuf+MLWDSHsqq9AbvSkZe+v1oAL2dK3hICaHk5XnSCWOy3
	Cuh/CIxNJVGexD2DVtbBW48ncR5i96wpMqwVBtbzrv35ogxkQ9ms2j1qMDhPj1au4BLfcr+YFdV
	r3bmslDn0FHv2egeQMC2tAvDOs
X-Google-Smtp-Source: AGHT+IFxU5ZtjYGMxUergsTU5V3twUzn47oIEb7nrbahUcALUUE0ByhDWjBgq5oUkpOYb65smkWskQ==
X-Received: by 2002:a05:6a00:10c1:b0:7e8:4587:e8cf with SMTP id d2e1a72fcca58-7e8c5813381mr7497678b3a.66.1765220269329;
        Mon, 08 Dec 2025 10:57:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.250.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aeeaa340sm13921722b3a.54.2025.12.08.10.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 10:57:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH] python3-django: upgrade 5.0.11 -> 5.0.14
Date: Tue,  9 Dec 2025 07:57:42 +1300
Message-ID: <20251208185742.3117794-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 18:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122384

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch merged in the upstream.

Release notes:
https://docs.djangoproject.com/en/dev/releases/5.0.12/
https://docs.djangoproject.com/en/dev/releases/5.0.13/
https://docs.djangoproject.com/en/dev/releases/5.0.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-django/CVE-2025-26699.patch       | 100 ------------------
 ...ngo_5.0.11.bb => python3-django_5.0.14.bb} |   4 +-
 2 files changed, 1 insertion(+), 103 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.14.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch b/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
deleted file mode 100644
index bba65eaee3..0000000000
--- a/meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 5fd7c868791b635ef20d2991cc028516b9021dd4 Mon Sep 17 00:00:00 2001
-From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
-Date: Tue, 25 Feb 2025 09:40:54 +0100
-Subject: [PATCH] [5.0.x] Fixed CVE-2025-26699 -- Mitigated potential DoS in
- wordwrap template filter.
-
-Thanks sw0rd1ight for the report.
-
-Backport of 55d89e25f4115c5674cdd9b9bcba2bb2bb6d820b from main.
-
-CVE: CVE-2025-26699
-Upstream-Status: Backport [https://github.com/django/django/commit/e88f7376fe68]
-
-Backport Changes:
-- The fix has been adapted from the upstream Django v4.2.20 patch for
-  CVE-2025-26699, applied to the python3-django_5.0.11.bb recipe.
-
-- The upstream patch includes changes to a 4.2.20.txt release-note file.
-  This file does not exist in the Django 5.0.11 source tree, so it was
-  intentionally omitted from this backport.
-
-- Only the relevant code changes from the upstream patch were applied.
-  No functional differences exist in the vulnerable logic between
-  Django 4.2.x and 5.0.x.
-
-(cherry picked from commit e88f7376fe68dbf4ebaf11fad1513ce700b45860)
-Signed-off-by: Anil Dongare <adongare@cisco.com>
----
- django/utils/text.py                          | 28 +++++++------------
- .../filter_tests/test_wordwrap.py             | 11 ++++++++
- 2 files changed, 21 insertions(+), 18 deletions(-)
-
-diff --git a/django/utils/text.py b/django/utils/text.py
-index d992f80dd2..36ab6a9efc 100644
---- a/django/utils/text.py
-+++ b/django/utils/text.py
-@@ -1,6 +1,7 @@
- import gzip
- import re
- import secrets
-+import textwrap
- import unicodedata
- from gzip import GzipFile
- from gzip import compress as gzip_compress
-@@ -97,24 +98,15 @@ def wrap(text, width):
-     ``width``.
-     """
- 
--    def _generator():
--        for line in text.splitlines(True):  # True keeps trailing linebreaks
--            max_width = min((line.endswith("\n") and width + 1 or width), width)
--            while len(line) > max_width:
--                space = line[: max_width + 1].rfind(" ") + 1
--                if space == 0:
--                    space = line.find(" ") + 1
--                    if space == 0:
--                        yield line
--                        line = ""
--                        break
--                yield "%s\n" % line[: space - 1]
--                line = line[space:]
--                max_width = min((line.endswith("\n") and width + 1 or width), width)
--            if line:
--                yield line
--
--    return "".join(_generator())
-+    wrapper = textwrap.TextWrapper(
-+        width=width,
-+        break_long_words=False,
-+        break_on_hyphens=False,
-+    )
-+    result = []
-+    for line in text.splitlines(True):
-+        result.extend(wrapper.wrap(line))
-+    return "\n".join(result)
- 
- 
- def add_truncation_text(text, truncate=None):
-diff --git a/tests/template_tests/filter_tests/test_wordwrap.py b/tests/template_tests/filter_tests/test_wordwrap.py
-index 88fbd274da..4afa1dd234 100644
---- a/tests/template_tests/filter_tests/test_wordwrap.py
-+++ b/tests/template_tests/filter_tests/test_wordwrap.py
-@@ -78,3 +78,14 @@ class FunctionTests(SimpleTestCase):
-             "this is a long\nparagraph of\ntext that\nreally needs\nto be wrapped\n"
-             "I'm afraid",
-         )
-+
-+    def test_wrap_long_text(self):
-+        long_text = (
-+            "this is a long paragraph of text that really needs"
-+            " to be wrapped I'm afraid " * 20_000
-+        )
-+        self.assertIn(
-+            "this is a\nlong\nparagraph\nof text\nthat\nreally\nneeds to\nbe wrapped\n"
-+            "I'm afraid",
-+            wordwrap(long_text, 10),
-+        )
--- 
-2.43.5
-
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-django_5.0.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 0d26c7928d..d176123893 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -4,9 +4,7 @@ inherit setuptools3
 # Windows-specific DoS via NFKC normalization, not applicable to Linux
 CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Windows"
 
-SRC_URI = "file://CVE-2025-26699.patch \
-           "
-SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
+SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

