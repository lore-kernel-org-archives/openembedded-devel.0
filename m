Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D738C54EBD
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.46810.1673191288505181490
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BITQTFIB;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id r11so5152167oie.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYylRMTDTH0U53TXHHiLy/2ksDT9UdvRXlNOxLzYBIo=;
        b=BITQTFIBHO+dOGl4nAxEmhKI4JWoV0/AAtpr0uQz8B11FZ5SIIv0ns5ZtEC31vIKr+
         biraxKwcoop8/tEHk6d2bS0ScornTfvduZQ9edKILxDL8epy0nbfVz60k3dyiPYQxkvP
         TVzyiO938DyZEDyO/Uf/XP7lM3hwn3Hc9aC6lPnXOD2Zx1+Rb1xCNIxYBzQxDCDAGmtc
         RUpFbUpzIvDWxcHrAY+SvQcrBq8Mn0KHJh96LbZCXhccPfVdO1b+E14rUYSVTGIU1C7i
         TYLl6Zs1/6A+7o/4r5BeeMds+0N449ONjfDeHIjNHzWY1vXax0EQ3BDCRwkjdbYx2uqv
         ewMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYylRMTDTH0U53TXHHiLy/2ksDT9UdvRXlNOxLzYBIo=;
        b=Ap4ifwokE3z3cv5GTVTOALz0qjI9C9udHhs2ZCGgiN5MACnX3DGFXnaIquz4cCwfEy
         ClkqZXKJKC1Iyju/7K9XIPyWJxmtsxoblJMBio9t4+J8gspAGrrA3ylA2ZarbP/++uXv
         aNbTawaY2kvy4XPOPoHha/LNGeE48I3CXW88wVRWFQQPSS3w5PegNnSZIfOvB7GW+61s
         /AiRYJJ4mFcTJoemZ/0Z6YpH4jgy29cKKFoai0P2OYaRbjRA900OhuGUeC2lslNw17k8
         A6T9ckvW2JvVPuz/cofwg2ChTRFfJK0+J0YTIjdUSm2cth4edmOIIOqbiq3LH/p2A2Lr
         73Kg==
X-Gm-Message-State: AFqh2kr+E0rtKC5PGDb2fUCy124Ijn+Xp1WDA+VGidhwzdkKwq4D60o7
	Ij2jQ9WJrWFTRuqj+2Qj+ImcQfIsZn4=
X-Google-Smtp-Source: AMrXdXvmBTJK8nWnIPDuqVJwLVhq991oUzb3/48LLOUO1GR9G3AiQGRDsnTFoEhpD4CI0YDpXqd9YQ==
X-Received: by 2002:a05:6808:18a5:b0:35b:e81d:285b with SMTP id bi37-20020a05680818a500b0035be81d285bmr32499319oib.28.1673191287714;
        Sun, 08 Jan 2023 07:21:27 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 15/26] aufs-util: Fix build with large file support enabled systems
Date: Sun,  8 Jan 2023 10:20:50 -0500
Message-Id: <dfab7834b6d2bcfe7f6fafcc2b69273a5b0ad5c5.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100460

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


