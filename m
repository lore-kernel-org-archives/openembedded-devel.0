Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D57E7734A
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:28:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.30981.1696026508798451974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpmA2KrW;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99357737980so1966431266b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 15:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696026507; x=1696631307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3EradFfn8n4y+y4Dv3a8fg7j98kENNmaeAsZXpwIB0=;
        b=mpmA2KrWDA8Ep558DCnTcZebt5wHr83SqBe1SvZp7cBmv3OUyN171jya7JN+HW7I1I
         7woZEPRlGDdFJl3cg719S7WMsZtL0mq3SoQy7ZN5BcX3qlTAPKkG0kKrNNx0DLPSNg8b
         Zigr4LlMx/WYnej2Z9ZaJIRLGgKbD4CeuRH8Z1VWUKBStfooWa4SW+gGmzZ+M80tDCao
         khlzo2yQHM3L9H/VYAMryGp0uM51qVZEGUGYdKf+JGaGCRYpRjI7T2tuLigXoefAt5uW
         b7h4ksQGz/w5CJJe78AW5wZhZbBgmEAe6mbTqEecQE0Nyl2Ak/WcfKxZ0HzuCkZw/hmx
         f8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696026507; x=1696631307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3EradFfn8n4y+y4Dv3a8fg7j98kENNmaeAsZXpwIB0=;
        b=pa57myLzF0VN5LeAfDq0nTDTQ5pKEa8W/FM7Dn+85sE3J50pHY3+wibXGFJzKXTEFI
         Lhu4hOEXa5GR98qrYQ4oIzTBGoccN99kmWKrzyXtKfhenJnTZXWhZFW/39dSxGJ0aG8n
         UiighIzLDCxsLkApuuvZIZFQChnFQhGzk77Ma3cKU5DCKphiTa60nJ6KDOcvwWD3ZYjN
         PbzFd8cn3aRyORWBztgeti6j25yKfRdDWt813Rf+LM6mrp6wCD08sIUO1JGGFDnkW0Lx
         WD+RvSpbk2EzJl6DR9P1DzFUo6Mrjhq/m5hNqqUC2Ojtvk+32Ogg55IZsJ7cj9UYXlhS
         jHoQ==
X-Gm-Message-State: AOJu0YyGzLA4uTfGCu58PuADUw89K2tYIxp6H/O5ZX5/5avMNlETkmi/
	jMHHIBYDDZhum/n0UrGU/tj6T3DNG7iP7gSo
X-Google-Smtp-Source: AGHT+IHSsjcLiLwivxKmCWXPZRAHZsnpcmPjD6gf5u1fSfdVDsYS8BlhZfJHRPVY4O0bTOctFOh70A==
X-Received: by 2002:a17:906:c801:b0:994:555a:e49f with SMTP id cx1-20020a170906c80100b00994555ae49fmr4527708ejb.31.1696026507035;
        Fri, 29 Sep 2023 15:28:27 -0700 (PDT)
Received: from slackware.local ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id a19-20020a170906275300b0099290e2c163sm12953660ejd.204.2023.09.29.15.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:28:26 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH v2 3/3] overlayfs-tools: Install fsck binary
Date: Sat, 30 Sep 2023 00:26:59 +0200
Message-Id: <20230929222659.57046-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230929222659.57046-1-uvv.mail@gmail.com>
References: <20230929222659.57046-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 22:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105279

Two projects, overlayfs-tools and overlayfs-progs, were combined
upstream.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 ...-Makefile-proper-location-of-LDFLAGS.patch | 32 -------------------
 .../overlayfs/overlayfs-progs_git.bb          | 32 -------------------
 .../overlayfs/overlayfs-tools_git.bb          |  5 +--
 .../xfstests/xfstests_2023.03.05.bb           |  2 +-
 4 files changed, 2 insertions(+), 69 deletions(-)
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
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
index fdfe04574..cfb6e4fd8 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} += "\
     e2fsprogs-resize2fs \
     libaio \
     libcap-bin \
-    overlayfs-progs \
+    overlayfs-tools \
     perl \
     python3 \
     python3-core \
-- 
2.35.1


