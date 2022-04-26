Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00DAC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 17:25:15 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.215.1650993910882574459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 10:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R7RnO9Xm;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 n33-20020a17090a5aa400b001d28f5ee3f9so3123150pji.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bb3oXvINQx90sbLDoq5jRMv9hXUt9A/FddEKxj0Qd0=;
        b=R7RnO9Xm/1ccIyoA9PCBfjY85G0h4He/EQ0BTzu0LfkKZMduWIszOOQsVjsorQL1Pz
         OYGFqzb8bCM7BYq5mx7AH0InhQCziZhB4n3cD/uoe1tVwYUc4S48XB2EIbpY/1uln9gz
         vlxSpRFfhNZWT741zmehyXdmRSXxYUcGH1LhnMc9c6+uK/tNDA0KT47bdk4xwhfRkD4Z
         QnrIMX4SNfUfPTWfzyuWc7higV2zTqnnrSxYwZwYXDj5u5yIpCUwRZhyxd/zJFmCAZj8
         INTCUGRzbdaDoH7T5IInumtrJiBLNXFhTx+/CY1W66rQ04bqABKeyVMIuzYlFZgKzpqf
         ulyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+bb3oXvINQx90sbLDoq5jRMv9hXUt9A/FddEKxj0Qd0=;
        b=tCXjTOPthT/l0H1+ZLk6GHjm6unWwv8iSseGx4gyg8F+9SVFIwe8h0pHWAzvhW9u/f
         ht0smZKfh6a3X7jhgvhDrBpGIxbWafcVeNnywaSkflwD1kyC1Bg/YHBqlZzH1ybnlXXv
         ZvPiK6lICIEkgwYoBN5h29on3BlDUwDLa1JFqCEFUjU00TNbJ21gaffM9wq8gozwTFlm
         mUohJKaRvy4LaGkfeykXC4cjILUmwn44zgqiez/lxNcSPWrizEl2bVBqDxThBZ2U6wmJ
         J2rABGo7Mhv1FE7uPTLyDXF8kDjl5gYSuQZmwOnLB1pqvLmJiwexpFthU4LpdSCikq5Z
         cUSA==
X-Gm-Message-State: AOAM533K4vQOdbGCJeCp+P0U7FpSuj/dheqXBKZ5UiSVKfu6zceB+jU6
	aWumQ3tErR3e67timWBEsbBF7gyNyAGNzw==
X-Google-Smtp-Source: 
 ABdhPJw34vVcbCKkUnx2pLFAT6XuQam3x6BCGNowb7bYPmFlFELVMIGHSA0wXjGHh0N6XEZkEzYUzw==
X-Received: by 2002:a17:902:b692:b0:14c:935b:2b03 with SMTP id
 c18-20020a170902b69200b0014c935b2b03mr24508941pls.81.1650993909295;
        Tue, 26 Apr 2022 10:25:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 r13-20020a635d0d000000b003aa482388dbsm13502737pgb.9.2022.04.26.10.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 10:25:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [meta-oe][PATCH] lockdev: Drop cumulative debian patch
Date: Tue, 26 Apr 2022 10:25:06 -0700
Message-Id: <20220426172506.311426-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 17:25:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96807

This patch is essentially defines MAXPATHLEN which no longer is problem
with latest glibc or musl

define MAJOR/MINOR for non-glibc case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...efine-MAJOR-MINOR-for-non-glibc-case.patch | 28 +++++++++++++++++++
 .../recipes-support/lockdev/lockdev_1.0.3.bb  | 12 ++++----
 2 files changed, 33 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev/0001-lockdev-Define-MAJOR-MINOR-for-non-glibc-case.patch

diff --git a/meta-oe/recipes-support/lockdev/lockdev/0001-lockdev-Define-MAJOR-MINOR-for-non-glibc-case.patch b/meta-oe/recipes-support/lockdev/lockdev/0001-lockdev-Define-MAJOR-MINOR-for-non-glibc-case.patch
new file mode 100644
index 0000000000..abcf1bc20f
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev/0001-lockdev-Define-MAJOR-MINOR-for-non-glibc-case.patch
@@ -0,0 +1,28 @@
+From 11c78232aa589d5ed43eea3683e6e3de0362ffdc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Apr 2022 10:00:32 -0700
+Subject: [PATCH] lockdev: Define MAJOR/MINOR for non-glibc case
+
+gnu_dev_major and gnu_dev_minor are glibc extensions but we do have
+major/minor macros on musl too, so use them to define MINOR/MAJOR here
+
+Upstream-Status: Inappropriate [No active upstream]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lockdev.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/src/lockdev.c
++++ b/src/lockdev.c
+@@ -125,8 +125,8 @@
+ #include <sys/file.h>
+ #if defined (__GNU_LIBRARY__)
+ # include <sys/sysmacros.h>
+-# define MAJOR(dev) gnu_dev_major (dev)
+-# define MINOR(dev) gnu_dev_minor (dev)
++# define MAJOR(dev) major (dev)
++# define MINOR(dev) minor (dev)
+ #else
+ #  error "put here a define for MAJOR and MINOR"
+ #endif
diff --git a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
index d84041ce63..a52ca25da4 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
@@ -5,22 +5,20 @@ LIC_FILES_CHKSUM="file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 PE = "1"
 SRC_URI = "http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_${PV}.orig.tar.gz \
-           http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_${PV}-1.6.diff.gz;name=debianpatch \
            file://cross_compile.patch \
            file://build.patch \
+           file://0001-lockdev-Define-MAJOR-MINOR-for-non-glibc-case.patch \
            "
-SRC_URI[md5sum] = "64b9c1b87b125fc348e892e24625524a"
 SRC_URI[sha256sum] = "ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82"
-SRC_URI[debianpatch.md5sum] = "5ef6267c42fca9145e0af006ccb6aff7"
-SRC_URI[debianpatch.sha256sum] = "a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e"
 
 inherit lib_package perlnative
 
-CFLAGS += " -D__GNU_LIBRARY__"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-EXTRA_OEMAKE = "basedir=${D}${prefix} baselib=${baselib} LD='${CC}' LD='${CC}'"
+CFLAGS:append:libc-musl = " -D__GNU_LIBRARY__"
+
+EXTRA_OEMAKE = "basedir=${D}${prefix} baselib=${baselib} LD='${CC}'"
+
 do_compile() {
         oe_runmake shared static
 }
-- 
2.36.0


