Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A50CC25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 01:52:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.11859.1660528366811964959
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 18:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dfFWilfS;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id f192so5600599pfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 18:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=esnbr85CUxnijlLANo6YA8dDWHYgVCCN4asGvn8298Q=;
        b=dfFWilfSO+a8tDNRsy+cun/6byBcV7yIlJEa9SLuj/qo0hhWmhD/v+2MWK1UwVl59D
         N0azZwOJvVQORfU2iiW9Bew1wCc8a8Jw65E1ENpOdu/ZwMJmGnYT9mWv/zB10oUDb1/r
         ZN3FjXOHWxtPsYFC3vW92ftfoDlwjw6U9u644VPCPn7VJIT3sRwmSTmqeItdXUTu8zk2
         QfXrM7sDzSlRgj7wT5ldNzpS3Ul/qijmOENgxI5U/TMmre93HVXm/DRykpBzbm/lZTaM
         WOZHSPiUJ3OxV4M8Vu26MYDYQbbDs9uet8nmkmmGx3gFCD33/UM27lXd29Z+Fh8vflS3
         LA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=esnbr85CUxnijlLANo6YA8dDWHYgVCCN4asGvn8298Q=;
        b=I6chJxQEWDoiadl3hahTmXohimA3uQmF5OmpXCktBq8dMm53VsH4MpKj0EMJjtfFkP
         Vndq6i15PwI+lS3eNzZecAp7h1y6jjERPRhAkgjocMHvqyo3ZgEpYaavzIVEZrlDLg9x
         7BlUuFV6WYXes/lodwly0vrFP7JY2AMJyx3ABqEF1zNvX7xFaqIgOndw1UwNYNvqPizd
         we3JncaDz5+cVyVGWcxupVMbuajzA3xTJdrtEJEt5oiO7GeOHnRRV5Fx8vI+j0tf1rmS
         tf9HxXdukMEUTieXQWvun8JqUU9M/FSAP6ah6aVOg6glFRRTzlKhuXrJ4dFLRhk93V6j
         Dvqw==
X-Gm-Message-State: ACgBeo0lCoN4Gc/cGYol8B3LTZHVeIUO85jwimRfW9aVMG20Nt61TJdN
	BGXQrNsqG1WCYTLfJEoC0mYJxjG2/MmvrA==
X-Google-Smtp-Source: 
 AA6agR7Y77VXxCHdpJKZLWgcN26pZJlLYbCAoZ4el1xivHjfgr/z1NBQiOIoSvRawx6af2kdHNjyUw==
X-Received: by 2002:a63:10c:0:b0:41d:cd13:ee22 with SMTP id
 12-20020a63010c000000b0041dcd13ee22mr11691778pgb.269.1660528365429;
        Sun, 14 Aug 2022 18:52:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a170902654e00b0016ed715d244sm5955587pln.300.2022.08.14.18.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:52:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] libmpd: Fix function returns and casts
Date: Sun, 14 Aug 2022 18:52:42 -0700
Message-Id: <20220815015242.1655923-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 01:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98232

Fixes build with clang-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../musicpd/libmpd-11.8.17/glibc-2.20.patch   | 10 -------
 ...-integer-from-pointer-without-a-cast.patch | 27 +++++++++++++++++++
 ...etween-pointer-and-zero-character-co.patch | 27 +++++++++++++++++++
 .../libmpd/0003-include-config.h.patch        | 26 ++++++++++++++++++
 .../musicpd/libmpd_11.8.17.bb                 |  5 ++--
 5 files changed, 83 insertions(+), 12 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd/0001-fix-return-makes-integer-from-pointer-without-a-cast.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd/0002-fix-comparison-between-pointer-and-zero-character-co.patch
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/libmpd/0003-include-config.h.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch b/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch
deleted file mode 100644
index 4a2b25cdd9..0000000000
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd-11.8.17/glibc-2.20.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- libmpd-11.8.17/src/libmpd-internal.h.orig	2014-09-30 04:08:50.963292427 +0200
-+++ libmpd-11.8.17/src/libmpd-internal.h	2014-09-30 04:08:30.595292223 +0200
-@@ -21,6 +21,7 @@
- #define __MPD_INTERNAL_LIB_
- 
- #include "libmpdclient.h"
-+#include "config.h"
- struct _MpdData_real;
- 
- typedef struct _MpdData_real {
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd/0001-fix-return-makes-integer-from-pointer-without-a-cast.patch b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0001-fix-return-makes-integer-from-pointer-without-a-cast.patch
new file mode 100644
index 0000000000..dd50a71f7d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0001-fix-return-makes-integer-from-pointer-without-a-cast.patch
@@ -0,0 +1,27 @@
+From f0f8cc5ac6f1fa9cb5c98cb0b3688f44c64fa8ee Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 19 Jul 2017 14:22:48 +0200
+Subject: [PATCH 1/3] fix return makes integer from pointer without a cast
+
+Upstream-Status: Pending [https://github.com/archlinux/svntogit-packages/tree/packages/libmpd/trunk]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libmpd-playlist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libmpd-playlist.c b/src/libmpd-playlist.c
+index c3c30ec..64c64ea 100644
+--- a/src/libmpd-playlist.c
++++ b/src/libmpd-playlist.c
+@@ -780,7 +780,7 @@ int mpd_playlist_load(MpdObj *mi, const char *path)
+ 	if(mpd_lock_conn(mi))
+ 	{
+ 		debug_printf(DEBUG_ERROR,"lock failed\n");
+-		return NULL;
++		return MPD_LOCK_FAILED;
+ 	}
+     mpd_sendLoadCommand(mi->connection,path);
+ 	mpd_finishCommand(mi->connection);
+-- 
+2.37.2
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd/0002-fix-comparison-between-pointer-and-zero-character-co.patch b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0002-fix-comparison-between-pointer-and-zero-character-co.patch
new file mode 100644
index 0000000000..66d921ed6d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0002-fix-comparison-between-pointer-and-zero-character-co.patch
@@ -0,0 +1,27 @@
+From fa3b3b3759986171a85230ba8b53764beafdb37f Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 19 Jul 2017 14:40:00 +0200
+Subject: [PATCH 2/3] fix comparison between pointer and zero character constant
+
+Upstream-Status: Pending [https://github.com/archlinux/svntogit-packages/tree/packages/libmpd/trunk]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libmpd-database.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libmpd-database.c b/src/libmpd-database.c
+index 2480d5e..edafc0a 100644
+--- a/src/libmpd-database.c
++++ b/src/libmpd-database.c
+@@ -961,7 +961,7 @@ MpdData * mpd_database_get_directory_recursive(MpdObj *mi, const char *path)
+ 		debug_printf(DEBUG_WARNING,"not connected\n");
+ 		return NULL;
+ 	}
+-	if(path == '\0' || path[0] == '\0')
++	if(path == NULL || path[0] == '\0')
+ 	{
+ 		debug_printf(DEBUG_ERROR, "argumant invalid\n");
+ 		return NULL;
+-- 
+2.37.2
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd/0003-include-config.h.patch b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0003-include-config.h.patch
new file mode 100644
index 0000000000..805204c0b2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd/0003-include-config.h.patch
@@ -0,0 +1,26 @@
+From 67eae4f20af9aaaf693025d95a05527a2c1fed1a Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Wed, 19 Jul 2017 14:38:43 +0200
+Subject: [PATCH 3/3] include config.h
+
+Upstream-Status: Pending [https://github.com/archlinux/svntogit-packages/tree/packages/libmpd/trunk]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libmpd-strfsong.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libmpd-strfsong.c b/src/libmpd-strfsong.c
+index 7d47bed..76fa3ff 100644
+--- a/src/libmpd-strfsong.c
++++ b/src/libmpd-strfsong.c
+@@ -28,6 +28,7 @@
+ #include <unistd.h>
+ #include <string.h>
+ #include <glib.h>
++#include <config.h>
+ #include "libmpd.h"
+ #include "libmpd-internal.h"
+ 
+-- 
+2.37.2
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index d5ee395af8..3a4b3aa1a0 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -5,9 +5,10 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
 
 SRC_URI = "http://www.musicpd.org/download/${BPN}/${PV}/${BP}.tar.gz \
-    file://glibc-2.20.patch \
+           file://0001-fix-return-makes-integer-from-pointer-without-a-cast.patch \
+           file://0002-fix-comparison-between-pointer-and-zero-character-co.patch \
+           file://0003-include-config.h.patch \
 "
-SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
 SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
 
 inherit autotools pkgconfig
-- 
2.37.2


