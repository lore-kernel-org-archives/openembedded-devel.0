Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0345BCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2530.1761113928364280928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWxxkih8;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29292eca5dbso40014265ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113928; x=1761718728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utzZVHUTlEZ2xDD+JQjzL9tt3vtcN0PCoyGjjVkQcEE=;
        b=HWxxkih8FRTDUlgHoP54GWyukFwvlNxi4z3kmWhPwTq9w+ixsLyNJKXudrP4WdAPCN
         vwqYyD94DaM6UHcBAMrBwOgcFjYhRsL32aEPXXxPgJXdnNS/YPGWIR4t1F+qRErPjmTn
         aZdVY07Ha7T4SuBqxAzPTtD40ugDAoxVYI8xjWOsoE9350/vbVSGVLKWqIXLEdqNcAmf
         OSlSkpokGruntpMROjRSDCC3DH7Sk3NKg0ZxVPCyhz8Vl3M1api5cCUsUi1oipPO5Gga
         LdziB710oMxi0MQdn7OZ/HJpCh2E/ejvm2DrvY7iRxW1ZxrqlIthSaZ7akR7ey6sYVQo
         cavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113928; x=1761718728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utzZVHUTlEZ2xDD+JQjzL9tt3vtcN0PCoyGjjVkQcEE=;
        b=AYhZZeTMZXGGUSYj50+9IdLRBdy4S9Uv1Se2rwzSHRR85A+G7OSfbx352jjxGe06zW
         XG6CCsi2Py8YL2iWZ4Mg40a6WyDQ27frY8W0tkDGVZI/xaEs930DYzE/Jo8J4OVB+Mlg
         HuYnme1TI0Kf7oCpSEqGMlfV/QRBTYjrj9xHlQ63bqxqTUUb1SffghXMt9FhKOpIYJvQ
         fSBwLl/pdn0wyO5xJiQq5LtRw5U3Q/I+dOp4k5cXaDSLV1qz0s129/e2KqYKJwVLm4VG
         lKCyvjPruFUZhhACLtSqfHZo0Z8N0awQ1zK+LYH4anSal2fzUayU4GTu0QmoqLjVXfUa
         Q+Fw==
X-Gm-Message-State: AOJu0YyGjMSWd4CiqTfHaSmwJiPN6BNgQms6YfF90eicyFO0A+ExINzv
	QK2T5aEt4mRd9R94MqZFISURwvCQPStlnp1cjtSxnqeHwRRSotAiEihjCKqfvA==
X-Gm-Gg: ASbGncvGFmkulqMeoUdaCztcuodwx0fooo475mP/UkJpy9oluPfAVw+C395G63mQpZT
	d7G+yLeygSv1eXZg9g/HW7rDC/WoQlFijhn43ifAeT0iQ7Ad8nygEOB2EKRiOFt2ETFnMveAOeN
	KlO8ECueGrbo+lVVQ7B96E8RCmOLihdRl9UexkuIoFOHCJK4JrvYv0Qqkp1llYXJN2m6m0tQODj
	m+IoOh7f9kAdpqD/74q02f47PT0CJymmcgpZe6iM0sPSJShNeaaXl7bE7urda8b6dTwkhAuKxju
	EXJWydp1C5V8epfnXYncfQH2r6dCL+QtBVK7HUe9uD1qdJISHqMvSJb21MvczFt0DMHikmtZ9f4
	nTtPH3rfH+MA7c7hUskNwDE1NBLp9S7MGkEVpybeH+v+WSHSUHy9BQpAQvPCD3FFIkjleoATdRw
	Bg8jr5IED6pzCrazRE4zePaIEq
X-Google-Smtp-Source: AGHT+IG8X4jijP1GEeGXkGuK3wQb6t3h67rFZtKca64aypRqO5IcFZuxNbJ4woinusPZxcaknTYU3w==
X-Received: by 2002:a17:902:fc4b:b0:267:b0e4:314e with SMTP id d9443c01a7336-290c9cbc851mr231066735ad.23.1761113927494;
        Tue, 21 Oct 2025 23:18:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 7/8] python3-django: patch CVE-2025-59682
Date: Wed, 22 Oct 2025 19:17:58 +1300
Message-ID: <20251022061803.887676-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
References: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120890

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
index 67f704f9cf..d62fa3fd2c 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2025-48432-6.patch \
     file://CVE-2025-57833.patch \
     file://CVE-2025-59681.patch \
+    file://CVE-2025-59682.patch \
 "
 
 SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"

