Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CA410A1E74
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44808.1774523023684651419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EBjeOImg;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82748257f5fso979873b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523023; x=1775127823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RObr5CIWAxSyWzaekAg/xtV4gVREXIjMXODfb/e2qOI=;
        b=EBjeOImgpFMD4KmeDhSw/W9cfxi74RndVG7XEH8JF2A0wUxMLn5SFk/85bsA+JBi+O
         GaoRtABWZSgUYNEkEWcaUSYs4BAxt2mDLh3fDxxnX1i0xZH6glVEbgvpmzdsdyp7X0uV
         L8XZ5V4VzQsscX0B9WhwmM9LKB+mJIcF5dMRBMZjFyY+3gOirXBWEqlk851taM0331Ox
         5Q3COibkOmJ1VYETvbeZoY1Nyi7Q6bKaw2EoYOitQt/n2kmHWxjJNAxgjEs5hgMnHtlO
         610zwI7va2N36ewIXhOwGNWO7633HZyhY+LOSXanUSEGH18IFykqkGBkbKg57jLE/Nh+
         KSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523023; x=1775127823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RObr5CIWAxSyWzaekAg/xtV4gVREXIjMXODfb/e2qOI=;
        b=TWhJpzkmrA5owHdf+UEy9iQao8mqpcmuLE5lYy4NVfXSIjYcQS6ubQUtfoD0cYW3xG
         Q9RQLXylKRE8sVTurcaK2SJmZVbdMOXwllreiUWMzHOL/c36Nj1/DzO59lXqnS49r3YK
         nJt5O4mWrVQjWXDiW6uO0Sq4G4sm2oVbWfbiGoSYmH+3VQnWKNOdNwIYnQvAXgraFgjX
         tCADeBkwqB+wIpiYWzqTZAV3yGj8/SS/9vR0h5ocwy05IzZQdTQSYPAv8iEXoASsp61o
         +lvF5XEDnGavvs5yCbyuZLwMBafcKMpPTHXXKv2qvJS5PV57ck/LuBWQF3WMP3IIxuwT
         bllA==
X-Gm-Message-State: AOJu0YzWSUYz1ZWWKqzDhHeakrlFQguJ2QR4wBxsA3XgP7Knu1ZFl4dx
	ss7T7dLFhNXIqAIOUcp5al9CiwksCDpZ5K9m7jUTg6NLFKignIYUAdZ6H+6tfKLA
X-Gm-Gg: ATEYQzzZwGi1b9nt/8WGRMfvwgebIHQ5T8JnDZ0B4fKFZXI9RG6jLhVOzMaU00BS+XJ
	Xf3F+sS/8SWrJ0v/mJaZAegnQNFOYWNUw1bFQRCmqG7HvsxEJc8rBd1Gr7Gd9LBMlVkaXo67QTi
	MG+3yw2BiSyhKSCvU8gq8MvSz1y5KD5vQ7Zy+afQqXBe/WCMhO5Fn3G2/lw3d9l1ukhym1Dt9HO
	64d28QjReXn7HJTtQEXfBexsvw9qdaMwYYPSdxoyKKPcp3qb4+yIBfWQwitWXCcUfNL19dq1nL8
	DV7bF1k/rxHrSB6TTagnMQVhWYtcMDcItvsSP/3jrVIaMBMnEoA7rQNm2g1D0Zl0fdRqv2y8/zf
	OZ4cddykD7Keb1ENS5Lilv4yRUQ6e7x+5/xPpqO/m0BBMe9/DQGuj7nL0vQiJc/yxND0gQXsQCQ
	sQScZviLgxwD2gNRyv/ox1+w86ixTG0k8oon4=
X-Received: by 2002:a05:6a00:9517:b0:829:6f7d:3086 with SMTP id d2e1a72fcca58-82c86787823mr1160086b3a.11.1774523022756;
        Thu, 26 Mar 2026 04:03:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 8/13] ufs-utils: bump SRCREV and include tag in SRC_URI
Date: Fri, 27 Mar 2026 00:03:05 +1300
Message-ID: <20260326110310.1809866-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125649

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patch which is now merged upstream

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...l_path-buffer-size-in-find_bsg_devic.patch | 39 -------------------
 .../ufs-utils/ufs-utils_7.14.12.bb            |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch

diff --git a/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch b/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
deleted file mode 100644
index 7ae858a65e..0000000000
--- a/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 989dcd297223d6896c5892532d14984326fa093d Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 18 Jul 2025 16:52:57 +0800
-Subject: [PATCH] ufs_cmds: fix full_path buffer size in find_bsg_device
-
-The full_path buffer consists of: path + '/' + files->d_name + '\0'
-So the buffer size should be: strlen(path) + strlen(files->d_name) + 2
-
-Fix crash when running 32-bit binary on 64-bit system:
-$ ufs-utils list_bsg
-malloc(): invalid next size (unsorted)
-Aborted (core dumped)
-
-Fix #58
-
-Upstream-Status: Backport
-[https://github.com/SanDisk-Open-Source/ufs-utils/commit/989dcd297223d6896c5892532d14984326fa093d]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- ufs_cmds.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ufs_cmds.c b/ufs_cmds.c
-index ddb037c..a6faa27 100644
---- a/ufs_cmds.c
-+++ b/ufs_cmds.c
-@@ -1520,7 +1520,7 @@ static int find_bsg_device(char* path, int *counter) {
- 			if ((strcmp(files->d_name, ".") != 0) &&
- 			    (strcmp(files->d_name, "..") != 0)) {
- 				char *full_path = (char *)malloc(strlen(path) +
--						   strlen(files->d_name) + 1);
-+						   strlen(files->d_name) + 2);
- 				sprintf(full_path, "%s/%s",
- 					path, files->d_name);
- 				rc = find_bsg_device(full_path, counter);
--- 
-2.34.1
-
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
index 3c12bc5fbe..fa23718611 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
@@ -4,11 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "dd2e655780424eadf7610de33e5966be19168a95"
+SRCREV = "bcf4b0dca8e58b8fc8265ba746a7b84af86fc365"
 
-SRC_URI = "git://github.com/SanDisk-Open-Source/ufs-utils.git;protocol=https;branch=${BRANCH} \
-           file://0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch \
-          "
+SRC_URI = "git://github.com/SanDisk-Open-Source/ufs-utils.git;protocol=https;branch=${BRANCH};tag=v${PV}"
 
 UPSTREAM_CHECK_COMMITS = "1"
 

