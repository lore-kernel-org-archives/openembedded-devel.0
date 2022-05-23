Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD96C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 18:01:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.30678.1653328865187388275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=laTx8kjf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h14so22485693wrc.6
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 11:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWddijmAyuntfL7aQqJmD0B8dlwFLbrtUMLcQaBzD+c=;
        b=laTx8kjfP9wdb4WutS6pHC0d5iw4oLduxp7WPA0+cyApnP1lVzFoWk5DX0TeZBVDmF
         /dlIucW3uownMULKHerUUiZbegRYhTlO8jPLr6w3B39YfyrxGvch8mMp0Hop71yD1GSu
         jqgSMHIAVPwqEhmtHHxDcENLXq9sGAZ6BaNUqU4kImEsOmNDk1NsRVZL5njyOE0P+GI2
         LjOjqa0okUScVfF3nbW49WckavahjUQbEZW3WZsA1oJvnNOil+owykTULnL3RRnEG2wM
         VOS7gZEq5FhgDe57qhBTj6q7ZMYG+o9rnCWHPcwPSUobYMt3FvP/OKcfGnbHCo1szJno
         ieTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uWddijmAyuntfL7aQqJmD0B8dlwFLbrtUMLcQaBzD+c=;
        b=AObvYemdgMetgVOTMpc3urQPKxhqYL3vry9+Ne7xXD/9LiAvh4UmwauUo7oShJZ3jU
         hjBInXfRFznG0nWXz6VrI3dR32MUjIPg0C+fnLTHBTFfQlcylASUWRSjmOUvZjKcg186
         s4CP0WdMKK7fDBz3/e4pccXFE/aT/NkQx3UH4KpbKLF2OJgAtO5aS1q8m/eEp3u7PRi+
         OhlwwKqhxcf+fKSCVyuHw1r5iaVrQQDAdgUC6BbA0uZVbSZen/ghZviQ5Srrfi1LyLsy
         A58yfSnoCDxGiG0AoAZ365wJ7cD5nhyzP86+oEGQ7YchZrwrrmiEZwMu3P/b3C8jPjKC
         iuFQ==
X-Gm-Message-State: AOAM532OjCd73kIiT5gcfPThoa0g3ZVWsb08o6VPggylOgyVXqb+rci5
	isaMpNkZEBlyJaYRpGkaUvQ1DyrEMdL21g==
X-Google-Smtp-Source: 
 ABdhPJw4PLyJgnqDHeZqk4FHW4qgQUCoTCB272Ajm2tizNbOsjxEWnj5wCcVhz/VRIv8tWcdPntcZg==
X-Received: by 2002:a5d:64ab:0:b0:20f:ef37:a9d1 with SMTP id
 m11-20020a5d64ab000000b0020fef37a9d1mr29274wrp.197.1653328863291;
        Mon, 23 May 2022 11:01:03 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-178-000-219-184.178.000.pools.vodafone-ip.de. [178.0.219.184])
        by smtp.gmail.com with ESMTPSA id
 b15-20020a7bc24f000000b0039736892653sm10208368wmj.27.2022.05.23.11.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:01:02 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH v2] overlayfs-tools: add new recipe
Date: Mon, 23 May 2022 20:00:47 +0200
Message-Id: <20220523180047.2493863-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 18:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97237

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

This package provides maintenance tools for OverlayFS, such as vacuum,
diff, merge, and deref

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...-so-that-it-compiles-on-Ubuntu-20.04.patch | 41 +++++++++++++++++++
 .../0002-makefile-fix-linking-flags.patch     | 31 ++++++++++++++
 .../overlayfs/overlayfs-tools_git.bb          | 34 +++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
new file mode 100644
index 000000000..f7490ebce
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch
@@ -0,0 +1,41 @@
+From 81b4fbb5f52044cb348534c23f10b3884972b09b Mon Sep 17 00:00:00 2001
+From: Beat Schaer <beat.schaer@wabtec.com>
+Date: Fri, 19 Mar 2021 08:18:58 +0100
+Subject: [PATCH] Fixed includes so that it compiles on Ubuntu 20.04
+
+---
+ logic.c | 3 +--
+ main.c  | 3 ++-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/logic.c b/logic.c
+index 97767f5..47ebfaa 100644
+--- a/logic.c
++++ b/logic.c
+@@ -7,8 +7,7 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <unistd.h>
+-#include <attr/xattr.h>
+-#include <attr/attributes.h>
++#include <sys/xattr.h>
+ #include <fts.h>
+ #include <libgen.h>
+ #include "logic.h"
+diff --git a/main.c b/main.c
+index aa11239..f462b98 100644
+--- a/main.c
++++ b/main.c
+@@ -12,7 +12,8 @@
+ #include <linux/limits.h>
+ #include <stdbool.h>
+ #include <sys/stat.h>
+-#include <attr/xattr.h>
++#include <sys/xattr.h>
++#include <errno.h>
+ #ifndef _SYS_STAT_H
+   #include <linux/stat.h>
+ #endif
+-- 
+2.25.1
+
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
new file mode 100644
index 000000000..cf4de18a7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools/0002-makefile-fix-linking-flags.patch
@@ -0,0 +1,31 @@
+From b4ff5886797e72d1c21da43261ca7648412f3186 Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+Date: Mon, 23 May 2022 19:53:21 +0200
+Subject: [PATCH] makefile: fix linking flags
+
+LDLIBS should be placed at the end according to
+https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html
+
+Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+---
+ makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/makefile b/makefile
+index fb1bed4..038c7ce 100644
+--- a/makefile
++++ b/makefile
+@@ -1,11 +1,11 @@
+ CFLAGS = -Wall -std=c99
+-LFLAGS = -lm
++LDLIBS = -lm
+ CC = gcc
+ 
+ all: overlay
+ 
+ overlay: main.o logic.o sh.o
+-	$(CC) $(LFLAGS) main.o logic.o sh.o -o overlay
++	$(CC) main.o logic.o sh.o -o overlay $(LDLIBS) 
+ 
+ main.o: main.c logic.h
+ 	$(CC) $(CFLAGS) -c main.c
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
new file mode 100644
index 000000000..eb6e4963a
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Maintenance tools for OverlayFS"
+HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
+
+SRC_URI = "\
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
+    file://0001-Fixed-includes-so-that-it-compiles-on-Ubuntu-20.04.patch \
+    file://0002-makefile-fix-linking-flags.patch \
+"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "291c7f4a3fb548d06c572700650c2e3bccb0cd27"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+DEPENDS += "attr"
+# Required to have the fts.h header for musl
+DEPENDS:append:libc-musl = " fts"
+
+EXTRA_OEMAKE += "'CC=${CC} -O2'"
+# Fix the missing fts libs when using musl
+EXTRA_OEMAKE:append:libc-musl = " LDLIBS=-lfts"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/overlay ${D}${bindir}
+}
-- 
2.25.1


