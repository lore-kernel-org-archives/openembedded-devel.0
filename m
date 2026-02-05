Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E705DEC1EA5
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 12:04:30 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19273.1770293065224190699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 04:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KeFcPhOJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb2314f52so577961f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770293063; x=1770897863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFh42pxqK97OGYnyKhP8gBVw6Ac+u3iqfJTDDN9MmG8=;
        b=KeFcPhOJL3Coz2dGxTj7fMTs5mCxL5fR8jvnBwqZ9/wyrOa7ASu6NI6MqNEd/C5JGY
         nKfnTmXclkAGSBfTGQzfagukGQAbT5tGlOETJlClh2zxW7uW7qWg1byJiClaQp4Ds1WW
         Wa1unlxvlN9UQPScYX5oEDAq3owBOqVBxsR1xGH+FIkJSioQylMoz+MrYqRdmbJ61Z2I
         5DA9ofmD+ZeZq/Ku9/azPYvdrZkvSjJNeAvQLjZqWEYYVPRKaRPBQud2OdiCme5Tj02P
         j8SwKn8hkZWxlrB2d/5snV+/32UsDZYpfv/in8hWM7Ehua8NVECEhZNccsybEH/ND897
         IlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293063; x=1770897863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFh42pxqK97OGYnyKhP8gBVw6Ac+u3iqfJTDDN9MmG8=;
        b=kuyrImG1/wd10umQVaBYrBLFv/b+fi2BLYclIOdfXHMaVqT6Kwo0JcMBOTMXN3YFnz
         qPQzrpBVnzNbie3xcDOq7X0HosNqT48Bo0MtBJpSxDkrH2IjgdUiBPGp2X5fPJMIx4CK
         zAqFxFmGgo2theBSvmkC56i7OINL5tptMMfI2itNilBc7yjFkhKryCJnisWLqigxsgKl
         Jg2Bd5C6MQQnhA+T5RfJkJ5SIn+cIh0hMETjS71vxJZ1Loy5e8NLp4q5yZF4IgZODjAx
         JSTJTz17DzYAtfurd4qqJdFZgdjGGKRin6wnxpuyqO7qu6tNB5ghUm2sQm58yPpk17Sw
         3lmA==
X-Gm-Message-State: AOJu0YwvZNuFLYlWnU4NHs9IBerUpW0qYLAG9Gq9mboNqeSIrAwF6hnP
	8qXIztX5ydd9L04qg4QPttuG9XY9whlZr8Ryb6xzg2l/CCDLdQhAORsrB4gbTA==
X-Gm-Gg: AZuq6aLktYVLdu2C0GNDmiZkT+MOq9C6ovmIKCjNWZvdIJGhVW1VtT+/6zNtX1iMcdS
	+r5fAIMWshgykJ8esKdhsHphVowYeVn1j7jUuQVdAjazgVU/M0oNW8S2zhByD0QGqYqxjgUIFyP
	f+G8cq0r64Xcc5Kmm7UlhpmTDhVMmki264sLk0qh24vRH6liYUSntlyshlGgEOhoarnANBPoh7T
	2oyrdtV4YSiZUKktWxHFmghGVHB+KF0CRWqa4BrfSM85KS9NdHIVhiGlMSF+RiqYfEFt0amo8V9
	B9aQdoD9n4x0pLKla5bVtk7dh5/h2r1HRth5PklNaxO052+RmNm82Bf20kkZVVgr636j1/EiOI/
	iq4alF15KX8pzjcXpzDCIf6ApmUyKV9oeRH2ojk1I7jfvz3ykkEcPJucxDmCgkmERYagW61oBAW
	NIUiru48hF
X-Received: by 2002:a05:6000:3104:b0:435:9756:d4c4 with SMTP id ffacd0b85a97d-43617e42220mr8715412f8f.17.1770293063329;
        Thu, 05 Feb 2026 04:04:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180640e5sm12636556f8f.40.2026.02.05.04.04.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 04:04:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 1/2] python3-python-multipart: patch CVE-2026-24486
Date: Thu,  5 Feb 2026 13:04:21 +0100
Message-ID: <20260205120422.1516950-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 12:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124210

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24486

Pick the patch that is referenced by the NVD advisory.

Ptests passed successfully:

Testsuite summary
 TOTAL: 121
 PASS: 121
 SKIP: 0
 XFAIL: 0
 FAIL: 0
 XPASS: 0
 ERROR: 0
DURATION: 2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../CVE-2026-24486.patch                      | 61 +++++++++++++++++++
 .../python/python3-python-multipart_0.0.20.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-24486.patch

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-24486.patch b/meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-24486.patch
new file mode 100644
index 0000000000..110737a761
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-24486.patch
@@ -0,0 +1,61 @@
+From 1194f169d7f6db3b518c40ef703135ffc4015ebe Mon Sep 17 00:00:00 2001
+From: Marcelo Trylesinski <marcelotryle@gmail.com>
+Date: Sun, 25 Jan 2026 10:37:09 +0100
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2026-24486
+Upstream-Status: Backport [https://github.com/Kludex/python-multipart/commit/9433f4bbc9652bdde82bbe380984e32f8cfc89c4]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ python_multipart/multipart.py |  4 +++-
+ tests/test_file.py            | 26 ++++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 tests/test_file.py
+
+diff --git a/python_multipart/multipart.py b/python_multipart/multipart.py
+index f26a815..7168c96 100644
+--- a/python_multipart/multipart.py
++++ b/python_multipart/multipart.py
+@@ -376,7 +376,9 @@ class File:
+ 
+         # Split the extension from the filename.
+         if file_name is not None:
+-            base, ext = os.path.splitext(file_name)
++            # Extract just the basename to avoid directory traversal
++            basename = os.path.basename(file_name)
++            base, ext = os.path.splitext(basename)
+             self._file_base = base
+             self._ext = ext
+ 
+diff --git a/tests/test_file.py b/tests/test_file.py
+new file mode 100644
+index 0000000..4d65232
+--- /dev/null
++++ b/tests/test_file.py
+@@ -0,0 +1,26 @@
++from pathlib import Path
++
++from python_multipart.multipart import File
++
++
++def test_upload_dir_with_leading_slash_in_filename(tmp_path: Path):
++    upload_dir = tmp_path / "upload"
++    upload_dir.mkdir()
++
++    # When the file_name provided has a leading slash, we should only use the basename.
++    # This is to avoid directory traversal.
++    to_upload = tmp_path / "foo.txt"
++
++    file = File(
++        bytes(to_upload),
++        config={
++            "UPLOAD_DIR": bytes(upload_dir),
++            "UPLOAD_KEEP_FILENAME": True,
++            "UPLOAD_KEEP_EXTENSIONS": True,
++            "MAX_MEMORY_FILE_SIZE": 10,
++        },
++    )
++    file.write(b"123456789012")
++    assert not file.in_memory
++    assert Path(upload_dir / "foo.txt").exists()
++    assert Path(upload_dir / "foo.txt").read_bytes() == b"123456789012"
diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
index 71f9674ec8..fcb04bac04 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.20.bb
@@ -2,6 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
+SRC_URI += "file://CVE-2026-24486.patch"
 SRC_URI[sha256sum] = "8dd0cab45b8e23064ae09147625994d090fa46f5b0d1e13af944c331a7fa9d13"
 
 inherit pypi python_hatchling ptest-python-pytest

