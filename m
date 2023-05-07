Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF430C7EE24
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 18:30:23 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.72583.1683484217685510464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 11:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=O5Z1DdNJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ab0c697c2bso35257865ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683484217; x=1686076217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hL135Hy6xem+yolMMrJJJRggQZaGFhQKDd0i/bJr9jY=;
        b=O5Z1DdNJjQAUxcIUPREGz4UoDER9qRSa6jYhaRiK3LrF7HWaJNpmuNn0ReexU/Wz0b
         gwe0/rOrNVwwkolLMeSAkB+5DNlVET50AJuyEWjhauwrfRK6e3XPWn7WvUHWTwYzJkmP
         JksM3ypejMy0BNEn7tPyjJNN7gMmc693QhweAuBvjxVNR9QScFS4lilSeV5D6ApIA+Oq
         jNXjO0ScSmpC9uJzJhGu/JhiJrdeluiJZ+sW6u5/yhJwziq3vdSGXvpH0zW8eJHNt+ag
         MC+7AgeExhst6HYrz+uDcaoTQ3+/g3vsKU03WaCutw5EBCLRhAfe27zBH7xEGECePVjc
         kEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683484217; x=1686076217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL135Hy6xem+yolMMrJJJRggQZaGFhQKDd0i/bJr9jY=;
        b=QVOEqzy4nygPoMOb9+shcncm9w8vOzq6mqpBL3nbyshlak4V+oyefYwcmBNDcOwR6V
         /lWd+/Pn8IwyANBTgylzOYMUzELO/nZ6jN7YINDHXeOtoEkCUHVg3RQJugZ7WL0LSMSa
         btl/HLG2Uua8VUDiHdNSoptEvnRFProDSYTJMss7zQQ6d5zVe9xq50XzoZedIcR5BOrv
         hPsEMrafsMAS69aD3cbMTvhYRLKeNo6gYm5QbTltrchpucPRhwOK7SKxgdnF4D1ClPTr
         z3ZVKMX0J+zQrXSyvrIbOEtkupTKF6+eAVgh7zg1ci74YhDdDjwE4/j80m5A1pFRqSDI
         xHCw==
X-Gm-Message-State: AC+VfDy3QxvKAZiNt688PpzyEuCxSRG8DCtwglgeaWtP9JjJ+/EFpXK3
	lzpkADMrlCOoiAqIu/Vs3rUP955o01OcXw==
X-Google-Smtp-Source: ACHHUZ6vDyC2MSrMj/O6aR+TSzTihuzfqX6OPlrWPmBfNBdTE8mB5F6rVDREmAp26wzQPn4lv7sKaA==
X-Received: by 2002:a17:903:182:b0:1a6:91f0:f7fd with SMTP id z2-20020a170903018200b001a691f0f7fdmr9715232plg.60.1683484216765;
        Sun, 07 May 2023 11:30:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902b58d00b001a6d4ea7301sm5377421pls.251.2023.05.07.11.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 11:30:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libcdio: Drop need for LIBCDIO_SOURCE_PATH
Date: Sun,  7 May 2023 11:30:14 -0700
Message-Id: <20230507183014.2466816-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507183014.2466816-1-raj.khem@gmail.com>
References: <20230507183014.2466816-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 18:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102361

LIBCDIO_SOURCE_PATH is defined with `pwd` which encodes absolute paths
into generated artifacts e.g. cdio_config.h which is flagged in build QA

WARNING: libcdio-2.1.0-r0 do_package_qa: QA Issue: File /usr/include/cdio/cdio_config.h in package libcdio-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...RCE_PATH-by-dropping-STRIP_FROM_PATH.patch | 43 +++++++++++++++++++
 .../libcdio/libcdio_2.1.0.bb                  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch b/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
new file mode 100644
index 0000000000..0b25dff75e
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
@@ -0,0 +1,43 @@
+From 08c1768aaeea86c522c0ef1705b9b6d434ebd3ae Mon Sep 17 00:00:00 2001
+From: Chris Lamb <chris@chris-lamb.co.uk>
+Date: Fri, 28 Jul 2017 11:49:13 +0100
+Subject: [PATCH] Drop LIBCDIO_SOURCE_PATH by dropping STRIP_FROM_PATH Doxygen
+ setup; it's not used as FULL_PATH_NAMES = no
+
+Source: https://sources.debian.org/data/main/libc/libcdio/2.1.0-4/debian/patches/Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac            | 5 -----
+ doc/doxygen/Doxyfile.in | 2 +-
+ 2 files changed, 1 insertion(+), 6 deletions(-)
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -557,11 +557,6 @@ AC_SUBST(HAVE_SOLARIS_CDROM)
+ AC_SUBST(HAVE_WIN32_CDROM)
+ AC_SUBST(HAVE_OS2_CDROM)
+ 
+-LIBCDIO_SOURCE_PATH="`pwd`"
+-AC_DEFINE_UNQUOTED(LIBCDIO_SOURCE_PATH, "$LIBCDIO_SOURCE_PATH",
+-	[Full path to libcdio top_sourcedir.])
+-AC_SUBST(LIBCDIO_SOURCE_PATH)
+-
+ AC_CHECK_FUNCS( [chdir drand48 fseeko fseeko64 ftruncate geteuid getgid \
+ 		 getuid getpwuid gettimeofday lseek64 lstat memcpy memset mkstemp rand \
+ 		 seteuid setegid snprintf setenv strndup unsetenv tzset sleep \
+Index: b/doc/doxygen/Doxyfile.in
+===================================================================
+--- a/doc/doxygen/Doxyfile.in
++++ b/doc/doxygen/Doxyfile.in
+@@ -138,7 +138,7 @@ FULL_PATH_NAMES        = NO
+ # If left blank the directory from which doxygen is run is used as the
+ # path to strip.
+ 
+-STRIP_FROM_PATH        = @LIBCDIO_SOURCE_PATH@
++STRIP_FROM_PATH        =
+ 
+ # The STRIP_FROM_INC_PATH tag can be used to strip a user-defined part of
+ # the path mentioned in the documentation of a class, which tells
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
index 62004ac440..8562462cba 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://0001-Fix-a-few-Werror-format-security-errors-with-mvprint.patch \
+           file://Drop-LIBCDIO_SOURCE_PATH-by-dropping-STRIP_FROM_PATH.patch \
            "
 
 SRC_URI[md5sum] = "aa7629e8f73662a762f64c444b901055"
-- 
2.40.1


