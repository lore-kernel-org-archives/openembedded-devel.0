Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFB8C2BD09
	for <webhook@archiver.kernel.org>; Sat,  6 Jul 2024 06:26:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.34147.1720247185670392610
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jul 2024 23:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuKrAJvt;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fafb9a33b3so12291925ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jul 2024 23:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720247185; x=1720851985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBipGc3BZo/Qpek1wTPa+3xMMp+Y3VKyoTxWayKmpys=;
        b=ZuKrAJvt66lugXwbM16XVASF1iPZ9BCptFVwOYo1VwpJ2aqE6Cvke5Fy6S1cR886GK
         PYzcwduPUacmCPN0ef46aO6MmgAFX5ObD+xRqXZb/ZVGD+Q9ixNZTdW+LKw6hCXfLSvt
         R3XLf0tgfTd2X3BBnHHJu0m7NbybjUKloLBROJ1NGskLOuzNZXXaKfajxKTU2AkQW6jJ
         o7pLTw4RoE5+vhepnbiM46tF8/gfz3R/J4Kz6XIWYOAOLeT4djOzHCiTN1pJ4Iu6Obu5
         b7V4zM7mz4GGW9bqB9pLkP/RB7ceCq2ZQcDoIa+10aobIGYKMqPNgWhxwFeVk03WnbLC
         vOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720247185; x=1720851985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBipGc3BZo/Qpek1wTPa+3xMMp+Y3VKyoTxWayKmpys=;
        b=bI/7lks/p6IV2lxl1HdCsuVihr/hzMMe4bSi6hTiN4wdo9BDIB5hHBobXyVv+mL9kV
         OkVJ9BtNbgVynioMh/tPaeRAUGYN62MVA9pitijWo3TzLPAylnnFuXMm/ieZGXU+dS/h
         piIHZ6G1bYP1d7dNEAumSQSZy/xJv/dODRoqxZ4JbmiUpP1PbMJ1zb2bGA/xe8hvrVLV
         OeoFmgmD396M2I8rjkEjXAGRiFmK59Pa6UYfNYSgqaGJpcxZ/Prn6vxHMDJd1OPkij0Y
         ByPPPMtcwgdbgL9siF1kUEjWWS0/RZYYlNppusHSbGfEZA04Wt2h8I8Rh6TyuVurSBQt
         Y3Jg==
X-Gm-Message-State: AOJu0YwqwQh+5n2phIKqY5KnF2ixUEEzkV55xmgFrNrhDv452k5FbKyg
	F9qigfQ+5Q9kCmAI0+LFbVJ+Qi2elvVOQg+d0FrQIHjscFXMUdE1jzpovw==
X-Google-Smtp-Source: AGHT+IG7ugfOvzbl1Bvd3SFTsPBsa29W18hun3Klrdscy6axzXX79f+ixm994RSx2hzFKE2uSzZ6MA==
X-Received: by 2002:a17:902:e742:b0:1fa:1f31:e7a3 with SMTP id d9443c01a7336-1fb33e712d7mr49833345ad.33.1720247184643;
        Fri, 05 Jul 2024 23:26:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::1108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb2ebeb132sm44561485ad.49.2024.07.05.23.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 23:26:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] overlayfs-tools: Fix build with musl
Date: Fri,  5 Jul 2024 23:26:22 -0700
Message-ID: <20240706062622.2750084-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jul 2024 06:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111260

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-always-use-glibc-basename.patch      | 38 +++++++++++++
 ...program_name-to-have-const-attribute.patch | 56 +++++++++++++++++++
 .../overlayfs/overlayfs-tools_v2024.07.bb     |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
new file mode 100644
index 0000000000..78802e39ab
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-always-use-glibc-basename.patch
@@ -0,0 +1,38 @@
+From 2fa94fc7adf05fae46204f4665216c8b019010f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jul 2024 23:16:38 -0700
+Subject: [PATCH 1/2] always use glibc basename()
+
+There is a use of basename() which expects it to be GNU version of
+basename, which is not available in other libcs e.g. musl on Linux
+therefore provide a version for such cases
+
+Upstream-Status: Submitted [https://github.com/kmxz/overlayfs-tools/pull/26]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ main.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/main.c b/main.c
+index 7b669eb..ea0f5a5 100644
+--- a/main.c
++++ b/main.c
+@@ -30,6 +30,18 @@ bool brief;
+ bool ignore;
+ extern char *program_name;
+ 
++#ifndef __GLIBC__
++/*
++ * GNU basename implementation
++ */
++static const char *__basename(const char *filename) {
++    char *p = strrchr(filename, '/');
++    return p ? p + 1 : filename;
++}
++
++#define basename(x) __basename(x)
++#endif
++
+ void print_help(const char *program) {
+     printf("Usage: %s command options\n", program);
+     puts("");
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch
new file mode 100644
index 0000000000..845306292e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-Change-program_name-to-have-const-attribute.patch
@@ -0,0 +1,56 @@
+From be694ba90aa2e0fed3a4e9b53ad7a61efd0430c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Jul 2024 23:18:07 -0700
+Subject: [PATCH 2/2] Change program_name to have const attribute
+
+This is how it is used in all places and it also avoids a const to
+non-const conversion warning
+
+Upstream-Status: Submitted [https://github.com/kmxz/overlayfs-tools/pull/26]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common.c | 2 +-
+ fsck.c   | 2 +-
+ main.c   | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common.c b/common.c
+index eaf24a8..a15b66f 100644
+--- a/common.c
++++ b/common.c
+@@ -29,7 +29,7 @@
+ #include "common.h"
+ #include "config.h"
+ 
+-char *program_name;
++const char *program_name;
+ 
+ /* #define DEBUG 1 */
+ #ifdef DEBUG
+diff --git a/fsck.c b/fsck.c
+index 4e513f5..285b9f1 100644
+--- a/fsck.c
++++ b/fsck.c
+@@ -46,7 +46,7 @@
+ #include "mount.h"
+ #include "overlayfs.h"
+ 
+-extern char *program_name;
++extern const char *program_name;
+ 
+ struct ovl_fs ofs = {};
+ int flags = 0;		/* user input option flags */
+diff --git a/main.c b/main.c
+index ea0f5a5..1a8b239 100644
+--- a/main.c
++++ b/main.c
+@@ -28,7 +28,7 @@
+ bool verbose;
+ bool brief;
+ bool ignore;
+-extern char *program_name;
++extern const char *program_name;
+ 
+ #ifndef __GLIBC__
+ /*
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
index 0ca6477f45..d11ee0c479 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
 
 SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
+    file://0001-always-use-glibc-basename.patch \
+    file://0002-Change-program_name-to-have-const-attribute.patch \
 "
 
 SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"

