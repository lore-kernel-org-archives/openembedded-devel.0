Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123F9C4167B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.1774.1650411421817825519
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q4gfCnFF;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id bg24so280547pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 16:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ci2ByVv0JK42Bcsh5EzETHL8DW4P+59RcOwKSab9WgQ=;
        b=Q4gfCnFF41D//gPYvXRqpdhweBjqNu3pUDuD+gH4oPY/jDpHNfhKasEHnr95+79tOO
         2C0GlO2tdOz+Ddi7R4TTZO0kRWN+klsM7Gwe8sPmsALZgBziL4zyieZrtbAsaj/0RjuM
         x5MeOfTkFGItAl+PGS75m5zXStmuH/PQTSYIIrybbDnxx+I2uAsf9h/2GzKwasLfClby
         oYAWRRoaJy3nWfNH22PZCoVES9C66v4e75Q3l5dg10Kbro7DTYQ7RsqWb6OLm08+kqCz
         hHy0ljGYFUuQXgsIVV6eRy/eFhsPko30eVvinOshCAM3sN2jd/8KoLtErSr4X2B8DogJ
         9/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ci2ByVv0JK42Bcsh5EzETHL8DW4P+59RcOwKSab9WgQ=;
        b=OvbUQDGQcpNu//ITgqXItUEz5Nt9Rps+Oz5DoU3I6cEcnrjGxbY6zDpn5B6KujhC31
         db+JCYVe0M+0TwmcAUqfe4ABOzTSLAeCnTrZxJFJ4JljaB5f/LSJIKeWF8+QWKKDMMS1
         Zu6T9A0UjyhVj7c6l4w+Eg4ZBwyvK9+YxbFANLkEdy1eBa7pQa0WITY+W33f7rW0HEhG
         Pbnq3OMozB4tyT7vB0/ps7INJIQp5b+TM6PezpXDFR9FGEbqb7pzHMyn0YM2/+/rXweE
         2cTp6A35jK1VLwQJAc14M8fwA2SG3nAj261Oy/ZS72bvFQHKvUlXPoz+e9recSKhjQwr
         vN7w==
X-Gm-Message-State: AOAM531unQcdh9Y1ZuBLkOVbvEN2MCCLZsI9Z+nFc6QuyBq0WLkpgSJq
	w7q8D6In4InjMkaUF9ZcSReH1g2YBlM=
X-Google-Smtp-Source: 
 ABdhPJy6A0ARBWhcAONBGmkre2bRvp9TAGvsNTK9+FHNVXf0wrC4Fgb0V7oyP1CuucVRPYG7XIeQ1g==
X-Received: by 2002:a17:90b:3809:b0:1d2:ab07:484a with SMTP id
 mq9-20020a17090b380900b001d2ab07484amr1150806pjb.236.1650411421065;
        Tue, 19 Apr 2022 16:37:01 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:2612:f5e4:3246:fbef])
        by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001c77e79531bsm22220665pjb.50.2022.04.19.16.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 16:37:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] postgresql: Fix build on riscv
Date: Tue, 19 Apr 2022 16:36:59 -0700
Message-Id: <20220419233659.1294216-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96707

From: Khem Raj <raj.khem@gmail.com>

Remove duplicate code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa22894fa352986a62c4530ad8facd8868b2e535)
[Fixup for Dunfell context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/files/remove_duplicate.patch   | 38 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_12.9.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch b/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
new file mode 100644
index 000000000..92a3dcc71
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
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
index b4c23ced2..67bf2b960 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
@@ -6,6 +6,7 @@ SRC_URI += "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
+   file://remove_duplicate.patch \
 "
 
 SRC_URI[sha256sum] = "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe0dd1a540a2b56dce"
-- 
2.25.1


