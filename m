Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDD1C001DC
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 20:22:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4773.1689452563270300398
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jul 2023 13:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=f+KIlytK;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b8ad9eede0so25236945ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 13:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689452562; x=1692044562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KPCBd4QMFspI4Fib2/3wx6WFXXmsYUh+mByHTMue+s=;
        b=f+KIlytKD8msveG2ZLx88CjdTHyOeBhzLzBA9u0ifLvoQcM3F0XFsWtBc99QkoqY53
         gS/6BkzWpboLwDqZi686ArRaXpzv1GQ3kwYlgZs8l5/vHTCPe4YLbkR/6q6wTa4OSpVD
         mwCHtJFxsU8k7pdCQjQjbWEtZW+e3DUdX/pvyg9IPi0Dm8r65PoCK7okcok/hOF/Z8Iy
         ZjyNnAYwaNSLWbQVjUWXs3cbGrI/DgQkwDaxXDB7u4mmy1VRjhv0a6U9QZdvJKH4xF+B
         kVLgcMdnpqyp0IHglMW265T3PoAfY7tinYs6fVDHiXKev4mrPtKfn4BXO7L5yotAzh50
         xOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689452562; x=1692044562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KPCBd4QMFspI4Fib2/3wx6WFXXmsYUh+mByHTMue+s=;
        b=LWJx3PbeGJe7O2TNAaF/XLRI1VFxL3KNA3CwM5gk87hNJpuCcgDrACwtImRNMAErr8
         qxjqDMBvkT60JS56lN7POe5Fnglwkerbqw06el0NZMXw3ryTVG4VRl5y//mHZfYf/g0E
         wHt/gfr/tVr4kIJye+DPPRFlO222DdbVgiUQPlNoFKLiBw6C1oJ+5jB0K22BnbegxfC9
         kmZsywlj7OlJgy0F2gPiLEJKaFtHtAuJdmGY6avUnNtn+1NoeLeAqdFlZD0KF357twib
         5sy0n8fArF0PtCAoHiNOxIq2EE/2r3KSTk9qie3Cf6DBAwO+e4sRh1m/PoWf60Mf6YJ9
         DMOg==
X-Gm-Message-State: ABy/qLaaVDwxgHK4At0u8pFUVp2oC+V/lCM38nj1lHmCMxOGGo9oPjkv
	x7yZzjKqEieZmRmZ+G83cRfzISuqeOE=
X-Google-Smtp-Source: APBJJlEL5ORDIjvU21dyxEzecpSyJyXG3HU5dWR1NN3zoFCnzqSc/8z0/Wxwa6mpX+Hh4BSejUg3aw==
X-Received: by 2002:a17:902:e810:b0:1b8:b459:f47a with SMTP id u16-20020a170902e81000b001b8b459f47amr10740018plg.34.1689452562443;
        Sat, 15 Jul 2023 13:22:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1069])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902bc4400b001b9c960ffeasm9832129plz.47.2023.07.15.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 13:22:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] zfs: Update to 2.2.0 rc1
Date: Sat, 15 Jul 2023 13:22:38 -0700
Message-ID: <20230715202239.3162521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jul 2023 20:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103873

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../aaf28a4630af60496c9d33db1d06a7d7d8983422.patch    | 11 -----------
 .../zfs/{zfs_2.1.11.bb => zfs_2.2.0.bb}               |  4 ++--
 2 files changed, 2 insertions(+), 13 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.1.11.bb => zfs_2.2.0.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch
index bcca56347c..f5504b389d 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/aaf28a4630af60496c9d33db1d06a7d7d8983422.patch
@@ -54,14 +54,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  endif
  
  # Suppress unused-value warnings in sparc64 architecture headers
---- a/META
-+++ b/META
-@@ -1,7 +1,7 @@
- Meta:          1
- Name:          zfs
- Branch:        1.0
--Version:       2.1.99
-+Version:       2.1.11
- Release:       1
- Release-Tags:  relext
- License:       CDDL
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.11.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.1.11.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
index bd463b8acc..72ad49408c 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.11.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
@@ -4,8 +4,8 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE ="https://github.com/openzfs/zfs"
 
-SRCREV = "0f03a411615a797425de488eecfaaf63fc41acfe"
-SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=master \
+SRCREV = "009d3288dea524c7ad373b04b65bee8bb6f0bfea"
+SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
            file://0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch \
-- 
2.41.0


