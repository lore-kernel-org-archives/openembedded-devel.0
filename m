Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C30DC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 17:58:00 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2239.1711389476056353441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 10:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dqSYnrAI;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso2266829a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389475; x=1711994275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26Fr1x8YIgizuIWuGTeY+6fPX5XoKAE23gDykBhHORk=;
        b=dqSYnrAIre4tmHq0t7NpxGjMUxnL3trDiJcC/nqUjlbVptJF/2SSgYLeoIl+JHjjSt
         tOy9RVblOzSaSlrBg66xpCWZInQll4RgmQfS8EhbXMtXuXQpvwkcd6L8gXaevd3rV1Xh
         hs0eqyx/Oq4E8rxsx0vIOCTABS8Ko+avuUZCvQToPWrA3M8SIeqGg7OMmMXJyfTSzD8C
         7mW8SWF348a1aEs/jY+PqoSTLOmJS86SASHGEuS9+ESqQBM4jd/LDJZz70hE4QLSXuA9
         Qjr+jDOzYUOVg7QG7Ix3n2eFqcOddue1+9AUY2jW4/h6/ehAagxswC8wCaQsAl3dbDGR
         RT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389475; x=1711994275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26Fr1x8YIgizuIWuGTeY+6fPX5XoKAE23gDykBhHORk=;
        b=ec0b8Qt6uGng9Dpn4iO0dutu2tFS8zouoqW3iaNOscqnIuk2tEs/9G4A7M76aVEa0X
         ZeungZUMDXN7IPZQ3BtQ0mB2iTghEBLz/XUESh8KNmDcWu0/3WOXk+IW3fmiKp70xaUI
         O+le6OYA5OtTbxksx1v6k/Yw78nWT9TPX0WaFflY6w6Cm2Cv2+Mlwo01d29EPuFgKQYU
         GBvG8kXBSlDzttYOpZWR6oG5KBo3eyMRgob/USyzH78dx+vRB2ZfQTVgbCuJATQSLGQe
         H3GHJeJeHUWIXyjfjA1KRYQyy5dyAfE3PXDkdHd2D0jZ+u8ZF+BSo0fQtDnV+udgGUfo
         JxqQ==
X-Gm-Message-State: AOJu0YxIjVMs+edsoaSoNogXSgLcOjGKTz++eUZsG09hr3ERPINZJ5+r
	ZMWB4qWZfB9zVP0wHgpWEKLt0LZm9qgbj3K1PaHVj5Me/Z1TnER1tXyelRtF
X-Google-Smtp-Source: AGHT+IEjoI293MwCgaS0GAmY+VW9psYz2W3b5CnLc/ayjGBNvES82MTz/eD/Wy1grtw1IZ2zsnSKoA==
X-Received: by 2002:a17:90a:6847:b0:29d:e70f:7240 with SMTP id e7-20020a17090a684700b0029de70f7240mr5384385pjm.11.1711389474851;
        Mon, 25 Mar 2024 10:57:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id p10-20020a17090a930a00b0029c61521eb5sm10295228pjo.43.2024.03.25.10.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:57:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 1/2] xfsdump: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 10:57:52 -0700
Message-ID: <20240325175753.3507115-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 17:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109596

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-libgen.h-for-basename-API-prototype.patch | 45 +++++++++++++++++++
 .../recipes-utils/xfsdump/xfsdump_3.1.12.bb   |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xfsdump/files/0001-include-libgen.h-for-basename-API-prototype.patch

diff --git a/meta-filesystems/recipes-utils/xfsdump/files/0001-include-libgen.h-for-basename-API-prototype.patch b/meta-filesystems/recipes-utils/xfsdump/files/0001-include-libgen.h-for-basename-API-prototype.patch
new file mode 100644
index 0000000000..a44d3b7f39
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfsdump/files/0001-include-libgen.h-for-basename-API-prototype.patch
@@ -0,0 +1,45 @@
+From 45a532ad73b1ba27fc951657a33f39e8fa915765 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 10:02:20 -0700
+Subject: [PATCH] include libgen.h for basename API prototype
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-xfs/20240325170941.3279129-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/main.c    | 1 +
+ invutil/invidx.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/common/main.c b/common/main.c
+index 1db07d4..ca3b7d4 100644
+--- a/common/main.c
++++ b/common/main.c
+@@ -16,6 +16,7 @@
+  * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  */
+ 
++#include <libgen.h>
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+diff --git a/invutil/invidx.c b/invutil/invidx.c
+index 5874e8d..c4e2e21 100644
+--- a/invutil/invidx.c
++++ b/invutil/invidx.c
+@@ -19,6 +19,7 @@
+ #include <xfs/xfs.h>
+ #include <xfs/jdm.h>
+ 
++#include <libgen.h>
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+-- 
+2.44.0
+
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
index 9e595b9521..9c0394918e 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.12.bb
@@ -12,6 +12,7 @@ DEPENDS = "xfsprogs attr"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsdump/${BP}.tar.xz \
            file://remove-install-as-user.patch \
+           file://0001-include-libgen.h-for-basename-API-prototype.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-xfsdump-support-usrmerge.patch','',d)} \
            "
 SRC_URI[sha256sum] = "f39c4c1b306b2dd7ec979c0e94d60fe69083d2ecf9af051cac5ef3bed772c74a"
-- 
2.44.0


