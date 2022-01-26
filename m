Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953D1C28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 04:14:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.8311.1643170461231028611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YvA1Ut48;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id n32so12526287pfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 20:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CH6QDbTBfPOa3SoOIvddEZVeyS/zg4GLlf/AUcsKJ4=;
        b=YvA1Ut48cBWpH274MpHuWqNAhxXREHLCvTsUveZYGLggKXP29A4WH9LrRUkvWI/d+f
         m6RPnvAphOPtEpoNM1A9VWb7d8bvilSBnFDTd6tWjmq+U2m22hy1JcaD8+axyz0wYDCp
         7lA9UyF6XMBT9ULLqLVnGDR0Dh4CB8RJgWpMPWw6RSPwZJsWt/epiJwJEDk0k4S4cUuk
         5Vl2NY8nuGqogeOGfEJx3ru0iVuQz/tbOrV2PtlnrkIoOYmX6dmpP9dvcJAru3tDDz4m
         kCCupMjP4xl/dSnHnzec611XyNOlrGKuScU1ZJiO609dOTC8DnguG6QCqZBKxunIGVBj
         p5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3CH6QDbTBfPOa3SoOIvddEZVeyS/zg4GLlf/AUcsKJ4=;
        b=xhs5Ool5SfVVMVKt0pavcqKjCLExZeCVbVbBULckO4hQZDa3elvvEcqOZM5rBPmRmZ
         rzv0uNt6Q0Vm36NHk5zK6usWhhYCYS+AVmuRycJv8OXMtg4Ljp7+hI8Nl6hP6TpAB0TG
         gPaOi9yMFrB+DtPe9+oYf6pvskQdhvlkFpdjfQHtQqm5RpLnoQb0jjnhGlJ5vYGM0lXy
         0EustZXIftLIPINDgldKAazZSLmPp8tmPln2VArypqoEEQxYundKWFD7mO/xa6ia7RAi
         /kd78Trg/4bmPz/OBUxrhgaV1fZ8lqNbsNF1M+YchKHwuiUzhP88TTKLbtNOULpB7guH
         Ag4w==
X-Gm-Message-State: AOAM530SH5RZkgda6UPqEZ7JKWEH6GjBs92CUyN89NF9/S2pJzatluxn
	c8FiJ35KIcBFUGnex27S1a5ilfTDZPZ8Hg==
X-Google-Smtp-Source: 
 ABdhPJzcYmiP+6TElHWhW0Jc8jrPhhJfNkWvn99f0hPYQCdw0cz8DB6wGieLSKYLEHI2tQGIN8q74Q==
X-Received: by 2002:a63:1462:: with SMTP id 34mr17530117pgu.229.1643170460326;
        Tue, 25 Jan 2022 20:14:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 ha21sm1720751pjb.48.2022.01.25.20.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:14:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] postgresql: Fix build on riscv
Date: Tue, 25 Jan 2022 20:14:17 -0800
Message-Id: <20220126041417.2342215-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 04:14:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95092

Remove duplicate code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../postgresql/files/remove_duplicate.patch   | 38 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_14.1.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch b/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
new file mode 100644
index 0000000000..92a3dcc710
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
@@ -0,0 +1,38 @@
+Remove duplicate code for riscv
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/include/storage/s_lock.h
++++ b/src/include/storage/s_lock.h
+@@ -341,30 +341,6 @@ tas(volatile slock_t *lock)
+ #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
+ #endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
+ 
+-
+-/*
+- * RISC-V likewise uses __sync_lock_test_and_set(int *, int) if available.
+- */
+-#if defined(__riscv)
+-#ifdef HAVE_GCC__SYNC_INT32_TAS
+-#define HAS_TEST_AND_SET
+-
+-#define TAS(lock) tas(lock)
+-
+-typedef int slock_t;
+-
+-static __inline__ int
+-tas(volatile slock_t *lock)
+-{
+-	return __sync_lock_test_and_set(lock, 1);
+-}
+-
+-#define S_UNLOCK(lock) __sync_lock_release(lock)
+-
+-#endif	 /* HAVE_GCC__SYNC_INT32_TAS */
+-#endif	 /* __riscv */
+-
+-
+ /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
+ #if defined(__s390__) || defined(__s390x__)
+ #define HAS_TEST_AND_SET
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
index 1112cc21d1..680b50bb40 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.1.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
+   file://remove_duplicate.patch \
 "
 
 SRC_URI[sha256sum] = "4d3c101ea7ae38982f06bdc73758b53727fb6402ecd9382006fa5ecc7c2ca41f"
-- 
2.35.0


