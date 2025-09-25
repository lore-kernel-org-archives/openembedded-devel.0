Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801DECAC5BF
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:59 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.9708.1758801833678055098
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UySS2y8d;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2ef8e00becso178048566b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801832; x=1759406632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DtaJBuHFG6xxiWim8sVt5XG1D2Pg8DSvRJBVmM81Ks=;
        b=UySS2y8dmo7gBq4j/aiB89LoiB1e3bDukWIzzNuw7mDc6s7kfliRZwpPrkA1oNM930
         pTSmG+ACU8F0RAeofE+mvErQkWwXkqGrkxJdifEct+OdyxbGG1aIETHSthmSQEkYfy2V
         5wUY8wNo9umbITDhbrvJxDmfoGyy/OjJT8Axc+r8QeO6YnQZJKeD8AHdaJ81wkvuyhGC
         UvqVW9ZTQSS9G3LjdZSoCQ3bPcjJ7wL1+pYKAgg1Dny8kJzPnHK61ZYhKTeT9kC9Lj28
         RamKEO/+VXdF771szfJb70b8Atl241ruaJJXjh5tUSqeL+9Ug2jrx9VBkydG/XsduFcY
         XRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801832; x=1759406632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DtaJBuHFG6xxiWim8sVt5XG1D2Pg8DSvRJBVmM81Ks=;
        b=TNRjdIkFehoP/XhLXDLlveYvynx5KzPwZNQ+XgAdKD2kFg4bWLn7RRjuK3pO0sIfj0
         iD5PmXiwvR9B00vLOVAuucevUjwcrbqoxggdDJzdmNYmU9H+9g0h3fResOHWYZc1YipD
         kmxB1WRfhnyOhVBeC49yI8JeWWkQh32N8vxqCwmkpsoZO7+r/TJm0nlSk96I0nQV034l
         z0igmT+05l7pqc+dHF+9xDzCASfUz2m1F6+N+xSnZktbuMTGq3/N7lvrM7jZHrzXIoMe
         2v+x+YpP/f8RzIXG5if+vwKe/abxroeG9x0b5TmeMLMGqcd3F4x2odoCiK9FA19zPpqz
         zLNQ==
X-Gm-Message-State: AOJu0Yz8TMTUeLCuhOm2mdl8CuR6L0KoOHByv/J0HGXXk0H4FY43UBG4
	7c9fONJA/Bi5M+BqlDUiwUbn+NFFsdirv0wv7qwUE2gnTDW0GGGBop3hGudpDVzY
X-Gm-Gg: ASbGnct+uSBOIPUh9XpC58PrRHcQ+SOK/uCqKHK1RSFmcy2o9pajer88onIaqZSskRd
	K7PVpLkP/p4gHsOaMVrFLA+iJJTBZJU175eDVvV0ueYY+8EjHQC430ZOxRcFatpDzsWoNgBpeJd
	kZSRU3w+e5vO8iiXG+Roc0n3zYdVAR06azBJlVjNfttLbs3QxvI2N+PrjXnbi/PqM8jT7DI0/sP
	9tvCIeQlTpqy9uecnCHRFeoq4oavCF+HFZPFAiPqUQtpvZKv30O3QQaomvuee+PTXhXAyRnJjui
	69G0Lhk4QVQ4KmkNGyKd08hXecMDFJPA6p9GYzz93J6ekVQKbVnNufqJaXvuwEBiMwQwq0uf9wO
	Su31Cf2pgtUzb3+/3U/jgEcbNVuYzre4=
X-Google-Smtp-Source: AGHT+IGws9tFh3qZwp1g0HpkiZuzCrtdgyiMCOF2qH9DNf8Bz4O02gfRfDT2wjOfYoW97+6cmjUTQQ==
X-Received: by 2002:a17:907:1c10:b0:b04:3629:b00e with SMTP id a640c23a62f3a-b34bb708a7dmr342397666b.29.1758801831789;
        Thu, 25 Sep 2025 05:03:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:51 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 10/21] libupnp: upgrade 1.14.6 -> 1.14.18
Date: Thu, 25 Sep 2025 14:03:22 +0200
Message-ID: <20250925120334.1670367-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119870

From: alperak <alperyasinak1@gmail.com>

Changelog:

github.com/pupnp/pupnp/blob/branch-1.14.x/ChangeLog

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6908f7fcb825b896fcea102ae75dab2a6122b42a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ead_mutexattr_gettype-pthread_mutexa.patch | 42 -------------------
 .../{libupnp_1.14.6.bb => libupnp_1.14.18.bb} |  3 +-
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.6.bb => libupnp_1.14.18.bb} (87%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch b/meta-multimedia/recipes-connectivity/libupnp/libupnp/0001-ithread-Use-pthread_mutexattr_gettype-pthread_mutexa.patch
deleted file mode 100644
index ee78196779..0000000000
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
index 81b42da412..5b15d18096 100644
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

