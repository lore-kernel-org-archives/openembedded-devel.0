Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FACE9127E
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15263.1770274809507136825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jz21umpf;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so3807985e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274808; x=1770879608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir7/Bfg6OOfWehc2UOeRfJB13oWTMflU1j6U8JLXECQ=;
        b=Jz21umpfydJgpAxAjbvHu0PP3iey7bw5nTyCC+sxWFiNH5+CIH0wt1UE0J/I4dBMLM
         Ck58wFjphO6pZlsAKW6J6GqhUGruRi1sqoWbTrs2MPYWw+cBxon0TziZPkQxlQ5V4GMw
         NHqxV1AcKUaYsEenwBOynSt+K0n/O8BXRdWrR/0iQAgXdQzqUOaghDwj5abfTTl8hF3U
         CzzyepPuVWnnqZ+U6jUIEBWHOdlgfR2Iy8KHhJzVCne0voJILOLMnVo40zB+aJ3N/EbA
         y9H7Q8CyGag8OUSxoKiZqpFBK17BpXRst9zI3MPPqP8Qte17YWj8YfXb5gXKyA3bfjnd
         IiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274808; x=1770879608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ir7/Bfg6OOfWehc2UOeRfJB13oWTMflU1j6U8JLXECQ=;
        b=PA4v82SjQ2IWVg6jpDW7sWOnf3QKbhfZLpBlYQc4XP3D3Vnmuq1e3EXELWWSxC1HmP
         gnwUHxNHrDo3sol6s2mUncoXQFAvA4jwe99FdY5j8k43T5bCkuDx0wk9g29+VweKsVv/
         YU1fI92Kv+iwIKBqxebby5s4aDQAEDYfT2Pnk6tvmvawX2aHWaYqCQJ6oMY0PAecQssP
         wDqAq+UObMJClQ232i5S1HyNlJFJcnz7RDc21DrtrvaD9S7dIryRVwq9IGKO02yIJUO/
         k9xHcttPmTaYWQOfoU497GrLBMQOPzosWRpmvkwFYGmAnOUg7hVCTHLDgrJzvNln0s7P
         sl+Q==
X-Gm-Message-State: AOJu0Yx19kD4Vbqfi63YSIub2xGVz2BgG1Frh3eBgeAU8Gc3j+aR1Jwt
	q0xIw0oTTYMCTl3zyTju0F6ZApkvCgOvr93k2ZVkYiE/ZVaCXC2n2dtAoIlqmA==
X-Gm-Gg: AZuq6aKEMhsrPf3E5kReoIVCtt0x1OPe1E5uy+hNUCLe6Usna+6OW8jWLtx2hgVeVwR
	wG9C8IznKkxgzdIoT962PmQhe+efY5DCX3yoD7PKwB/T+J9TPRq5lrIQOdikLB3vRNiLo505tdE
	mZbeXTbdmnYIuIP0kFM/g+DlqXUgPVNT35JcS7SmWyEeQN0jkN62qjnhFHWqdJY9n652eyFPWEV
	4rnWg1+eiCdnLB0rFxIXQfBB4e+uQhSVhGeNqDM9plz/z27oMBGuwvaM0HZf5kIvFAf3xMqLFsY
	ZvF2Rz6WYmLIMc8gDC7SJx47CWp7/fMgFB4VFcRVGXb9wVPLWewMC034c9bgxTAbabKZdG5ueIB
	lxsWvsHiROo1zBVSQntpNS8duqDAaMPhy/8363hAB/5muhEVPd4MZ0vHPICnV8ccMgpvkmhr2cZ
	6KuAP7t1OE
X-Received: by 2002:a05:600c:8712:b0:480:4be7:4f53 with SMTP id 5b1f17b1804b1-4830e99333amr91236755e9.31.1770274807714;
        Wed, 04 Feb 2026 23:00:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 16/20] python3-virtualenv: patch CVE-2026-22702
Date: Thu,  5 Feb 2026 07:59:51 +0100
Message-ID: <20260205065955.1267785-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124192

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22702

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-virtualenv/CVE-2026-22702.patch   | 60 +++++++++++++++++++
 .../python/python3-virtualenv_20.35.4.bb      |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
new file mode 100644
index 0000000000..a0b6d80a42
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
@@ -0,0 +1,60 @@
+From 2e9f44a74a8adbaf641475c58f1cfa1bb7ab15e1 Mon Sep 17 00:00:00 2001
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
+index d7f1480..7a9d38e 100644
+--- a/src/virtualenv/app_data/__init__.py
++++ b/src/virtualenv/app_data/__init__.py
+@@ -36,12 +36,11 @@ def make_app_data(folder, **kwargs):
+     if is_read_only:
+         return ReadOnlyAppData(folder)
+ 
+-    if not os.path.isdir(folder):
+-        try:
+-            os.makedirs(folder)
+-            LOGGER.debug("created app data folder %s", folder)
+-        except OSError as exception:
+-            LOGGER.info("could not create app data folder %s due to %r", folder, exception)
++    try:
++        os.makedirs(folder, exist_ok=True)
++        LOGGER.debug("created app data folder %s", folder)
++    except OSError as exception:
++        LOGGER.info("could not create app data folder %s due to %r", folder, exception)
+ 
+     if os.access(folder, os.W_OK):
+         return AppDataDiskFolder(folder)
+diff --git a/src/virtualenv/util/lock.py b/src/virtualenv/util/lock.py
+index b250e03..82c8eed 100644
+--- a/src/virtualenv/util/lock.py
++++ b/src/virtualenv/util/lock.py
+@@ -17,9 +17,8 @@ LOGGER = logging.getLogger(__name__)
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
+@@ -117,7 +116,7 @@ class ReentrantFileLock(PathLockBase):
+         # a lock, but that lock might then become expensive, and it's not clear where that lock should live.
+         # Instead here we just ignore if we fail to create the directory.
+         with suppress(OSError):
+-            os.makedirs(str(self.path))
++            os.makedirs(str(self.path), exist_ok=True)
+ 
+         try:
+             lock.acquire(0.0001)
diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
index 28444f12c4..e40aa98863 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.35.4.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
+SRC_URI += "file://CVE-2026-22702.patch"
 SRC_URI[sha256sum] = "643d3914d73d3eeb0c552cbb12d7e82adf0e504dbf86a3182f8771a153a1971c"
 
 BBCLASSEXTEND = "native nativesdk"

