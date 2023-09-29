Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEB7E71D38
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:38:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17426.1695994732564021262
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IFHaW7Qa;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bf3f59905so1875794966b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695994731; x=1696599531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PidK8aMZmgsLdEjG3L9Ga4rdG+CsUVUe0qcU8TeUK0=;
        b=IFHaW7QaAP0fvD5HNJjszxzPEdO/I8tviZaIfthf4El/GI4bFGWkFroPE2P7MTdyQL
         FRAoTKnwYNR7ule9j5Z5w87L8uUWW37pES/riOtLCrIZHUINrNFapGCraLT5TSQCUGBr
         3WUt/pmViZHR+jEfoPngvJcHXMrqC95gXfTUwDLTJlaePpTDoSPFb6w9AdtEQ4pKbcj5
         Tp3YGpWaCSW4PYmdgXiBlFI9b9ledDuIWS9KADb/SfGo0hajQtdlOafD7hV9szDs+fZt
         S5HO9c6UiGFFrBjZ6trSoob1dHnN379//hP14LSa9Qt1c0wgJcD6VbyFA7w/RMd7yFh1
         F2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994731; x=1696599531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PidK8aMZmgsLdEjG3L9Ga4rdG+CsUVUe0qcU8TeUK0=;
        b=GbzLRLajAo39b6g4mQzoZyAEkYfXusp0HSXZLqjhScCqK15g0ydxe4SOZ0apYgSVdJ
         xNMK2pqYfUEWVUsxd0L15TB4A3BmA8F/IyKDFcYlw0EsjgpMnbXrDGDUBBmgHkwc1Ksw
         OIi2NPp/o8HJsLSZ3oEwsWsOXEIOtELDqLfTirI3njdoeD0a3f6hndHQr77nHde7qczE
         7QKj6g0uN89q6PUYWY+XwWbLC45DQzsDptXAfq/OHboY+6vm37UHhu2Dx/qEQUGhBxHg
         05/qjynco0huDgsvddVx7qGjdGyi5x8+gKb6ftjDv4aFiWFA/THWRO618G1n2JeEJrJA
         8Btg==
X-Gm-Message-State: AOJu0YzIQkiC9U2EzPPUCVvI3EhtZRpilsTWm5b6pW8La2og5j7WVbz1
	S9VR8yOPDEo7Yx3Na5evms9fnNSQP/pnwQYjH9Q=
X-Google-Smtp-Source: AGHT+IGq6zamhVm/B0oDUdpITM2hJzHgwTNcF8diGpVUlCZtAHUIMILmqVYqSjzXyPpqs14GvdryWA==
X-Received: by 2002:a17:906:3e52:b0:9b2:a798:8565 with SMTP id t18-20020a1709063e5200b009b2a7988565mr4140661eji.26.1695994730672;
        Fri, 29 Sep 2023 06:38:50 -0700 (PDT)
Received: from slackware.local ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b009a5f1d15642sm12431287ejb.158.2023.09.29.06.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:38:50 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH 2/3] overlayfs-tools: Bump up the version
Date: Fri, 29 Sep 2023 15:37:23 +0200
Message-Id: <20230929133724.56928-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230929133724.56928-1-uvv.mail@gmail.com>
References: <20230929133724.56928-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105244

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


