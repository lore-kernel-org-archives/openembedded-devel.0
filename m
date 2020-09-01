Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.7329.1598942839801028532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 23:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S2ylWv2y;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id bh1so50600plb.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVG5UVNAuj6GaXCTwjtWsnK71Kk49bT2VRWLjhggK+I=;
        b=S2ylWv2ydWrY/pqjYwg4PSBeJQkyzmB0CxqGLrgfLBs9YdIqX9Qch0Hcz3dO/8EOSn
         VG32yjLplijBQ/dokW4Y47+ClmVu7o0eYnrlRvV+0LXijUghzn6TxLRgAijVDQP2ualE
         gFYu4Qdj0iYMdWPYKA9SzyCy4Z+tvMeYewYcUDhwt+57NaqCzGD14Q7VqP2npQg+rdkz
         N+RNVMBjB5LY8xCk/PT7whbCLbHlJvPj1M90gaaIkoMKCkF3p1/PKZF1FRbGVskliLUy
         Dh0oMnLamKOuiyJKG7kTc70cNVQjmbC4rdtfp/3yj8b+MpV+aH5bngESgGO4729+pKUY
         XXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sVG5UVNAuj6GaXCTwjtWsnK71Kk49bT2VRWLjhggK+I=;
        b=NZmpYXPnf9aF1zB3yNcbXBbm8boXC/4MdbjvSEIMfKXdanQ+2A+DvDG+6Hwp3OzUgv
         A40chTRjZg3hh6MOuqiVbdMcI+2Y+BveiOB1OTI1hDwSjxA7KsBaImjP2+h06l4XRhUJ
         A6XK7U1EHQiHTXfdYbQlXNudRsNR/lk1aat2kIshdKEcK3JblH82c9c06WsB6TR8j8Zx
         CKO6hB7VMABxViIyMItezXu41DMIWjAq/Mwh1lMLjFBkdeB3K+G3lETBsXPMpdiwKQ3o
         VP2x9elwCbEPdYccbOLd/u45uJWMrgureVW+u2AkZIRmI59AfJZVpPMtpnxT8WQZx3ah
         EeNw==
X-Gm-Message-State: AOAM530uc/V/bifDOaZVq8feD2bIcr3b/T1m/PHw+jiXSvKdH23pRlAi
	eDLHb/MDdCoT6FVdrKSR30Luu/6Tm7Tw/A==
X-Google-Smtp-Source: ABdhPJwEfYwKo2uLBLGttanj7Jr5e3tIMx2Z3fj7g5mxyBKxee7Tt+qD7N/FAyZ82pVuk3/Hm3KchA==
X-Received: by 2002:a17:90a:2bc8:: with SMTP id n8mr181062pje.189.1598942838804;
        Mon, 31 Aug 2020 23:47:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id a13sm778384pgn.17.2020.08.31.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 23:47:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/5] packagegroup-meta-filesystems: Update to add new recipes
Date: Mon, 31 Aug 2020 23:47:10 -0700
Message-Id: <20200901064714.2206751-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-format while here to list one entry per line

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-filesystems.bb          | 34 ++++++++++++++-----
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
index 86b1c9b36f..8a8a8dbe2b 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
@@ -16,20 +16,36 @@ RDEPENDS_packagegroup-meta-filesystems = "\
 "
 
 RDEPENDS_packagegroup-meta-filesystems = "\
-    ntfs-3g-ntfsprogs ifuse sshfs-fuse \
-    logfsprogs owfs simple-mtpfs \
-    unionfs-fuse fuse-exfat yaffs2-utils \
+    ifuse \
+    logfsprogs \
+    fuse-exfat \
+    owfs \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "smbnetfs", "", d)} \
-    "
+    simple-mtpfs \
+    yaffs2-utils \
+    ntfs-3g-ntfsprogs \
+    httpfs2 \
+    unionfs-fuse \
+    sshfs-fuse \
+"
 
 RDEPENDS_packagegroup-meta-filesystems-support = "\
-    physfs fuse \
-    "
+    fuse3 \
+    fuse \
+    physfs \
+"
 
 RDEPENDS_packagegroup-meta-filesystems-utils = "\
-    xorriso aufs-util xfsprogs \
-    f2fs-tools exfat-utils udevil \
+    aufs-util \
+    exfat-utils \
+    fatcat \
     xfsdump \
-    "
+    f2fs-tools \
+    fatresize \
+    udevil \
+    ufs-utils \
+    xfsprogs \
+    xorriso \
+"
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.28.0

