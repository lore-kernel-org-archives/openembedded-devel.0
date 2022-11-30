Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19CE3C47088
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 07:19:22 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.5220.1669792757151178475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 23:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=quZP/vle;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id b11so14931392pjp.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 23:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKK+SgVjtlT1tBKo2WiBqRjaSdvoJQba9zQebqn/fk8=;
        b=quZP/vle0MOuIPp1PgKXKMXeEHgmHeDEICn8Ahq+WkzpsQaM1o/yctz6kALfnT5CY6
         /BEtTPZAvuJzur5unDle+1DsPQDft0CkpJ/5PBSOko/gvJk/Sk7iJCGl7jUDOnfbKpcL
         X4c+oBrbKOjcYkdtQ11SPbb7tavGtlSiLz9tuf26Uo9wzgvm+aVsV8iiNPGxB8avMDCP
         iXhCqlRsLO/emgYemcrYyAWEyQm0LIBR/6V1tCl83NyShYgfSZYK+/U2GVy5sgyvXeIT
         Wroq5Oc2nZH2iyvFvL6BoN+PMcwQskatBo0gkFXtSIIFQoiKE2YUUKGacXBM7nCYp8G0
         o5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKK+SgVjtlT1tBKo2WiBqRjaSdvoJQba9zQebqn/fk8=;
        b=A/OeW2YtfDoZT3lkLMgfb/3RFvVC57JD3+c3mJzdfU5eUZHrW81yWV1A5xvb5Dhhyg
         8kkIqwWXPcguSg7BH/sgYQW7o3ySfF3i36gi/Ay2um/r425aasGOFxJe+C+oylShAXGa
         n3KJPuEng/kxzvQLKS4kia+2r6ZAD2FjgZDCEWz6xqJA0gAMWFER4JhcuTpGVpt9rIS0
         p9Gf0aex3zqKY4RhwMDrf4yw2iR2m21+HtMNBoxn5ry9Zldsezk1KYWHQ9qMvT+qFeRZ
         m8eqwsdKQ+3b/xLPzYWSN1HKt35TeN+UAIYFsPZrEW3KRU7EGfC2jcKOlqp49yqmba2Y
         ekNw==
X-Gm-Message-State: ANoB5pkbu8tIVn1eRrdfhCrAOI+UIGtAvXQ4sHfkA1RuEIZ9Y7xW3qoL
	Wvq2tzO64YXgWa7wgwVdvlLKA/f1L3Q=
X-Google-Smtp-Source: AA0mqf5WFdIqIC9Kn8ZeBe66/dZWi9dqIhdEFHSAngQJNgdyjzudt580x8XYX0xHaM0RCr/3JvntEA==
X-Received: by 2002:a17:902:d711:b0:17f:52af:d035 with SMTP id w17-20020a170902d71100b0017f52afd035mr42616232ply.106.1669792756162;
        Tue, 29 Nov 2022 23:19:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id im15-20020a170902bb0f00b00189812a5397sm577447plb.180.2022.11.29.23.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 23:19:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystem][PATCH 01/10] aufs-util: Fix build with large file support enabled systems
Date: Tue, 29 Nov 2022 23:19:04 -0800
Message-Id: <20221130071913.1805812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 07:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99858

Fixes

| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/aufs-util/4.9+gitAUTOINC+8f35db59ef-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-gnueabi/arm-yoe-linux-gnueabi-ld: rdu64.o: in function `readdir64':
| <unknown>:122: multiple definition of `readdir64'; rdu.o:<unknown>:122: first defined here
| /mnt/b/yoe/master/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/aufs-util/4.9+gitAUTOINC+8f35db59ef-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-gnueabi/arm-yoe-linux-gnueabi-ld: rdu64.o: in function `readdir64_r':
| <unknown>:139: multiple definition of `readdir64_r'; rdu.o:<unknown>:139: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.38.1


