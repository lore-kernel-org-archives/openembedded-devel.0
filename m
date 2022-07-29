Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A6FC00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:20:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.1003.1659122404632770252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LKFPsnhp;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id b10so5434218pjq.5
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoloY0yje3WxGlTTEY1AQfrpydvBcFgNjp2SlrwPHTg=;
        b=LKFPsnhpG2Z8pRTrQn3z9/kxDdn3pJogyGiQcMp0Un4XTt4AtJFTIbYZccKCNfYOXg
         1m0LDHfvoUyegs61vYYsRQ1uYf0+G2R/fIYNcHeQYSOJVAIiMU/tFNQZY135nFYMI2Oa
         u44DvtElVkhQPUJty3oxXQFzc8YxCN90lpHi0oeYDtAxNIfNwlZghLu84fJ38WQGB4mR
         0zpgf77YlLTOlkNi18wV1LBiK/MVXUJeZ/hxl+9znnRgI81dKiBVn49ppMkKZxTPhRon
         T2zb04pb66OjMy2hsh5VriTQMLZc5R2xg7QDA4UiU5vrdwLgrNmajrVPy4pChA3N4NoS
         dTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GoloY0yje3WxGlTTEY1AQfrpydvBcFgNjp2SlrwPHTg=;
        b=sBtsgBFv52tMxoHl7e+atwZRE7I7W3RL9h2yE6W7Mr0QXwA7TMneM9gJ9bvCu+oxSk
         jX29py0LN1eMGiDVc61KrrRhpz+jgs9TEeOjK9TXDDKUsfCBePNWN2gTfHGVNioZp1pQ
         nenAq3J0+A87/oYaXpkt5a/RQ39dtHxgtsWmw9dJl9jcF9/D6W57LHJoslNYwasWfcXx
         tUHYppit29LHFTpe/BZK7TS1T6Z8EltrxNAMRKmlsW2t7b9H0xfvk+ATN1dko2WRWNps
         n0RLmjyyljfMktnEoKZLljKiIl13fU2rAB4IscEBduA0urymOsiqIFlpZ9ds+Z42x1/o
         6obA==
X-Gm-Message-State: ACgBeo3vqtTe5k1cHMoy8w5EYHYszfcMWNuHBMqW3ldOo/hGTVtu08+/
	V/x+hz9922wkpP7QZIYIP9WATAN+I1oCHg==
X-Google-Smtp-Source: 
 AA6agR455XtxxSuYoUK3m0Bh/NWbB4QZTxYOh7A/WYfao3Oxwr1ybeP85/bJNIvQpLDDs+rdYHQAjA==
X-Received: by 2002:a17:903:2407:b0:16d:ab14:a971 with SMTP id
 e7-20020a170903240700b0016dab14a971mr5137078plo.48.1659122403626;
        Fri, 29 Jul 2022 12:20:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8ca5])
        by smtp.gmail.com with ESMTPSA id
 h14-20020a056a00000e00b005255263a864sm3215547pfk.169.2022.07.29.12.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 12:20:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: Fix build with glibc 2.36
Date: Fri, 29 Jul 2022 12:20:01 -0700
Message-Id: <20220729192001.698699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 19:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98055

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-linux-fs.h-to-resolve-fsconfig_.patch | 74 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_250.3.bb   |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
new file mode 100644
index 0000000000..01afd37a37
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd/0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch
@@ -0,0 +1,74 @@
+From b0933e76c6f0594c10cf8a9a70b34e15b68066d1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 23 Jul 2022 10:38:49 +0000
+Subject: [PATCH] glibc: Remove #include <linux/fs.h> to resolve fsconfig_command/mount_attr conflict with glibc 2.36
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/pull/23992/commits/21c03ad5e9d8d0350e30dae92a5e15da318a1539]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build             | 13 ++++++++++++-
+ src/basic/fd-util.c     |  2 ++
+ src/core/namespace.c    |  2 ++
+ src/shared/mount-util.c |  2 ++
+ 4 files changed, 18 insertions(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -474,7 +474,6 @@ decl_headers = '''
+ #include <uchar.h>
+ #include <sys/mount.h>
+ #include <sys/stat.h>
+-#include <linux/fs.h>
+ '''
+ 
+ foreach decl : ['char16_t',
+@@ -486,6 +485,17 @@ foreach decl : ['char16_t',
+         # We get -1 if the size cannot be determined
+         have = cc.sizeof(decl, prefix : decl_headers, args : '-D_GNU_SOURCE') > 0
+ 
++        if decl == 'struct mount_attr'
++                if have
++                        want_linux_fs_h = false
++                else
++                        have = cc.sizeof(decl,
++                                         prefix : decl_headers + '#include <linux/fs.h>',
++                                         args : '-D_GNU_SOURCE') > 0
++                        want_linux_fs_h = have
++                endif
++        endif
++
+         if decl == 'struct statx'
+                 if have
+                         want_linux_stat_h = false
+@@ -501,6 +511,7 @@ foreach decl : ['char16_t',
+ endforeach
+ 
+ conf.set10('WANT_LINUX_STAT_H', want_linux_stat_h)
++conf.set10('WANT_LINUX_FS_H', want_linux_fs_h)
+ 
+ foreach ident : ['secure_getenv', '__secure_getenv']
+         conf.set10('HAVE_' + ident.to_upper(), cc.has_function(ident))
+--- a/src/core/namespace.c
++++ b/src/core/namespace.c
+@@ -6,7 +6,9 @@
+ #include <stdio.h>
+ #include <sys/mount.h>
+ #include <unistd.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "base-filesystem.h"
+--- a/src/shared/mount-util.c
++++ b/src/shared/mount-util.c
+@@ -7,7 +7,9 @@
+ #include <sys/statvfs.h>
+ #include <unistd.h>
+ #include <linux/loop.h>
++#if WANT_LINUX_FS_H
+ #include <linux/fs.h>
++#endif
+ 
+ #include "alloc-util.h"
+ #include "chase-symlinks.h"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
index d5c799aac3..af21e12ad6 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_250.3.bb
@@ -46,6 +46,7 @@ SRC_URI_MUSL = "\
                file://0001-pass-correct-parameters-to-getdents64.patch \
                file://0002-Add-sys-stat.h-for-S_IFDIR.patch \
                file://0001-Adjust-for-musl-headers.patch \
+               file://0001-glibc-Remove-include-linux-fs.h-to-resolve-fsconfig_.patch \
                "
 
 PACKAGECONFIG ??= "gshadow idn"
-- 
2.37.1


