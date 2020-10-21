Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.14041.1603295820118950388
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 08:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAL9SJAd;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id c77so2702480wmd.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 08:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CIzXrjY99b+WV3JuorctfLq0GnGtILRHqeZlc5fUHVg=;
        b=kAL9SJAdwbwCxuG1Nv1Iv4bxZUR3+ccC8Q8o3/Ng6lcLegyuq3z9ZD+p/9Nevnmne9
         N901VuUNm78T13OMIo6iFJwgPC1NzkJvW4aKt5Tu5Eh1qK9YX//4HVgVRqbG+20nbwoL
         AYzEq8AGKcFRAFsVEGAuBGf5zSTDKXVTVbRUZP6dZurP87otCC3SfIFrVXQttRlIeWZ4
         YgQzU47QmsS3yfX5Cef8o2bMyf1BQbIkQvJBFrrPJPUPRxIhis4KFupbwZQDDQsEGdnM
         iAnSCrQjvttarEiW1mzNHtHSuxHa3H7S/7puRSHrxHhC1t0t6i6N8w6/Ja7A3kpxUJzB
         n8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CIzXrjY99b+WV3JuorctfLq0GnGtILRHqeZlc5fUHVg=;
        b=LRcEbt1I1WBA1YCn8NlZR7AGxon4edvJreqzLPLIxlicY3lLvzOCw/Rx9nj5qusIoN
         4mm5McvuMV+VHkxU66tyBAv/cvBP/ALduto2qu83pNvcuhhi/rOZ5kl3wph/g1rct6N9
         NXJeMCcOn2q1sxKtbLTR5Af0t+WoDGqaQfJ8GuOJtFbfHXBLklBRr/5ZwTsFvQqPy6r9
         RayUcynBSQgDI0vrLjOWEcshJ9aY8hzqVCnUU+b+QwMtouQzSfRBstmDatS0zgtvdaRY
         juVDNRRvkHQeZYe6zr5GhnSExPhZaVHaovyMO7tTST7J/yj/n/R2vX6TSI0rh1t4kd1t
         FKnA==
X-Gm-Message-State: AOAM5302Hb7spefzQrOTaNgRFqNZbx09tTQuq+3meyz1/mMvDm0RPKxT
	0XX5nLiGGuHvFelrro8hOKCy3VT2DUfbxg==
X-Google-Smtp-Source: ABdhPJxvGN4F0G2CJSHpzrGYVh1eehExfQPwBIoFkaKY45ItOolGFRcJOU1hpkNCEfkPv7KgT4bHRQ==
X-Received: by 2002:a1c:2d8f:: with SMTP id t137mr4235951wmt.26.1603295818060;
        Wed, 21 Oct 2020 08:56:58 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id a8sm3967620wmj.31.2020.10.21.08.56.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 08:56:57 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Add recipe for fsverity-utils
Date: Wed, 21 Oct 2020 16:56:56 +0100
Message-Id: <20201021155656.2841020-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Library and command-line tool to manage the fs-verity
feature, introduced in Linux 5.4 and supported in ext4
and f2fs filesystems.

https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 .../fsverity-utils/fsverity-utils_git.bb      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb

diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
new file mode 100644
index 000000000..c0b6fc657
--- /dev/null
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Userspace utilities for fs-verity"
+DESCRIPTION = "fs-verity is a Linux kernel feature that does transparent \
+on-demand integrity/authenticity verification of the contents of read-only \
+files, using a hidden Merkle tree (hash tree) associated with the file. The \
+mechanism is similar to dm-verity, but implemented at the file level rather \
+than at the block device level."
+HOMEPAGE = "https://www.kernel.org/doc/html/latest/filesystems/fsverity.html"
+SECTION = "console"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
+
+PV = "1.2"
+SRCREV = "406187bb3a885e083b448b2c2aa42c22957ae629"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "openssl"
+
+EXTRA_OEMAKE += "PREFIX=${prefix} USE_SHARED_LIB=1"
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES =+ "libfsverity"
+FILES_libfsverity = "${libdir}/libfsverity*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

