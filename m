Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C37C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 08:18:10 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.12128.1699777082188254333
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 00:18:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sspj4rMI;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50970c2115eso4665360e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699777079; x=1700381879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgVbgOCFOZM5VmJk1PIDdcilrXYcNU/1VqIUYhrv2oQ=;
        b=Sspj4rMIlE5kafajbZIz6GNvnAoML9nmxY3cCC2DSLP85YrpyEJzIFDafz2u3vGoIt
         PgK1ChmY+NuIQWyT+wdv0NZnIfALz9/L9NIL+5erLEv6VSh0lVu2t0rKIwipkylob4Y5
         klZbdhg8gu7zB37CbZKp+Fg7hiXCKzIWyPC3BwGlRsbjvPafkCRkO1d9DJWLwEzYSOsQ
         J7IiMGYrPVXUUDYkpUlj7V5YK9ICc3ogEyWP/wPjQzfU2dTb2/cJk+gHIAlSMopxYNHo
         754E93HY3wms/Q01SKWizHD4kqmFDm781JzhsKen/zavWaMQhOO0Qwcjiz1CWEeKEp73
         R0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699777079; x=1700381879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgVbgOCFOZM5VmJk1PIDdcilrXYcNU/1VqIUYhrv2oQ=;
        b=W3RqmXwoeI5Q+KzHJ0EZvaTD8IbFXjT4aP+ZQXC1xbSqjK6QRN8YPlNcFscEk+h3np
         JCljBRmMr7Vx9IcHVcQh/nx/B0AuTfNsZHwSWq37fRoeppcphl7QBYWkwvuMeVuEeul2
         Co9gyLzv12vXFOSgfPQpQ0VP06uHkhOFEQHGf52eRzKeJeK4X7EMZqQ0MIh6MzQqya8F
         N8CIdcsZSOxV68L+zgj7QUhcViNU9KeuU2+xcB04HPiUclPBACEz/AoIQ0IvOuS4Fr9w
         ILWKkr/WS4W6pwaNZhiv+HH+KoL/Pp3TlBuFlQq9By5SZ2rrFg8fSv/ND0KlLhz5IAf6
         fyMg==
X-Gm-Message-State: AOJu0Yyus/Fl5Js9Z4Uh/MSRmTnE8HW+ktsakg0GU+t4twCkJkh9mKyv
	cb51QWUJvfBEsKWgmRzQUaDJ49IwsGzekQ==
X-Google-Smtp-Source: AGHT+IHfPNnKgI2dNPExVwXb6QymMVCuuy5NMIRCYHDlyIW+OOyeX0ik2vvjjNvIFC8ROE87YM4dQw==
X-Received: by 2002:a05:6512:1593:b0:50a:77c5:12b5 with SMTP id bp19-20020a056512159300b0050a77c512b5mr2150160lfb.23.1699777079144;
        Sun, 12 Nov 2023 00:17:59 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id r20-20020aa7cfd4000000b005435c317fedsm1952776edy.80.2023.11.12.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 00:17:58 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libupnp: upgrade 1.14.6 -> 1.14.18
Date: Sun, 12 Nov 2023 11:17:48 +0300
Message-Id: <20231112081748.69354-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 08:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106579

Changelog:

github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 Conditional statements removed in the newer version so no need the patch anymore.
 1.14.18 -> github.com/pupnp/pupnp/blob/c540ce2431bdeac73359029d4592b45790e1d154/upnp/inc/ithread.h
 1.14.6 -> github.com/pupnp/pupnp/blob/cef2b23fb36baac091b0c7d41136b4c1d9549c6d/upnp/inc/ithread.h

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


