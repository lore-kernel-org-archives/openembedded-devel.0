Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A5CC4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 07:46:19 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.37606.1672472773291455040
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 23:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TyMpjafj;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e10so1498919pgc.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 23:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UEXs5CCx3Ku+JNrvlkeiWCV2XI5LmZx6BeKNCM7Jdc=;
        b=TyMpjafj9d8ae4/HJ9UDZdK3t2RVQPLng17I5r/EEaK8coKNoZKA2NZi+cQuIPjr/8
         Qx2vdECjxls9iMeEIwFKH9+eCIoyCS9My9/3H+xTUx9fj7ISGtZuW7Lf2Yh6hpe3TRod
         9VWj/zSkvYyChGV73XVTO3ud4IjxHQ1MtcWcHOAzImxpzEVvIXGwfTc+Syf/UdE1nneu
         pCDZub+56P8h/BN7K5kdvs+2KeMjQqyOtJemP6RX2Phd+ECZe0Rv3aONRaL9y3GXJjHo
         NxOnNPVG0/QjJJJdBy5/zZZjp9AycczQC8tbZF8p5WQD+si3yzn5E4pNNrdcFGsDWUMW
         Z+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UEXs5CCx3Ku+JNrvlkeiWCV2XI5LmZx6BeKNCM7Jdc=;
        b=TfcSRkAXZozgM/cOC5Gg67NGYhKft4xNIa6rscV82O5gfbYMZf6UOXwk4UjKzjAPCn
         RSKdYHN49HmH39NRRciZ+LiInEZ9nRmNVywm63tHEOPbktseZARl/x1BsiF1cznX0Zau
         96ye3/YPqCwEFmLbdWsyLb5d9HBluQlsbK3n/JXj5NxUhtWerZCB5js0s2nlOLNNJyLK
         5nvGZ7wk1e1lx5Q/0B/jX7yP6hkBh9bgLV7YtjKPvTGoUE3NPBnFmbrSemLZdGoA2SEL
         bK2nGzuAMtz2DRVgk6GEOxmhxF1/gAnsx/Lyo1v2PQBE7MmlI5bhPuLXbVe0GS3t43RI
         NfbA==
X-Gm-Message-State: AFqh2kqFza5E9O28HIE0JCvRslhCA9ZLnraW5ZiNfctkAQly5CnBiStY
	d3Xo5zgYQbTpZZjRzPUAFBa6XJPW9a0=
X-Google-Smtp-Source: AMrXdXuipaUClH7lu3BrszuE27wf0K/oqsPQ9ASIuzA3lOwCTfeun1XwXDZENH7jcblKXhSPxv2jXA==
X-Received: by 2002:a62:18d6:0:b0:581:710e:56ad with SMTP id 205-20020a6218d6000000b00581710e56admr14392321pfy.23.1672472772184;
        Fri, 30 Dec 2022 23:46:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78bda000000b0056bbeaa82b9sm3936132pfd.113.2022.12.30.23.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 23:46:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] boinc-client: Fix build when using 64bit time_t
Date: Fri, 30 Dec 2022 23:46:08 -0800
Message-Id: <20221231074608.3088753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 07:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100319

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Do-not-undefine-_FILE_OFFSET_BITS.patch | 59 +++++++++++++++++++
 .../boinc/boinc-client_7.20.4.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch b/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch
new file mode 100644
index 0000000000..846fb099dc
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/0001-Do-not-undefine-_FILE_OFFSET_BITS.patch
@@ -0,0 +1,59 @@
+From 4e5c5a245f248976ea55fe1f805badb0cb1bb072 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Dec 2022 23:41:36 -0800
+Subject: [PATCH] Do not undefine _FILE_OFFSET_BITS
+
+This does not work when we want to use 64bit time_t in glibc
+therefore let system decide on defining these macros
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ client/client_types.cpp  | 9 ---------
+ client/hostinfo_unix.cpp | 9 ---------
+ 2 files changed, 18 deletions(-)
+
+diff --git a/client/client_types.cpp b/client/client_types.cpp
+index 2977ef7863..7653517302 100644
+--- a/client/client_types.cpp
++++ b/client/client_types.cpp
+@@ -22,15 +22,6 @@
+ #include "zlib.h"
+ #else
+ #include "config.h"
+-// Somehow having config.h define _FILE_OFFSET_BITS or _LARGE_FILES is
+-// causing open to be redefined to open64 which somehow, in some versions
+-// of zlib.h causes gzopen to be redefined as gzopen64 which subsequently gets
+-// reported as a linker error.  So for this file, we compile in small files
+-// mode, regardless of these settings
+-#undef _FILE_OFFSET_BITS
+-#undef _LARGE_FILES
+-#undef _LARGEFILE_SOURCE
+-#undef _LARGEFILE64_SOURCE
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <zlib.h>
+diff --git a/client/hostinfo_unix.cpp b/client/hostinfo_unix.cpp
+index ff0b596221..0ad6841b39 100644
+--- a/client/hostinfo_unix.cpp
++++ b/client/hostinfo_unix.cpp
+@@ -26,15 +26,6 @@
+ 
+ #if !defined(_WIN32) || defined(__CYGWIN32__)
+ 
+-// Access to binary files in /proc filesystem doesn't work in the 64bit
+-// files environment on some systems.
+-// None of the functions here need 64bit file functions,
+-// so undefine _FILE_OFFSET_BITS and _LARGE_FILES.
+-//
+-#undef _FILE_OFFSET_BITS
+-#undef _LARGE_FILES
+-#undef _LARGEFILE_SOURCE
+-#undef _LARGEFILE64_SOURCE
+ #include <iostream>
+ #include <vector>
+ #include <string>
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
index 4cbbca23f2..a16117b993 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
@@ -34,6 +34,7 @@ BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
+           file://0001-Do-not-undefine-_FILE_OFFSET_BITS.patch \
 "
 
 inherit gettext autotools pkgconfig features_check systemd
-- 
2.39.0


