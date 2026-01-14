Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECF7D37E27
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:08:15 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9474.1768396093818868168
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:08:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W2du48QJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso3185764a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768396093; x=1769000893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=W2du48QJJRvikER9tJVTPGZ6b6liLVqrblquHxGifjxO/vRHwbwyzkR0Dy1tJ5vVRP
         vOfRxexRXs0FX7R8Be1fpcfNrD19lMhWRrMJN1SlnKMCbP8+Qa1Qs68y9JAJuto9aVkv
         /Mae4kSVbG0n9jpZuXGNoYRkpVWdFhk/mOiaQGd5bEKQb03s07pN+p8V7cQqakrdI1JW
         blP1+MKkBNl/UfD9O2jOeVqzL7PKf8uUd6oNrzMJgZkMh3DhKgTrzGrkgmlutm9/bg+a
         0L7u6npTSzzXaBaoaYA8oTw++9QE7Nud4wJ8CTjuV+e4353pEkLPNivcIDdok2NE0h4k
         EIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396093; x=1769000893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RF4pJj9H8fGJANRyKKXrFxFZqV32WGED+Q7X91pd2G0=;
        b=Zx1/tGcB3y+3vRW6XqgumoQT6W3idpRjsGIUrak6laNkxWW105iMVCDJ8QvtL/QZfA
         B9oZ2MGKouBIQZLYlMfGQsg9Bwl2InSHexuv2tCsVktt8p2nGyYoCN/zHuV0pGo4vPqU
         8DHH5VBsrLqu+q1YOCESCH57I+8dbxMGJ0VLWNycyyyVLfsiwLtGsbvAgPNdO5D/nyfE
         dn6xkI5CzZcRRHxGuY+Huk3C3wc8aehpykt96A7Acs80VF+doO0Z8SYNu17YrXphE4YR
         r/FouDLQfSNleN3Tyj+0zmIB0eOJBTVl/FG21gJA709h4Lg1zAxzhb5PhUjrLqVrzMw6
         RxLg==
X-Gm-Message-State: AOJu0YzZ5Np/dRM3rOh8BMdU+ZYrYAmXjwN4mnTYj0FIHvEIH2Xe52OQ
	Zr2xftgRtUw4xHHYXXEsqed/PG4hbS6ZHHdLb5raQnWYiia6KEnpW76SNR07tg==
X-Gm-Gg: AY/fxX4UIRuGqE7nr6lIVIHNZedx5D2iR0yCmRuxvex4qA62TFKDja9mHbDqe13p3M5
	7HmqFt3Ggx6l9mcZrZKsAij2NA3d9ZxxLrDSeVRL/nED+Enu84lwOUx+7IC9w4gPx74in0V4zAK
	tecbE6Zshq6g0gnikFdeIUGxMlM2PdgC7FBL/1EBcCuv6e5AG58DFiGZNT8ME3p5zxn7oayMnLH
	qA1OBvNErx6rAmFoXfXmVN/SyKK0zBnbam/jf1dAIAH1r34XdQdcKyh8kHICIBZgGytkgYomKnm
	eLWPPPgEaetgeEoltS5PSta9KHdcAKKRIHUZClKsImfUrxgJ51EPH0Pn6zoDCtKyBqVssKvph1i
	+RZ0/IoZcFhC4cM3dzZBw0tMn89TCWmRfJB2VxvaN+ZqlcJrwxELuQ2p06w2YRAbWUp4OXqO1Jq
	KxYyf8JkOm4ZSVK3jCg9hE8JM=
X-Received: by 2002:a17:90a:e70e:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-351091a88edmr2375610a91.33.1768396092990;
        Wed, 14 Jan 2026 05:08:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35106914b1esm1296398a91.1.2026.01.14.05.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:08:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [PATCH] python3-virtualenv: patch CVE-2026-22702
Date: Thu, 15 Jan 2026 02:07:57 +1300
Message-ID: <20260114130800.1021123-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
References: <20260114130800.1021123-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123476

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

