Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861DDC61DA0
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:46 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.44858.1674653502215918132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F/Brga1Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id x15-20020a4ab90f000000b004e64a0a967fso3145705ooo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYylRMTDTH0U53TXHHiLy/2ksDT9UdvRXlNOxLzYBIo=;
        b=F/Brga1Z+GdjMEWicjwQOaabVmzQtlrG/5g2zLnVu0zbR+djz/vRqGqZuDG7dmMO6z
         wBfmqfb/4haheFyKReTgucwJU/n78PwrOjzDxgIfZmqsJV1xdUCywCwn/qloN7T9cX6i
         PZOWk81kHzL8giBZG9LrMWEvjddeM2uMs2X/4Y2Usjc2x07HIl+cePKl/SkfX4vmX+4E
         SVf4yA3G0lGc9A9iPeH9zUOpRg7cc5TzXFc6VCN18I9o+KJTOlYEFdev4zFtGDqDa5oQ
         qgeqTufGGNlT9HB0XzqsdnY8j6Gwd6xVwnB4EmzseeglARzdIls/5cwgGF+0Dm0h/B8q
         RNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYylRMTDTH0U53TXHHiLy/2ksDT9UdvRXlNOxLzYBIo=;
        b=3L7HXhTVMke5wGVXwHmPZ3YpgzIQIxad4OtAm65dsHemD5SwykPLBTkJ5Fs/VlcCtX
         QJ9kROA/+Buyj/pg3HCsJ+326iu/zplTPEWQ2inrc9LdR5T0BqlbTybrHEVmf+amX1ad
         aDFzzug8EGbhIlp6G/jN+V2wnMgC6OEYUFUYy10Xhljm7m2CvT3uJplYjVdoBdIrornT
         dn/grYy1EQ8zNy5CZyVaLhHInAA5EivMMXnmyI+DDNX3SHZS6F8JqwVmZ4RUq8d32WJe
         pleTd7E3SsJe8+/A9/Mghz1Mkpx5R83neUTjesPRcvqJl0YpYFaGxJSVSmfFzdFaxWvj
         0jRQ==
X-Gm-Message-State: AFqh2kqzMx+5UB/xmv8UD80tMU9RRdPwLiTlfhwooLmrKBt7nbW5DWhD
	D8u3Zf9sLnoimq28UO4vFqi1GzwWvK0=
X-Google-Smtp-Source: AMrXdXvczzbB1B3hQoBV+4qnTP4UQ0Q2+D+sMAe9iiOePiXSLQDlw0ka4EglVzmPNqpi4eGXM/99/g==
X-Received: by 2002:a4a:a509:0:b0:4f2:2208:46a2 with SMTP id v9-20020a4aa509000000b004f2220846a2mr15397585ook.8.1674653501303;
        Wed, 25 Jan 2023 05:31:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 15/41] aufs-util: Fix build with large file support enabled systems
Date: Wed, 25 Jan 2023 08:30:57 -0500
Message-Id: <dfab7834b6d2bcfe7f6fafcc2b69273a5b0ad5c5.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100750

From: Khem Raj <raj.khem@gmail.com>

Fixes

| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/aufs-util/4.9+gitAUTOINC+8f35db59ef-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-gnueabi/arm-yoe-linux-gnueabi-ld: rdu64.o: in function `readdir64':
| <unknown>:122: multiple definition of `readdir64'; rdu.o:<unknown>:122: first defined here
| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/aufs-util/4.9+gitAUTOINC+8f35db59ef-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-gnueabi/arm-yoe-linux-gnueabi-ld: rdu64.o: in function `readdir64_r':
| <unknown>:139: multiple definition of `readdir64_r'; rdu.o:<unknown>:139: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8e7f93867671a23f2b6d4a7559ea024a0dfc784)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Do-not-build-LFS-version-of-readdir.patch | 32 +++++++++++++++++++
 .../recipes-utils/aufs-util/aufs-util_git.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
new file mode 100644
index 0000000000..c983733dcb
--- /dev/null
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util/0001-libau-Do-not-build-LFS-version-of-readdir.patch
@@ -0,0 +1,32 @@
+From 12ba95281d0bbea3576350d635b4dee0f953b94a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Nov 2022 18:38:07 -0800
+Subject: [PATCH] libau: Do not build LFS version of readdir
+
+rdu64 is providing largefile supported version of readdir and readdir_r
+however, we enable largefile support unconditionally in OE therefore its
+not needed since readdir() and readdir_r() are already LFS capable
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libau/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libau/Makefile b/libau/Makefile
+index 9ada831..1fd1ccc 100644
+--- a/libau/Makefile
++++ b/libau/Makefile
+@@ -30,7 +30,7 @@ STRIP ?= strip
+ all: ${LibSo}
+ 
+ ifeq (${Glibc},yes)
+-LibSoObj += rdu64.o
++#LibSoObj += rdu64.o
+ 
+ # this is unnecessary on 64bit system?
+ rdu64.c: rdu.c
+-- 
+2.38.1
+
diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index f565be3f7e..fbf7753b02 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs4.9 \
            https://raw.githubusercontent.com/sfjro/aufs4-linux/aufs4.9/include/uapi/linux/aufs_type.h;name=aufs_type \
            file://aufs-util-don-t-strip-executables.patch \
            file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \
+           file://0001-libau-Do-not-build-LFS-version-of-readdir.patch \
 "
 SRC_URI[aufs_type.md5sum] = "b37129ef0703de72a852db7e48bdedc6"
 SRC_URI[aufs_type.sha256sum] = "7ff6566adb9c7a3b6862cdc85a690ab546f1d0bc81ddd595fd663c0a69031683"
-- 
2.25.1


