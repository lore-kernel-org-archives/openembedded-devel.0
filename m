Return-Path: <koen@dominion.thruhere.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98EDC54FB3
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 12:36:54 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.8412.1748176608690701208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 May 2025 05:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dominion-thruhere-net.20230601.gappssmtp.com header.s=20230601 header.b=ogY5biyF;
 spf=none, err=permanent DNS error (domain: dominion.thruhere.net, ip: 209.85.208.47, mailfrom: koen@dominion.thruhere.net)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso2900832a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 05:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dominion-thruhere-net.20230601.gappssmtp.com; s=20230601; t=1748176607; x=1748781407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqh3QD5r7dMKLDiaf6E7sGG1ckT9esGLYV5YC/PehY4=;
        b=ogY5biyFZPfAG/mprIZZ5wXD9PY6RSxR6H3u346RmQQucdeB6iUl42dPdycTQ0G30a
         1DIPzjtx4W49YvZmBqUT6U7Hfte+h13FRJVkdB5Ml1OrV3jtjIICRHYv898xFWiNdgS/
         X+RqxyastWENDCMxuI/qHkjs0FrdOS0UwTTV0PMMNZMRRNaqAJxvEEUa+rvrXCSj5w1I
         Aum1CV4S8EgU7+NCrzYwCgnoUcX+lN1cXsnUyCLq7/yUYoGIF8BRx+NXWFUjPlDKfw2c
         oBjPwBIwqoBcj7Buohhnbj/WEsQvvrUGvU/UevrxPbjOz1sfKVB6RVaSbn+u/NvmPwbK
         uMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748176607; x=1748781407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqh3QD5r7dMKLDiaf6E7sGG1ckT9esGLYV5YC/PehY4=;
        b=BUVjPV/cGcKU0wQ7q/GHJWclD4oD1llkH5Mh6qCbYRFSRDa4avU+9u4gD7jmWtlj9T
         x0IABw/0H1uBdEZYDkVuGkJBmpOQ3uqDRWeL7Ch+qD5r2AxaC5O0rUZZrcaX693mRn+E
         koUD8DERe2LEtORrz2taNruPy2fESHvfHbZOk5/EAU3QvmO0yQ1di0mD/pGylKekQSqI
         NX+KDyp9KqaI6r9Z6faCrHukSSDhbGG00TcQT8FEsuzInWycfU3xE8hJxG+JfCfMqthj
         LeO0DGc8UHLD9ZS/mTUbXf517lYLLUgD5xC2/s+LKW/jzGCN5dnjt4Nd2DnPmcinikoV
         eOLw==
X-Gm-Message-State: AOJu0Yz/L0aG4G923+HpeBOFPj7PJ2WFISqO3FEc0km/Rj5D5IRvhYAV
	/8GjKkD/enxkN7cbT+fQEX5Lz8mAtSIoU7HVciyncfYIUGQq9/p8hKh/ERQkTrLH+gzQrYA/9ck
	tUHjUiQ==
X-Gm-Gg: ASbGncuHDwiReYR4WsATxRxmdVm/9tPYzQEKq8epESNbXJrsGDqKY5063MxtlvRfTK4
	vq/lX9euBykWD5JlMYH0zut6KR17LygF1cir5Kq+r87we4oFIX5CmKwHpaRkE7FbKn3PyuNThXq
	NY5Xqrot27v5aJiGx4AK8c5ZRa43IakiyYwzSdr4N5eKYB7D4ukT/i1GebqC/GqkAbRtezffB8l
	79JXxgC6P77HdHDJHN3UQrlrSA1Bq6/PTEPT9jxsrOBFjJ7RsqHSo0T8t41z1dZFlh48NDGO/6U
	t8B/rH3CYk/S/gl7lVfD3WKddpargoGj9JpS5aoD2FTdAVq7Z2WfqzT0Qk8Vm4edTFcVv62D+yL
	wndPM6gACHg5EmrQaU7oRyg==
X-Google-Smtp-Source: AGHT+IHowR3w881iyu9qnk6pb5XJrt5awVBhox3qpqrYDwrQnN+dj6m0KxGUQEBJRiGUneAmFPhvjA==
X-Received: by 2002:a05:6402:5215:b0:604:7931:90a1 with SMTP id 4fb4d7f45d1cf-604793192e1mr1058588a12.30.1748176606552;
        Sun, 25 May 2025 05:36:46 -0700 (PDT)
Received: from localhost.localdomain (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6045e3917d3sm1144709a12.71.2025.05.25.05.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 05:36:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH] libwnck: update to 43.2 and fix build errors
Date: Sun, 25 May 2025 12:36:33 +0000
Message-Id: <20250525123633.2232417-1-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 12:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117617

This fixes the following build issue:

wnck-3.so.0.3.0.p/pager.c.o.d -o libwnck/libwnck-3.so.0.3.0.p/pager.c.o -c ../libwnck-43.2/libwnck/pager.c
| In file included from ../libwnck-43.2/libwnck/pager.c:34:
| ../libwnck-43.2/libwnck/pager-accessible-factory.h:19: warning: header guard '__WNCK_PAGER_ACCESSIBLE_FACTORY_H__' followed by '#define' of a different macro [-Wheader-guard]
|    19 | #ifndef __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
| ../libwnck-43.2/libwnck/pager-accessible-factory.h:20: note: '__WBCK_PAGER_ACCESSIBLE_FACTORY_H__' is defined here; did you mean '__WNCK_PAGER_ACCESSIBLE_FACTORY_H__'?
|    20 | #define __WBCK_PAGER_ACCESSIBLE_FACTORY_H__
| In file included from ../libwnck-43.2/libwnck/pager.c:35:
| ../libwnck-43.2/libwnck/workspace-accessible-factory.h:19: warning: header guard '__WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__' followed by '#define' of a different macro [-Wheader-guard]
|    19 | #ifndef __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
| ../libwnck-43.2/libwnck/workspace-accessible-factory.h:20: note: '__WBCK_WORKSPACE_ACCESSIBLE_FACTORY_H__' is defined here; did you mean '__WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__'?
|    20 | #define __WBCK_WORKSPACE_ACCESSIBLE_FACTORY_H__

And the subsequent build error caused by an OE-core patch to
startup-notification.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...caused-by-OE-core-changes-to-startup.patch | 43 +++++++++++++++++++
 ...40d59c32d7ebeb94d242436e3144cefc174a.patch | 40 +++++++++++++++++
 .../{libwnck3_43.0.bb => libwnck3_43.2.bb}    |  4 +-
 3 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.0.bb => libwnck3_43.2.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
new file mode 100644
index 0000000000..91e23c785b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch
@@ -0,0 +1,43 @@
+From 1df0f4ae8fd54bc1ae940dfafa701c84d068674d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 25 May 2025 12:24:16 +0000
+Subject: [PATCH] Fix build issue caused by OE-core changes to
+ startup-notification:
+
+../libwnck-43.2/libwnck/tasklist.c: In function 'sequence_timeout_callback':
+../libwnck-43.2/libwnck/tasklist.c:5034:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
+ 5034 |                                                 &tv_sec, &tv_usec);
+      |                                                 ^~~~~~~
+      |                                                 |
+      |                                                 long int *
+In file included from /build/angstrom/build/tmp/work/armv7at2hf-neon-angstrom-linux-gnueabi/libwnck3/43.2/recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn.h:32,
+                 from ../libwnck-43.2/libwnck/tasklist.c:40:
+/build/angstrom/build/tmp/work/armv7at2hf-neon-angstrom-linux-gnueabi/libwnck3/43.2/recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
+   84 |                                                            time_t            *tv_sec,
+      |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~
+
+It is caused by a patch of startup-notification in oe-core which is backported from upstream mailllist and changes the signature of function sn_startup_sequence_get_last_active_time().
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ libwnck/tasklist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
+index 7418f89..460e11d 100644
+--- a/libwnck/tasklist.c
++++ b/libwnck/tasklist.c
+@@ -5031,7 +5031,7 @@ sequence_timeout_callback (void *user_data)
+       WnckTask *task = WNCK_TASK (tmp->data);
+ 
+       sn_startup_sequence_get_last_active_time (task->startup_sequence,
+-                                                &tv_sec, &tv_usec);
++                                                (time_t *) &tv_sec, &tv_usec);
+ 
+       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
+ 
+-- 
+2.33.0
+
diff --git a/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch b/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
new file mode 100644
index 0000000000..2d526e7aba
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
@@ -0,0 +1,40 @@
+From ef0e40d59c32d7ebeb94d242436e3144cefc174a Mon Sep 17 00:00:00 2001
+From: correctmost <136447-correctmost@users.noreply.gitlab.gnome.org>
+Date: Thu, 20 Mar 2025 03:03:44 -0400
+Subject: [PATCH] build: fix -Wheader-guard warnings reported by clang
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libwnck/-/commit/ef0e40d59c32d7ebeb94d242436e3144cefc174a]
+---
+ libwnck/pager-accessible-factory.h     | 2 +-
+ libwnck/workspace-accessible-factory.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libwnck/pager-accessible-factory.h b/libwnck/pager-accessible-factory.h
+index 8e2fe30c..25220fc2 100644
+--- a/libwnck/pager-accessible-factory.h
++++ b/libwnck/pager-accessible-factory.h
+@@ -17,7 +17,7 @@
+  */
+ 
+ #ifndef __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
+-#define __WBCK_PAGER_ACCESSIBLE_FACTORY_H__
++#define __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
+ 
+ #include <atk/atk.h>
+ 
+diff --git a/libwnck/workspace-accessible-factory.h b/libwnck/workspace-accessible-factory.h
+index d2d4a84a..335b465b 100644
+--- a/libwnck/workspace-accessible-factory.h
++++ b/libwnck/workspace-accessible-factory.h
+@@ -17,7 +17,7 @@
+  */
+ 
+ #ifndef __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
+-#define __WBCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
++#define __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
+ 
+ #include <atk/atk.h>
+ 
+-- 
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
index c7f7989115..4342325f11 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
@@ -19,7 +19,9 @@ inherit gnomebase gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "905bcdb85847d6b8f8861e56b30cd6dc61eae67ecef4cd994a9f925a26a2c1fe"
+SRC_URI += "file://ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch;patch=1 \
+            file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
+SRC_URI[archive.sha256sum] = "55a7444ec1fbb95c086d40967388f231b5c0bbc8cffaa086bf9290ae449e51d5"
 
 # gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
-- 
2.39.5


