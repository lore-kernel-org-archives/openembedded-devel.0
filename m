Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BC0C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.11458.1685531624897982455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oq+1bRSq;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-565a63087e9so72811947b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531624; x=1688123624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0VZWymFyfk2pGDDYz1WPH7wwyWX0TbCWx5Bz6k0z1Q=;
        b=oq+1bRSqu1328tZ+0xhi0wJEJk8fpudg90L/KrTucJflLUs2o+32XnbXonHUgsptTO
         LU40MEXyKgMJfpTRKsbzYuGDB3zAGLrC4aNAQ1LVtSTuze9KILI0lbCUh63oq9B1LJUt
         eSzWxNLr0hvDuCT2HvBAYa/7wRR0ZD3gEZxlyo+cWw0VmCElNBFTc7jH/nrBrMAfRUyg
         nlJfvHO88XsMV3/dCrcOvv629qET0mc+KosgYGm7X0vSUXFXso0ouXdUAM6swVKmItai
         WhXKjdPCr1QhdkulnEU4Ao43jMKPy9mTpV7erP1vCno9vPpMNpM4Ksf+WswuJJ2gG3aT
         q12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531624; x=1688123624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W0VZWymFyfk2pGDDYz1WPH7wwyWX0TbCWx5Bz6k0z1Q=;
        b=GFmh54bPaA9tkNBkRDfXB/464uJYKVoW4crGuGf05SVfhcf0xnJsvWsZzhxefokZzJ
         AcqTkRV4CwEqxU/55lSe7RIO/E7dMW7xsq3Ajz2qxN6R4IEiQfaxnWmODjRmkqTjgXhw
         ypDxtEyRQigcH5ZNHiqeOf8C2w9NvElhP9SQzu0t5s3gHjffQ5TUvSEGW5cGfdrIzgpg
         aMUYwClVbq4csTH5PGZXF37SwN4a+HwnG1XGv/h6MNGyTUUqBXwZOnnOsZC69FAqTTBz
         hWT7GOYterUtRaVS+ghMjO9bxQ8vHkQBWxxg9brGbg6jv+5NJ/v8GTgISIxFdA+O+v/V
         VQ2g==
X-Gm-Message-State: AC+VfDxM5QDb69qf655+eZUQIQ0WPr2mikySPPAmGY/jlivax2u8FSjs
	209W3qTaAXHrifpOneXWVM8tB4gbKV4=
X-Google-Smtp-Source: ACHHUZ7LcazyPUj4SmO4EW0/HnuQ/FRoRzlGHZJlI/pdWfG1Uf6DEWiEzUZ08wXX4vkiyNd/Enq3ZQ==
X-Received: by 2002:a0d:e84b:0:b0:565:f045:18c3 with SMTP id r72-20020a0de84b000000b00565f04518c3mr5823623ywe.20.1685531623738;
        Wed, 31 May 2023 04:13:43 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 33/36] libgphoto2: Edit out sysroot from CC variable in configure
Date: Wed, 31 May 2023 07:13:06 -0400
Message-Id: <20230531111309.2454603-33-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103062

From: Khem Raj <raj.khem@gmail.com>

Configure emits HAVE_CC variable to be used in sourcecode and its built
from CC env var, CC in OE contains buildpaths in --sysroot option,
therefore edit this option out in configure.ac itself and remove all
other workarounds to fix this issue in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c0a344ab713d213933d59875f74ce89612c877c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


