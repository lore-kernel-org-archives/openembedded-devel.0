Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3205C3DA79
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 04:24:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.130374.1672028671284465124
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 20:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lTdkRVdn;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso162671pjc.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 20:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsQ2N3TvvJjEiO6Wu/jOl2G70OhXU6UP1/6zsGjxm88=;
        b=lTdkRVdns5OK0Ftcb5XL6OS8HpN8HxoB86PMuei4FR5ammXXVH8vqPjoo1lyyur5K2
         1PewJHqR0hN/SjeniJpoqDLEq5VrTz8S4QHnppeoT0jccmRd7Lnx9IgBhGRhUUrLG6Na
         dunMPyqtDCBOdsqZu/Q2KD7PNwoZN74yeWLG/0hRPZ6k23eVftoFrBjwGkPRtBjoIuRW
         U4sEG+k9t7XuoGCFPl4Onc5LmMT55EDd0PxOzQg5oAqXEIs+L6wxJlhioO4mXNsAzD4M
         sqQukl+KEVGyXezwrUA1SMlkzRIXm449vJ5xM8yjsztMYqgf2A/VHV9CUh7clOtrUl7e
         Xh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IsQ2N3TvvJjEiO6Wu/jOl2G70OhXU6UP1/6zsGjxm88=;
        b=5sxO3zq+TbFLZsFMkpBx8VP+Q4QvFy3l7rT2ejLkV1OGmmVz/FBICH1+7wPo0U7FNm
         W/GCS+I6gOPiSI1U9qgVLM3ucTs7Bzl5r2SP56XMgRjxeWIPa+1/yD9HHkYs3a6UMBx9
         KLyfQmG1er/oFzJR5ROGDQuY3OJIpck8DU3HNsl5nsBymtWJLMKUEs40HqPrNTOGFJah
         BpL6TfVtMMGhQdONwonXLtdU7vQqSFNEA0iUkMjKW5DJRO0rMz4WLPqZu5m+9SbZ0pMP
         qaFIK9m/FKKDIlrKeIk/v4V9Ek9ixM//3zKH4KpbUO0pUh9miRddjSaRGENmYaGI9cLZ
         7Jqg==
X-Gm-Message-State: AFqh2kpqtCLUXUzkTD93eJprDlFcetksz3IhOKTxSBrCkE3cnuVVBTja
	20fpjTLfav9YvUfEzzvCIRGsEy0yPeU=
X-Google-Smtp-Source: AMrXdXsi2+pSlJFNgee9YTpuaXYgDwN55flIlVsPKs8ie2mOti5JFEr6f+elvsbmX5wWlP+kebCaRA==
X-Received: by 2002:a05:6a20:2d9a:b0:ae:6619:6e5d with SMTP id bf26-20020a056a202d9a00b000ae66196e5dmr18842865pzb.47.1672028670264;
        Sun, 25 Dec 2022 20:24:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020aa78e8d000000b00574ab0e053bsm5870551pfr.187.2022.12.25.20.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:24:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] android-tools: Define lseek64 = lseek on musl
Date: Sun, 25 Dec 2022 20:24:27 -0800
Message-Id: <20221226042427.3721363-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 04:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100236

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../core/0006-adb-Musl-fixes.patch            | 27 +++++++++----------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
index b5d383f383..53f7bcb8e8 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0006-adb-Musl-fixes.patch
@@ -15,8 +15,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  adb/sysdeps.h                | 12 ++++++------
  4 files changed, 20 insertions(+), 14 deletions(-)
 
-diff --git a/adb/adb.h b/adb/adb.h
-index 44e5981bdc..bcdc49f63c 100644
 --- a/adb/adb.h
 +++ b/adb/adb.h
 @@ -18,7 +18,9 @@
@@ -29,11 +27,9 @@ index 44e5981bdc..bcdc49f63c 100644
  #include "adb_trace.h"
  #include "transport.h"  /* readx(), writex() */
  
-diff --git a/adb/disable_verity_service.c b/adb/disable_verity_service.c
-index ed3da52108..29fa3d65a9 100644
 --- a/adb/disable_verity_service.c
 +++ b/adb/disable_verity_service.c
-@@ -14,25 +14,28 @@
+@@ -14,25 +14,32 @@
   * limitations under the License.
   */
  
@@ -51,13 +47,18 @@ index ed3da52108..29fa3d65a9 100644
  #include <sys/stat.h>
  #include <fcntl.h>
  #include <inttypes.h>
-+#include <unistd.h>
-+#include <errno.h>
-+#include <stdbool.h>
- 
+-
 -#include "cutils/properties.h"
 -#include "ext4_sb.h"
 -#include <fs_mgr.h>
++#include <unistd.h>
++#include <errno.h>
++#include <stdbool.h>
++
++#if defined(__linux__) && !defined(__GLIBC__)
++#define lseek64 lseek
++#define off64_t off_t
++#endif
  
  #define FSTAB_PREFIX "/fstab."
  struct fstab *fstab;
@@ -67,8 +68,6 @@ index ed3da52108..29fa3d65a9 100644
  static void write_console(int fd, const char* format, ...)
  {
      char buffer[256];
-diff --git a/adb/framebuffer_service.c b/adb/framebuffer_service.c
-index 8cbe8403cc..8f0ccfb7aa 100644
 --- a/adb/framebuffer_service.c
 +++ b/adb/framebuffer_service.c
 @@ -14,6 +14,10 @@
@@ -92,11 +91,9 @@ index 8cbe8403cc..8f0ccfb7aa 100644
  #include <linux/fb.h>
  #include <sys/ioctl.h>
  #include <sys/mman.h>
-diff --git a/adb/sysdeps.h b/adb/sysdeps.h
-index cc1f839e9f..ea39ac39cc 100644
 --- a/adb/sysdeps.h
 +++ b/adb/sysdeps.h
-@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
+@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd
  {
      return close(fd);
  }
@@ -118,7 +115,7 @@ index cc1f839e9f..ea39ac39cc 100644
  
  
  static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
-@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  fd, int  pos, int  where)
+@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  f
  {
      return lseek(fd, pos, where);
  }
-- 
2.39.0


