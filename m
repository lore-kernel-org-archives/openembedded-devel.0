Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.717.1615621466553677321
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 23:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBhUcCG0;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id 30so8413205ple.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 23:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9Wa6ilM0pK0Vynlrz08buQtgLtkTXirW+8npT2ynKg=;
        b=uBhUcCG0fO5Qo3enAyDQFhrUFXQwo202oWq7Ro8Pj+5Dpu3aNmLa6lydVFrR3HDJeX
         fKr5l2ixwP2v4DbbGuRe9T/uh7Y3/N56YC1I9YjGC+XDH1ZFZYlzK3aSOy/yUi135TAs
         J4qrJ/8CejPVqtKRW5l1rQzIhcx21Oe2EB2FN494yXgDVP2ZhSCHWV9v0SzI8plcdTq0
         jeTZXR6XzyFxAMabKoTm1aVWQxuuRgD5IGG621ahXbh7jFffMsoDwgQJ2KVbNaqZF2rP
         IJGsXp2fCpLfLSajcecA7eZsCSjd1jrsaeRfrLYXVOF8WM+zgGMGCR2dOcT6p7SJ2C0r
         NL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9Wa6ilM0pK0Vynlrz08buQtgLtkTXirW+8npT2ynKg=;
        b=SLTpqNsVV+bJIUV8WBUBxPBCUCgMUBT+fi+DFjahXnrNgRxRnV6Z+y4M/fW/cytJ1L
         JxPCZmN2ceYNMTa9xe7vZnVuVxBKgIVr22kx+niLBoS7wIztvgz0ahfBQ3IcLL3WZwkk
         Gt9fqPq65a+HU3x+yHTUPEErKfhO5QHBR7QTACJIMf86pxI+sRnOX2mp9FA0QBJPAYP/
         4Pv3/6WmmfVqrH8s1dfXMpCmKQeluaF6WyeB7pFYFjhaF3SyUafhwuH83DhDc4S8iWOx
         x8UIjEXQ2ZLt+jyR8E9NaQlxiKsizBRGIudteIzcB5vvh5VSS6xDpVeGWQ5TUDmuQDHC
         EbUQ==
X-Gm-Message-State: AOAM531TLFfW2ADnPxKzESvHOtJ518DqzK1FJNl2pSjAnZTZp2Tz6Yvz
	/taBq1wNN2nsEzRer0Bmm8X7kZQBs5vPQA==
X-Google-Smtp-Source: ABdhPJyy5CIdmttyir05apGcUzArjqYu/vieouQc1l2MgeHwrTGOEkJoiH6ffiGiVxG6MdiXyEbmcw==
X-Received: by 2002:a17:90a:e28c:: with SMTP id d12mr2290393pjz.167.1615621465514;
        Fri, 12 Mar 2021 23:44:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id a7sm7441992pfo.105.2021.03.12.23.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 23:44:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] oprofile: Fix build on musl
Date: Fri, 12 Mar 2021 23:44:23 -0800
Message-Id: <20210313074423.2680128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX_INPUT is defined in linux/limits.h, therefore include it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc    |  1 +
 .../oprofile/oprofile/include_limits.patch      | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index 0e1e2ed8c9..0863a8fd36 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
            file://0001-replace-sym_iterator-0-with-sym_iterator.patch \
            file://0001-Use-new-bfd-APIs-from-2.34.patch \
+           file://include_limits.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch b/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch
new file mode 100644
index 0000000000..5aabfe78eb
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/include_limits.patch
@@ -0,0 +1,17 @@
+include linux/limits.h for MAX_INPUT
+
+Fixes
+op_pe_utils.cpp:533:19: error: 'MAX_INPUT' was not declared in this scope
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/libpe_utils/op_pe_utils.cpp
++++ b/libpe_utils/op_pe_utils.cpp
+@@ -11,6 +11,7 @@
+  *
+  */
+ 
++#include <linux/limits.h>
+ #include <linux/perf_event.h>
+ #include <dirent.h>
+ #include <stdio.h>
-- 
2.30.2

