Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08659C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 07:22:08 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.8105.1700032926416903912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 23:22:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEiocTrr;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso947782766b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 23:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700032924; x=1700637724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqA0UaKj2beH/Tkd55qufKzvzLg/1kNUheq5xjnHBPI=;
        b=nEiocTrrcjjwvuMB/zrVqPBqS69l3+BuOnxaJlGspSniBgGigBdi5/xCrGgolAIpBv
         hZR4pyQUzm5JNCgxmbX7OZQBScr31T92tZoD6smkPLxuFgmJcBeuL5dMyOMWzTkJY64a
         xScVlVur1VBIkoTNMYWU9beTsry9ml/1f9eyb+UspnueU+TkCWh3mJt+5MES/wVohBqA
         JR4Pvdo5Zv+ru3kq+zloJPi7/0Q+pX/UAs/EnEAAXmxLnAc1GQjKXrGZ9xO0FP4ngHlf
         mX65jCgV7h32FZcwXDiJfp8fm+pz48KRxzBGKQntpdfM45c58nrTvXCLbprUHSk+Gghx
         8wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700032924; x=1700637724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqA0UaKj2beH/Tkd55qufKzvzLg/1kNUheq5xjnHBPI=;
        b=HZ522/ZQGQb1MNadirW363sIHeUl3muis/PKj+kR7RtRI0iMHIYJMy9oOK2cklPKmQ
         y3K5OpO9XMf3TNLkuf2yCCkY9OZDWlAOxk5pCDqDdUDJQtgunFIUVx+KC2IksZGfszDl
         dg9z8psPe0g1ZP9ceUvLsH37OA2+DR3b+ubphNN3xcdYE+zMXuv3JmFwcuTW7oJ1hjec
         rz+nusjdHds1JPs7yKyUTfek7814F8nw7L9zkuZC1soDAU+53hVvjSXHE094s43v53Ql
         fnO+7xsoo+fmvvHNgeJxUP4W5QndVh6HhVBkq2miTtQ+/e7WPiu2JilJfzPTSq74CU+F
         WlNw==
X-Gm-Message-State: AOJu0YyW2tR2FNux/Z7zhRwRUS0JVJqtV1xzz382OR432uAHDdiDCzJx
	LGnABsdPKBYqhF6d+wbfn/DAJZwei3m/gA==
X-Google-Smtp-Source: AGHT+IG8xiPupG0YQNTfssmsYo87NPdtwDBBObYdS6K1D8ZR3IjNC174O28s9C1swJa6JBmAT4EEnw==
X-Received: by 2002:a17:906:260a:b0:9dd:ba33:cd39 with SMTP id h10-20020a170906260a00b009ddba33cd39mr8597343ejc.48.1700032923965;
        Tue, 14 Nov 2023 23:22:03 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id s1-20020a50d481000000b0053e5f67d637sm6283926edi.9.2023.11.14.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 23:22:03 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][master][PATCHv3] libupnp: upgrade 1.14.6 -> 1.14.18
Date: Wed, 15 Nov 2023 10:21:51 +0300
Message-Id: <20231115072151.188435-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 07:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106743

- In the new version, build succeeds on musl systems so patch is deleted.

Changelog:

github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 The difference with v2 is that only the commit message changes.

 ...ead_mutexattr_gettype-pthread_mutexa.patch | 42 -------------------
 .../{libupnp_1.14.6.bb => libupnp_1.14.18.bb} |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.6.bb => libupnp_1.14.18.bb} (87%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
deleted file mode 100644
index ee7819677..000000000
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 343a3b724225d3c87af0b268da14d3acb7a5b9a1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 May 2021 15:38:43 -0700
-Subject: [PATCH] ithread: Use
- pthread_mutexattr_gettype/pthread_mutexattr_settype on linux
-
-_np variants are not recommended anymore, and glibc 2.34+ will have
-these removed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- upnp/inc/ithread.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/upnp/inc/ithread.h b/upnp/inc/ithread.h
-index f6800ea9..1d0f9dba 100644
---- a/upnp/inc/ithread.h
-+++ b/upnp/inc/ithread.h
-@@ -304,7 +304,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
-  *      Returns EINVAL if the kind is not supported.
-  *      See man page for pthread_mutexattr_setkind_np
-  *****************************************************************************/
--#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
-+#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
-+    || defined (__linux__)
- 	#define ithread_mutexattr_setkind_np pthread_mutexattr_settype
- #else
- 	#define ithread_mutexattr_setkind_np pthread_mutexattr_setkind_np
-@@ -329,7 +330,8 @@ static UPNP_INLINE int ithread_cleanup_thread(void)
-  *      Always returns 0.
-  *      See man page for pthread_mutexattr_getkind_np
-  *****************************************************************************/
--#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__)
-+#if defined(PTHREAD_MUTEX_RECURSIVE) || defined(__DragonFly__) \
-+    || defined (__linux__)
- 	#define ithread_mutexattr_getkind_np pthread_mutexattr_gettype
- #else
- 	#define ithread_mutexattr_getkind_np pthread_mutexattr_getkind_np
--- 
-2.31.1
-
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
similarity index 87%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
index 81b42da41..5b15d1809 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.6.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.18.bb
@@ -8,9 +8,8 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "cef2b23fb36baac091b0c7d41136b4c1d9549c6d"
+SRCREV = "c540ce2431bdeac73359029d4592b45790e1d154"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x \
-           file://0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch \
           "
 
 S="${WORKDIR}/git"
-- 
2.25.1


