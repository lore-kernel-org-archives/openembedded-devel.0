Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F25BC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:25:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.22681.1699820741152573858
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiijBTEG;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso577169966b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820739; x=1700425539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikfkS15LFzyI0zwFKWi1GYw7X8PUw0VZOUuf/aOMnZM=;
        b=eiijBTEGkU5tTwttN+NXE3fXtPFeLfdNd+2R5LluCOSBp2RqdI9AZHA5xIfX+58fYb
         omOYqmS68+p4orSH4yvtpTU3l74qHWMeXQkcJegx3EI8CJ4j1cxTGMVTWYhj/qHatbrW
         esap9B/GsZL/Gc+wYeQybclfvfGWDGzP3wko4m7CwvgDvtkCKubyrHFf4j/mDN7F4XiX
         5AfghhKRu4RBDht1ATl3aYVUNYfSgE/LJPonYBK3LU6amfUJqhQNSfmiRant9Iw1Cq3j
         5cybX1KEEkPYOac2nvIYZ98mdfdREMPa2y6rS12sC1TMcRRUh5oOrSc4VN/LILyW/Jkv
         jdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820739; x=1700425539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikfkS15LFzyI0zwFKWi1GYw7X8PUw0VZOUuf/aOMnZM=;
        b=h6E/z+LMF11zBPD3KmuJV3w8wB4hmcWs/yfdfebBk0OBIRWoZ/y3Gf3ubo4vO3DQG4
         2tcznl3MV+mwfZ/FlKC2fig/TGkMKfx9bU2HCIddfDmgdbuUxoRLZ8JeudOvZPl8gXrJ
         f0J4AtLEC43eFO4r1ED7C+Eyl7Os13CpYJdojcu/FbIS/lRA/hmcm8gec3kw5JXrN937
         rYpyG101UPAfZhO29xQ87wKf9DGe3OihGWZY8DrtzYRYA/8I8UlvIViSd0mOz3KOwVVx
         FdqlKa1oRNywVtlCBHuTwF+/W4DQ+k+a00uRQkiAcdGKWhCjdfWLCRJ7kfutSX0u8Mmc
         CZtg==
X-Gm-Message-State: AOJu0Yy/uZm2TKO6G4Cb6uCo4OpcRq6L21cUEAXrM/Pcqh0Hw/MA/1cD
	mqheFOaLQcBzzRhGahpAe7EikITKMWHW/Q==
X-Google-Smtp-Source: AGHT+IFrvoLv41+d/WznO5LwIYn7Vw1/gJ26RibMuyUE3qU5qjlt5Q0nHkh+bmhtwJzA+OXidaIsrQ==
X-Received: by 2002:a17:906:7d0:b0:9e5:19c2:e5f9 with SMTP id m16-20020a17090607d000b009e519c2e5f9mr3605317ejc.12.1699820738644;
        Sun, 12 Nov 2023 12:25:38 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id k23-20020a170906a39700b009c4cb1553edsm2983086ejz.95.2023.11.12.12.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:25:38 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] libdnet: upgrade 1.16.3 -> 1.17.0
Date: Sun, 12 Nov 2023 23:25:25 +0300
Message-Id: <20231112202525.633823-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106612

Patches removed because fixed in the new version.

Changelog:

- Various fixes around the build process (esp. cmake support + string.h include fixes)
- Stronger cmake support, updated autotools and a few smaller fixes.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...onfigure-Replace-use-of-AC_EGREP_CPP.patch | 39 -------------------
 ...g-config-variable-to-find-check-incl.patch | 27 -------------
 .../{libdnet_1.16.3.bb => libdnet_1.17.0.bb}  |  7 ++--
 3 files changed, 3 insertions(+), 70 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
 delete mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
 rename meta-networking/recipes-connectivity/libdnet/{libdnet_1.16.3.bb => libdnet_1.17.0.bb} (71%)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
deleted file mode 100644
index 133ccc46b..000000000
--- a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b0c98f93a7f427d18206c79bf2a0350dc81172f6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 6 Apr 2023 10:44:08 -0700
-Subject: [PATCH] configure: Replace use of AC_EGREP_CPP
-
-Use AC_COMPILE_IFELSE instead to compute platform support for arp ioctls
-AC_EGREP_CPP does not work as used with upcoming autoconf 2.72
-
-Upstream-Status: Submitted [https://github.com/ofalk/libdnet/pull/85]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4/acinclude.m4 | 11 +++++------
- 1 file changed, 5 insertions(+), 6 deletions(-)
-
-diff --git a/m4/acinclude.m4 b/m4/acinclude.m4
-index d6350a2..3699bf1 100644
---- a/m4/acinclude.m4
-+++ b/m4/acinclude.m4
-@@ -196,12 +196,11 @@ dnl
- AC_DEFUN([AC_DNET_IOCTL_ARP],
-     [AC_MSG_CHECKING(for arp(7) ioctls)
-     AC_CACHE_VAL(ac_cv_dnet_ioctl_arp,
--    AC_EGREP_CPP(werd,[#include <sys/types.h>
--                       #define BSD_COMP
--                       #include <sys/ioctl.h>
--                       #ifdef SIOCGARP
--                 werd
--                       #endif],
-+    AC_COMPILE_IFELSE(
-+        [AC_LANG_PROGRAM([[#include <sys/types.h>
-+                           #define BSD_COMP
-+                           #include <sys/ioctl.h>]],
-+                          [[int foo = SIOCGARP;]])],
-     ac_cv_dnet_ioctl_arp=yes,
-     ac_cv_dnet_ioctl_arp=no))
-     case "$host_os" in
--- 
-2.40.0
-
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
deleted file mode 100644
index 8a78e7ac2..000000000
--- a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 85d8338a3ebc01a3ea7600aa602139c4eac3be07 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 6 Apr 2023 12:13:09 -0700
-Subject: [PATCH] configure: Use pkg-config variable to find check include paths
-
-Upstream-Status: Submitted [https://github.com/ofalk/libdnet/pull/85]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3f0c404..553b487 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -153,7 +153,7 @@ AC_ARG_WITH(check,
-   esac ],
- [ PKG_CHECK_MODULES([CHECK], [check])
-   if test -n "${CHECK_LIBS}"; then
--     CHECKINC="-I${prefix}/include"
-+     CHECKINC="${CHECK_CFLAGS}"
-      CHECKLIB="${CHECK_LIBS}"
-      AC_MSG_RESULT(yes)
-   else
--- 
-2.40.0
-
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb
similarity index 71%
rename from meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb
rename to meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb
index 05c8fb309..a42d014f6 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.17.0.bb
@@ -4,10 +4,9 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
-SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https \
-           file://0001-configure-Replace-use-of-AC_EGREP_CPP.patch \
-           file://0001-configure-Use-pkg-config-variable-to-find-check-incl.patch"
-SRCREV = "a03043bec8e66b240a45555e37147b22db182c21"
+SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https"
+
+SRCREV = "912f7848bfff4ebc6d610f802a3144f84880cbe4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


