Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E2CCD184
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 07:43:08 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.10397.1760686982915588620
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 00:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QqK7X90t;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so150264a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760686982; x=1761291782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdYosj18JxsdOF4tX6FsTGxogFUVKkATj7II134gg94=;
        b=QqK7X90t+aw9c53GRW3/MrmTiz33a1Um66MjwSQQiVvlrwnv0KBT40qlPcUfqbZOL6
         Ba7LlMB2EaXeHUjPD35TugoRPsqrcTloiC5ObgG2nQ941qINOvfYc3Ly0xLOGinSed3y
         dua0BUIy/0gafmUVgEZuvcJfNb0JFO5Cbqzc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760686982; x=1761291782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdYosj18JxsdOF4tX6FsTGxogFUVKkATj7II134gg94=;
        b=fK8OtL2bd9X2wCF2BTjzMt7lQ/gjO5/ZzbFezVL4f5SsNzcrIIsxMaWoUlVPaKTR2G
         Z/ja64x3JUcby6Tu2Z/YDgIoorvEVpVc1PioG/AupF2vyE/AiD4RFe/mFmSCsts2wh83
         bZCC8ot51Bad4k92HdPKGyhIlRHQZk/PSv4bL1fYNeFCrqbudgO4o4JGGjUsCnoX0waZ
         LPJ0VijIISAqfQhdcyj//tmKLfiqtiCb28uPJQ/OyTWEq/KPfVhCrNGb14ZDhsGmhsGP
         IghqnhNnfLpBnoDaOAZ425quMhDwOVEg0jfQRvKtmxxZd8RjDtX/XfRx1S+4g3Ivb9H8
         x4uw==
X-Gm-Message-State: AOJu0YyoaH9felAXlD8x6PaE/HD9sUWcwDdirc0hIJxlZJnrbFVODEKP
	vveCvdjNqUs0E/p/O7wUTiRkhkZTZm0pKspbqgk6IYNmhRpQz5Q/L6v00tWNyIHOwuY8b1UKfmr
	pqrcpm80=
X-Gm-Gg: ASbGncvJVX5b2gT4AB27HbPabjnSQd225QEuT7WnvI5Rw4E9MNwQQnZMk6Qm7K+0RRf
	OY+BFmEBiKnW8XCJ3QSWZ89tJONoX8Qgi6AuAcwkQHDiguEtBlTjptR4brzB9itQZzWvtptDMqM
	e/Cc4lMAsxjH1RThzk6pUM0+Vu9K7fItYF3lj7k4W9Us7ehzNcz6p3B/5AnMeSkiA4nP4WXb7nt
	/leEDBh7d0W+lt3GCiJIju6+pFaDJ+XSIF/43MtJkOfG0m1N7TuZy6JOsyV8Q4pYbx2VVVWyBLN
	5Iu0JBQHSytvdn65OAtvxaDYDhxmhdCDfC/GBGQZzN5+SPIoEnXR0AvclmUarz6P7cO+JDOsGVC
	Rpn6Ljju4hI6mwMMMQt5nKqYRRSAVO6zHONKovJbBKcFPnBvaOgggzVtnJ26HdtqG6fx8t2MUzr
	nZE9huazOd8KKtRurvoFXHraK54w==
X-Google-Smtp-Source: AGHT+IH1FPxWqYRpGGGLIK9uPpDS8xvR0qO/67WZPEkL5OMPfAK0kSB+wPBmuqDrBcG9Bnwq14uqOQ==
X-Received: by 2002:a17:90a:e70f:b0:32e:3837:284f with SMTP id 98e67ed59e1d1-33bcf8e312bmr2932901a91.21.1760686981657;
        Fri, 17 Oct 2025 00:43:01 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcf:39c2:10fc:ab36:ff9a:d488])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd79b2ee4sm1897076a91.1.2025.10.17.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 00:43:00 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-multimedia][kirkstone][PATCH] vorbis-tools: Fix CVE-2023-43361
Date: Fri, 17 Oct 2025 13:12:40 +0530
Message-Id: <20251017074240.1510482-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 07:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120742

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commits:
https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/68c5a33685f5b86e7f18f239ceb8861484fee552
& https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/5bb47f58582c15c2413564b741d1d95e7b566aa8

Drop md5sum

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...g-include-utf8.h-to-codec_skeleton.c.patch | 28 +++++++++
 .../vorbis-tools/CVE-2023-43361.patch         | 57 +++++++++++++++++++
 .../vorbis-tools/vorbis-tools_1.4.2.bb        |  3 +-
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch

diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
new file mode 100644
index 0000000000..db7d142543
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch
@@ -0,0 +1,28 @@
+From 68c5a33685f5b86e7f18f239ceb8861484fee552 Mon Sep 17 00:00:00 2001
+From: Petter Reinholdtsen <pere@debian.org>
+Date: Sun, 6 Apr 2025 07:53:53 +0200
+Subject: [PATCH] Added missing include "utf8.h" to codec_skeleton.c.
+
+Patch from Sebastian Ramacher <sramacher@debian.org> and Debian.
+
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/68c5a33685f5b86e7f18f239ceb8861484fee552]
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ogginfo/codec_skeleton.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ogginfo/codec_skeleton.c b/ogginfo/codec_skeleton.c
+index a27f8da..0709860 100644
+--- a/ogginfo/codec_skeleton.c
++++ b/ogginfo/codec_skeleton.c
+@@ -25,6 +25,7 @@
+ #include <ogg/ogg.h>
+ 
+ #include "i18n.h"
++#include "utf8.h"
+ 
+ #include "private.h"
+ 
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
new file mode 100644
index 0000000000..69286907fa
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools/CVE-2023-43361.patch
@@ -0,0 +1,57 @@
+From 5bb47f58582c15c2413564b741d1d95e7b566aa8 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Sun, 17 Sep 2023 11:49:12 -0700
+Subject: [PATCH] oggenc: Don't assume the output path ends in a file name.
+
+oggenc attempts to create any specified directories in the output
+file path if they don't exist. The parser was assuming there was
+a final filename after the last directory separator, and so would
+try to read off the end of the argument if it was a bare directory
+such as `./` or `outdir/`. It also did not handle more than one
+consecutive separator. This corrects both issues.
+
+Thanks to Frank-Z7 (Zeng Yunxiang) at Huazhong University of Science
+and Technology (cse.hust.edu.cn) for the report.
+
+Fixes CVE-2023-43361.
+
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/vorbis-tools/-/commit/5bb47f58582c15c2413564b741d1d95e7b566aa8]
+CVE: CVE-2023-43361
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ oggenc/platform.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/oggenc/platform.c b/oggenc/platform.c
+index 6d9f4ef..d50ad99 100644
+--- a/oggenc/platform.c
++++ b/oggenc/platform.c
+@@ -136,18 +136,22 @@ int create_directories(char *fn, int isutf8)
+ {
+     char *end, *start;
+     struct stat statbuf;
+-    char *segment = malloc(strlen(fn)+1);
++    const size_t fn_len = strlen(fn);
++    char *segment = malloc(fn_len+1);
+ #ifdef _WIN32
+     wchar_t seg[MAX_PATH+1];
+ #endif
+ 
+     start = fn;
+ #ifdef _WIN32
+-    if(strlen(fn) >= 3 && isalpha(fn[0]) && fn[1]==':')
++    // Strip drive prefix
++    if(fn_len >= 3 && isalpha(fn[0]) && fn[1]==':') {
+         start = start+2;
++    }
+ #endif
+ 
+-    while((end = strpbrk(start+1, PATH_SEPS)) != NULL)
++    // Loop through path segments, creating directories if necessary
++    while((end = strpbrk(start + strspn(start, PATH_SEPS), PATH_SEPS)) != NULL)
+     {
+         int rv;
+         memcpy(segment, fn, end-fn);
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
index 290162127f..33a212de8e 100644
--- a/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/vorbis-tools/vorbis-tools_1.4.2.bb
@@ -12,9 +12,10 @@ DEPENDS = "libogg libvorbis"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/${BP}.tar.gz \
            file://gettext.patch \
+           file://0001-Added-missing-include-utf8.h-to-codec_skeleton.c.patch \
+           file://CVE-2023-43361.patch \
           "
 
-SRC_URI[md5sum] = "998fca293bd4e4bdc2b96fb70f952f4e"
 SRC_URI[sha256sum] = "db7774ec2bf2c939b139452183669be84fda5774d6400fc57fde37f77624f0b0"
 
 inherit autotools pkgconfig gettext
-- 
2.25.1


