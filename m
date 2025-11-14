Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C268CE7AA2
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 09:47:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14461.1763113641259742397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 01:47:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mz74lR2n;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297d4a56f97so17615325ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763113640; x=1763718440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxToe5Be/QyH68QRGqu5qNx94OJzwCnzygZNNBGbfaw=;
        b=mz74lR2no2mEIrIVFEpV2xVBh+x9bBuE3HsecUSyDVadlZ6Kqmltq7YG/y7lo6xK9i
         jqxCVqEN3NaUpYsIKx+ZaJAD/fm93dTJ5sQwJurwjC9YPKr190D0ZnsO/64+slA2ChYA
         VwpMRYcy7SUqzEiuKTJldA3LSSGCQ6o6lC9cgWtXPEj5BBLWuO3uyrFBjJQnDkFLtBvW
         rfWaGf8QkfWSmp95KgzgwZD3brMpU4vsxHoU4XUyUbsj2RaEIaGX4+x/SEeRxqEqXPKh
         7++EbqpPU2wq3DkQkdgnxEhC2QJrr7ttjoBYLNFNgAOfQjjg7bhtYp5G98pa37nX5wRd
         7quQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763113640; x=1763718440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxToe5Be/QyH68QRGqu5qNx94OJzwCnzygZNNBGbfaw=;
        b=t2J5hdEJlro7nMDaak/hKY7fj0t/rNzuClN7Rm1z6hDsFGF9NopWxon0VqlICDQHtL
         rHnqff4yhNWaV+znNUO2sG6mnnOUUD/QBpQSqhT38x6EMv8KibLL/HBpjQJKBecrw9Ef
         mJdBzqLaC++zGkxNIl9PrtkbCEhZrlgxOyEMs8v2Imn94Jy4l7T62vi40ze56w1jmor+
         wJv1Ot+yLaH8sOK4xxhc3BMsud5hfa6N5s2MwEFjiL+BRfM836Epv1L0MpDCHqXsEeG8
         QeYr1CtYUoWqr0Oj7NN5EWBCWFBKEEMkDfyosJ3UixQDGScrz/zBRiHdjolBmBxskv84
         yWmQ==
X-Gm-Message-State: AOJu0YzTwcfcGJwy9QshQYb2yr6pqiSabIzBuQtuWm+/apb8fies2WYs
	cn/Zt1eyPW07LisTQrm9+kFgu2QGYCn5k3GRcglUMLEvI6Q5OUM06SotEa3dGQ==
X-Gm-Gg: ASbGncuE83q/GWQ6CPJ6mh36aHKCPijnNmU8DFHBJ1wOgek+PEoUjPNBx6D1W7CQWp3
	8q/5IPSjMEpGz/nVw1jOcIPYHw4oqQ63DOWajEHBClnOr72KlRTiWGqc1s88YHL9NjSqFX06mtb
	jUXhlbxi4fl/4FMeP96lmSqbaZ9axeCpHS/h1JSspj0boxKPddLQWDVt5AwY3PNQ43/7Tq40/53
	pyswYtyK+lNmmahs67CuffJX+3VvBHE6MswwzqxBiI6/yoQlUNj8Y8aOsvtQUjgpELbK70dRaj9
	jZJMdkYV1oskXAsV2tB9SzPRJT2f+r3FzDaxPmJSeoXL2FvOGGipLYRgxKfsfTXgD/ci0TDwPeu
	lOqdYkxuQygho8HzK8w/65i17I94TXpm+C0Ln1ZFfeBPzaTuTsyBaMwiTrMyZKwCoqTz0btvlqm
	nAxpRF3QPwZdXg
X-Google-Smtp-Source: AGHT+IExWTGoP1neqoKzTTl4fb38Sl7GlNBudo2uBCJMTdLPWMldLZMENIhCCoAoNusSKinTt5CyrA==
X-Received: by 2002:a17:903:2948:b0:295:9db1:ff41 with SMTP id d9443c01a7336-2986a6be5b3mr18806725ad.21.1763113640534;
        Fri, 14 Nov 2025 01:47:20 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c103asm49413995ad.96.2025.11.14.01.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 01:47:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 4/5] libnvme: upgrade 1.12 -> 1.16.1
Date: Fri, 14 Nov 2025 22:47:02 +1300
Message-ID: <20251114094703.4091777-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
References: <20251114094703.4091777-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 09:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121705

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

changes in v2:
- no change

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

