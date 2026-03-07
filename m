Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C9DF55105
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 18:38:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14690.1772908699188988712
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 10:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JWCL8bVz;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4807068eacbso86424855e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 10:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772908697; x=1773513497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAn8RktB/H/RjUYr2aXuEnWi9edyJEcLhOGOzsH+DVk=;
        b=JWCL8bVzWw76wncyc/DhckOOCGc8wpwvqsD/C7s7gN3uGZR6qZIc3MCQEDDWbR4h8q
         HvpMXj5xSwCSdVuMFE8ABd7qr6UKH+rVR7iy4y3VY9NzvtAXAmebv+U3AerRijjdJA0t
         NCtaspug/nVdhAaPoeTooG6T4jPx4m/QjmFR6lT9xlBHxy1OX0dkDr/pURWr4RRDswAY
         1QGMSUZr938J5UJl+4Y1FOv56vuWcWcl8FeXfeFn1RYM0PUSk/mc1QOUOJIKNF8cJM+h
         oIBWIEWVx0JmgM6WNT7syBG134oWIjnimHgrv7GE5+EJuaaZyA5kqKfVknmpxykAG+rC
         Vh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772908697; x=1773513497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAn8RktB/H/RjUYr2aXuEnWi9edyJEcLhOGOzsH+DVk=;
        b=EpdTvl6lfE1IQazWV7kXekZVjSZ1o/yTng86ALJKLhcSFgmLhINgaK9eHnMJZaVfc6
         olI4mGmtAsqdTgTVZQb21b4z1UWciM8RomuAYJfdLYuLruZpvm8aI2BhP2ajkp/AB8vP
         IpdsLlH3WGHbFgHtjlSgNIhbGPQ8EtN4F8iHGdVRpaP4Gyw7eS+tePqS+GgN/Da/YS9J
         3lfWvFVXMgemOx1G1evZXNOD7lszFdQ7tUgUQMlCcrDbihxmAQM0/osGLBUm/PmIuZTl
         ib+u6fbJ5CQbLOtWbdoWIXoqkst2nLZQWheGb+i4GQZpRkkUQzCcSPP/lxANbzZVdE00
         Hgyw==
X-Gm-Message-State: AOJu0Yxegy8XuT8kpG4uC8nQiLMHqou3b59miqng3TcSKcCcxHUqsfxP
	Sn3CZF4DCX58e8IJ84z5s/6Ic+li3K1WBxcMvTI7DojyUjomlsNRv0vWsEiz5g==
X-Gm-Gg: ATEYQzwEd9OZXHgTibcL5cUOspLDyuKEuTpOzXK8QZf6KpVhZ4VVI3qdnpILu/57217
	IuAzRQ4bWy24TArVzpPiR6y0Bnj8Hz0CBOFf3kMBf7h8VPB1sbXPA7zbOHnW3yqTR4Ce86e+wmc
	8oYozyGO+UPYmVqqWlGbXdkA6mqQlr5NjEKGjRaKQT5mPeetekSN1PmLMlIHcUZxrxMAGGFF9PK
	OJTX5rcuxdh6Q7BYyJhp9tP/qe0oKPVLBChLoIMM9Xp9XEibCZaBHFYVvSTvx6vk3P5XFC+8JXW
	uiUEVRnjdU4jvfVfohQCbTatxGqg2kb872c2cKEIvuaax5kjjCwbnHWsI8B6Ugp8JdAcxDhzQBW
	WJKL/7fikWkhDfyu8GtTlKM4DyfeXX9augz090urFROrr5s+P56qrVduoRiZLpdGYsPQwnDzk3w
	vb3mGdebvUQO1F5W7IgmsS
X-Received: by 2002:a05:600c:198f:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-485268b8dbemr104240345e9.0.1772908697191;
        Sat, 07 Mar 2026 10:38:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852e38c013sm127306365e9.8.2026.03.07.10.38.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 10:38:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] emlog: bump to latest revision
Date: Sat,  7 Mar 2026 19:38:15 +0100
Message-ID: <20260307183815.630447-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 18:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124933

Drop the patch that is included in this release.

Actually that is also the changelog since the previous version - there
were no other changes beside the accepted patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/emlog/emlog.inc          |  3 +-
 ...not-use-no_llseek-with-kernel-6.12.0.patch | 32 -------------------
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index ff2a106c6e..d51c9723fd 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -4,8 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=https;branch=master"
-SRC_URI += "file://0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch"
-SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
+SRCREV = "a50aae487f689c1abb46b151abc68d6635b9b2fe"
 PV = "0.70+git"
 
 CVE_PRODUCT = "nicupavel:emlog"
diff --git a/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch b/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
deleted file mode 100644
index 86f719b0bb..0000000000
--- a/meta-oe/recipes-core/emlog/files/0001-emlog-Do-not-use-no_llseek-with-kernel-6.12.0.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From dca01ea62833249d78ac3bdf277b73424bf93e89 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Dec 2024 09:55:10 -0800
-Subject: [PATCH] emlog: Do not use no_llseek with kernel 6.12.0+
-
-no_llseek is finally gone with 6.12-rc1 [1]
-
-[1] https://github.com/torvalds/linux/commit/cb787f4ac0c2e439ea8d7e6387b925f74576bdf8
-
-Upstream-Status: Submitted [https://github.com/nicupavel/emlog/pull/16]
----
- emlog.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/emlog.c b/emlog.c
-index 2ead738..b45c72d 100644
---- a/emlog.c
-+++ b/emlog.c
-@@ -464,7 +464,12 @@ static const struct file_operations emlog_fops = {
-     .open = emlog_open,
-     .release = emlog_release,
-     .poll = emlog_poll,
--    .llseek = no_llseek,        /* no_llseek by default introduced at v2.6.37-rc1 */
-+#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 12, 0)
-+    /* no_llseek by default introduced at v2.6.37-rc1 and
-+     * removed in 6.12.0
-+     */
-+    .llseek = no_llseek,
-+#endif
-     .owner = THIS_MODULE,
- };
- 

