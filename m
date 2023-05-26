Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E395C7EE2C
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:19:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2488.1685081968502929041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 May 2023 23:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gGLY6pxX;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so1333435b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685081968; x=1687673968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9bjXMbnC6ncHkygL5v71DRDyZ2UfbSGOCJ6ZJZDQN40=;
        b=gGLY6pxX74a4p8xp+vYVscMHjVLmJzn4+iTrUCrQYH1gAwYZKu8k0DJMpgZqpTXxKa
         0R5OgJTlrvMUg1kkufuWyTVLPZmofOwSjt5Nva2yG3VE1Sqfq1Ar/7472x6U7s4xqm4k
         t16uSz7xmNdgDQjwYKY3ktGC7BVFsaMh73vxAHXqf37wsbI7TjS8LxbI4WX66ZJ3Jqn5
         DN6jSTHqSc9NfpigBFrnx2eyOsVzfWnLmqox3n7jFwBoSDG0Voj4Cn1YIvXjDcVF9/WB
         eosFudCKpGcDTF54Hh6QgZI17p0AKas37Ln4/l24zdPlI9mUwaxUIRlo2H+aAQaoVBCY
         b9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685081968; x=1687673968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bjXMbnC6ncHkygL5v71DRDyZ2UfbSGOCJ6ZJZDQN40=;
        b=QTAL0YbWMli+lqFZWd61UguB7rYxjfkhdYSaTCLSeAbvllqz2kn9KUinhIfPfI6ckO
         CxtvnnZEJNqY4NsvkrX+kFBSEeLWroEtAkjGtYqTSGiBUqwy4e1uqQl9hNFKlXsXAIUZ
         kSaFAqPJny8RFbhiM0d4t8p6O4Q7cn/t1qwKOZlUprt6Fu+MmlM2fMFEkeI84tOuQ9MK
         CZrDjf6OMP3OiyNiB5Y8LIbsstyJuPWL5o8nKx7KJdYbPYzzUdmi55CvXlTbMidkWYFj
         I6o4OP0Xp/meXPsnTTsPBVFgOIZHpJ98QV5NYAIn19mdlXWCjv3V2QyYgPaeHQJVe9BT
         gnLw==
X-Gm-Message-State: AC+VfDxFekd93h4J+ScKlDDz7QcLys2ROELH0rNIQj6dQckTHXzSsdp+
	U9RB4v3oqVMKsbWZUwLOKsyAb3cKJRM=
X-Google-Smtp-Source: ACHHUZ4JKwHzGPkoQ2MH5AhIoo0x6SpR6ayL5Rpw9R+WC3LzyRCEXj59S+1fosolYEZlCq6y4TylLw==
X-Received: by 2002:a05:6a20:8e25:b0:102:5e06:1544 with SMTP id y37-20020a056a208e2500b001025e061544mr804112pzj.30.1685081967414;
        Thu, 25 May 2023 23:19:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id k6-20020a63ba06000000b0050f85ef50d1sm1885427pgf.26.2023.05.25.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:19:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/7] libgphoto2: Edit out sysroot from CC variable in configure
Date: Thu, 25 May 2023 23:19:19 -0700
Message-Id: <20230526061925.420351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102863

Configure emits HAVE_CC variable to be used in sourcecode and its built
from CC env var, CC in OE contains buildpaths in --sysroot option,
therefore edit this option out in configure.ac itself and remove all
other workarounds to fix this issue in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure-Filter-out-buildpaths-from-CC.patch | 48 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.30.bb              |  7 +--
 2 files changed, 49 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
new file mode 100644
index 0000000000..570bb3e4c1
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-configure-Filter-out-buildpaths-from-CC.patch
@@ -0,0 +1,48 @@
+From 06be633b8f4e2241bd37d4faf62b49606ad778e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 25 May 2023 19:01:36 -0700
+Subject: [PATCH] configure: Filter out buildpaths from CC
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac                 | 4 +++-
+ libgphoto2_port/configure.ac | 6 ++++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 17216b1..39c8cc4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -261,7 +261,9 @@ GP_CONFIG_MSG([Compiler],[${CC}])
+ GP_CONFIG_MSG([libltdl includes],[$LTDLINCL])
+ GP_CONFIG_MSG([libltdl library],[$LIBLTDL])
+ 
+-AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC"],
++CC_NO_SYSROOT=`echo $CC | sed -e \
++		's|--sysroot=.*\b||g'`
++AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC_NO_SYSROOT"],
+                    [The C compiler we are using])
+ 
+ 
+diff --git a/libgphoto2_port/configure.ac b/libgphoto2_port/configure.ac
+index 1086b8e..59f3c34 100644
+--- a/libgphoto2_port/configure.ac
++++ b/libgphoto2_port/configure.ac
+@@ -103,8 +103,10 @@ GP_CONFIG_MSG([Compiler],[${CC}])
+ GP_CONFIG_MSG([libltdl includes],[$LTDLINCL])
+ GP_CONFIG_MSG([libltdl library],[$LIBLTDL])
+ 
+-AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC"],
+-                   [The C compiler we're using])
++CC_NO_SYSROOT=`echo $CC | sed -e \
++		's|--sysroot=.*\b||g'`
++AC_DEFINE_UNQUOTED([HAVE_CC], ["$CC_NO_SYSROOT"],
++                   [The C compiler we are using])
+ 
+ AM_CPPFLAGS=""
+ 
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb
index 0f2800a95f..b1fb7579ee 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.30.bb
@@ -12,6 +12,7 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
+           file://0001-configure-Filter-out-buildpaths-from-CC.patch \
 "
 SRC_URI[libgphoto2.sha256sum] = "ee61a1dac6ad5cf711d114e06b90a6d431961a6e7ec59f4b757a7cd77b1c0fb4"
 
@@ -32,12 +33,6 @@ do_configure:append() {
     cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
     autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
-
-    # remove WORKDIR information from config to improve reproducibility
-    # libgphoto2_port recheck config will set the WORKDIR info again, so dont do that
-    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/config.h
-    sed -i 's/'$(echo ${WORKDIR} | sed 's_/_\\/_g')'/../g' ${B}/libgphoto2_port/config.status
-    sed -i '/config\.status/ s/\-\-recheck//' ${B}/libgphoto2_port/Makefile
     cd ${S}
 }
 
-- 
2.40.1


