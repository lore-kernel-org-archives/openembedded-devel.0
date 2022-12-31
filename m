Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8531DC4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 22:27:24 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.52686.1672525643221740757
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 14:27:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WEUI2fEl;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so24803063pjh.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 14:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi/YsUZiEcmZCspZLJBBmetQerreaMnat//C33m845I=;
        b=WEUI2fElARha1juIAxI9aPLQs/3YPFsz6JG4ettmnN/lX3RTRNmvbtHBVVddIY5S2r
         +95+ydzguW/d04cnP67WrEYIA9KDUsL08mHHjiUmoeCqbfv6T7rEmY565RsuK0mQOSjj
         d8YItbcIwvSiBaiCohz84CM4YNtF+1NsiigJUcY1MC6BBfkw0vEg6T0cdfBVd7CKahUi
         tYHPRorJrlTofdQEmlfq+E8Pui8HS/yAiq2UgeYcwxDF9jOAU2Ph2Ibrc/eoxvLraOCg
         td8lwV4tlPcJ9BpzTy4Cr6B4XCtMESY06bsFekUR478v4tOWg1r3KYla3muQzpAsbhEu
         NyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi/YsUZiEcmZCspZLJBBmetQerreaMnat//C33m845I=;
        b=m+gZobvvyiN2xU5al8vclELbnGztRjGqFur4OT9BDv3ESZuOCjUlK0O9ZceBNy6ebR
         uHJIs/GxskBExWZGY/b2XFsOf0+OJ/XQ/8AG/yTweWUVuaM32jShD72y6mMfVDhxe/eh
         Pt7ZWax3INWYpwWOry8bL0fz0V8oJ+4TuknackZ5+4zngHrbVqltzQl5u5O7yGKIB1PM
         dtqLOAuIwIyurLitsE51IxdQ17Wln5nXiMYCvnKpQFNMAAiFpIKKnIXmpRcPwSr4DeVF
         Nx/dStEvdHiEie+SbVXN1QPENM7X5guojjPlW5frIMb7kRBttXd0J9rxgbwOKdbLNL+m
         OhxQ==
X-Gm-Message-State: AFqh2kr7bEek6RQGaiosmc2wLRG9vzPXp3cKs7Dqk4rYz6pxjBeqV63R
	9pv9hFZHQfy4QyH7DmOLtsd5z5BVXmk=
X-Google-Smtp-Source: AMrXdXvS0RHT26sXXjpmKJY+X4iX2EVv2X1e9jWYhQts4TzFTsTxOua0ftWrd94+nkh5isheO0gaQw==
X-Received: by 2002:a17:90a:688e:b0:226:c30:aa45 with SMTP id a14-20020a17090a688e00b002260c30aa45mr17576621pjd.40.1672525642435;
        Sat, 31 Dec 2022 14:27:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c21-20020a17090aa61500b00219463262desm14671427pjq.39.2022.12.31.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 14:27:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Do not use off64_t on musl
Date: Sat, 31 Dec 2022 14:27:18 -0800
Message-Id: <20221231222718.1455310-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221231222718.1455310-1-raj.khem@gmail.com>
References: <20221231222718.1455310-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 22:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100327

Its not available on musl since off_t is 64bit by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-wiredtiger-Avoid-using-off64_t.patch | 30 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
new file mode 100644
index 0000000000..abe6898554
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-wiredtiger-Avoid-using-off64_t.patch
@@ -0,0 +1,30 @@
+From 0508c1518c2e7c586a231d344e9f93b08507885b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 31 Dec 2022 14:23:40 -0800
+Subject: [PATCH] wiredtiger: Avoid using off64_t
+
+off64_t is not available on musl since off_t is already 64bit by
+default. Therefore replace using off64_t with off_t
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/wiredtiger/src/os_posix/os_fs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/wiredtiger/src/os_posix/os_fs.c b/src/third_party/wiredtiger/src/os_posix/os_fs.c
+index 3898eb74343..9ce2d5edb38 100644
+--- a/src/third_party/wiredtiger/src/os_posix/os_fs.c
++++ b/src/third_party/wiredtiger/src/os_posix/os_fs.c
+@@ -533,7 +533,7 @@ __posix_file_sync_nowait(WT_FILE_HANDLE *file_handle, WT_SESSION *wt_session)
+     pfh = (WT_FILE_HANDLE_POSIX *)file_handle;
+ 
+     /* See comment in __posix_sync(): sync cannot be retried or fail. */
+-    WT_SYSCALL(sync_file_range(pfh->fd, (off64_t)0, (off64_t)0, SYNC_FILE_RANGE_WRITE), ret);
++    WT_SYSCALL(sync_file_range(pfh->fd, 0, 0, SYNC_FILE_RANGE_WRITE), ret);
+     if (ret == 0)
+         return (0);
+ 
+-- 
+2.39.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index d040ab160b..6e93ec9b0c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -38,6 +38,7 @@ SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
            file://0002-Fix-default-stack-size-to-256K.patch \
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
+           file://0001-wiredtiger-Avoid-using-off64_t.patch \
            "
 
 SRC_URI:append:toolchain-clang = "\
-- 
2.39.0


