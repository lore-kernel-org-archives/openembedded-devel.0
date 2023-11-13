Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DAEC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 16:29:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.41347.1699892962105227094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 08:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMb4NUts;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507adc3381cso6136886e87.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699892960; x=1700497760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScQnyiquAELEsuQFAnxUwQtzXFnMLrXl+GM0HZ4Z3So=;
        b=cMb4NUts+JR5tb9+eIbTy5t0jSQ0BzHnNIYVOop6RK5UbVH+XfI26CojmYmHeDBtBm
         awEHzHgqFNzeDFqq389NVQl/xuKcV31/Ma8rCDTo0Ghi35OqegfW/IVYcCX6yKnvpWUl
         19OYzvpvPssdgJxttfMhZna7adZgc7ZSkiRis4ZueoiXrN6O2WcbIzZgiFbbPUC2VWW2
         UDry05Mt09meFtr6XSChAzgVvid6Hfw/zcmqUzknxfXpnnVDHXJq5u+83Tn71gyr2bEa
         xUg3/hXQa0GFkjK8HTKK0pwSszk7jD9t1XQylIX9LBCPvIcPCiATvuWW4ciFxyKWTjUk
         g9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699892960; x=1700497760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScQnyiquAELEsuQFAnxUwQtzXFnMLrXl+GM0HZ4Z3So=;
        b=p6SWrMRgodo9u1vsbA0ya03hAxHWA4Fly/z7g4cFJnq1Em6EvEW6chlZcKeGStE36K
         kiplATL6j7kcePK61rAt0qM6sf5vcRxte0vYuU7OQ4F9v6UiR1FgI4VafFtygni1H3Gj
         M36kS7qabLRwFu28Nog0ivvku9ZNvnq0UZ+8EIIMiu6FH5n0N0d1dwW70EE81c5z+E6f
         pkBh1K8TBm3fDn7nNhXvnlE4DVopAkqZMUpGUbsvP6Dl+IQMFNSiRNqA1F1Y2Fn3eLRX
         Cel09dPdmuxMnu3T5JmN/dz+hYGDWiXZJXE++BsEQ6/pJ1jFmo/xMvLg7xtAHhC2VuI4
         DZ/w==
X-Gm-Message-State: AOJu0YzLu3gOH7KT8rcFCDoAuPDngHmG1NKUuQDcaunIORKHnTlAt/DB
	/VT3DXsC4NKNcaMyi86NrDcosq2g0EVZmw==
X-Google-Smtp-Source: AGHT+IHB1TAoFyEtUOiGaX/ofOvyJEQDJ0nTGcnQ1ggF1EmKzpNboYEGASvqBZge03GUbDCHNDIvmg==
X-Received: by 2002:a19:385b:0:b0:509:44fb:eb63 with SMTP id d27-20020a19385b000000b0050944fbeb63mr4128728lfj.26.1699892959331;
        Mon, 13 Nov 2023 08:29:19 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id c4-20020a056402120400b0053f9578ec97sm3909087edw.56.2023.11.13.08.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 08:29:18 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCHv2] libupnp: upgrade 1.14.6 -> 1.14.18
Date: Mon, 13 Nov 2023 19:28:45 +0300
Message-Id: <20231113162845.286974-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 16:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106645

- In the new version, build succeeds on musl systems so patch is deleted.

Changelog:

github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 As far as I have researched, people say that it will be enough to define TCLIBC = "musl" in local.conf so that I can test it on musl systems.
 I did it this way and I was able to build successfully without patch.

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


