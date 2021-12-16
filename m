Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0091C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 23:25:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.1907.1639697101342655496
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=br+HHEQv;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id k26so640502pfp.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9X5al5FbocUBabKmeS0GpuiXqzo5LbBtcqvisP2cP8=;
        b=br+HHEQvltYSM4MxBHQPD1zDkPHqXVVkGizrpZ1yQfvi7qlQulXQmtDPgrlgoECpKi
         PTvZK+1RehcsNAYuIJes+7KXr8jLqhgS7/gQyyNB0tXrLvJvh9FEo12+UFrLdhhhC08B
         TBQiZo4TKuZ4S2yhLjReQ4A8xfGCIqRx0dRc6GVvUIS5vX5PMV3G6MW1CJq4Yc5kMafw
         J9kHAtcC+44O4VAX4YrXmXmOipiTqBx960PPQJfVqPHZV2/5o4n74THm1NoDMrFMqVGa
         Rw/PR7dxJlE33PSsU/pO7Jz5X/xLaAEL1Op131k3j5EdVgVksWFNHfXNVQmkDaspAfW4
         GpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9X5al5FbocUBabKmeS0GpuiXqzo5LbBtcqvisP2cP8=;
        b=lTC94Ad2GDmoIYzh3gNtINie/YSaaKR6dlTY2QJAKSkmrIGZ90R3wEtadFqfvq7xqh
         o38e0UcbUh8XKiKe/FDztL4vP+2IJ8CPTYsGy75vvqIzTYER2PjntDJRSvYY6D4/B8QN
         dKkb6TX9Ymrscv+9U8SRh0dx5UebN5AqhiGKZIQaNbpdDDjCoQTjqG4koFxq+UXgSE8e
         2d+fTENWFnsFL/Iv1UzGviTDtx15XsmDXNQgKK9xO+QEkBdcpmccjE+MzKprSfIqGJPe
         vwJ6NscOv81iKr/utpWouQkCJulDOBmvvROxnBmgl1cEjs0ANJqI6uNFumMKUErNE/Ld
         eM8g==
X-Gm-Message-State: AOAM531pppjNDFydBf9qYfzQ4cP66/3X68kaTKGVT0QHR4lMiq3bRhGA
	MIe8DBzLXOCGR07Haviq8P8hCak/76I=
X-Google-Smtp-Source: 
 ABdhPJx9ZE685u9giWRpvpYhPU/om/NnefXXWlXArGmpkOXye1mgWoYSWk6BpAc2JVjKc/TYA9dLeQ==
X-Received: by 2002:a05:6a00:248b:b0:49f:9d7f:84e2 with SMTP id
 c11-20020a056a00248b00b0049f9d7f84e2mr135173pfv.40.1639697100419;
        Thu, 16 Dec 2021 15:25:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 oj11sm9959595pjb.46.2021.12.16.15.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 15:24:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] [meta-oe]inotify-tools: Fix build on musl
Date: Thu, 16 Dec 2021 15:24:56 -0800
Message-Id: <20211216232457.1080201-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 23:25:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94412

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fytools-Include-limit.h-for-PATH_MAX.patch | 29 ++++++++++++++
 ...Bridge-differences-between-musl-glib.patch | 40 +++++++++++++++++++
 .../inotify-tools/inotify-tools_3.21.9.6.bb   |  5 ++-
 3 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
 create mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
new file mode 100644
index 0000000000..f30a62d594
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
@@ -0,0 +1,29 @@
+From 1e37cc3aa674c4b052f0655fef59a910fd7325cb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Dec 2021 14:53:25 -0800
+Subject: [PATCH 1/2] libinotifytools: Include limit.h for PATH_MAX
+
+musl builds fail since the required header which defines PATH_MAX is
+missing, its perhaps included indirectly via glibc based systems
+
+Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/153]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libinotifytools/src/inotifytools.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
+index 8bdfdb6..902eac2 100644
+--- a/libinotifytools/src/inotifytools.c
++++ b/libinotifytools/src/inotifytools.c
+@@ -17,6 +17,7 @@
+ #include "inotifytools_p.h"
+ #include "stats.h"
+ 
++#include <limits.h>
+ #include <string.h>
+ #include <strings.h>
+ #include <stdlib.h>
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch
new file mode 100644
index 0000000000..931244830c
--- /dev/null
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools/0002-libinotifytools-Bridge-differences-between-musl-glib.patch
@@ -0,0 +1,40 @@
+From 6c3ce01a281a9aa661494d24a862219fc9e2b460 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Dec 2021 14:57:55 -0800
+Subject: [PATCH 2/2] libinotifytools: Bridge differences between
+ musl/glibc/kernel fnotify.h
+
+System detects to use sys/fnotify.h and then assumes glibc's definitions
+but musl has definitions of its own. perhaps portable thing would be to
+use linux/fnotify.h interface directly on linux irrespective of libc
+
+See the differences discussion here [1]
+
+[1] https://inbox.vuxu.org/musl/20191112220151.GC27331@x230/T/#ma8700992467200c8792e0fa8508eae656b81aeba
+
+Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/154]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libinotifytools/src/inotifytools.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
+index 902eac2..2b96395 100644
+--- a/libinotifytools/src/inotifytools.c
++++ b/libinotifytools/src/inotifytools.c
+@@ -55,6 +55,12 @@ struct fanotify_event_fid {
+ 	struct fanotify_event_info_fid info;
+ 	struct file_handle handle;
+ };
++
++#ifndef __GLIBC__
++#define val __val
++#define __kernel_fsid_t fsid_t
++#endif
++
+ #endif
+ 
+ /**
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
index e3a4e6350e..89c3a00b71 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
 SRCREV = "8f8fcdffb7e80928bea6c1fccd3527a9f5d8fe77"
 
-SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https"
+SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
+           file://0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch \
+           file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


