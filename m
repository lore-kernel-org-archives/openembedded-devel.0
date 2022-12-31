Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089F2C4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 05:19:29 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.36298.1672463968353217958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 21:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DJPjknrt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso27535411pjp.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 21:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UWOAW2wE+FsU5NiFUFp2HfEuC0Nxi+aAXFY7NM6IqG0=;
        b=DJPjknrtFOOVAsfwgCbh0kjHilL0Aol5nX+sqArqPJS8A4njz/Dp35sYdEDNm0DA18
         XZpFDRhlL33Qj2sGuPKjIqCCklcYWmGtz/reaxcui2x4NMweHsHVg9W2bFt6twfZYQzE
         afB0mPBPaSbQi7THFucULoofC6K6A4CAKHAyz4XI9RYpu12bcNKYLfaT/bPjnSiQm+Qa
         FKKD4uFj+CXWM1gM2YHdJDLuGktTzHQDWwwKgBSu2Gmj214cmbOX9jpVxRnb4zcZYxOi
         uVYyjQ2+6yR+SW7oVyI0lD41X1Sy5U2tOOXMb3rZPuzckCV+rBiAVlhiM6pT1p1p72tW
         y30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWOAW2wE+FsU5NiFUFp2HfEuC0Nxi+aAXFY7NM6IqG0=;
        b=d2ck0jy7X5EBP9GW/+SXsSkTzxFteEGO1eIXladWlemYumSyerzH/MALKU4tKpixDY
         XUWb+eFL9mZ1TslmS4T65axfSdhmpQVwckQb34xet8sjQghYPlCls8CmvMZ7ntdzIRL/
         +0xPYDRnnfcP4xttzhHTCiWFGv0KU7//17FfNx3BXjf8VQ5+AnszfK54gczS04Ou8FiQ
         +RPtdP5waOfrY94/wQpBEAkPFuTG5fLiItPWWXb6neENc38fa70mkA6xBYLeDEO3ZnN1
         UiubMEjZU5hP4G5UDcm+DjSMA9aF67xWIebP05o3Z3G49JY3xwJUl2/gDZw9L9Pfm9IS
         8EIg==
X-Gm-Message-State: AFqh2kobbxC4EC/EBsW0QTg0xHgg7VtlYp72Y52XjDWw1AbhSjJLYQU6
	9EyJpv192I7dyzrpwFNitDdcE03UyRQ=
X-Google-Smtp-Source: AMrXdXsnSS46DBXLVDc6aGdLm7d3cB0Fps/Lx7ZnmKqW9tlFEF5zXsN7vtbagg9hTeqxq0ZbaHuFqw==
X-Received: by 2002:a05:6a21:3996:b0:ad:2abb:5a5b with SMTP id ad22-20020a056a21399600b000ad2abb5a5bmr44398171pzc.9.1672463967531;
        Fri, 30 Dec 2022 21:19:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id b189-20020a621bc6000000b00580d877a50fsm11746536pfb.55.2022.12.30.21.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 21:19:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] fatresize: Fix build when 64bit time_t is enabled
Date: Fri, 30 Dec 2022 21:19:24 -0800
Message-Id: <20221231051924.3051025-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 05:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100318

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch | 34 +++++++++++++++++++
 .../fatresize/fatresize_1.1.0.bb              |  3 +-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch
new file mode 100644
index 0000000000..d0ecdcba4e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch
@@ -0,0 +1,34 @@
+From 69647e5d393a52ed3892eccc172ee750d6aaa45d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Dec 2022 21:08:25 -0800
+Subject: [PATCH] configure: Do not add -D_FILE_OFFSET_BITS to CFLAGS
+
+AC_SYS_LARGEFILE macro is in use and this will add a definition for
+_FILE_OFFSET_BITS in generated config.h which is already included as
+first include file in fatresize.c hence its not required to be added via
+CFLAGS, this also fixes a case when -D_FILE_OFFSET_BITS=64 is passed via
+CC from environment, where the autoconf macros set
+ac_cv_sys_file_offset_bits=no and that means we will have
+-D_FILE_OFFSET_BITS=no added to CFLAGS which messes up builds.
+
+Upstream-Status: Submitted [https://salsa.debian.org/parted-team/fatresize/-/merge_requests/3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d6e6cb2..4dcec28 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,7 +29,6 @@ AC_CHECK_FUNCS([memset strtoll])
+ 
+ # Check for LFS
+ AC_SYS_LARGEFILE
+-CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
+ 
+ dnl libparted
+ # hack
+-- 
+2.39.0
+
diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
index 1ca8bb3fe9..cf7ac62be8 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize_1.1.0.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "git://salsa.debian.org/parted-team/fatresize.git;protocol=https;branch=master \
            file://0001-build-Do-not-build-.sgml-file.patch \
+           file://0001-configure-Do-not-add-D_FILE_OFFSET_BITS-to-CFLAGS.patch \
           "
 SRCREV = "12da22087de2ec43f0fe5af1237389e94619c483"
 
-PV = "1.1.0"
-
 S = "${WORKDIR}/git"
 
 DEPENDS = "parted"
-- 
2.39.0


