Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA0D37E2A
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:08:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9535.1768396100811782735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aInDRuk9;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c551edc745eso2279579a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396100; x=1769000900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=aInDRuk9RL2eYT7UOliO3Qy9Fxd22xfv9+YYRymhaD+w2d2bmyzpQdLUHuFsIosYka
         C/dUEYPaX9jSh+KJ/RWCZ278qtjRWZXCmjjM9k0+0IYMWUrRLxoN+ELVi7cxYIiVkffK
         gOerpKEtAoXYFNwOQj2k79QtgsOXFErhXZlwhE7G8Fg9rrWyTp/I6jI/S/Se8jsFqqyx
         OY9zqu2KgWp32weo9GMfJCeneZy1gpa92R8H751XRKz4cGoUt3AwWsAcUGCW668H+L0j
         XV8u/PDJbgx+AcD8f4261NOeh2nBIqsQF5b6i19aD2lAAiC1241yCtQzNXKN1N5TUP8o
         X87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396100; x=1769000900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=LconVDjZAfdFducfR6U/KZe0yQQxaUehLvUWrR+ORXUkenEjxYNdoMI27rU+NhUoe+
         eOTgX+aUC8N19scjEme6lurZo86yjvHhErjmf24y+cJBOdQZglkqYQGD8yxLeWOdoQSs
         qX02hpI9YC8NObYT1Uu9qnaOedyg6G2UcffqP+54hZYqkvS8Ki7qEi64cymtoTPiFANW
         h5G1iWrRyzNJ737GlCMRSFzzSB24QuvsjKcjhYsjER1XlSENYj386dqFgLi9A1j28WaK
         1jbN3aQrF7GUdKBLTw/pyaX7WxMTl55UEPyWQIOkkAOW5YFtHerx/WvLO1NHU3xvPCLd
         qXJw==
X-Gm-Message-State: AOJu0Yx509x/0/ULkZXQcr2Q7WTPHbzPn0sSjqsbb/+uxj8Mfc0nCUK+
	XcsqV1uVDkRDdI34P8AFpPp9c4f2OtWonufbL4uM2Ocsjx0EZmOxDXzy8iY6KQ==
X-Gm-Gg: AY/fxX75+G/n5w1H3gUIsPC/1VOA/DWiSRywa3nrPzY8LNiiJ6AG5SGG1rjLHeBKmZC
	s7yctRqLfVxwLyUOIP+CXmCbdg+9HAJ/xtcCix2xHdJzt/2LDcDk25XmG+yI8WabvYYP9X2TPj1
	OC/ZJfwRrOv+EV0KCigM790gPuPEBsvylGVlRGXcxwZafmDo46hCU+OJJy9wNeYb8Nh059r3n16
	62ZnosnTKrE2eZ0+sriCr3uWPV3ToP86/97J9DaLxfLjacEq3sbUOArCTdULe5G2B1DJsj4pi0N
	T6KCopaWZJNEi8NDzi4M5IKiIpByuJR9dOv//L/nE4DVxkpTPncovGcg0K2WPtYHfmcwA0PnKmW
	T167zkw8U+AzD/d0X5T+1i5jEW0PAKN/WVZOkaqIUfj2Be0s6M/2Yx4mP42wYOTc58zct9PW8T9
	/daocVx4L8oMQlfbngw6nvkd0=
X-Received: by 2002:a17:90b:5870:b0:34c:c866:81f2 with SMTP id 98e67ed59e1d1-351090a09f6mr2286039a91.4.1768396099927;
        Wed, 14 Jan 2026 05:08:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106914b1esm1296398a91.1.2026.01.14.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:08:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 3/3] python3-virtualenv: patch CVE-2026-22702
Date: Thu, 15 Jan 2026 02:08:00 +1300
Message-ID: <20260114130800.1021123-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
References: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123479

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

