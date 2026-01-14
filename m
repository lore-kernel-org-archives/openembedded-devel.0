Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9DAD37E29
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9368.1768395711368711469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bjOtw3LO;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f478e5283so3363719b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395710; x=1769000510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=bjOtw3LOsI7N7JKSgVGbjVUe4ruFh7Y/8RnEmjGQkd4XYUWDE58OXUD+qZZ0ZNGf/P
         hVvP4EHYc51ASpR029RfF9x9UiGsDIsMCXcfj6BOEIUx6kf5j0+Ne/nm+3DhIjMfIQQx
         jbSznVkg6aSdZAQwc1G4/JrpEok+PuKGYUm+fP9oU+aSPvPJP5+M0xaEu2/KmexTGw6f
         dU6yfOOyKsA71sESQ3ZuyULQkEnq5mL2ek8ym/sJ6ExmJxb8XKP2ijS7olKg/27+56Yc
         uCoozKTf5+0zOA8fViAeGFU8gp0nLtcg4KU6KjnMH46mqJy7S/QqR71PPgMPG/cuGr5F
         pcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395710; x=1769000510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=Zr1r/CgTGzqnuXYVh0dSr8WSD9q3TF8s6z1PgaPqlLvULp53a/J3jfiurBxfgMvWA8
         6JnzuBfKjC9ysZ51jD4k4seR+XkuUOgK0SiIbUDrtzyG5kNGtGKvYSo803kn+/9oRB+J
         VFx4/kWHWlT9MEbE1ZEt4xw2cRwjxRq5cNISbbp+s9P5lFjLlfK0Hu1X8UB6ZOo4lT3M
         5AHxv39YmDTXm/taqBfCpmxkj1Ug5RWyEdZNZ9NOJPUlLuO9UngADNg9TPg86Au1Fuar
         iB91DQ/0kGXMKld31M5y2JzL1QLAnrsP6eJdtf9jqFmXXClVE2R0y04vVKGajGVSfwig
         j4UQ==
X-Gm-Message-State: AOJu0YwVslSc+iE3jCCe8g4rSqX/V5+uCJ6dyzOtjG7XafHJP9xJX20Z
	rUs9WerzdfZpIjsAHwl6YoyJdlIK5gSMEwfiyUMCtdwhIoWGU6OmCdiv/l33Pg==
X-Gm-Gg: AY/fxX5HLHduF99942IokVnWakx6x9DmnJ9OcKMj5O4tPA77+eLyFNnqdVKSzYvkYOB
	O/JdA+QU9CKCFTrzCQ+HyoZo96zF/91zC7yb1v0MwwtMKsPAuuTrw5rtzDgZqJzo/A+uMxPBDHf
	ym4zsHpxgHnkEr2vWsafjQdAuHNql43SPjUOPdS2x1N5TzbDS4b073RKdr1ed2y4PxPqnx44ggH
	joYkHMGL6uKDKC1gZ291JR/ZcBr5bVflJOuA/C53JzJd68OM7OrnKy7o72n2xy+sWGFGJ6Y36Em
	3euyomP98S0KqkGRgR9ogFeEUkdn2Sar2MNlxiWKGf0tTfge38j08DaSjs3nl6irBzjL4UoA7HB
	T0MkIn8bK3QcC3e9rkq0/H8neCzwCht7FJMvbH4pzlDJ4T/zHyRPceGb3s/Ndexudf86RM5mCcA
	08ZT3fil3AtnwxmrGnt7sZOYQ=
X-Received: by 2002:a05:6a00:f05:b0:81c:4a92:258f with SMTP id d2e1a72fcca58-81f83d786a7mr1972910b3a.68.1768395708863;
        Wed, 14 Jan 2026 05:01:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 19/20] python3-virtualenv: patch CVE-2026-22702
Date: Thu, 15 Jan 2026 02:00:56 +1300
Message-ID: <20260114130100.1016416-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123472

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22702

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-virtualenv/CVE-2026-22702.patch   | 60 +++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |  4 +-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
new file mode 100644
index 0000000000..30f177b4d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
@@ -0,0 +1,60 @@
+From c57ef93ee6f63129d20b24e71a6ddab1c75752b7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Fri, 9 Jan 2026 10:19:39 -0800
+Subject: [PATCH] Merge pull request #3013 from gaborbernat/fix-sec
+
+CVE: CVE-2026-22702
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/dec4cec5d16edaf83a00a658f32d1e032661cebc]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/virtualenv/app_data/__init__.py | 11 +++++------
+ src/virtualenv/util/lock.py         |  7 +++----
+ 2 files changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/src/virtualenv/app_data/__init__.py b/src/virtualenv/app_data/__init__.py
+index 148c9418..301a00f7 100644
+--- a/src/virtualenv/app_data/__init__.py
++++ b/src/virtualenv/app_data/__init__.py
+@@ -34,12 +34,11 @@ def make_app_data(folder, **kwargs):
+     if is_read_only:
+         return ReadOnlyAppData(folder)
+ 
+-    if not os.path.isdir(folder):
+-        try:
+-            os.makedirs(folder)
+-            logging.debug("created app data folder %s", folder)
+-        except OSError as exception:
+-            logging.info("could not create app data folder %s due to %r", folder, exception)
++    try:
++        os.makedirs(folder, exist_ok=True)
++        logging.debug("created app data folder %s", folder)
++    except OSError as exception:
++        logging.info("could not create app data folder %s due to %r", folder, exception)
+ 
+     if os.access(folder, os.W_OK):
+         return AppDataDiskFolder(folder)
+diff --git a/src/virtualenv/util/lock.py b/src/virtualenv/util/lock.py
+index b4dc66a3..a28b32f8 100644
+--- a/src/virtualenv/util/lock.py
++++ b/src/virtualenv/util/lock.py
+@@ -15,9 +15,8 @@ from filelock import FileLock, Timeout
+ class _CountedFileLock(FileLock):
+     def __init__(self, lock_file) -> None:
+         parent = os.path.dirname(lock_file)
+-        if not os.path.isdir(parent):
+-            with suppress(OSError):
+-                os.makedirs(parent)
++        with suppress(OSError):
++            os.makedirs(parent, exist_ok=True)
+ 
+         super().__init__(lock_file)
+         self.count = 0
+@@ -109,7 +108,7 @@ class ReentrantFileLock(PathLockBase):
+         # a lock, but that lock might then become expensive, and it's not clear where that lock should live.
+         # Instead here we just ignore if we fail to create the directory.
+         with suppress(OSError):
+-            os.makedirs(str(self.path))
++            os.makedirs(str(self.path), exist_ok=True)
+ 
+         try:
+             lock.acquire(0.0001)
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
index a980727dd6..b7dd5729ef 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
-SRC_URI += "file://CVE-2024-53899.patch"
+SRC_URI += "file://CVE-2024-53899.patch \
+            file://CVE-2026-22702.patch \
+"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

