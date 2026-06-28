Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB35C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14716.1782634301423600466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G4BtlhZX;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4928440eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634301; x=1783239101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js6ASCe+5BLPHocziplyulpNhF33Eu8TbmKNILtcdq4=;
        b=G4BtlhZXN4r1Xl/WNX9qpBbXH7ozMUJ8UTHdv8v9r8NvoWSwtLhgy7euRooPAsMyiP
         fIqyq1vfCjTbT9BhqqDQ1Ilb26cCVelXBqUPhgLtLTCdyI2W+Y+eIoIPeC0EByLgih6Q
         S0N3AukiIuK5NY9gwH8m+7XXLkqUNGL8mWCOOmbIDvE26YE9PfPHedUBfbWQecbvqFBC
         LsksuAuHDk8L3WA2JGK15QMt/1YVixycEsWGFpFmvpGPbWXJVk3mKTQ0xPsBHoSEgz8B
         lS6MOshap3Cedri1NjVa9WxLDzRJexyN4FDnRXG2rrlI1HC+hN3TUzA+Ad3Sp26dvKbT
         tkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634301; x=1783239101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=js6ASCe+5BLPHocziplyulpNhF33Eu8TbmKNILtcdq4=;
        b=fdH2AMbdG3qbU4naxgrUhbyo8Z5ajU8NMOGnfUVa+dd1ZQercTmRgqTtHkaIPBjOvj
         aip1lUFY0xxqmnbm6JEpSbYqRUoH++vOGz1ri61FFSChrLu8L4Vpw6vREsJMRyYBElvv
         LUBQRh/qhqoVEIjcLViAdq/WpSze6AYoIWNqzHHjj2SkyCLNMo0eXdYI3ThpZxyVS1rP
         2B/HrVrDgZ9wuitA81xqq3AXiROndw4KEuNk+fXVTNaOiW9CKFUXrqUXaktmWBbDTYnh
         lRkGwSOgEkwNmkYN49ys9MXT35vr3m5PZr0QASBK9fm7mFYlFAAVUjQtgv9mpxPeiQHw
         /30Q==
X-Gm-Message-State: AOJu0Yzssu3yrK2b071SPwGde27QmudFsBPBG78OiJjTeHWsWuptIMpQ
	wcz6mRB+c77kdRkPTBqMOVpqIa+wS4P+6FqUsUnsV8wOoDHhXeYGuKQ4znEaQFr1skvsnQ==
X-Gm-Gg: AfdE7cm+3ugfKAjvjKhSHw3O1HYcV9SXX1e3st+QODyQaz7h8CvWo7cdhGJydEd2F45
	XVGFj1MEhQaR6OU5b8LElS7pFera06jhTp5gQ5GwuA5+XsYqUyxZLX2BgGxm7xuVnm2ZByEiDkL
	fBBPdCJFEow/yURW7+oslzsLJ7pyZh5S3y5bzrzWgf4SnqF/UE6k1PFU1C7iFsfZI2NOEQJuw1k
	QbGALodeC/MTRUV1b2sM3GH3jZB93TYD8PR8Rakdx9U+RrZ1Fql/43JGfzLw/m3o83fAjEg+wgw
	DWQI0E1gXkf/iE9N5TgbXrdSaSzTCMkYr1rXYO+9T+R/4xasmsxQhMwNohwokXzSDNVpmy4K8ex
	WtECemLcpEL8Zsrccdb+po6dUZy+EORReiqvlZ/Vz06d2acDYDnoCLIE/d+fVtA1GcffU0viQHT
	slqY50L1HfUYKfrHWQgHvyd/COOyn0IgNQtWUZwEegU/6YZgyCcwVc9+jd6qggzbghGR9JM534X
	n/Y5Dr9rqNVl3GQRVGoYQ9PNi7dY08vmjS7T1F2UhGOFvMZscmwuSuUg9tW6iLtKFuxtaehJot6
	riev4pxkARNr7x5uKypmMCbu8flsew==
X-Received: by 2002:a05:7300:768c:b0:30c:7ab6:7ff7 with SMTP id 5a478bee46e88-30cab09accfmr6939388eec.15.1782634300700;
        Sun, 28 Jun 2026 01:11:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 017/128] dlm: upgrade 4.2.0 -> 4.3.0
Date: Sun, 28 Jun 2026 01:09:28 -0700
Message-ID: <20260628081122.178348-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127827

License-Update: added GPLv2/GPLv2+ files (linux_helpers.h, rbtree_augmented.h, rbtree_types.h) to the per-file license listing

Drop 0001-dlm_controld-remove-unnecessary-header-include,
0001-Disable-annobin-plugin and 0001-Remove-fcf-protection-full, which
are all present in 4.3.0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../dlm/dlm/0001-Disable-annobin-plugin.patch | 31 ---------
 .../dlm/0001-Remove-fcf-protection-full.patch | 64 -------------------
 ...ld-remove-unnecessary-header-include.patch | 35 ----------
 .../dlm/{dlm_4.2.0.bb => dlm_4.3.0.bb}        |  7 +-
 4 files changed, 2 insertions(+), 135 deletions(-)
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-Remove-fcf-protection-full.patch
 delete mode 100644 meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch
 rename meta-networking/recipes-extended/dlm/{dlm_4.2.0.bb => dlm_4.3.0.bb} (82%)

diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch b/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
deleted file mode 100644
index 6302829267..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0001-Disable-annobin-plugin.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5a0799d0bacc0cf93e15febdac7d8c50b21e7234 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2023 13:13:12 -0700
-Subject: [PATCH] Disable annobin plugin
-
-OE gcc does not build this plugin, moreover there are non gcc compilers
-which can be used with OE as well e.g. clang which might not have it
-either
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dlm_controld/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
-index 8802d88..0380ec9 100644
---- a/dlm_controld/Makefile
-+++ b/dlm_controld/Makefile
-@@ -47,7 +47,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 
- BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm
--LIB_CFLAGS += $(CFLAGS) -fPIC -fplugin=annobin
-+LIB_CFLAGS += $(CFLAGS) -fPIC
- 
- BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
- BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
--- 
-2.41.0
-
diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-Remove-fcf-protection-full.patch b/meta-networking/recipes-extended/dlm/dlm/0001-Remove-fcf-protection-full.patch
deleted file mode 100644
index 6290aa4c7a..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0001-Remove-fcf-protection-full.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From e4ae70ae71f88d48cf1ab63810c9f7b4177af3a5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 15 Jul 2023 19:05:54 -0700
-Subject: [PATCH] Remove -fcf-protection=full
-
-This option is not available on all architectures e.g. RISC-V
-Fixes
-| cc1: error: '-fcf-protection=full' is not supported for this target
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dlm_controld/Makefile | 1 -
- dlm_tool/Makefile     | 1 -
- fence/Makefile        | 1 -
- libdlm/Makefile       | 4 ++--
- 4 files changed, 2 insertions(+), 5 deletions(-)
-
---- a/dlm_controld/Makefile
-+++ b/dlm_controld/Makefile
-@@ -43,7 +43,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
- 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
- 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
--	-fstack-clash-protection -fcf-protection=full
-+	-fstack-clash-protection
- 
- BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
- BIN_CFLAGS += -I../include -I../libdlm
---- a/dlm_tool/Makefile
-+++ b/dlm_tool/Makefile
-@@ -15,7 +15,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
- 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
- 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
--	-fstack-clash-protection -fcf-protection=full
-+	-fstack-clash-protection
- 
- CFLAGS += -fPIE -DPIE
- CFLAGS += -I../include -I../libdlm -I../dlm_controld
---- a/fence/Makefile
-+++ b/fence/Makefile
-@@ -15,7 +15,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-Wno-sign-compare -Wno-unused-parameter -Wp,-D_FORTIFY_SOURCE=2 \
- 	-fexceptions -fasynchronous-unwind-tables -fdiagnostics-show-option \
- 	-Wp,-D_GLIBCXX_ASSERTIONS -fstack-protector-strong \
--	-fstack-clash-protection -fcf-protection=full
-+	-fstack-clash-protection
- 
- CFLAGS += -fPIE -DPIE
- CFLAGS += -I../include
---- a/libdlm/Makefile
-+++ b/libdlm/Makefile
-@@ -80,8 +80,8 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
- 	-fdiagnostics-show-option \
- 	-fPIC
- 
--LIB_CFLAGS += $(CFLAGS) -D_REENTRANT -fcf-protection=full
--LLT_CFLAGS += $(CFLAGS) -fcf-protection=full
-+LIB_CFLAGS += $(CFLAGS) -D_REENTRANT
-+LLT_CFLAGS += $(CFLAGS)
- 
- LIB_LDFLAGS += $(LDFLAGS) -lpthread -Wl,-z,now
- LLT_LDFLAGS += $(LDFLAGS) -Wl,-z,now
diff --git a/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch b/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch
deleted file mode 100644
index 55efcea184..0000000000
--- a/meta-networking/recipes-extended/dlm/dlm/0001-dlm_controld-remove-unnecessary-header-include.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4c40289eb9e47cfd272a8cc402fd2ddb29e2a3dc Mon Sep 17 00:00:00 2001
-From: Alexander Aring <aahringo@redhat.com>
-Date: Wed, 24 May 2023 13:50:59 +0000
-Subject: [PATCH] dlm_controld: remove unnecessary header include
-
-The timewarn netlink functionality got dropped and will be removed by
-kernel v6.4. The user space part was already dropped by commit 34ea31e7
-("controld: remove timewarn handling"). This is just a left over of this
-commit. Recent builds fails now because the UAPI header in the Linux
-kernel was removed. This means older dlm sources cannot be build with
-newer kernel-headers, however it is not recommended to use older dlm
-sources and all existing users should upgrade anyway.
-
-Upstream-Status: Backport [https://pagure.io/dlm/c/ddbba6608896f81bfce8f8edf3d0f507714cfc43?branch=main]
-Reported-by: Fabio M. Di Nitto <fdinitto@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- dlm_controld/main.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/dlm_controld/main.c b/dlm_controld/main.c
-index 7cf6348..e70e96a 100644
---- a/dlm_controld/main.c
-+++ b/dlm_controld/main.c
-@@ -12,7 +12,6 @@
- #include <pthread.h>
- #include <linux/netlink.h>
- #include <linux/genetlink.h>
--#include <linux/dlm_netlink.h>
- #include <uuid/uuid.h>
- 
- #ifdef USE_SD_NOTIFY
--- 
-2.41.0
-
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
similarity index 82%
rename from meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
rename to meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
index b7966d7f12..99a0149e38 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
@@ -8,18 +8,15 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
-           file://0001-dlm_controld-remove-unnecessary-header-include.patch \
-           file://0001-Disable-annobin-plugin.patch \
-           file://0001-Remove-fcf-protection-full.patch \
            "
 
-SRC_URI[sha256sum] = "90237e18af7422ac15fc756899b3bb6932597b13342296de8e0e120e6d8729ab"
+SRC_URI[sha256sum] = "8dc23b97390236032a2fe19068c7dad23f82fb624732c9bff6898b6996c9b700"
 
 UPSTREAM_CHECK_URI = "https://pagure.io/dlm/releases"
 UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)"
 
 LICENSE = "LGPL-2.0-or-later & GPL-2.0-only & GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://README.license;md5=8f0bbcdd678df1bce9863492b6c8832d"
+LIC_FILES_CHKSUM = "file://README.license;md5=531f5086ad0f36f6e22cb6085e1c41d5"
 
 S = "${UNPACKDIR}/dlm-dlm-${PV}"
 

