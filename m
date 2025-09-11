Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7165CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 07:02:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.40077.1757574174309397602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 00:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nq1llbAC;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0473327e70so56503966b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 00:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757574173; x=1758178973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oe5h5Mn3SASn5Fah238fA5FMWvH71GizyCFeAxvOgiU=;
        b=Nq1llbACQv37YWplLutI22N0hdjos9rO+RFCt774DcPvqoJl2mZzqefVu7BmTP0NnM
         XJYVLb4T7exT6FP/I9uIxpWARauYcZUFzB5JzUYoTMEu+NEXkzkSIuFvnXJD092/W2Bi
         cWtwRWtiqNEMARtfH7bSzTrtAz89yeRUVvjJEGtQkrrznqfQEezOKO7MZDlHR7RLRvBi
         rQRcHKAs6+HNQIK4WCIq01lJbLzVSz/Bnx2awAX4m/iKtjoS0njUcMQJv3HFBSoTzJV0
         YQULS1TZ7NBj+DAKmigbkJ6j/RXy4yw9xtsOJaDmnuuAXvEz2VcT3B5/uriQF6BoCrIm
         EwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574173; x=1758178973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oe5h5Mn3SASn5Fah238fA5FMWvH71GizyCFeAxvOgiU=;
        b=CUi1e5FOyqJ/U7SUueecJ/H3643A8GIy2YI2ByDYagVHBmjdO6tuvdNpDAvLiDE20G
         UpxPBaeDNQ64DJw3aT3fSO+CSu6PVVt5EIP+KoqeuqWtucYofkfYp19O6wQeiHQ30U3i
         FKic+KnXS4XC64d/xi864DjOSJci5d+ykf/v0ocpKJqdTJzTHzP5zHHbSXj3gxOklErC
         n1zezstta0Le753zcR2f2yPWDtiBnWilwHkR6sIgNNBR8yPMcJi4ulEiC6t6t74JBbC7
         gv19tlW7NKkYZPULyCC6dqPC3kDk7PdFsgjnUvIe87h8SSge5/TrZ7wfogC+9U1uMG8m
         lFbw==
X-Gm-Message-State: AOJu0YzHCwymOoul22Tz9LtOO0CseXxPnHzyVaNnDnqkTTOoAnyXBrvA
	KR1kg4BoZfegqUeE9A7pTlY8wRyvFpjxyaNz7FYRuskPeFPvxUnCzoszkBbyVA==
X-Gm-Gg: ASbGncvSDngCuZ3SmP7ejBDXEuaX9piY0ZR3B8aoAjY/JBCIQosMriWDtqs9u753MbK
	Te0g1rNsOfOEpuNv0ij3SsAaDb7eD5vuE3tE0eqqYDtbMlY9L+zVT6vIyesSbj7rENbG+g5xsGk
	P4/6DbA8tqN+S9mwxy3Tdc6JFwIxpA3Mh+15LlHknpIFRRV5V5+tEAhIxv51Iqm58R8GWMjV1So
	ryCBWz2ReGky5TjKTPsgJ+7T2Mgj97FzDrIxm1WkCy9dj9fOQLz7BXCb4YgA0oZNZhpsq036mA1
	6JUlxI+8XDapAlUVi97PIq3+Ae8GR5WgYFVtx9r2l93GviVamu72DFgMW9k7IHyOnBf/WVaCDUd
	NS8ud5sL0AhdnbR98JVQuLRJ9mKO/JtE=
X-Google-Smtp-Source: AGHT+IH9Btsn7ol5GwL9ivloVncXAIwIpORbbeEcXi67HYxf4DJg4E0BXloU9aaTvNAfyMwmbh9bFA==
X-Received: by 2002:a17:906:ae81:b0:b07:88ef:fe1c with SMTP id a640c23a62f3a-b0788f00483mr385205566b.44.1757574172304;
        Thu, 11 Sep 2025 00:02:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334ed29sm64547766b.107.2025.09.11.00.02.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 00:02:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH 1/2] libwnck: fix build failure for lib32-libwnck
Date: Thu, 11 Sep 2025 09:02:50 +0200
Message-ID: <20250911070251.1112836-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 07:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119353

From: Changqing Li <changqing.li@windriver.com>

Fix the following compile error:
../../sources/libwnck-2.31.0/libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
 4355 |                                                 &tv_sec, &tv_usec);
      |                                                 ^~~~~~~
      |                                                 |
      |                                                 long int *
In file included from /build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn.h:32,
                 from ../../sources/libwnck-2.31.0/libwnck/private.h:36,
                 from ../../sources/libwnck-2.31.0/libwnck/tasklist.c:40:
/build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
   84 |                                                            time_t            *tv_sec,
      |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ix-Wincompatible-pointer-types-error.patch | 42 +++++++++++++++++++
 .../recipes-gnome/libwnck/libwnck_2.31.0.bb   |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
new file mode 100644
index 0000000000..4e23f613aa
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
@@ -0,0 +1,42 @@
+From 01d9add9f9c25442329879d1c3513c68ed14a749 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 28 Aug 2025 10:29:59 +0800
+Subject: [PATCH] tasklist.c: fix -Wincompatible-pointer-types error
+
+Fix the following compile error:
+../../sources/libwnck-2.31.0/libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
+ 4355 |                                                 &tv_sec, &tv_usec);
+      |                                                 ^~~~~~~
+      |                                                 |
+      |                                                 long int *
+In file included from /build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn.h:32,
+                 from ../../sources/libwnck-2.31.0/libwnck/private.h:36,
+                 from ../../sources/libwnck-2.31.0/libwnck/tasklist.c:40:
+/build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
+   84 |                                                            time_t            *tv_sec,
+      |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~
+
+Upstream-Status: Inappropriate [ Latest master don't have this code ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libwnck/tasklist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
+index 4f0c6c4..758fc5f 100644
+--- a/libwnck/tasklist.c
++++ b/libwnck/tasklist.c
+@@ -4340,7 +4340,8 @@ sequence_timeout_callback (void *user_data)
+   WnckTasklist *tasklist = user_data;
+   GList *tmp;
+   GTimeVal now;
+-  long tv_sec, tv_usec;
++  long long tv_sec;
++  long tv_usec;
+   double elapsed;
+ 
+   g_get_current_time (&now);
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index d7f47002f8..5552d2e2b9 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -12,6 +12,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch"
+
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
 SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
 

