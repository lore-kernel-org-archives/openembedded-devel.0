Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA459E8FDD4
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 06:56:45 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4536.1766818603890252058
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 22:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hzl1De97;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so4502289f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 22:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766818602; x=1767423402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vreprv0c6Moxaab6v4jaMpKPo6nWWdvBs9EshNXIeLU=;
        b=Hzl1De97IL2O2BW2xG3H9tOBw+OJXXRR3XZDcvqoN0xbPN+DuKEhvfHuC4gZHDAXlR
         AARVIICUkvm6T39cZEzbN+3gEU4QgPwE2iIsPlDvo4rHIUOmNHmGfH8WhD4Hp3rKaRkJ
         qrKrKHYtg85/ZzDP70L2E4G7N8OEctxnRq6DXu42Z2a/y3hCMK0voZlmw5OJ7gYc0G6j
         NjTGEOuhi2eIYuIcCNJXSE3eDLE7gNZyhm6WbZ6I2mhg3heOWOS1xmhT+2v6EfV4iSzI
         uM3AnC7GFN2cMrDj+vAuuSjzYcP2flNtMBk8g65qBx8HNTjhFuP0aLWRDXIEWHsMkZ0/
         4/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766818602; x=1767423402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vreprv0c6Moxaab6v4jaMpKPo6nWWdvBs9EshNXIeLU=;
        b=SEeEClMwIguCu3OLR9oMXbBA+J2vhmJUhIHvw/XkVuth4zF5++YhuwLNlzljLiS1ZL
         HHiamBBoPaPOLQi9G6jX88559oAYgiBCcNUk/JPaRjni7R9DluP359sfaRVcGqrzyox5
         BFs9UfCs12OmpH8bLnbL79ZNY7mJuIYfFMbVQpsUn1Pm+rHiJNBkfp/7Y93D0gnQRhSB
         LIjp8eriQRMHp9hUDg9myAumeW2ZaqsXgi7IHgFRp8CnKpJ4J55v5SsK4kvDTlGKURzY
         VnfPgkNrvDr9kQJxzFohFpr2jEVA1daUwlRWq6ukZNFsEIKoWAFiYAiiKnbTJO6aH9j+
         sMsA==
X-Gm-Message-State: AOJu0Yz/ZisKSbBRrJUT8Y011zQ5Y+f6oh3unJ/Ol9C3LMwjMxyO2I+v
	Oka55Kk7mUunI2+wt+VsOKOsIjytykO5kvRQXe4d/INIyA09H2ydWO+lYApw/g==
X-Gm-Gg: AY/fxX5GKQlRlISaPgBDnlWWFr/EQgKyQApZFUGwq7Tomm9BJg0z02pJkbSWhDZNdoX
	z9FkykCVGuRLxYqbOggLHHGih4Qi4jcDt2l+CQ1O4sBGF8O+bti0bs1uj+A8dvfMxGfUU+ICq6T
	4CH+nSzUcJtFKbJN6SFsu6hIpCCArm81IQDYUTj6/5n6Swwz57dLr6bNw9n6yY/TkKLLfh6oZLR
	H1y8fJlUxY7dqO5il2qjeAb/cad+tTBRzYJzi8XrMBs/59QjB32dhoTXPe2Tk4nnFR9mZoLKzRs
	kwLF4PpyH1O3uu8xG41OWtPr/4MgV1gFqv23Oi9Z31lnGIdd+8HL+9s76SZ5bfLFw8HhsJu7TDg
	FXeL1jE8xVcxs9lhA4hz/wmX1NIyAwK2jKlHb/vm7BbqCGzGQT9C1uXLSPBylPjI9yOzYkgSwPq
	+Y1TImfbBc
X-Google-Smtp-Source: AGHT+IGc+VudzpidxgkkX8VgTSCjNr5LIqMo+SxoCcxeMk3IE1M6JR05IE6uS/lppHh9RUAOLZRb6w==
X-Received: by 2002:a5d:5f49:0:b0:432:88bd:df3a with SMTP id ffacd0b85a97d-43288bde28dmr1127528f8f.46.1766818602081;
        Fri, 26 Dec 2025 22:56:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm48902371f8f.31.2025.12.26.22.56.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 22:56:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 3/6] overlayfs-tools: upgrade 2024.07 -> 2025.01
Date: Sat, 27 Dec 2025 07:56:33 +0100
Message-ID: <20251227065636.3144581-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227065636.3144581-1-skandigraun@gmail.com>
References: <20251227065636.3144581-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 06:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122946

Drop the patches that were merged in this release.

Shortlog:
show why files can't be open using errno
Fix memory free
Allow force to execute script, and keep upper dir while merge
Fix broken long option for ignore
Change program_name to have const attribute
always use glibc basename()

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-always-use-glibc-basename.patch      | 38 -------------
 ...program_name-to-have-const-attribute.patch | 56 -------------------
 ...2024.07.bb => overlayfs-tools_v2025.01.bb} |  7 +--
 3 files changed, 2 insertions(+), 99 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch
 rename meta-filesystems/recipes-utils/overlayfs/{overlayfs-tools_v2024.07.bb => overlayfs-tools_v2025.01.bb} (64%)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
deleted file mode 100644
index 78802e39ab..0000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2fa94fc7adf05fae46204f4665216c8b019010f3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jul 2024 23:16:38 -0700
-Subject: [PATCH 1/2] always use glibc basename()
-
-There is a use of basename() which expects it to be GNU version of
-basename, which is not available in other libcs e.g. musl on Linux
-therefore provide a version for such cases
-
-Upstream-Status: Submitted [https://github.com/kmxz/overlayfs-tools/pull/26]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- main.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/main.c b/main.c
-index 7b669eb..ea0f5a5 100644
---- a/main.c
-+++ b/main.c
-@@ -30,6 +30,18 @@ bool brief;
- bool ignore;
- extern char *program_name;
- 
-+#ifndef __GLIBC__
-+/*
-+ * GNU basename implementation
-+ */
-+static const char *__basename(const char *filename) {
-+    char *p = strrchr(filename, '/');
-+    return p ? p + 1 : filename;
-+}
-+
-+#define basename(x) __basename(x)
-+#endif
-+
- void print_help(const char *program) {
-     printf("Usage: %s command options\n", program);
-     puts("");
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch
deleted file mode 100644
index 845306292e..0000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From be694ba90aa2e0fed3a4e9b53ad7a61efd0430c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 5 Jul 2024 23:18:07 -0700
-Subject: [PATCH 2/2] Change program_name to have const attribute
-
-This is how it is used in all places and it also avoids a const to
-non-const conversion warning
-
-Upstream-Status: Submitted [https://github.com/kmxz/overlayfs-tools/pull/26]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common.c | 2 +-
- fsck.c   | 2 +-
- main.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/common.c b/common.c
-index eaf24a8..a15b66f 100644
---- a/common.c
-+++ b/common.c
-@@ -29,7 +29,7 @@
- #include "common.h"
- #include "config.h"
- 
--char *program_name;
-+const char *program_name;
- 
- /* #define DEBUG 1 */
- #ifdef DEBUG
-diff --git a/fsck.c b/fsck.c
-index 4e513f5..285b9f1 100644
---- a/fsck.c
-+++ b/fsck.c
-@@ -46,7 +46,7 @@
- #include "mount.h"
- #include "overlayfs.h"
- 
--extern char *program_name;
-+extern const char *program_name;
- 
- struct ovl_fs ofs = {};
- int flags = 0;		/* user input option flags */
-diff --git a/main.c b/main.c
-index ea0f5a5..1a8b239 100644
---- a/main.c
-+++ b/main.c
-@@ -28,7 +28,7 @@
- bool verbose;
- bool brief;
- bool ignore;
--extern char *program_name;
-+extern const char *program_name;
- 
- #ifndef __GLIBC__
- /*
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb
similarity index 64%
rename from meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
rename to meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb
index 708bbfcf02..c83233a9a0 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb
@@ -4,13 +4,10 @@ LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
 
 SRC_URI = "\
-    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
-    file://0001-always-use-glibc-basename.patch \
-    file://0002-Change-program_name-to-have-const-attribute.patch \
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=${PV} \
 "
 
-SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
-
+SRCREV = "6e925bbbe747fbb58bc4a95a646907a2101741f6"
 
 inherit meson pkgconfig
 

