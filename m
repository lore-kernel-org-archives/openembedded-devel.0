Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0FCCAC58C
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 15:29:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.21757.1757518166776638540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Sep 2025 08:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BALh3j0i;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1156399466b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757518165; x=1758122965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b6QbJHh217TeBIoETfRN12xJKIAHkqI9hHBSCJJ6BoY=;
        b=BALh3j0ioQxYa1ZAHRRKmGSHFJ5EZlDEtfFCE0CJHoA5WYG8UJY5KxBJq7nhRCimTd
         6lgQM7vDRtFBl1Weh9NSSagDcDim8LtmAA6aQJOGBCg4nP65HErXQpZAy2Nx0uhJzSgU
         +RpTQ0Ur6UdG+qGQFy2lEFEUTluXfOGs2DxaKfj/RdArU0WHBVGudezu0Q5nKTUl1xwY
         O2DkTL3O7fxyVclniPOTfsJF3wOiVRA/6AIDhdoc7lWmzMIJJ+LjYI0cZn+T6V6gC17x
         sAlFHLCAPVYR+z5MpK5uL+WONm4v0I/amuZNE8RKDbefIMFtAjXhU93YyAbY7yhg9tW1
         sZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757518165; x=1758122965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6QbJHh217TeBIoETfRN12xJKIAHkqI9hHBSCJJ6BoY=;
        b=OxEjHRch4g/SnVrsBNhLz4lTGcomFewYgoif6HUOj3O/LaCwnbc9p8lHmh8PGhfBq5
         aUbKlMYMfpqUcA+pqOGWcRlix5oTVh4aiJQ+JPuvdlwFyyHgu7sDCXb1vcL2r9aUhMhk
         13A6OhVDLxxH4e7i/1BO8mXWiLyHDFrgQuFNYsxgQAY3Nco6peiMmvv7M0TAaBpjlPRR
         MrQpnBMnSGDLJEoN7tfMS7zzbHiQGUR9tbBnJ9hY0ly5kn3/mJKQG8hEZNZs3kJP7r9P
         pPEB1OwB1m1VpoFjUA09NHP5I4eeYPDRxzStOVpOQ8nifOm5XRqEvg93Cq8eoPlnQYiU
         JcEA==
X-Gm-Message-State: AOJu0Yw1ZC5CXF8+/OzXRDd6Cf+wTx9hKH1vYB1ueTRX7LF1C2conF94
	eWNLC1dOlSXftylvS5fI4yO94uLJQOOKnvoEbdxQ2UU9a6zy9CAG5QLDXTC1hh6W
X-Gm-Gg: ASbGncvdzTvurXJzIYKjNMxpXvtaL+whuV+YjWCYdkJgPKYt/FVwcCfavQmLlGWgxEz
	mIgZoeqcrtN6NAAqCxuPB5kmxGwr0YFKyA53z8DxbJ7+Eni5FOUqCPqoLfiRyDZUAv1LCGs7BHy
	1eofezY//6V37kKouVEAwOFc6o9f2Zv0zqj3NyEzTIYcLCIH0zLdawRwvD87UeOxGq2Z7s69GAj
	n1hYdihPiwz9w1KOMoB5nKSeU7zSD4nmvXbfAG/vLu1Jwbkn5DiXb7f5v9iSADAuM2DXrjpnTn7
	SAQ+5IY2iD/lp+G8IRFGidYDr18ynUsesRJG6hy2DqcF3er2ViuHJEg50QaSKyhPBf9bc/b1nlY
	vRIN36DvLbL6r4eMrXOBS
X-Google-Smtp-Source: AGHT+IFpPpJYPZz+uer71/arSGE2Vm7J3WO1dQITtpTRLhNoM8r2TjPpWqXerg9WbyuwkQcxPzR/zQ==
X-Received: by 2002:a17:907:808:b0:b04:3333:7e68 with SMTP id a640c23a62f3a-b04b16c48e6mr1561315666b.41.1757518164798;
        Wed, 10 Sep 2025 08:29:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830a7598sm183046066b.24.2025.09.10.08.29.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:29:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH 1/2] libwnck3: update to 43.2 and fix build errors
Date: Wed, 10 Sep 2025 17:29:22 +0200
Message-ID: <20250910152923.859295-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Sep 2025 15:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119348

From: Koen Kooi <koen@dominion.thruhere.net>

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
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

