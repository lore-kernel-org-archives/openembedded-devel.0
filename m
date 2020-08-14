Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.12368.1597383421560552152
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ee1tTksN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 189so3357481pgg.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ptaQnywhmP2fA5pR1hZqAqvWK7Yzm4oeW7Hz6HReutQ=;
        b=ee1tTksNZJ+QP5u8hhD5xlOptM6RD934B2RZkSBma615Gdc3kdW6BZXBxFOh57V3fa
         Yg2fUPf7q97hD6L1+/0KzYsXzajJqB5Qd5jY+z5QLbZ9IdTsyi+uTOqf8+wfW/KBJxZe
         UR9yDvei7Bzj2c30D9olmxmjt07PEzNAjqOkFtibSf+BrikG5VjRUEPDGGIT26Q319lG
         omNV/wZMH/3M3A59HRdfW/9dYaTg14X244BQlVhBhrfmISXpUd8nWOdmo2eoqIEKIX9Q
         Kk8ZL+GiSkBL8WZggACRFaLfmgqwrVSyvk8duJYnnvS8RhuFAZr22PgRv6v4oIxImkVT
         VPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ptaQnywhmP2fA5pR1hZqAqvWK7Yzm4oeW7Hz6HReutQ=;
        b=YJ96qnGj/PH/Gb+VNI3NSSEtFf9srtxmNVvoFURVntA5H+A062AovN05mBZ5ivmigg
         dL7DJmaAGK579RphQ3Vb84aRpPHx3UCpOeubprA0Bg7DLv8k3YYCa0jbTWEMKEwu4MZn
         jCp8Qj/vwToGuT+eEap3qegcRqWN/KDLHUEpPKIpM4WfVWh2PUs8o4+TvP6mf2jJmkuV
         u12J8XmGPOR1crRl5aXgkiLG7HuVDgFA8/j+ejNBmxAeDw0zGQSkfK4NOeHzCkZd+uXN
         IXGTSigPCf3M6CbINkamQDb8UzdgG4Hnuyp7xn9Cau5s+qgakrkvwgDPyuhORuWD0Koo
         Q56A==
X-Gm-Message-State: AOAM531ruv7BFWuYnq1DYvmYfg+lFSyW/U5JnZDzg/w5FC0ELwrnLZ9s
	u4Wqmaqg8pb3SKFlRQczcjznIpCxl6sxpg==
X-Google-Smtp-Source: ABdhPJxX01cGomf58+hv0AK6jDVsV44KGm1F/cuYRIZHixi1HooP7caCHusNRJGjS0EicdZ3TgQNxA==
X-Received: by 2002:aa7:8c09:: with SMTP id c9mr668902pfd.157.1597383420546;
        Thu, 13 Aug 2020 22:37:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:00 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/21] lprng: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:38 -0700
Message-Id: <20200814053657.1701247-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Do-not-define-Mail_fd-multiple-times.patch | 34 +++++++++++++++++++
 meta-oe/recipes-extended/lprng/lprng_3.8.C.bb |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch

diff --git a/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch b/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
new file mode 100644
index 0000000000..5748690445
--- /dev/null
+++ b/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
@@ -0,0 +1,34 @@
+From 6358561d5bad34f0003ebd415142d504fe53045a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 11:42:08 -0700
+Subject: [PATCH] checkpc: Do not define Mail_fd multiple times
+
+Its also defines in var.c via lp.h this is flagged when -fno-common is
+used
+
+Fixes
+TOPDIR/build/tmp/work/core2-32-yoe-linux/lprng/3.8.C-r0/recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-ld: vars.o:/usr/src/debug/lprng/3.8.C-r0/build/src/../../lprng-3.8.C/src/include/lp.h:72: multiple definition of `Mail_fd'; checkpc.o:/usr/src/debug/lprng/3.8.C-r0/build/src/../../lprng-3.8.C/src/common/checkpc.c:35: first defined here
+clang-11: error: linker command failed with exit code 1 (use -v to see invocation)
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/checkpc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/common/checkpc.c b/src/common/checkpc.c
+index aa03b08..7334094 100644
+--- a/src/common/checkpc.c
++++ b/src/common/checkpc.c
+@@ -32,8 +32,6 @@ static int Remove;
+ static char *User_specified_printer;
+ static time_t Current_time;
+ static int Check_path_list( char *plist, int allow_missing );
+-int Mail_fd;
+-
+ 
+ /* pathnames of the spool directory (sd) and control directory (cd) */
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
index 963c6320f2..4432342366 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
@@ -3,7 +3,9 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch \
+          "
 SRC_URI[md5sum] = "5901bed95e61d2bea3ba3056056af432"
 SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10"
 
-- 
2.28.0

