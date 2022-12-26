Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9077DC4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 03:25:27 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.130540.1672025123417175110
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 19:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ne9BJOdX;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id o2so4176622pjh.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 19:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr+reDitv3u4+bePwhS6cRkO9S1Hcp8+ClR7WgXjwe4=;
        b=ne9BJOdXDgzxNN6uEHgQ2mAdD4pl7AS9tnB1XcGDu99VIAaHzeQlCIP0HW1LC37NCP
         3bQhHz1cl4Z9YvYiziaYhRlqkaeySonNIiNfOSWc2LPcmvN09V/4zgX/7r7UB76IlJce
         04ZG3ng4pijWcEacaTHsQ2RpyPnFXItblpXKDQ+i1dUusEVbNZaKaqFbulUKisORfa0M
         7pJ0A8uV3S7wpt9T/qNmOYzi50oXk0dqbgoiPT96vtqdTNrORG/Le9xNXbIQMxtNoc7A
         Ryv9YUUzHCScCWrJCRA8Bu1nvKedkntocvZvuhX/+59zsjf64zm4U75pO+LJ99KJAK4p
         +y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr+reDitv3u4+bePwhS6cRkO9S1Hcp8+ClR7WgXjwe4=;
        b=LZbMH0O81EVsbc3MYtBw4QoUiP1eILRlSzpLoYTaRvlhoump3IyHIIPhsYByJr7cvH
         ZRtzJ0FyB4ikBIchMVEM1hw/9iPI4DmzTBCt/8C4/sDTgeFJFzgS2r7YKazqn5eV7ZMn
         3CUf9QY1P0QzyGvT65JLJCgLr7V6lYwoJlZ3fZMGw3JamuJNjca2LV5X3IIef4BowTIu
         CtlL1FvcwA4rGlyg0v4AivJVwP/9eAkcrUQbp4PYNfsMZ9uYAd/iI8dnWtnMcX26o/4h
         HVeMX0C7Ov1RcqxL6yZ0SrebR85XvagkiC/N03Vo3NCHwY00EiXU2rgJx9PozBn+cL+i
         4ftA==
X-Gm-Message-State: AFqh2krsMJdDmNqwtctdSnPkI+sCn84HRnZfpO5Dv1p/jr9H0Y3WVqv/
	rw3+vdG72+egdlbrVWNyxkEbQN/o/6Q=
X-Google-Smtp-Source: AMrXdXtb9qYbktP3DZa70NgGBn8gGMpBsEDSmd2arujxFwETLyErgZTjhRGN7EAQbu42ZYGTwi26Og==
X-Received: by 2002:a17:902:e801:b0:190:d283:7faf with SMTP id u1-20020a170902e80100b00190d2837fafmr24859126plg.13.1672025122426;
        Sun, 25 Dec 2022 19:25:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b0017f74cab9eesm5911053pln.128.2022.12.25.19.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 19:25:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Alias lseek64/open64/ftruncate64 on musl systems
Date: Sun, 25 Dec 2022 19:25:20 -0800
Message-Id: <20221226032520.3637522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 03:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100234

This ensures it can keep building with newer musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 1a7cce2ea1..4e285aea7e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://sys_futex.patch \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
+           file://lfs64.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "ffacf84e74daf249ad64b9573d79a4e882f66b004614f8b33bfcb14a8e25da1d"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
new file mode 100644
index 0000000000..9867908c6c
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/lfs64.patch
@@ -0,0 +1,19 @@
+--- a/storage/connect/os.h
++++ b/storage/connect/os.h
+@@ -2,13 +2,15 @@
+ #ifndef _OS_H_INCLUDED
+ #define _OS_H_INCLUDED
+ 
+-#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__APPLE__)
++#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__APPLE__) || (defined(__linux__) && !defined(__GLIBC__))
+ typedef off_t off64_t;
+ #define lseek64(fd, offset, whence) lseek((fd), (offset), (whence))
+ #define open64(path, flags, mode)   open((path), (flags), (mode))
+ #define ftruncate64(fd, length)     ftruncate((fd), (length))
++#ifndef O_LARGEFILE
+ #define O_LARGEFILE 0
+ #endif
++#endif
+ 
+ #ifdef _AIX
+ #ifndef O_LARGEFILE
-- 
2.39.0


