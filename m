Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F77E71D3A
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 13:38:58 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.17427.1695994734594112793
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 06:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jnuoyN2l;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53627feca49so3048441a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695994732; x=1696599532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sas3JVRrLEhvz6zYF61YHf/cRSu+tElDyGWCDvYAq/s=;
        b=jnuoyN2lrG5sAtKPtgIKztK8Ysvgm+OYCJlBKnT4t9VxotyGx57iVQnbFL/oedR6/U
         +WH8pvnTVi+DgKutZtNvP6Rieeb9C4pB1CL7XQzrHoPEYiwbCO+fS3xse1b7ltkxeNSz
         X5qVsY4QACvMaVX7LHTB8inh+C/2tsZ3D6Qp2Jda1S3pWE6hYjov6fURGb0Z9w5vQG2F
         8LpS1/2f5GWTnlta2r8ypzZYsi7zCQ+G2JB8wyj+6xuMNdc1CeldrRnNoTwpwgftWSnb
         H3M+pogv1tQ1M95uK4S66NRJy0g8E4zDULbZH2Y7aQOUMEdUIEX+5f94djnanp7V5WIg
         FDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994732; x=1696599532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sas3JVRrLEhvz6zYF61YHf/cRSu+tElDyGWCDvYAq/s=;
        b=ckyi+5LL7vgAdh3nilBndbMSsyouYZmAjlw9ZQLzQi8sU49JohexW+SoSALcuh2j3a
         mb3poMyW2E1RmlxEPq4ke2CJ56HeNLl0Ud2frNF5lcKanHJxFAfBokiHUQ2w3XMz0pEE
         Am6q3GLqv2CCZpCjaX1UUJBWh4Q3hR3XINAZs3AHJaWNESSWN4d3DR3PqPMg8R5t3CtH
         xglIacU3vRNSKqU2X1cFhKEd48zi5TKlKu1Gn+vPdW2bilJy3vbN1ycJPCA3nQCLxGqz
         YthCByoCX4rdFhjYiuBJ42ZvzTuG8ayZ7UA37jQFLG9PAVPB+9XIr2prfZR/azwPv1uq
         h+9g==
X-Gm-Message-State: AOJu0Yws03KOnnQmN3T0as8IzETB5XWzposSq7h1wMjf3rqRr9eyfZtk
	IRJM5Q1bmLEJqh2Bm02XXsfI4mw0MHdSYyD0myE=
X-Google-Smtp-Source: AGHT+IHb40yt2rQK46I3TYkfbGjs7KYDhmSabqUeJHtFORuvjsFfpR2kacq6LOw0SI2kNFVnV5/Ydw==
X-Received: by 2002:a17:906:3287:b0:9ad:8a29:f26a with SMTP id 7-20020a170906328700b009ad8a29f26amr3643245ejw.63.1695994732144;
        Fri, 29 Sep 2023 06:38:52 -0700 (PDT)
Received: from slackware.local ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b009a5f1d15642sm12431287ejb.158.2023.09.29.06.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:38:51 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH 3/3] overlayfs-tools: Install fsck binary
Date: Fri, 29 Sep 2023 15:37:24 +0200
Message-Id: <20230929133724.56928-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230929133724.56928-1-uvv.mail@gmail.com>
References: <20230929133724.56928-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105245

Two projects, overlayfs-tools and overlayfs-progs, were combined
upstream.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...-Makefile-proper-location-of-LDFLAGS.patch | 32 -------------------
 .../overlayfs/overlayfs-progs_git.bb          | 32 -------------------
 .../overlayfs/overlayfs-tools_git.bb          |  5 +--
 3 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
deleted file mode 100644
index 2c001834b..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8eeaee82dcfdf47f16ad880e416b722827f41bdb Mon Sep 17 00:00:00 2001
-From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
-Date: Mon, 23 May 2022 19:37:32 +0200
-Subject: [PATCH] Makefile: proper location of LDFLAGS
-
-Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
----
-Upstream-Status: Pending
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e3c5207..14b155e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,5 +1,5 @@
- CFLAGS = -Wall -g
--LFLAGS = -lm
-+LDFLAGS = -lm
- CC = gcc
- 
- all: overlay
-@@ -7,7 +7,7 @@ all: overlay
- objects = fsck.o common.o lib.o check.o mount.o path.o overlayfs.o
- 
- overlay: $(objects)
--	$(CC) $(LFLAGS) $(objects) -o fsck.overlay
-+	$(CC) $(objects) -o fsck.overlay $(LDFLAGS) 
- 
- .c.o:
- 	$(CC) $(CFLAGS) -c $<
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
deleted file mode 100644
index 9d58b9a63..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "File system check utility for OverlayFS"
-HOMEPAGE = "https://github.com/hisilicon/overlayfs-progs"
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
-
-SRC_URI = "\
-    git://github.com/hisilicon/overlayfs-progs.git;protocol=https;branch=master \
-    file://0001-Makefile-proper-location-of-LDFLAGS.patch \
-"
-
-PV = "1.0+git${SRCPV}"
-SRCREV = "e10ef686570d9c7eff42f52461593a5c15da56bd"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-# Required to have the fts.h header for musl
-DEPENDS:append:libc-musl = " fts"
-# Fix the missing fts libs when using musl
-EXTRA_OEMAKE:append:libc-musl = " LDFLAGS='-lfts'"
-
-EXTRA_OEMAKE += "'CC=${CC} -O2' "
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile () {
-    oe_runmake
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
-}
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
index de5155133..ca2ec9cc4 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
@@ -21,11 +21,8 @@ EXTRA_OEMAKE += "'CC=${CC} -O2'"
 EXTRA_OEMAKE:append:libc-musl = " LDLIBS=-lfts"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-do_compile () {
-    oe_runmake
-}
-
 do_install () {
     install -d ${D}${bindir}
     install -m 0755 ${B}/overlay ${D}${bindir}
+    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
 }
-- 
2.35.1


