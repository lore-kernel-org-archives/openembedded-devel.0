Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164E7C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 19:04:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5711.1719860674509846613
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 12:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KzQHFizq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso30143865e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 12:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719860672; x=1720465472; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hAlKzvJcSKnubkx+g3M0vm5V8/x4veuMNZeK9rl/9w=;
        b=KzQHFizq4tlEpEB0rFCwb9gIi9f/eKDUMQm8EvBzoCh76L1Facn/VGCJ03+/BWL79i
         +ZZ4g2UvK7XUwAGpJhfTARTm0EWphhiBNtpdvMnYV9L5reHhreG2Pa9mtfMTITs9a+wO
         vFSKyNUrBCKp53hrFGrNMtcpGIVH/GmIUHp5lnAjC0AH7Wjp7PdbMr+8Yw2PsHpiZQMP
         aLI/Bu12LjhtCTuGE/jQFNrDTiNcy46Cx/w3xS3Cj+rKY0HgBBQ7sBAdn6wJuPf+uC3Y
         iRgcBpZFRpCnMSNCRSpc7JE8/YdBjn2rHNI9CgPtV0IkAVaRVhUva4bmQV2cZwycWhzf
         PS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719860672; x=1720465472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hAlKzvJcSKnubkx+g3M0vm5V8/x4veuMNZeK9rl/9w=;
        b=efP7lajWI6hqZqAziSgGzKiIjSntuucMprKv0ITz4NEKcGz0aciDApyon2PT3GeQlD
         qOyo3VVsI/bN00J3AORXmFSiXrjxU8aweoj119KSx2YbdY+CYvI1lcmLaJ11Kl9/DbV6
         +GKHkeHUQnRwne83a6/VYWhfaY2sB0nK0eS9ngzXy9soMFGNg4m9Pafhe/e9Db4jFlt0
         AM34Z7hdHFL4S/gG8dWGPusmbKgS+h3ieHmavs09IsAIUQbd8JTE3aKSmUjujK411hQS
         jzrkKs5tMaHgMnjjNdNpyXPfXWwBpEi2NKNxDo/PUsxoByOgSP5i4PK/fiZVA/U0FIaD
         mMqg==
X-Gm-Message-State: AOJu0Yx06QPUwTOlm0GkmMk5XZMxE3R4+H6yMGNJfOkwefC9AVgQNUzj
	TtXM8rYDe6qE5b5DNogicDIkJgdDHlB+O/QODoi4OJVqN0HNVo4Cc9qpUZTR
X-Google-Smtp-Source: AGHT+IHka2Ic9XCcZbggsbnoXTsvlk+BrOcQ2K7XLlFfpeKxbG2r/6zVYUGSGOfREwsvFuLo/pSo9w==
X-Received: by 2002:a05:600c:5129:b0:425:63b9:ae2c with SMTP id 5b1f17b1804b1-4257a02008fmr56979165e9.27.1719860672378;
        Mon, 01 Jul 2024 12:04:32 -0700 (PDT)
Received: from localhost.localdomain (dslb-002-205-007-136.002.205.pools.vodafone-ip.de. [2.205.7.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b098b4dsm166796505e9.29.2024.07.01.12.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:04:30 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH] overlayfs: Use explicit version
Date: Mon,  1 Jul 2024 21:03:48 +0200
Message-Id: <20240701190348.3586827-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 19:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111209

The upstream project now has a version scheme and migrated to meson.
Adjust the recipe accordingly.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../overlayfs/overlayfs-tools_git.bb          | 28 -------------------
 .../overlayfs/overlayfs-tools_v2024.07.bb     | 14 ++++++++++
 2 files changed, 14 insertions(+), 28 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
deleted file mode 100644
index 47613207a..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Maintenance tools for OverlayFS"
-HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
-LICENSE = "WTFPL"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
-
-SRC_URI = "\
-    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
-"
-
-PV = "1.0+git"
-SRCREV = "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-# Required to have the fts.h header for musl
-DEPENDS:append:libc-musl = " fts"
-
-EXTRA_OEMAKE += "'CC=${CC} -O2'"
-# Fix the missing fts libs when using musl
-EXTRA_OEMAKE:append:libc-musl = " LDLIBS=-lfts"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/overlay ${D}${bindir}
-    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
-}
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
new file mode 100644
index 000000000..543d0f07d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Maintenance tools for OverlayFS"
+HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
+
+SRC_URI = "\
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
+"
+
+SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
+
+S = "${WORKDIR}/git"
+
+inherit meson
-- 
2.25.1


