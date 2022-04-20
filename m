Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFB6C41535
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.2501.1650416289078678843
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 17:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kLG8P6cg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id s14so316158plk.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 17:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEYfVPNy6wpkl4xdnzQqBcii/7BW1cpLuYsCwcaxH8o=;
        b=kLG8P6cglkKPsfAnS8aKkwsPkb0cctCew5nFgKHgOWPLf194H91dJQ8Fnzr+hi2r3Z
         wG6qshtJfyG5W8kMN2z5e5wZ+z/DFnt0FLlUd/wmtLA/3UjBL1t7aumNLNX0RjUbTkbz
         6cVcm6/T4s7SDNFXgBL/S3AFWsI15yom55OA0D0/ZYGnjUoh6Hh1xFUztJPrxonNKRNk
         M3VcqdoaBpfamplMWbQ0aQKvODLbCcvWOHxQnldScW0vw0e9Kj85EQ4EwRkuGKp7Zy0l
         beLWSgiAJcXqijycld6+CzivZwrsXT4KkQ0Gws5tLzzUdvplSWQFQgDkXtRTXaFq74rE
         abWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jEYfVPNy6wpkl4xdnzQqBcii/7BW1cpLuYsCwcaxH8o=;
        b=ye6i7747lLYnF1OS1etniu2oKQ3s97Mxleir+KU0yJeZpZ6D6HAeqMPpsdULbmi22Z
         5duXvdaz4DME8elvF2Zo4OcomlWgrEwSvplPsD/8Vwsd1fRj68evr77NoSF1uROc5IdS
         phFXU1r0bq+sgiwOSlx4T/9MarSBq35xR8mFNevc52GS08zSmyOyN+c/UU2sShetlHUV
         QOFl+iD1Agjn3SWEdCRFrPFlCcokyz+r5u95+IqmFqVAz7xbBSgD26O1T7HVhEuy5+aq
         8jsq2O5wyHb+mwNGZlbBAIlJEMQ6AJQ/q3smG6bfmKStOCKC6/sKold2ANfkOomXj9Z0
         A8hQ==
X-Gm-Message-State: AOAM531p/pd19+pkj9Ypb7/wQrx8+nMsedHPsM4rGcac0Sc2l5Hwxcts
	eawzLxSecxgveGDsH2LWnlm7eQbk+Rs=
X-Google-Smtp-Source: 
 ABdhPJwTGxSM1JIrIYarM0nN/1PffG+4CefqDDAhKlIy+Cpo6H84T5FF8r69ZYzIa5D/uEXMbz/M5g==
X-Received: by 2002:a17:90a:d58b:b0:1cd:65dc:6a62 with SMTP id
 v11-20020a17090ad58b00b001cd65dc6a62mr1444844pju.89.1650416288203;
        Tue, 19 Apr 2022 17:58:08 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:2612:f5e4:3246:fbef])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a056a00194400b004fb358ffe84sm17669845pfk.104.2022.04.19.17.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 17:58:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott][PATCH] postgresql: Fix build on riscv
Date: Tue, 19 Apr 2022 17:58:06 -0700
Message-Id: <20220420005806.1297147-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96708

From: Khem Raj <raj.khem@gmail.com>

Remove duplicate code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa22894fa352986a62c4530ad8facd8868b2e535)
[Fixup for Hardknott context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/files/remove_duplicate.patch   | 38 +++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_13.5.bb |  1 +
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
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
index 81193e30e5..1588c30282 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "\
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
+   file://remove_duplicate.patch \
 "
 
 SRC_URI[sha256sum] = "9b81067a55edbaabc418aacef457dd8477642827499560b00615a6ea6c13f6b3"
-- 
2.25.1


