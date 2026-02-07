Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E15FEE0AD8
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2758.1770460452637020066
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/IFbYEI;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a16a400so2730960f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460451; x=1771065251; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2RnrjwClWxvXgJR42KSyztbAv6ET8SLHtNpgK93LbU=;
        b=g/IFbYEIIC8KjU9+Xpi2qpRIiVr8ya43W1HOkX22yl4CvA7wq+TCD8qAnnWF+24rrN
         VZYngI9yp3sEwuGOysHqFMcjcHnvlsHdRfY22N71sZZWitAqtYPgNjDWIVp8mPgUR600
         cTqQg15JbkI2hH9u+3oliVHK/R4KZ2Rgg1It7JzCvQ8ggAx8i24T6faEoPfvKijEp6C+
         09jD5iQT4OnFmdcvyp42m/6156QWMKA/Q+GimVbG4CneI/UCIpd7EerHfoQ+hF78cjSS
         KRVhRE01NawAyIJ6WbqyHbF9qLlH8+909nCJw0a4u7jFEXBYlH9U4X4oDthajemLQEFG
         m4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460451; x=1771065251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h2RnrjwClWxvXgJR42KSyztbAv6ET8SLHtNpgK93LbU=;
        b=d2Th7bQVzR3XHyDMrMewHH+9+IG8heaV3PK3niM0R97/hxAWBPH2FJueEAZmVkKNMv
         4JRNyGeMXcQs2nDzEVOK23Ur6xg+KYgmK14AWBbWm0m1l6Ltt506v6wmEKxrMMY8QCiI
         rWpkhfh/7yw29a375IZKMzREf+5vAz19uJbxWi1lCtcc9LxMC2zo3sm4URs/VMKhW7PL
         Ecef7tRNKMcIHCGUoLIcxs8gJEdeaXwokEJoERB9Lu6seEdIuKvnZ7biflEoZEXhBSJn
         eqN/6HTbxTg17Zjj7Rl3UQlb1l8cdxwuaD2fw5s6O0iI2JN815K/+QuzIqDcz6HqTjpJ
         kgrw==
X-Gm-Message-State: AOJu0Yz/oLzxIPDs4RaSIarQNMn8lxc4bj7Y0XuCRu4676G8AOGLS5WX
	FxMNyjZrxfq/yGoqPM7+0qagqzjqLqdzDYl7rS0lneG4VUHZrUmvm1qY0+CgLQ==
X-Gm-Gg: AZuq6aIveQPHD/J08LhgEazz/R5uk062JJM7+NucKSfikh3N3yOn2kdnS+IWcAKJPdQ
	cfI1CA6do9gyoBjEWo0R5RSB5LJwYA9bXRZWTdm288MXOiZ4ZPI+MAvynAWSCYAt5KnQYcIACl5
	KH7+fWX0ZZVJtJNSbvAWxbKSOKGlwunxrJk/1GIrGOLA5csEKN3VQrXIeP/Lt36vG8yKOD+jE4A
	nY54ZT2E538V2XQnQtKrxpLJRYx8tzXwTvOh5x7cjQwcYgFoYEHm5YxApHcoMqdY+3ZT/kgePSZ
	w4Iw8jQRcA00/ZatxihpUJ7ltJICxCG0PRcpHvCnb07R3tUI+zkILn91sVRACWFWJsbGc3Jg17U
	/GlDsx2u8sJfSv9i+VHADdIg1zpV5xAKsznvucu3XzWmVXekxy1ImhDV9S5M5RONHBIOG4fJCjZ
	5vlNY2j09Q
X-Received: by 2002:a5d:4c8b:0:b0:436:34d9:4627 with SMTP id ffacd0b85a97d-43634d94904mr1227148f8f.37.1770460450844;
        Sat, 07 Feb 2026 02:34:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 15/15] python3-virtualenv: patch CVE-2026-22702
Date: Sat,  7 Feb 2026 11:33:57 +0100
Message-ID: <20260207103359.4177243-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124256

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22702

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-virtualenv/CVE-2026-22702.patch   | 60 +++++++++++++++++++
 .../python/python3-virtualenv_20.25.3.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
new file mode 100644
index 0000000000..ef9922ab55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
@@ -0,0 +1,60 @@
+From c43b7ce784de42511f80b45d741715646cc4fa44 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bern=C3=A1t=20G=C3=A1bor?= <gaborjbernat@gmail.com>
+Date: Fri, 9 Jan 2026 10:19:39 -0800
+Subject: [PATCH] Merge pull request #3013 from gaborbernat/fix-sec
+
+CVE: CVE-2026-22702
+Upstream-Status: Backport [https://github.com/pypa/virtualenv/commit/dec4cec5d16edaf83a00a658f32d1e032661cebc]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/virtualenv/app_data/__init__.py | 11 +++++------
+ src/virtualenv/util/lock.py         |  7 +++----
+ 2 files changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/src/virtualenv/app_data/__init__.py b/src/virtualenv/app_data/__init__.py
+index 148c941..301a00f 100644
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
+index b4dc66a..a28b32f 100644
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
index fee5250c4d..5cb99647b3 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.25.3.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
+SRC_URI += "file://CVE-2026-22702.patch"
 SRC_URI[sha256sum] = "7bb554bbdfeaacc3349fa614ea5bff6ac300fc7c335e9facf3a3bcfc703f45be"
 
 BBCLASSEXTEND = "native nativesdk"

