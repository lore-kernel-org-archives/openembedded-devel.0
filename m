Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0799DC76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:19:57 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.167870.1680808792387003805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Apr 2023 12:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dQS5feYs;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso43927645pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680808792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDtpY5fkhW1Xd4qcyJSE53jvaDjhXYJl+Uf23ACd2uM=;
        b=dQS5feYsGfXxCSAJRnzvw2LYd4hMTGZ3hlpXtTPTQSuCe5GzE376CRyDN3z5LHVG2V
         llm+bLGtKbG6bRUlOqbal7jdCQjM5vkkF4MOYhuKD1o4sAWQFov1xUvSLhXa916FGset
         cpwc2QLIbTqXDvvRRpP8hbqUgu3vrCj0a/0ma2elNuL8isiNxNFtqAnwPKvoSDtF7Dth
         ibQ10syFIQZxXHBcR9Sg90L9ALr5oXmYfC9p3Ice1AIUXTs7C7ZdN2qJjR8qhbYOlN7q
         ReOtWYMln7687/kRVkYCxX0xBTE7HjJaQtGcWcw5aKbejwAfVZ3NGzQzpp1+sZGJ4JR6
         X/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680808792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDtpY5fkhW1Xd4qcyJSE53jvaDjhXYJl+Uf23ACd2uM=;
        b=ziDBOSY4DSkQ4Wd99Eksu1xBf8uHJGvn3diMuDUUrIJ+Kq7+WQnw8Y9/esaxAh5eVd
         9507YMFhUzD6mdhdUzynYrRMMtaw//TYAfFxhSumtlPkmPUCOng3rDyj/2+5igQnknXU
         D/cnjRAHfI+W3M2Jw1bNSnJPCqspvkLQfB8nSBiMD0xFes5DGFLWjva6lSs+Il6Wr+0K
         75SEbd4tm8CFEtdANVhwZRRH3p+2yIesQpyNX9ehqtFF51zasjdenGcI6kx4TpBv4Cl7
         cqBu0mnM8Fha2KWq1ATevSckYuZRr0sgqVMPVjP/LRItCdChmX5P7PYC++ucOpD5xvyJ
         wI+w==
X-Gm-Message-State: AAQBX9cwnCfX+8C3dm6vM/RPP4RIo9xENCXsClUnLrf9FWxTHFsPy9Ch
	SYI031VnMdUwT3aIAZcjf2MHv63+/85KgQ==
X-Google-Smtp-Source: AKy350ZmYZ/DVXdjozMCxxlLnwqXQVkCVwV8oeNx6KXXh3UdbNTSTid15GSOt2qyG/lldIg0vPHrkA==
X-Received: by 2002:a17:902:ea08:b0:1a2:7356:1ec8 with SMTP id s8-20020a170902ea0800b001a273561ec8mr197535plg.67.1680808791432;
        Thu, 06 Apr 2023 12:19:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id c7-20020a170902b68700b001a064282b11sm1707771pls.151.2023.04.06.12.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 12:19:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] libdnet: Upgrade to 1.16.3
Date: Thu,  6 Apr 2023 12:19:49 -0700
Message-Id: <20230406191949.3818718-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 19:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101975

Fix build with upcoming autoconf 1.16.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-Replace-use-of-AC_EGREP_CPP.patch | 39 +++++++++++++++++++
 ...g-config-variable-to-find-check-incl.patch | 27 +++++++++++++
 .../libdnet/libdnet_1.14.bb                   | 20 ----------
 .../libdnet/libdnet_1.16.3.bb                 | 23 +++++++++++
 4 files changed, 89 insertions(+), 20 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
 create mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
 delete mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
 create mode 100644 meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
new file mode 100644
index 0000000000..133ccc46b2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Replace-use-of-AC_EGREP_CPP.patch
@@ -0,0 +1,39 @@
+From b0c98f93a7f427d18206c79bf2a0350dc81172f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Apr 2023 10:44:08 -0700
+Subject: [PATCH] configure: Replace use of AC_EGREP_CPP
+
+Use AC_COMPILE_IFELSE instead to compute platform support for arp ioctls
+AC_EGREP_CPP does not work as used with upcoming autoconf 2.72
+
+Upstream-Status: Submitted [https://github.com/ofalk/libdnet/pull/85]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/acinclude.m4 | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/m4/acinclude.m4 b/m4/acinclude.m4
+index d6350a2..3699bf1 100644
+--- a/m4/acinclude.m4
++++ b/m4/acinclude.m4
+@@ -196,12 +196,11 @@ dnl
+ AC_DEFUN([AC_DNET_IOCTL_ARP],
+     [AC_MSG_CHECKING(for arp(7) ioctls)
+     AC_CACHE_VAL(ac_cv_dnet_ioctl_arp,
+-    AC_EGREP_CPP(werd,[#include <sys/types.h>
+-                       #define BSD_COMP
+-                       #include <sys/ioctl.h>
+-                       #ifdef SIOCGARP
+-                 werd
+-                       #endif],
++    AC_COMPILE_IFELSE(
++        [AC_LANG_PROGRAM([[#include <sys/types.h>
++                           #define BSD_COMP
++                           #include <sys/ioctl.h>]],
++                          [[int foo = SIOCGARP;]])],
+     ac_cv_dnet_ioctl_arp=yes,
+     ac_cv_dnet_ioctl_arp=no))
+     case "$host_os" in
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
new file mode 100644
index 0000000000..8a78e7ac28
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet/0001-configure-Use-pkg-config-variable-to-find-check-incl.patch
@@ -0,0 +1,27 @@
+From 85d8338a3ebc01a3ea7600aa602139c4eac3be07 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Apr 2023 12:13:09 -0700
+Subject: [PATCH] configure: Use pkg-config variable to find check include paths
+
+Upstream-Status: Submitted [https://github.com/ofalk/libdnet/pull/85]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3f0c404..553b487 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -153,7 +153,7 @@ AC_ARG_WITH(check,
+   esac ],
+ [ PKG_CHECK_MODULES([CHECK], [check])
+   if test -n "${CHECK_LIBS}"; then
+-     CHECKINC="-I${prefix}/include"
++     CHECKINC="${CHECK_CFLAGS}"
+      CHECKLIB="${CHECK_LIBS}"
+      AC_MSG_RESULT(yes)
+   else
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
deleted file mode 100644
index 9f2ff51576..0000000000
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.14.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "dumb networking library"
-HOMEPAGE = "http://code.google.com/p/libdnet/"
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
-
-SRC_URI = "git://github.com/dugsong/libdnet.git;nobranch=1;protocol=https"
-SRCREV = "3e782472d2a58d5e1b94d04eda4a364c2d257600"
-
-UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/git"
-
-inherit autotools multilib_script
-
-acpaths = "-I ./config/"
-
-BBCLASSEXTEND = "native"
-
-MULTILIB_SCRIPTS = "${PN}:${bindir}/dnet-config"
diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb
new file mode 100644
index 0000000000..05c8fb309f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.16.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "dumb networking library"
+HOMEPAGE = "https://github.com/ofalk/libdnet"
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
+
+SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https \
+           file://0001-configure-Replace-use-of-AC_EGREP_CPP.patch \
+           file://0001-configure-Use-pkg-config-variable-to-find-check-incl.patch"
+SRCREV = "a03043bec8e66b240a45555e37147b22db182c21"
+
+UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+inherit autotools multilib_script pkgconfig
+
+DEPENDS += "libcheck"
+
+EXTRA_AUTORECONF += "-I ./config"
+BBCLASSEXTEND = "native"
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/dnet-config"
-- 
2.40.0


