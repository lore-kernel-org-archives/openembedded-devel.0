Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A0ACCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.34151.1761574560778639042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+0jvV5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso35668735e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574559; x=1762179359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCexvCMiYoE4BHFcYQO/escaPaQGa8lkrCe7tQ7DbbM=;
        b=A+0jvV5nArU2iF97N/RuqoRrvVgC+YlnZ7DD7LbIlV6FOv7W0iyCwj1ZL+Kr+nYWhO
         NmzVLHC0k/j7mCG15Xs0HnG2Xrh98jaQxuP4op3iyfEORGugkOKWhcfZ/wK7QrTTHf1r
         msnqvXCta0QDbMv6dgJb1K0tI+ti8jVrQvDo239GWhU8A03KI5bwlwNiFKu6feKHW2Yl
         D5kGzadh1FGlKzsCd/JTQGQSb4k9u88LpB4mFKy/e02q0aU04Zh1IMktRnMR6n4670Ar
         UeOrlqpAr3pqc5WF0h6WEzuH9xWSScDMVQeSRiNM9gGTbriflHa9PFmU3G/qTo/8ehSj
         GucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574559; x=1762179359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCexvCMiYoE4BHFcYQO/escaPaQGa8lkrCe7tQ7DbbM=;
        b=BwUFmD6eiLIfqBaWMsAFdp65N7isBRvFl9DUzAna7R8Qjmu02+YioX3tyIFcWVwo+m
         18jh1JQJRDn9E4n1sc7DD/pMa4ogGRQhl7e15e7KWTE5RNykVqff9nwME1QpNkkYYQ7/
         LcWIKZ5zWe6+P8lcRU9Op//y+GeG+5FtYPNd/AJsQ2lfcrBPLbk6j40HtH6BFq7tOlMl
         Mi1t6gdCT1jMLhHzMsAyqb9sEU0fdzZW+SYHmyAwe8PyYgCXO74DWwhRJBBybViXKYd+
         nDDbWehkHrNTHqsnlY6o5LCaJOS7p5HMZ3Gxv53W5/HUuwJd44IkgHBlPyo55FlvjXsu
         jP9w==
X-Gm-Message-State: AOJu0YxNqJdXklksqDyfjvGXZBb3LWBsYgR8HlfY3+xybhDMXUxMcXYu
	J4/L2jHi9dBbURlZ9i/d8dofrC5zRh0DA1KH/3PRkkQXP1bZ0pgaY7bOvX6djQ==
X-Gm-Gg: ASbGncumQlWQ5iqTA2HYqxn0sOY4HM5aUoUzgrrntvaW6gQ34pL/Z039O5TVQWJPI3X
	++OxVuAb745QIhlF2A8fGDiYTe5zZC1HTuRjwx2DfY3BX7Xzl7hzripZIHpffTGVIL1Stvziy96
	bSRqy7KkDvu89Hmf65Q5wVOGWjItT5kkwntk8gec6bdoElR7XEbqJRlFaGCi7GTk/53LH/xiW7Y
	TSVlTAUNcZIyE10hnBeBuVQp8B9N+5wJHEqhiDjS1C4oA20nXMAwz64Vdw0EVItlYJbQpfxt9ms
	zzdItbyAH+Twtbnt0UeLBO22ZbmE7bfW2VJPkOb9soJs3ldNSdHIy6+BVHAQxY+apRb9flVP2D3
	YCRSqmeWuozrm1yc753bknFHvn98U5KhA1alKVmXosEh9iVWX57W8467pQdnep2ByMiIWqrmvc5
	pV0vzLdlZP
X-Google-Smtp-Source: AGHT+IFdMfb5PMu+yGwLF0NA5R28ey+ZBbE6mhVmGiQhzJ/ZTIL2WM79h3nKTeJkAdbU+X2dpXuWaQ==
X-Received: by 2002:a05:600c:1d20:b0:476:4efc:8ed4 with SMTP id 5b1f17b1804b1-4764efc9b5amr74943075e9.11.1761574558765;
        Mon, 27 Oct 2025 07:15:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.15.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:15:58 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-initramfs][kirkstone][PATCH 01/10] klibc: patch CVE-2021-31870
Date: Mon, 27 Oct 2025 15:15:48 +0100
Message-ID: <20251027141557.1893563-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121041

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-31870

Pick patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../klibc/files/CVE-2021-31870.patch          | 45 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch
new file mode 100644
index 0000000000..028b5d395e
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/CVE-2021-31870.patch
@@ -0,0 +1,45 @@
+From 15c0e066ac8a75bdb3189dd5d77dc0f3539afefd Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 28 Apr 2021 04:29:50 +0200
+Subject: [PATCH] calloc: Fail if multiplication overflows
+
+calloc() multiplies its 2 arguments together and passes the result to
+malloc().  Since the factors and product both have type size_t, this
+can result in an integer overflow and subsequent buffer overflow.
+Check for this and fail if it happens.
+
+CVE-2021-31870
+
+CVE: CVE-2021-31870
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=292650f04c2b5348b4efbad61fb014ed09b4f3f2]
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ usr/klibc/calloc.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/usr/klibc/calloc.c b/usr/klibc/calloc.c
+index 53dcc6b..4a81cda 100644
+--- a/usr/klibc/calloc.c
++++ b/usr/klibc/calloc.c
+@@ -2,12 +2,17 @@
+  * calloc.c
+  */
+ 
++#include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-/* FIXME: This should look for multiplication overflow */
+-
+ void *calloc(size_t nmemb, size_t size)
+ {
+-	return zalloc(nmemb * size);
++	unsigned long prod;
++
++	if (__builtin_umull_overflow(nmemb, size, &prod)) {
++		errno = ENOMEM;
++		return NULL;
++	}
++	return zalloc(prod);
+ }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index ceb4f5ad3b..dd22282b40 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -21,6 +21,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://cross-clang.patch \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
+           file://CVE-2021-31870.patch \
            "
 
 ARMPATCHES ?= ""

