Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.67.1615575324856369654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 10:55:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zrp5OVJE;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d8so12340025plg.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 10:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hpN2gaUb8lGkMOniHgsl1heCgEiZNUCWGVUedZb1ic=;
        b=Zrp5OVJE8EF6GKSTwKpQNMF8LBD3Rm6VCNjTpuICySXUdNhwUDGffO0glnNh14ye3F
         dIEn4tpNO38HLaw8KG0HiPO069gQuK0Sw5Z7vy+P0brBDf1rn0X7JrxJDHH9pkQJ8wAu
         iHH3rwVYcdWKqPD4AhQYsW9AW47QIIHRD8zbUmMI/LA8e4/jtB6aV5dGbXxvE71G8PpB
         So6H7haxjb8wROEDbdY9AQtnykgENlbs2bB+itSXjgXk4VWEuL08PMwqHMeWgJwH1gvX
         oIz81/cB/W7iZcsG1B5cxAagctEUnb5KQevRKokrZJ28Eo78B6JLHhCv5Z4bE7JuqZiN
         1AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0hpN2gaUb8lGkMOniHgsl1heCgEiZNUCWGVUedZb1ic=;
        b=on6qc6HY6GgJwk4MYOA5okeqBKxq7+1LGDRaBd7qbrXlZ8Ha6xIL2eF7jYl/ljSy+b
         WIq5X+ompsdqd0E1Wmx87oGZ4HI4e1sneYiuicpKyjO9RxpslqTxkcm0ZtJ5PZHKpRJY
         IhBbzC6t6FdxKv2fXvyIs/CAdbVxGq6D+rXzo2PFh+8ISbJEQOcQuNRQHmDlhhVuACiS
         fNbbc7e7whBilMy6W7ZPCUtOntZATkr0dNojXDImWkFbi4vML6gIAwTG5jp9bHaLZYAv
         W3IMrZXlqcyqy9P6+Oi3mOqCBLPGSymmsbl+3fChwY6nrJYf4OMC/Eh7zf8XTuAmLqAo
         zXcg==
X-Gm-Message-State: AOAM530ifMiKGva78XIDF8G6F2vBSgZ+5Tu5S3ih6+DRbb/iVcYHqr4G
	+oN7ozhwnyvX4CHLjFyKUZmvoJjkvUVcoA==
X-Google-Smtp-Source: ABdhPJx6AhP1vuYQu9hN/1V1BllrjeAYSjoGXKV/z8jLQcGQET57Smba7tLl6cNH5uau8huakHMNeA==
X-Received: by 2002:a17:90a:e516:: with SMTP id t22mr15519970pjy.39.1615575323771;
        Fri, 12 Mar 2021 10:55:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id f13sm6439558pgu.36.2021.03.12.10.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 10:55:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] ufs-utils: Upgrade to 1.9
Date: Fri, 12 Mar 2021 10:55:20 -0800
Message-Id: <20210312185520.301194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with ppc64 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...place-u_intXX_t-with-kernel-typedefs.patch | 54 ---------------
 ...0001-Use-asm-type.h-for-kernel-types.patch | 65 +++++++++++++++++++
 .../{ufs-utils_git.bb => ufs-utils_1.9.bb}    |  6 +-
 3 files changed, 67 insertions(+), 58 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
 create mode 100644 meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_git.bb => ufs-utils_1.9.bb} (82%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
deleted file mode 100644
index e69a3cf1ff..0000000000
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 6cf6f5b9c39dfd0d46f2069c3baeab92ae980367 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Dec 2019 00:58:13 -0800
-Subject: [PATCH] Replace u_intXX_t with kernel typedefs
-
-u_intXX_t requires including sys/types.h which might not work in kernel
-code, if this header is used in a kernel module
-
-Fixes
-| In file included from ufs.c:16:
-| In file included from ./ufs.h:9:
-| ./scsi_bsg_util.h:131:2: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
-|         u_int16_t result;
-|         ^~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/westerndigitalcorporation/ufs-utils/pull/23]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- scsi_bsg_util.h | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/scsi_bsg_util.h b/scsi_bsg_util.h
-index 3f8a482..497c3ae 100644
---- a/scsi_bsg_util.h
-+++ b/scsi_bsg_util.h
-@@ -121,15 +121,15 @@ struct ufs_bsg_reply {
- #endif /* SCSI_BSG_UFS_H.*/
- 
- struct rpmb_frame {
--	u_int8_t  stuff[196];
--	u_int8_t  key_mac[32];
--	u_int8_t  data[256];
--	u_int8_t  nonce[16];
--	u_int32_t write_counter;
--	u_int16_t addr;
--	u_int16_t block_count;
--	u_int16_t result;
--	u_int16_t req_resp;
-+	__u8  stuff[196];
-+	__u8  key_mac[32];
-+	__u8  data[256];
-+	__u8  nonce[16];
-+	__u32 write_counter;
-+	__u16 addr;
-+	__u16 block_count;
-+	__u16 result;
-+	__u16 req_resp;
- };
- 
- #define BSG_REPLY_SZ (sizeof(struct ufs_bsg_reply))
--- 
-2.24.1
-
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
new file mode 100644
index 0000000000..08cf870169
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Use-asm-type.h-for-kernel-types.patch
@@ -0,0 +1,65 @@
+From 517f841ccac59b0579e706dd768d6c7b1a7e7552 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Mar 2021 10:37:21 -0800
+Subject: [PATCH] Use asm/type.h for kernel types
+
+This ensures that right headers for types is included otherwise it can
+conflict for some platforms e.g. ppc64 where it includes the underlying
+files conditionally
+
+asm/types.h is
+
+if !defined(__SANE_USERSPACE_TYPES__) && defined(__powerpc64__) && !defined(__KERNEL__)
+ include <asm-generic/int-l64.h>
+else
+ include <asm-generic/int-ll64.h>
+endif
+
+Upstream-Status: Submitted [https://github.com/westerndigitalcorporation/ufs-utils/pull/29]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ufs.h      | 1 -
+ ufs_cmds.h | 2 +-
+ ufs_ffu.c  | 1 -
+ 3 files changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/ufs.h b/ufs.h
+index dc51367..0321c54 100644
+--- a/ufs.h
++++ b/ufs.h
+@@ -4,7 +4,6 @@
+ 
+ #ifndef UFS_H_
+ #define UFS_H_
+-#include <asm-generic/int-ll64.h>
+ #include "ioctl.h"
+ #include "scsi_bsg_util.h"
+ 
+diff --git a/ufs_cmds.h b/ufs_cmds.h
+index 1e7e24d..5c5b045 100644
+--- a/ufs_cmds.h
++++ b/ufs_cmds.h
+@@ -5,7 +5,7 @@
+ #define UFS_CMNDS_H_
+ 
+ #include "options.h"
+-#include <asm-generic/int-ll64.h>
++#include <asm/types.h>
+ 
+ 
+ enum field_width {
+diff --git a/ufs_ffu.c b/ufs_ffu.c
+index 2bcec44..99b479c 100644
+--- a/ufs_ffu.c
++++ b/ufs_ffu.c
+@@ -12,7 +12,6 @@
+ #include <unistd.h>
+ #include <stdint.h>
+ #include <errno.h>
+-#include <asm-generic/int-ll64.h>
+ 
+ #include "ufs.h"
+ #include "ufs_cmds.h"
+-- 
+2.30.2
+
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
similarity index 82%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
index 23583650b8..e23c764a03 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_1.9.bb
@@ -2,14 +2,12 @@ SUMMARY = "Tool to access UFS (Universal Flash Storage) devices"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PV = "1.6+git${SRCPV}"
-
 BRANCH ?= "dev"
 
-SRCREV = "a3cf93b66f4606a46354cf884d24aa966661f848"
+SRCREV = "517c0b01e47d4441cc45be351509fb4c96843d5a"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=git;branch=${BRANCH} \
-           file://0001-Replace-u_intXX_t-with-kernel-typedefs.patch \
+           file://0001-Use-asm-type.h-for-kernel-types.patch \
 "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.30.2

