Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFC8CCF9E4
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.8329.1761175646287303413
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HOnMXIz2;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-339d53f4960so208567a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175645; x=1761780445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+F0TJGPYV4zpXwU3bfCeAqJ9AtMqfu9WqyZC/oWZOE=;
        b=HOnMXIz21zgJ+HpGtbtez+Az9fyPfTyrWd3lYzCS+gVFV8V/Jo7Bq9reG78zgWT9d5
         OW+dPsUwGdVR1r+OlEr2IHkP8Bi8aIgXI3HlnmnacnbT2azwm+VbhziZkZzhjPSeVplP
         Q9GGjq9K/oXchtUdcv1bW8NL5OC8Miio9pQkxOjaXTUG26orF8F5RIWR2hnUkWHrmPzB
         l8+lYt0vZGt/MjC2BfqqXxKN/HcAlVnm9uVZhHtTa+/wJMYUhwDuyhEb9c6PVh6DuzOt
         UdTza/gyRC2CYoQLhy1H+XAKERsOHjMp7SvPD9EcTmHufmL8IshOEH0dMMatuxrWXxid
         AoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175645; x=1761780445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+F0TJGPYV4zpXwU3bfCeAqJ9AtMqfu9WqyZC/oWZOE=;
        b=UXTrdgJFjlCkDExlonLchg2vS2YgUmcOaX1kCUp20LxieBA1Z0dSXluelufOMe7udE
         eGMqifZucJ/ppM8hB/ZpwDm9anEoxF1JzDW/Y8KK/KrSF+GwnuokCHkhWGpRhkF3HCQd
         tVrIdgXAKjoyBeRZcyAqvTiIN0WW+W6ky9HbAHUzveU7LV4n2PyEX93gwcSwXob8ljyR
         +UNIGKcnQkb2XZcgRKqkusNIO+7My0GvXb7uuxw2CGe+QPQ+vxGcFZqzH51Y13z9FR2R
         1m3Fn7hC2mPkLNxVbAPaadzGZ8Hc+dfdCtCYlwVflRR53Rlj5XS3Wkq9b9XDHnslhNGp
         LdYw==
X-Gm-Message-State: AOJu0YxyeOU1adBCdNs//vko2VuAgQyPeXxoBsl9B7O9AVn8af9kVVTX
	ZJOAGBTHotJ9ivk0eJF2pOEi0jCkVpi6zq6Aj22emVA2yWL6cgixBbebKOipUA==
X-Gm-Gg: ASbGncteVftMsW/lcGRx34K6qD3dzRaWrpBNcqPB4/ua2Mxl0bLRRZvlwAD6t2yJ/Hy
	PCLlX5EKx5L/w8ak0sjXMZ99kZMR7AhWSz9XUgAleVNQRtLXwBfIRAG81NE2Z7b/IM5pEsIRqhI
	NW2w8nh3KGv+33M8WapLBWdu5u0KpTwwtcCw9reaOBqYzn2BHVxFV/+cFNbRwFcvGS3rCrVZlOV
	E3RvMX0Vs1it55Ga5DzvaT6NjJgRYCYjFABv/4LgtbB15r9WRtFZNrW1mn9b0jR6ghIFiMZgOgR
	pfe6GkGUX0UGAOZNsKgDKtNdyWseEItCDK9LxRzAtxJhTigDaEuTnk9izOWpzYLAsa23JMQFY0D
	nTTBFHvSr+1DCt1h8lLDZ0h8lMQA3FJorWIdAgvi6srxKM493XddvsXJK1Nyd8KdtztNnsEZcSG
	mRGHua30CJzLGdLb+Kq/B5PiI8
X-Google-Smtp-Source: AGHT+IHj5/+to5JgA0dZRybJ8aPc0ShEQydvfwZUjbJxs3be2YdFd8vl2HBN0O9n5evC9a1aJC6PJQ==
X-Received: by 2002:a17:90b:3d8a:b0:330:6f16:c4e0 with SMTP id 98e67ed59e1d1-33bcf87f43dmr33021156a91.12.1761175645485;
        Wed, 22 Oct 2025 16:27:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:25 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 7/8] python3-django: patch CVE-2025-59682
Date: Thu, 23 Oct 2025 12:26:30 +1300
Message-ID: <20251022232633.1703690-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120908

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59682

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2025-59682.patch                      | 72 +++++++++++++++++++
 .../python/python3-django_4.2.20.bb           |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59682.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59682.patch b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59682.patch
new file mode 100644
index 0000000000..72f566a0e1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.20/CVE-2025-59682.patch
@@ -0,0 +1,72 @@
+From c757b620cd8099d17e202c0f5582bbab5564056c Mon Sep 17 00:00:00 2001
+From: Sarah Boyce <42296566+sarahboyce@users.noreply.github.com>
+Date: Tue, 16 Sep 2025 17:13:36 +0200
+Subject: [PATCH] [4.2.x] Fixed CVE-2025-59682 -- Fixed potential partial
+ directory-traversal via archive.extract().
+
+Thanks stackered for the report.
+
+Follow up to 05413afa8c18cdb978fcdf470e09f7a12b234a23.
+
+Backport of 924a0c092e65fa2d0953fd1855d2dc8786d94de2 from main.
+
+CVE: CVE-2025-59682
+Upstream-Status: Backport [https://github.com/django/django/commit/9504bbaa392c9fe37eee9291f5b4c29eb6037619]
+(cherry picked from commit 9504bbaa392c9fe37eee9291f5b4c29eb6037619)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ django/utils/archive.py           |  6 +++++-
+ tests/utils_tests/test_archive.py | 19 +++++++++++++++++++
+ 2 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/django/utils/archive.py b/django/utils/archive.py
+index 71ec2d0015..e8af690e27 100644
+--- a/django/utils/archive.py
++++ b/django/utils/archive.py
+@@ -144,7 +144,11 @@ class BaseArchive:
+     def target_filename(self, to_path, name):
+         target_path = os.path.abspath(to_path)
+         filename = os.path.abspath(os.path.join(target_path, name))
+-        if not filename.startswith(target_path):
++        try:
++            if os.path.commonpath([target_path, filename]) != target_path:
++                raise SuspiciousOperation("Archive contains invalid path: '%s'" % name)
++        except ValueError:
++            # Different drives on Windows raises ValueError.
+             raise SuspiciousOperation("Archive contains invalid path: '%s'" % name)
+         return filename
+ 
+diff --git a/tests/utils_tests/test_archive.py b/tests/utils_tests/test_archive.py
+index 8cd107063f..8063dafb65 100644
+--- a/tests/utils_tests/test_archive.py
++++ b/tests/utils_tests/test_archive.py
+@@ -3,6 +3,7 @@ import stat
+ import sys
+ import tempfile
+ import unittest
++import zipfile
+ 
+ from django.core.exceptions import SuspiciousOperation
+ from django.test import SimpleTestCase
+@@ -96,3 +97,21 @@ class TestArchiveInvalid(SimpleTestCase):
+             with self.subTest(entry), tempfile.TemporaryDirectory() as tmpdir:
+                 with self.assertRaisesMessage(SuspiciousOperation, msg % invalid_path):
+                     archive.extract(os.path.join(archives_dir, entry), tmpdir)
++
++    def test_extract_function_traversal_startswith(self):
++        with tempfile.TemporaryDirectory() as tmpdir:
++            base = os.path.abspath(tmpdir)
++            tarfile_handle = tempfile.NamedTemporaryFile(suffix=".zip", delete=False)
++            tar_path = tarfile_handle.name
++            tarfile_handle.close()
++            self.addCleanup(os.remove, tar_path)
++
++            malicious_member = os.path.join(base + "abc", "evil.txt")
++            with zipfile.ZipFile(tar_path, "w") as zf:
++                zf.writestr(malicious_member, "evil\n")
++                zf.writestr("test.txt", "data\n")
++
++            with self.assertRaisesMessage(
++                SuspiciousOperation, "Archive contains invalid path"
++            ):
++                archive.extract(tar_path, base)
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index 443b4dbbfc..964b982fda 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2025-48432-6.patch \
     file://CVE-2025-57833.patch \
     file://CVE-2025-59681.patch \
+    file://CVE-2025-59682.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

