Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702F1CDE008
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 03:50:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10474.1763092243445034990
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 19:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cY/W/6jO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso1703296b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 19:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763092242; x=1763697042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jZcHDkpVxQjd9njeiTN57tjWVKN2vDeamMI5TACHSE=;
        b=cY/W/6jOjzgy7541KTXa7STgCJ3ZTHya0BxW/G2/HqjZk833kNnbBlP7ZCp4gUhsUN
         IWoF39WtlT97UiYosQFf4w77TVBorH9BwNMsuiot9LIouhACvkrc/sagoKK+4kAMszRk
         l+vRoq46DCtkrtUiOfKg3r435FcJGkK0MYYemCghsO1qdpjDGol+N7SJNzHnO6hS8R04
         eEIJHHd05CxoSjm6EfYvVoe18jUsX7OL7N2T9xlvdcpFM8ICSBY4N3Q87OCdbjPYD5+E
         xzH7RL7rMUJAe7gr7WpkWzAwg+sQnR7IxeCXQqP0Ym+edTCyhQlKaNJP5Aie6eAgUQ+T
         rs/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763092242; x=1763697042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jZcHDkpVxQjd9njeiTN57tjWVKN2vDeamMI5TACHSE=;
        b=mcyNxZw/DhI0mNUgOzpPQG7byM3qPYfGQLHYX6TwcJSb4EG6QxcmGeUMfz1SdDJ3Jf
         BVa28HEro7bK2aVDk5gmaB+lt2qoaUvx4gRkqFUw+qBPIPD33sZ7iFVwCFvuUpewMQZ2
         FaTI8CVQuQR9ikA9fpHA8W0qSjlTQHnq+ZX0+RwAgxkNA6TBAesWv0QAOKoXmJxy0x5S
         2XLhAJMCmWQwRbqnEfXUhycHlHd3cGK71F+9DgYSo7Oe4D5Sriv7s62iESF2wnqd1zX7
         pfKtig1iohYdxxIpiIdwr2ezicpopwHzYlYIhHCSm2sqvHS8+1hS3QQy42taUBRvywo8
         sT5w==
X-Gm-Message-State: AOJu0Yy7ZBVS1/KLrQGXlx55hfUbOEgMP8mUE7j9IOXnI09deZ4f1QsI
	ah9Hs6VRYUq5+NrqEBj1X2dZ4oLkIvsdHkZBu+Y9K+wYvPRuHs8WVX0DCkmLXA==
X-Gm-Gg: ASbGncvcUf6aFn2Z6+OvA8Efh/TG2iDUIguWTpNXLxPOi86xmWdhlGfwfUJ+SfhhZs7
	ygH8Q601mh8LreutZaLmqPF8nBIrkjq3NS0xIiBugtyiuqj+78NxDzADLENfAEhnQ4vgiFO0NzN
	bjeBgr7FrlOpMMXMSsR+pl2Cblcq9HIjW2cOLWoNS8iayd2CGW1uXZWo9/XZNNoj5NHHuVjXBgw
	jb8h64OrrO7TtYtrNpcslKJ2VF8J8iMbU8M1RaD42WlfFoOehU9urEpx/KeGQ7tDiHIRlG9VpFY
	q1XGEd40AryVSLt7vBYg7Z+1/3CxYjoBIznQ9t1eQyWZfC6x0NCi24H2DgXA76LGDb7+f46aGBt
	fF2QpBLX3hOpnKpVYGbLjvF7jD96IeqEfCml+z1E5L07K3/ZsV0ZuVk3iJmWAschAtD5BEN5U9K
	LxzZFUIgpLqVrRlw==
X-Google-Smtp-Source: AGHT+IHdErpYBJNa5bzysa3fJAGp98MFJpiH916cv0KCS6TDQ/7mbBsdIsNpnG+bL8xdNgRrsU3bkg==
X-Received: by 2002:a05:6a20:6a21:b0:342:a261:e2bc with SMTP id adf61e73a8af0-35b9f7802fdmr2521977637.10.1763092242553;
        Thu, 13 Nov 2025 19:50:42 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37507fc7bsm3478092a12.23.2025.11.13.19.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:50:42 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/5] libnvme: upgrade 1.12 -> 1.16.1
Date: Fri, 14 Nov 2025 16:50:29 +1300
Message-ID: <20251114035030.4042745-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
References: <20251114035030.4042745-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 03:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121680

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use PACKAGECONFIG to support liburing which is now disabled by default.
Dropped patch which is now merged in the upstream.

Changelog:
https://github.com/linux-nvme/libnvme/releases/tag/v1.13
https://github.com/linux-nvme/libnvme/releases/tag/v1.14
https://github.com/linux-nvme/libnvme/releases/tag/v1.15
https://github.com/linux-nvme/libnvme/releases/tag/v1.16
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...k.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch | 41 -------------------
 .../{libnvme_1.12.bb => libnvme_1.16.1.bb}    |  6 +--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
 rename meta-oe/recipes-support/libnvme/{libnvme_1.12.bb => libnvme_1.16.1.bb} (88%)

diff --git a/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch b/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
deleted file mode 100644
index 8734d443bb..0000000000
--- a/meta-oe/recipes-support/libnvme/files/0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 14328a9a429fd84ddd1a3ed4fb0eb9643c61fa58 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 7 Apr 2025 13:23:57 +0800
-Subject: [PATCH] mock.c: fix checking of HAVE_GLIBC_IOCTL
-
-Commit [ 0d8d0a55 build: do not include config.h globally ]
-changed to always pass -DHAVE_GLIBC_IOCTL=[0|1], and this causes
-a regression, for system without glibc ioctl, -DHAVE_GLIBC_IOCTL=0
-is passed, and causes error:
-../git/test/ioctl/mock.c:123:5: error: conflicting types for 'ioctl'; have 'int(int,  long unsigned int, ...)'
-  123 | int ioctl(int fd, unsigned long request, ...)
-      |     ^~~~~
-In file included from ../git/test/ioctl/mock.c:9:
-pathto/usr/include/sys/ioctl.h:115:5: note: previous declaration of 'ioctl' with type 'int(int,  int, ...)'
-  115 | int ioctl (int, int, ...);
-
-Fixed by checking value of HAVE_GLIBC_IOCTL in mock.c
-
-Upstream-Status: Submitted [https://github.com/linux-nvme/libnvme/pull/985]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- test/ioctl/mock.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/ioctl/mock.c b/test/ioctl/mock.c
-index 7402b45c..da3caba8 100644
---- a/test/ioctl/mock.c
-+++ b/test/ioctl/mock.c
-@@ -118,7 +118,7 @@ void end_mock_cmds(void)
- 	} \
- })
- 
--#ifdef HAVE_GLIBC_IOCTL
-+#if defined(HAVE_GLIBC_IOCTL) && HAVE_GLIBC_IOCTL == 1
- typedef int (*ioctl_func_t)(int, unsigned long, void *);
- int ioctl(int fd, unsigned long request, ...)
- #else
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb b/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
similarity index 88%
rename from meta-oe/recipes-support/libnvme/libnvme_1.12.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
index 95d18a1ed0..fbbe141487 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.12.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "5ec1f5284ecb0eda481f3d2d61236fbc5b46164f"
+SRCREV = "becae3d874b40bfedede672b4b2f58ae8c3be3b5"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master \
-           file://0001-mock.c-fix-checking-of-HAVE_GLIBC_IOCTL.patch"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
 
 
 inherit meson pkgconfig
@@ -24,3 +23,4 @@ PACKAGECONFIG ??= "keyutils openssl"
 PACKAGECONFIG[keyutils] = "-Dkeyutils=enabled,-Dkeyutils=disabled,keyutils"
 PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
 PACKAGECONFIG[python] = "-Dpython=enabled,-Dpython=disabled,python"
+PACKAGECONFIG[liburing] = "-Dliburing=enabled,-Dliburing=disabled,liburing"

