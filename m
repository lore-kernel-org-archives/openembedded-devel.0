Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C9DC76195
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 01:35:58 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.13940.1679708157116380254
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 18:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c4Y0y7Th;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so3298097pjb.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679708156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPtmregZ+coMTm8NhT3lSB4SRr18JePY+gZaLMvTgX0=;
        b=c4Y0y7ThKY3wHtIqVTdoOQ/etvAjvnR+9nbFkeueUym3GZypfyW9lJi+DOLUB+xP5s
         Gz0Z/7srxZ7gleViUtz6xA6ELg/+aaAwIJhhQMFi/6kOs6wlrXoVWd1Xn+axhctCSw+7
         NQeP6nw3DmuD9AoGuiEz+CGY0jMZGd8AulA6dOv/WwXsrUUsktwPbfDfekaAPyerHyEH
         ZAQ6AfSHOzCw4RsG8nHVyBeRKDjTP+utRF/jfrYaGIyW/Y80sPrcomWU2v5tJsd32dcj
         FoDGPcKYPCUup58RGvgKQEU+HQ56x1cTCHiyvm9No177UsUbv99veffn82NOqcE4duia
         V/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679708156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPtmregZ+coMTm8NhT3lSB4SRr18JePY+gZaLMvTgX0=;
        b=xoTO4LzMJ907Ss3NoRWvcd9HJkg9tbckh7VVGx62NhiR6ouWlX9WHsBCV1ZSMBJ64H
         uP+pWPBpwunRFUc5MfyXKsSzuQZnHvuuPQvodhhkCoeZ4E9O8C3lOS5jqMNnP0JTJ/To
         M5EGFpTRO8CMnodBk44RwVbUGMniaFRw461OAop5jzXB6dUvtDoDzJj1wIjpL0yoA3Fu
         mtDVbwN/bykI7nKNdyEtRr+KnS+MBCoZ6bYhIuNxRKoFI1F1zmp8HZmlQvl1b2usrjH0
         MVGPVBBQvhl81Mt6y3o9gNne5tUTv2IofWuaq1QaFDhngt/wdM7jNU9DGhuHz+sTYhNJ
         b85A==
X-Gm-Message-State: AAQBX9cA14cxxsLCtkEYphC+msxI6kCL/2fXjIo6p+bLAm6xlkoRchn3
	60kWN8mX4YzcRFkp0Y0NbZz6Mti2cA6afA==
X-Google-Smtp-Source: AKy350b8sFeHAODcce88OkGmiW4GKm1z+8RzO9a8Nsc1OSQi+y1gHo0B1d9f+2nbvrMBhv79s3KxBg==
X-Received: by 2002:a17:90a:4fc2:b0:23d:4242:a7a5 with SMTP id q60-20020a17090a4fc200b0023d4242a7a5mr4932913pjh.47.1679708156026;
        Fri, 24 Mar 2023 18:35:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id bp9-20020a17090b0c0900b00230dc295651sm821067pjb.8.2023.03.24.18.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 18:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: Fix build with musl
Date: Fri, 24 Mar 2023 18:35:53 -0700
Message-Id: <20230325013553.785841-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 01:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101711

Musl does not implement FTW_ACTIONRETVAL which is a GNU extention
therefore add that to configure check before enabling nftw

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...for-FTW_ACTIONRETVAL-along-with-nftw.patch | 34 +++++++++++++++++++
 .../xfstests/xfstests_2023.03.05.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch
new file mode 100644
index 0000000000..fd34989fdf
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch
@@ -0,0 +1,34 @@
+From 2a4fed8331f996421e65db446559991a854e2ad3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Mar 2023 18:23:01 -0700
+Subject: [PATCH] m4: Check for FTW_ACTIONRETVAL along with nftw
+
+FTW_ACTIONRETVAL is glibc specific extention which is used to implement
+xfsfind but it may not be available on other C library implementations on Linux
+e.g. musl. Therefore ensure that these defines are available before declaring
+nftw() to be usable
+
+Upstream-Status: Submitted [https://lore.kernel.org/fstests/20230325012858.587801-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Darrick J. Wong <djwong@kernel.org>
+Cc: Zorro Lang <zlang@redhat.com>
+---
+ m4/package_libcdev.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/m4/package_libcdev.m4 b/m4/package_libcdev.m4
+index b41c087b..7f731044 100644
+--- a/m4/package_libcdev.m4
++++ b/m4/package_libcdev.m4
+@@ -132,7 +132,7 @@ AC_DEFUN([AC_HAVE_NFTW],
+ #include <stddef.h>
+ #include <ftw.h>
+     ]], [[
+-         nftw("/", (int (*)(const char *, const struct stat *, int, struct FTW *))1, 0, 0);
++         nftw("/", (int (*)(const char *, const struct stat *, int, struct FTW *))1, 0, FTW_ACTIONRETVAL);
+     ]])],[have_nftw=yes
+        AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)])
+     AC_SUBST(have_nftw)
+-- 
+2.40.0
+
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
index 9baa31f712..fdfe045749 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2023.03.05.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;na
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-Add-a-return-type-to-aio_rw.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
+           file://0001-m4-Check-for-FTW_ACTIONRETVAL-along-with-nftw.patch \
            "
 
 SRCREV_xfstests = "f7765774a1b5cb98c2f21a892e82b3421f40e791"
-- 
2.40.0


