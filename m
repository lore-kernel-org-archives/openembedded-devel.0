Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA8CC6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:34:24 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.11309.1662276863941981702
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l650vDDf;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q63so5583778pga.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IltXKOHH855k0Ij3vp7x5gCrEFA4zfInPUY9+i9p6hw=;
        b=l650vDDf67PRfhiRtc78CCiS+RCnYs8G/Gh62Nvc6g/Qu+ngMhbstrsUnxSuTQKvQi
         8mc/XMrtlLlVsHkVxecRutISY3spkJL1Turt0BrheTwRm47bzJjPU8zRGgXjTlY0zrwh
         ThSwIrYcB8Z60jtrXSzqX2tMt+K3hEsXGE0yUkQCtpF/ruMFT3Z6L5cj6uB0PwVysHxB
         R7Wx9GncQUsk7SDIdKBvKKLgw46AsvPHhax06pO1WeCXjde2ZLqW5LkwMk/Mz6dNsAyV
         udzd2oiZ0aUEkNksGJDRSP6FmeCt1Wjy8320B4MNodaSVX2wZq7djcTSRSgvScjBZFDd
         0qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IltXKOHH855k0Ij3vp7x5gCrEFA4zfInPUY9+i9p6hw=;
        b=xOwCXECN8NDg5cZKeBd+TYhSgtyGasR3VIi1Wh34m6jjOOY77r9U3q4Q8HGBtK31XG
         f9jBzX00VMr8uTziVpwXiKOsuvTjMzzjI8Ol7sqOD6sM/RpZ8yQ2XLF5DU1bwhh/1598
         60u9KquLRgfBTnt+/ivxJK2LWqIOPl4BWl1zieEDUZEsRkEY/IPdSVwlWhHLsqKqyXHZ
         uDVvhd2/75sFELqS+opcgyy+ZuNyIhOw9pMkEwOpKAz942+fnShX9WTeJoEyAXrA/Kkv
         xT0i7e5FlkNh9WPU5mwuoDIioLJNudojZzudPqckbJn0HyvRulX3JpML04vd2pmIF4g9
         WteQ==
X-Gm-Message-State: ACgBeo3nhSh8IIW2PzLjgSsNn0ABY+oWIvcBro+yUCMHWNJSUK2q2VWt
	MjbowlCRgcW7+aFJ+rrbTi0FlooVzBXQew==
X-Google-Smtp-Source: 
 AA6agR48jxn4EKJTyLfRlPw6iEgg5nMj8FZ2B//GVkc89nZjYAhSqRKfYUaNwZ5zawxEZS6+yXbCJg==
X-Received: by 2002:a05:6a00:1307:b0:53a:9663:1bd6 with SMTP id
 j7-20020a056a00130700b0053a96631bd6mr23240467pfu.55.1662276862865;
        Sun, 04 Sep 2022 00:34:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/63] libuio: Update to latest tip of trunk
Date: Sun,  4 Sep 2022 00:33:16 -0700
Message-Id: <20220904073417.3251865-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98596

Drop upstreamed 0001-include-fcntl.h-for-O_RDWR-define.patch
Drop replace_inline_with_static-inline.patch, it has been fixed
differently

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-include-fcntl.h-for-O_RDWR-define.patch |  38 ------
 .../replace_inline_with_static-inline.patch   | 121 ------------------
 .../recipes-extended/libuio/libuio_0.2.1.bb   |  11 +-
 3 files changed, 4 insertions(+), 166 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libuio/libuio/0001-include-fcntl.h-for-O_RDWR-define.patch
 delete mode 100644 meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch

diff --git a/meta-oe/recipes-extended/libuio/libuio/0001-include-fcntl.h-for-O_RDWR-define.patch b/meta-oe/recipes-extended/libuio/libuio/0001-include-fcntl.h-for-O_RDWR-define.patch
deleted file mode 100644
index 3cae5c9928..0000000000
--- a/meta-oe/recipes-extended/libuio/libuio/0001-include-fcntl.h-for-O_RDWR-define.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d39c78d322585a32f9a55c67c25a99602ce08b12 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Apr 2017 09:01:33 -0700
-Subject: [PATCH] include fcntl.h for O_RDWR define
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/lsuio.c | 1 +
- tools/rwuio.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/tools/lsuio.c b/tools/lsuio.c
-index 58eb922..4769446 100644
---- a/tools/lsuio.c
-+++ b/tools/lsuio.c
-@@ -19,6 +19,7 @@
- #include <stdio.h>
- #include <sys/types.h>
- #include <getopt.h>
-+#include <fcntl.h>
- 
- #include "system.h"
- #include "uio_helper.h"
-diff --git a/tools/rwuio.c b/tools/rwuio.c
-index aef9e90..ebc71e1 100644
---- a/tools/rwuio.c
-+++ b/tools/rwuio.c
-@@ -20,6 +20,7 @@
- */
- #include <stdio.h>
- #include <stdlib.h>
-+#include <fcntl.h>
- #include <sys/types.h>
- #include <getopt.h>
- 
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch b/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
deleted file mode 100644
index fd314bfee5..0000000000
--- a/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-By default, gcc-5 uses C99 inline semantics, this semantics doesn't 
-generate externally visible function for inline functions. This results in 
-below error, when an another translation unit (TU) tries to link with the 
-inline function,
-
--- snip --
-| lsuio.o: In function `main':
-| <...>/libuio/0.2.1-r0/git/tools/lsuio.c:85: undefined reference to `uio_mmap'
-| collect2: error: ld returned 1 exit status
-| make[2]: *** [lsuio] Error 1
--- CUT --
-
-To solve this error and make libuio to compile with both 4.x and 5.x,
-
-1. We can remove 'uio_mmap' inline function definition in uio_mmap.c, and move
-   that definition into uio_helper.h file (which is included by lsuio.c) and 
-   replace inline with "static inline". Similarly it can be done to other 
-   uio_single_munmap and uio_munmap inline functions
-
-2. Add 'extern' keyword in front of inline functions declaration, to make 
-   inlined function as externally visible function, and to link with other TUs.
-
-Going with option 1.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
-
---- git_org/src/uio_helper.h	2015-10-20 02:37:04.183075855 -0400
-+++ git/src/uio_helper.h	2015-10-20 03:34:24.659970136 -0400
-@@ -61,11 +61,11 @@ struct uio_info_t {
- 
- /* function prototypes */
- 
--inline char* uio_lib_name(void);
--inline char* uio_lib_version(void);
--inline int uio_lib_ifcurrent(void);
--inline int uio_lib_ifrevision(void);
--inline int uio_lib_ifage(void);
-+static inline char* uio_lib_name(void);
-+static inline char* uio_lib_version(void);
-+static inline int uio_lib_ifcurrent(void);
-+static inline int uio_lib_ifrevision(void);
-+static inline int uio_lib_ifage(void);
- 
- int uio_get_mem_size(struct uio_info_t* info, int map_num);
- int uio_get_mem_addr(struct uio_info_t* info, int map_num);
-@@ -76,10 +76,30 @@ int uio_get_all_info(struct uio_info_t* 
- int uio_get_device_attributes(struct uio_info_t* info);
- 
- void* uio_single_mmap(struct uio_info_t* info, int map_num, int fd);
--inline void uio_mmap(struct uio_info_t* info, int fd);
- 
--inline void uio_single_munmap(struct uio_info_t* info, int map_num);
--inline void uio_munmap(struct uio_info_t* info);
-+static inline void uio_mmap(struct uio_info_t* info, int fd);
-+static inline void uio_mmap(struct uio_info_t* info, int fd)
-+{
-+        int map_num;
-+        if (!fd) return;
-+        for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
-+                uio_single_mmap(info, map_num, fd);
-+}
-+
-+static inline void uio_single_munmap(struct uio_info_t* info, int map_num);
-+static inline void uio_single_munmap(struct uio_info_t* info, int map_num)
-+{
-+        munmap(info->maps[map_num].internal_addr, info->maps[map_num].size);
-+        info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
-+}
-+
-+static inline void uio_munmap(struct uio_info_t* info);
-+static inline void uio_munmap(struct uio_info_t* info)
-+{
-+        int i;
-+        for (i = 0; i < MAX_UIO_MAPS; i++)
-+                uio_single_munmap(info, i);
-+}
- 
- void uio_free_dev_attrs(struct uio_info_t* info);
- void uio_free_info(struct uio_info_t* info);
---- git_org/src/uio_mmap.c	2015-10-20 02:37:04.183075855 -0400
-+++ git/src/uio_mmap.c	2015-10-20 03:34:45.060003208 -0400
-@@ -22,11 +22,3 @@
- #include <stdlib.h>
- 
- #include "uio_helper.h"
--
--inline void uio_mmap(struct uio_info_t* info, int fd)
--{
--	int map_num;
--	if (!fd) return;
--	for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
--		uio_single_mmap(info, map_num, fd);
--}
---- git_org/src/uio_munmap.c	2015-10-20 02:37:04.183075855 -0400
-+++ git/src/uio_munmap.c	2015-10-20 03:34:59.636026835 -0400
-@@ -22,10 +22,3 @@
- #include <stdlib.h>
- 
- #include "uio_helper.h"
--
--inline void uio_munmap(struct uio_info_t* info)
--{
--	int i;
--	for (i = 0; i < MAX_UIO_MAPS; i++)
--		uio_single_munmap(info, i);
--}
-\ No newline at end of file
---- git_org/src/uio_single_munmap.c	2015-10-20 02:37:04.183075855 -0400
-+++ git/src/uio_single_munmap.c	2015-10-20 03:52:55.005763023 -0400
-@@ -24,9 +24,3 @@
- #include <sys/mman.h>
- 
- #include "uio_helper.h"
--
--inline void uio_single_munmap(struct uio_info_t* info, int map_num)
--{
--	munmap(info->maps[map_num].internal_addr, info->maps[map_num].size);
--	info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
--}
diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
index e22b25a168..65bf9ba647 100644
--- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
+++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
@@ -3,16 +3,13 @@ SECTION = "base"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "git://git.code.sf.net/p/libuio/code;branch=master \
-           file://replace_inline_with_static-inline.patch \
-           file://0001-include-fcntl.h-for-O_RDWR-define.patch \
-           "
+SRCREV = "17d96e8f9a5bce7cee5e2222855ab46a246dba51"
 
-inherit autotools
+SRC_URI = "git://git.code.sf.net/p/libuio/code;branch=master;protocol=https"
 
-SRCREV = "ed4f07ea147ac403c28105ab44d01bbf524d36f9"
+PV .= "+0.2.2+git${SRCPV}"
 
-PV .= "+git${SRCPV}"
+inherit autotools
 
 S = "${WORKDIR}/git"
 
-- 
2.37.3


