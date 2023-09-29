Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08FAE77347
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:28:29 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.30820.1696026507027471970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYNuidRl;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99de884ad25so1990264266b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 15:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696026505; x=1696631305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PidK8aMZmgsLdEjG3L9Ga4rdG+CsUVUe0qcU8TeUK0=;
        b=cYNuidRlCSOWIvVk1CPb3eMHzIqxGSPsrYlJDYevMvxbYlaRQntGqA4d1cG97nA+Ey
         xNR0hFA5tdzvyzJSD8qDwN+QVrVU2S9fWINiOg7C8HBn8i/2elZsj6Y4d+MK7m50E6Z+
         rGDSwjyefMifZJacaZs8aTB0BqyrwggV0c4Kq26ntMTnqxI4fdQoXcdk/f50iAwzA9b2
         Fl2KUuZ4NsyRpgArqBtYMFH0cjxvcxFg++lNEvD/yk1gVznds5k20V2vVSS4lkTbUgRF
         SkNuMZ1PeuEyuH/7UsK55NSCzEzRObxmcisGdjw3BWtJ3ki1a1M2hZZgNVUGLTWwy9Fz
         B3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696026505; x=1696631305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PidK8aMZmgsLdEjG3L9Ga4rdG+CsUVUe0qcU8TeUK0=;
        b=ls7TLl1LNl+m2GtVONXdexROkE4U8HoKW5DtJChjAEh8a7F6FLhA5KLPt0jTeI5Q65
         kDu0d3kU0J16mC2KHR2uBj8a3bn6KDnZv0KGsaQs34WiOdzFyuT0ZuJPlkgukfqdnG/F
         Mp4uIwGGf6soPEFd7RqZ/Ji35GB5DwYxV1SuB/0Gu6Mf0c23RmPefiHNjK5Y1ZZUz/zZ
         jm05gP/s027DhJ1DNjUEr3eTHh6BbMB1lI52Id3daoJmtu7yYCtgTmIH8mX6mfCR5kaE
         6TYqLSTjHoIlzMxRcpmrQwClIxcmQBn87Zc8S5eF000++O3mr7398oPdOFlsV3ir/xQJ
         rFKw==
X-Gm-Message-State: AOJu0Yy+5KUraF6mOCeYZJSWcQrtfSuM09G7Hp4PeVfG0jsWNNuWrF6p
	KMnR7/6ochFjjLPr3GIfX/yAT0bpYtDunsd5
X-Google-Smtp-Source: AGHT+IGvgenN7FmgjyL6/RynoXfb2olpxesORFl3q0CY0kMSYz0JDk2iS9pKjqk45rnYhU97xFXX8Q==
X-Received: by 2002:a17:907:7804:b0:9b2:b7f2:bc7a with SMTP id la4-20020a170907780400b009b2b7f2bc7amr5164491ejc.34.1696026505293;
        Fri, 29 Sep 2023 15:28:25 -0700 (PDT)
Received: from slackware.local ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id a19-20020a170906275300b0099290e2c163sm12953660ejd.204.2023.09.29.15.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:28:24 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH v2 2/3] overlayfs-tools: Bump up the version
Date: Sat, 30 Sep 2023 00:26:58 +0200
Message-Id: <20230929222659.57046-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230929222659.57046-1-uvv.mail@gmail.com>
References: <20230929222659.57046-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 22:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105278

Drop the patches, they have been merged upstream.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...-so-that-it-compiles-on-Ubuntu-20.04.patch | 43 -------------------
 .../0002-makefile-fix-linking-flags.patch     | 33 --------------
 .../overlayfs/overlayfs-tools_git.bb          |  4 +-
 3 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
deleted file mode 100644
index ed84d92c7..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 81b4fbb5f52044cb348534c23f10b3884972b09b Mon Sep 17 00:00:00 2001
-From: Beat Schaer <beat.schaer@wabtec.com>
-Date: Fri, 19 Mar 2021 08:18:58 +0100
-Subject: [PATCH] Fixed includes so that it compiles on Ubuntu 20.04
-
----
-Upstream-Status: Pending
-
- logic.c | 3 +--
- main.c  | 3 ++-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/logic.c b/logic.c
-index 97767f5..47ebfaa 100644
---- a/logic.c
-+++ b/logic.c
-@@ -7,8 +7,7 @@
- #include <string.h>
- #include <errno.h>
- #include <unistd.h>
--#include <attr/xattr.h>
--#include <attr/attributes.h>
-+#include <sys/xattr.h>
- #include <fts.h>
- #include <libgen.h>
- #include "logic.h"
-diff --git a/main.c b/main.c
-index aa11239..f462b98 100644
---- a/main.c
-+++ b/main.c
-@@ -12,7 +12,8 @@
- #include <linux/limits.h>
- #include <stdbool.h>
- #include <sys/stat.h>
--#include <attr/xattr.h>
-+#include <sys/xattr.h>
-+#include <errno.h>
- #ifndef _SYS_STAT_H
-   #include <linux/stat.h>
- #endif
--- 
-2.25.1
-
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
deleted file mode 100644
index 8fbb250f0..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b4ff5886797e72d1c21da43261ca7648412f3186 Mon Sep 17 00:00:00 2001
-From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
-Date: Mon, 23 May 2022 19:53:21 +0200
-Subject: [PATCH] makefile: fix linking flags
-
-LDLIBS should be placed at the end according to
-https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html
-
-Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
----
-Upstream-Status: Pending
-
- makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/makefile b/makefile
-index fb1bed4..038c7ce 100644
---- a/makefile
-+++ b/makefile
-@@ -1,11 +1,11 @@
- CFLAGS = -Wall -std=c99
--LFLAGS = -lm
-+LDLIBS = -lm
- CC = gcc
- 
- all: overlay
- 
- overlay: main.o logic.o sh.o
--	$(CC) $(LFLAGS) main.o logic.o sh.o -o overlay
-+	$(CC) main.o logic.o sh.o -o overlay $(LDLIBS) 
- 
- main.o: main.c logic.h
- 	$(CC) $(CFLAGS) -c main.c
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
index c638be9af..de5155133 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
 
 SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
-    file://0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch \
-    file://0002-makefile-fix-linking-flags.patch \
 "
 
 PV = "1.0+git${SRCPV}"
-SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
+SRCREV = "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
 
 S = "${WORKDIR}/git"
 B = "${S}"
-- 
2.35.1


