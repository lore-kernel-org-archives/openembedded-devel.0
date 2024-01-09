Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007BDC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 04:13:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10025.1704773611752019963
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 20:13:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kNMjr5rh;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d4a2526a7eso10984365ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 20:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704773611; x=1705378411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9abBKbr2CPUtRlm2B2k9K6kPegyqideOAzt9MkcZvNQ=;
        b=kNMjr5rh/PIoaN6JEf77SXy7M0XjA20KiiZrH/CEvFOslq/9j2A/uyjUvV/5EP7gcn
         x2ZNGIy0TMdL4WkjtY3OvwNAKagnY1dd6sioe5bhbL0uaeRNIl1U8afAAS2kcV5dMTfO
         itTI220hFmcMILvl6NgqmcuGvggkbMMMoNYbQof/SNNg7mWjMl/XS/j369apIsimJYjx
         FNVz5RL5BH3vZifVZHIskLue70zld5oD4LKlXxPjZsZZRI9IuG0vTzlZLSHoFqe7af9D
         yr30NKFUQDntbmfcBVc0w5mh19a/YObMqjcPRq3XdfV7nnbb/4bWtDoCJ3f42npE0y7h
         s9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704773611; x=1705378411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9abBKbr2CPUtRlm2B2k9K6kPegyqideOAzt9MkcZvNQ=;
        b=p3Pp+BoFpl12qyRypCeKSkuKttYde+zEoD9Hh2lYV0iTTiuMINm5Hm1988rKsAIJnd
         3imnGIdr089E6gcgfgZIOz+BXFlasHtbwT9xC6jKBuTtIz7zfhSOutpvZfFEGcWP2jdL
         s4Gdhra2WKgjTll9UYV+mKpJJ71JvGGweUOtzp4EsJbyUpls9t78tcgKY9OEj8+pAIEH
         jC9JhN2LHVCiwg2Hth1FuOcZCnqkLWASu7qHYMtXj986UNrYNSt898YpzroR3JTUI55J
         fCjx5+l0i87JiD7X2sZpY2OUDOoMoSKqVtZeLElB6cV3W9IxrzGsfCms9NZv7sD/W8uw
         +JDg==
X-Gm-Message-State: AOJu0YxsgbklQqNHpQKMvH8SJr1yVDp+Ym2l7scY6j8Z/MnD/L/U8zos
	i1TG2MMSMJrj/0U4upjDxf99bVM8LPw=
X-Google-Smtp-Source: AGHT+IE+mhZpoLT3s6KLyFUH3t6/VbzmsjLZisQ0pUj1AjfcgvfI1DkfzQu7qMDOzNfZejy1kfkT4A==
X-Received: by 2002:a17:902:bd03:b0:1d4:ca53:2a34 with SMTP id p3-20020a170902bd0300b001d4ca532a34mr2008644pls.51.1704773610785;
        Mon, 08 Jan 2024 20:13:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::839a])
        by smtp.gmail.com with ESMTPSA id bj2-20020a170902850200b001d55717179asm376302plb.288.2024.01.08.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 20:13:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] tgt: Fix build with musl
Date: Mon,  8 Jan 2024 20:13:24 -0800
Message-ID: <20240109041324.4110649-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109041324.4110649-1-raj.khem@gmail.com>
References: <20240109041324.4110649-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 04:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108181

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tgt/files/musl-__wordsize.patch           | 41 +++++++++++++++++++
 .../recipes-extended/tgt/tgt_1.0.90.bb        |  6 +--
 2 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch

diff --git a/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch b/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch
new file mode 100644
index 0000000000..ac758cc39d
--- /dev/null
+++ b/meta-networking/recipes-extended/tgt/files/musl-__wordsize.patch
@@ -0,0 +1,41 @@
+The definition of __WORDSIZE is found in <sys/reg.h>
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/usr/iscsi/iscsid.h
++++ b/usr/iscsi/iscsid.h
+@@ -22,6 +22,9 @@
+ #include <stdint.h>
+ #include <inttypes.h>
+ #include <netdb.h>
++#if !defined(__GLIBC__)
++#include <sys/reg.h>
++#endif
+ 
+ #include "transport.h"
+ #include "list.h"
+--- a/usr/tgtd.h
++++ b/usr/tgtd.h
+@@ -1,6 +1,9 @@
+ #ifndef __TARGET_DAEMON_H
+ #define __TARGET_DAEMON_H
+ 
++#if !defined(__GLIBC__)
++#include <sys/reg.h>
++#endif
+ #include "log.h"
+ #include "scsi_cmnd.h"
+ #include "tgtadm_error.h"
+--- a/usr/util.h
++++ b/usr/util.h
+@@ -19,6 +19,9 @@
+ #include <linux/fs.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#if !defined(__GLIBC__)
++#include <sys/reg.h>
++#endif
+ 
+ #include "be_byteshift.h"
+ 
diff --git a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
index f68ae99db5..35995f7876 100644
--- a/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
+++ b/meta-networking/recipes-extended/tgt/tgt_1.0.90.bb
@@ -7,9 +7,10 @@ DEPENDS = "sg3-utils libaio"
 SRCREV = "df991fa788e22cd8b8e3013cfae306988c19c3d0"
 
 SRC_URI = "git://github.com/fujita/tgt.git;branch=master;protocol=https \
-	file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
+	      file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch \
         file://0001-usr-Makefile-WARNING-fix.patch \
         file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
+        file://musl-__wordsize.patch \
 "
 SRC_URI += "file://tgtd.init \
             file://tgtd.service \
@@ -18,8 +19,6 @@ SRC_URI += "file://tgtd.init \
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST:libc-musl = "null"
-
 CONFFILES:${PN} += "${sysconfdir}/tgt/targets.conf"
 
 inherit update-rc.d systemd
@@ -29,6 +28,7 @@ SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
 CFLAGS += ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE -DTGT_VERSION=\\"1.0.63\\" -DBSDIR=\\"${libdir}/backing-store\\"'
 
+CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 #do_compile() {
 #    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
 #}
-- 
2.43.0


