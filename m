Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CD8C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 03:31:01 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3671.1707795055360286360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 19:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E/58hciL;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so3012468a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 19:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707795054; x=1708399854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+v8gY60VDdc6Wy6feX9/3/PMYt4JCV4iLKag4eA4cI=;
        b=E/58hciLx2fu7PoUOOEAOtTsCtByQCg3fYEIZHvcp89olf9n0TArWikDuzvvQDPEQf
         QLk89iPABiG2ok/XzWWvMn5kjJuDFl4/2+CNdMJCWSm6RNQJZRYU/lutSlubEN3fj2J0
         a9IZwyjCfpeNlzjgc7MzJb8y+BPRTKhO1gxfBDobIqZpq/qVW7g/fPCf/b478ZEfo7NS
         BKfjJZhamC2uHzSc0OiaRvQUkKtviFGPFpC3jSogn14mqblDJ2kmCj/sI+5eQxCHf/q3
         QycjFFFAEVG6GrsBoc5eR6O2zss6LgUKBxQlzKtSw7VJT0ohvBcQRU9qj73nqvAjXQ5O
         K6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707795054; x=1708399854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+v8gY60VDdc6Wy6feX9/3/PMYt4JCV4iLKag4eA4cI=;
        b=T+nUvSbr07nTxI6RetgruX2HlPa/cylmnXMOF+9YR0xTkOWi8vMwh4eEZ7XTLpv3up
         xpKXsW4PCiW84G8zwYuTz9WD/M+dmaCt8ELjnfsWh/vDMpkDVuk0kzAJobkqTWWSYpvT
         ipOb+DK0r1GC0ifgvzGarTWRx4Y5zZgQod1jjHCGxoRRJubERIS3HilfWOMTcYUznkcA
         2qjGjzpkKb9Uevdum+YjOYPhaaXt91Il3nh8wids2f5ayIKyWRux0bZVUkaoOb+J2f6B
         sHEqAEc8CczQhXnU05Ngyn6T1gMiMT/CQiWSUXQyt2/VxQb+jjCGCGIWg4xfMqheqXhg
         eXhw==
X-Gm-Message-State: AOJu0Yzn9Nprn6y8bUgNVcYZ11oVexEJP5ZXKh5aKoMnkqvBmlQS2I06
	ft+QC+jYQlvq6E+j/9ysHhxyIIG9WMWVwcClD7pNCICPrAKNTIXK4QelvRTnMWM=
X-Google-Smtp-Source: AGHT+IFRY08aCoqROghuIO53Dh2SSTFNEgS27JADvCwdE63pPDdvWZtd2LlmQ+cFsWcumufyjH5hSQ==
X-Received: by 2002:a05:6a20:ce4e:b0:19c:9c1d:6090 with SMTP id id14-20020a056a20ce4e00b0019c9c1d6090mr11509159pzb.6.1707795054264;
        Mon, 12 Feb 2024 19:30:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDXgf0l47m1TTj3j7BS5LHn1kMEiFu72sHTrEqb14P18ge5uV7twChkdWZ/Y+7ZDDyhpYD16WbXdujZOwcZC8i2w==
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::fffa])
        by smtp.gmail.com with ESMTPSA id lo5-20020a170903434500b001d8ecf5ff6csm1051906plb.147.2024.02.12.19.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 19:30:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libnfs: Add cmake checks for sys/uio.h
Date: Mon, 12 Feb 2024 19:30:51 -0800
Message-ID: <20240213033051.2910281-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 03:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108719

Fixes build issues with latest compiler e.g. gcc-14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 .../0001-cmake-Test-for-sys-uio.h.patch       | 44 +++++++++++++++++++
 .../libnfs/libnfs_5.0.3.bb                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
new file mode 100644
index 0000000000..de3ab82292
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-cmake-Test-for-sys-uio.h.patch
@@ -0,0 +1,44 @@
+From d0fa719d49f38777911a8e99717f2d4b30811080 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Feb 2024 19:24:54 -0800
+Subject: [PATCH] cmake: Test for sys/uio.h
+
+writev() API is used in few places and it will need including sys/uio.h
+for getting the funciton signature
+
+Upstream-Status: Submitted [https://github.com/sahlberg/libnfs/pull/440]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/ConfigureChecks.cmake | 1 +
+ cmake/config.h.cmake        | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/cmake/ConfigureChecks.cmake b/cmake/ConfigureChecks.cmake
+index 0258fc8..c26a02d 100644
+--- a/cmake/ConfigureChecks.cmake
++++ b/cmake/ConfigureChecks.cmake
+@@ -22,6 +22,7 @@ check_include_file("sys/stat.h" HAVE_SYS_STAT_H)
+ check_include_file("sys/sysmacros.h" HAVE_SYS_SYSMACROS_H)
+ check_include_file("sys/time.h" HAVE_SYS_TIME_H)
+ check_include_file("sys/types.h" HAVE_SYS_TYPES_H)
++check_include_file("sys/uio.h" HAVE_SYS_UIO_H)
+ check_include_file("sys/vfs.h" HAVE_SYS_VFS_H)
+ check_include_file("unistd.h" HAVE_UNISTD_H)
+ check_include_file("utime.h" HAVE_UTIME_H)
+diff --git a/cmake/config.h.cmake b/cmake/config.h.cmake
+index 4016c6c..6263896 100644
+--- a/cmake/config.h.cmake
++++ b/cmake/config.h.cmake
+@@ -90,6 +90,9 @@
+ /* Define to 1 if you have the <sys/types.h> header file. */
+ #cmakedefine HAVE_SYS_TYPES_H
+ 
++/* Define to 1 if you have the <sys/uio.h> header file. */
++#cmakedefine HAVE_SYS_UIO_H
++
+ /* Define to 1 if you have the <sys/vfs.h> header file. */
+ #cmakedefine HAVE_SYS_VFS_H
+ 
+-- 
+2.43.1
+
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
index 068c827f70..8a470ee2fb 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 SRC_URI = " \
 	git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
 	file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+  file://0001-cmake-Test-for-sys-uio.h.patch \
 "
 SRCREV = "4379837536d9eac537810dc7b13071136049b22a"
 S = "${WORKDIR}/git"
-- 
2.43.1


