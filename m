Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5698.1794974928494660109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d/6u+amy;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so1677606eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974928; x=1795579728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ISj+LutErgZ/IL1Wc+0s1g96x75kt8v9RnL2M09waQ=;
        b=d/6u+amyWWGxLeasyeETawCtC83fh5m/cr84DsNUpKAht3IqGkw6MHWNb5En5V306G
         vmCQHCvsu/cGA9bydjypz7MpBmBrjJUHrZA5F2KKJGkfoISOaFaYcxlIHGF//XyKjO20
         uLBysVi+PkChntj/h4wS2jOSGonwl/JEhQIvgbxiuqzJxpNlMBK3CXrIrb76TainoWdN
         Hd+ChvI4Hr1r3aO6OD0sOtmfskSquXwWSMkN0qmvW5eT0Jc8ACsID/kcfkEJjWWmXKlQ
         vQl1lh78IeYqQQs19Wq6WLhLHTlO95fiWT6BqyITnkcdO/fXUFudBdGrFooPblQJkQc2
         yIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974928; x=1795579728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ISj+LutErgZ/IL1Wc+0s1g96x75kt8v9RnL2M09waQ=;
        b=RpkvD5ShoWnySRJDgQ03q8i438tv6bIpqcUkiB2XLx1Gz+IcqV8TRL8kF5+AiYcrt9
         QHZT77NEqTfJH81fhPM0Ujf/2MCEZuZ37pxvbafSB0vIS7a0zwsF1jRhQjAH+O3ogJCk
         RrU1lzDy+qoN2Fr020u6jgOgH7YLh4KjMCLT1rPCoSvxSE7GDNoLG/DyWmZezruqqz8Q
         vkaHWNfArPMZKbvSSLc1dIM6OX1xxMiEUq0KGhqqmrcKSUPk9Hsfqh9NX+VAMPMbanbU
         j9sCJ4wj/sT8UESAxAgz8uYLowizdcl7u01GFSychHW7VK7Ppo/JJqzRNuHKI9dvs4gx
         6wdA==
X-Gm-Message-State: APuU4Z/By97aShuqBgU36TVU1zIk60R2hc4Y8q70fKZ+n9/MkEvNEps2
	xrbLysYhO5vEJYwB/Mx0UvBgE0+g5EVVP9L3RKCNipzMkRx68yLG9iyTLDCM+Yd9
X-Gm-Gg: AZFdTZdig24t8XFn8VlnhydXhjVyMaYJ66RTyU7sBRDO/JVcs5VN1LMExPhre1eoBxG
	tZPsLP+gpl4gggGmsgrkhriYRmcUSrYnZ+goS36kUUfYTREnL4KG6tNGlcqP6yizVkZk3kbxPwl
	bj+fOxYo64ys72X2XARUtJQDzz7PSKsZAz4HRkWFh5RXStwwgvHKUP0qMdDAjcLRqQGMApWfxPE
	u7SNrDLmoECl66VvoyXHmr80tlJGa89tv3hxZ6127NjMHF0Z92CZ/30xNFcoFqpRuuIHmFka19N
	dEnSG0fm3cV4KGUyTU8TSlEHygwy8JDEM4TCA7JWd3uH4g2eJ4AzMCjhZhrNMp5arWJO9VLmOmH
	JsdozqoefWc7rnOrYxCDUFLMz2ls/zU4mXFDk3nPc+greg1drhmd/uWG9sPZfXlnkXB6jYrcila
	TrI6FumpPmcdFjqR23Vk2fFoMjWzPd8etmFvAynZHIlm7W72nFsAaNXjhX6HhFdKbMdrsvgZTN0
	6XZJtrZD61nSAiv6QuS5rZAyUXv6SkxgyvRaVfVvV/tl3+cLPz++qhpPLsskkeYHfi8FgU154Lo
	6fYBirtRVl0Qu5Kow0zZPHbMHKzYSigOv6ALvnJgkyGsRNESj8qg5Tx2zGMPKOOkm8SxxH6AVrf
	S56CY8kNAf7HyfBK+hIWhYG8rX7DBfYxenRQiODpXvSvKQzNndjrSskeQQhvgL1ocOPdK3aRlYh
	weVi8s/u4NHRgRAVx6yKopLGXiTpUa+nw12XHDsDMcAPT+ef87HwW9AYzOyYWKSuh6zsbfXvRKl
	EDAqqGs4I5Q5uIHCbcXp9e1XR2qkDWYDZKwId/8SNwDT0jxX+GaBmjfwfJkA6f6yOdHslaP3vtu
	qKUD
X-Received: by 2002:a05:7301:908:b0:36c:a321:9fbc with SMTP id 5a478bee46e88-3827da10cadmr1333100eec.1.1794974927789;
        Tue, 17 Nov 2026 20:08:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 8/8] fuse: Use upstream version of fuse_kernel.h include fix
Date: Tue, 17 Nov 2026 20:08:30 -0800
Message-ID: <20261118040831.2284885-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
References: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132623
Content-Type: text/plain; charset="utf-8"

Replace aarch64.patch with the change upstream actually merged,
libfuse commit 914871b20a90 ("fuse_kernel.h: clean includes"), which
uses <linux/types.h> on Linux and keeps the stdint.h definitions for
other operating systems.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-fuse_kernel.h-clean-includes.patch   | 36 +++++++++++++++++++
 .../recipes-support/fuse/files/aarch64.patch  | 33 -----------------
 .../recipes-support/fuse/fuse_2.9.9.bb        |  2 +-
 3 files changed, 37 insertions(+), 34 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/fuse/files/0001-fuse_kernel.h-clean-includes.patch
 delete mode 100644 meta-filesystems/recipes-support/fuse/files/aarch64.patch

diff --git a/meta-filesystems/recipes-support/fuse/files/0001-fuse_kernel.h-clean-includes.patch b/meta-filesystems/recipes-support/fuse/files/0001-fuse_kernel.h-clean-includes.patch
new file mode 100644
index 0000000000..a89da971de
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/files/0001-fuse_kernel.h-clean-includes.patch
@@ -0,0 +1,36 @@
+From 914871b20a901e3e1e981c92bc42b1c93b7ab81b Mon Sep 17 00:00:00 2001
+From: Riku Voipio <riku.voipio@linaro.org>
+Date: Thu, 7 Feb 2013 12:04:21 +0100
+Subject: [PATCH] fuse_kernel.h: clean includes
+
+Use <linux/types.h> for linux and define types used for other operating systems
+using <stdint.h> types.
+
+Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/914871b20a901e3e1e981c92bc42b1c93b7ab81b]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/fuse_kernel.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
+index 501450c..df8e9b9 100644
+--- a/include/fuse_kernel.h
++++ b/include/fuse_kernel.h
+@@ -91,12 +91,16 @@
+ #ifndef _LINUX_FUSE_H
+ #define _LINUX_FUSE_H
+
+-#include <sys/types.h>
++#ifdef __linux__
++#include <linux/types.h>
++#else
++#include <stdint.h>
+ #define __u64 uint64_t
+ #define __s64 int64_t
+ #define __u32 uint32_t
+ #define __s32 int32_t
+ #define __u16 uint16_t
++#endif
+
+ /*
+  * Version negotiation:
diff --git a/meta-filesystems/recipes-support/fuse/files/aarch64.patch b/meta-filesystems/recipes-support/fuse/files/aarch64.patch
deleted file mode 100644
index 4c14a8f827..0000000000
--- a/meta-filesystems/recipes-support/fuse/files/aarch64.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-fuse: add aarch64 support
-
-u64/u32 is not defined in sys/types.h, include linux/types.h like
-the kernel version of fuse.h does. Patch sent to upstream mailing list.
-
-Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/914871b20a901e3e1e981c92bc42b1c93b7ab81b]
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- include/fuse_kernel.h | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
-index c632b58..e804278 100644
---- a/include/fuse_kernel.h
-+++ b/include/fuse_kernel.h
-@@ -88,12 +88,7 @@
- #ifndef _LINUX_FUSE_H
- #define _LINUX_FUSE_H
-
--#include <sys/types.h>
--#define __u64 uint64_t
--#define __s64 int64_t
--#define __u32 uint32_t
--#define __s32 int32_t
--#define __u16 uint16_t
-+#include <linux/types.h>
-
- /*
-  * Version negotiation:
---
-1.8.1.2
-
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 1600068c0f..f127514f68 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.gz \
-           file://aarch64.patch \
+           file://0001-fuse_kernel.h-clean-includes.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse2-0007-util-ulockmgr_server.c-conditionally-define-closefro.patch \
            file://fuse.conf \
