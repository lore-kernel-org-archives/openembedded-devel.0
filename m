Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.1340.1591500294999644283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JclKAd0p;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id w20so7104042pga.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=T3mH+n32XfTIcDI/AoKP809G6fGZ8Lb1ip2xDtwPaV8=;
        b=JclKAd0pI8fhERbjAHIRKbOSyR1uUeSOTnmNwSHjhW2mOPCXe8xX1hh4bvGhQdbb9R
         /renSRghMg2dajC1ceIxEpIAJ5sJgbc9IZvBISnawuQJdigkB5/JbYf/ut/dZFuWprI0
         +zw9vENHrlrYMn742xOU4kIIkZtWrVhv37js377ppzmzF49i5RGUxShU4ywt4Si8ALXm
         el4YJdLqUp7i+s4oLc2rDibKYtwjPuc2nn2uz/3gkP8c283QhzfjHfry+IKYyrmZpWkz
         b3vGh4LwsAt8L9xyjwAJbiEGLHRzIHyxsN2aE2HUWao6aUCPWk6Vwy8siLLfPAbwrV+E
         61VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=T3mH+n32XfTIcDI/AoKP809G6fGZ8Lb1ip2xDtwPaV8=;
        b=OhB/cuTfX8wPF+FC1aoQ0uC/zrLY+pSijw/5rgWtDh0hrtpBYPbfeU9ddNKkNKymfk
         T+mwblWqu0CzO+Cj7l6qP7vKj6j3EGe8qYxkGR/buoYNVJGdG00WTFuclX5i2nTsniZ0
         UuSyk/A7168qtWiBbOUJbtLLaLpFYONkcx4HjkBHXuklnfWTDaXDeI+zQyn/cjMuvKEy
         wUiRryOeAatg9ZDYEqF1HhC9W8b6Vnn8l99KqpPsqyOH1gdbTZZcyAOq5bzWMBpHTERe
         WHfWIMEISKU46wBKN3n+5+RU2rGjeiueThQ8DptOr26JquQDhAhtG+0x76llQlU5A8Z6
         e50A==
X-Gm-Message-State: AOAM532R/iOx7IN7+HSMIahQ8oHbx955pQDbSbgIHWqSCM0mtz6SjBaX
	7MPW8wAvisFnrZSRjlr1wDi3V7oZ
X-Google-Smtp-Source: ABdhPJwuDRDPJfYbneuZa0lGfnKcrwuSGpxewahbbkQx5NujTFztZJAU6ODpNeMH/YObSIPx1uSUSg==
X-Received: by 2002:aa7:8506:: with SMTP id v6mr16201216pfn.303.1591500294195;
        Sat, 06 Jun 2020 20:24:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/26] snort: upgrade 2.9.15 -> 2.9.16
Date: Sat,  6 Jun 2020 20:24:22 -0700
Message-Id: <6e9148d82aa394fbeb9bad70de51a614e4e74a14.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-0001-chdeck-for-gettid-API-during-configure.patch
Removed since this is included in 2.9.16

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e44e7be3e9d140410d3c7d799a32cf867e494f9c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...deck-for-gettid-API-during-configure.patch | 48 -------------------
 .../{snort_2.9.15.bb => snort_2.9.16.bb}      |  5 +-
 2 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.15.bb => snort_2.9.16.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
deleted file mode 100644
index eff610de7c..0000000000
--- a/meta-networking/recipes-connectivity/snort/snort/0001-chdeck-for-gettid-API-during-configure.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c45ab69f9428e4d2fc1146301a4546bb2b42c9ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 00:25:58 -0700
-Subject: [PATCH] chdeck for gettid API during configure
-
-glibc 2.30 added gettid syscall wrapper
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.in | 2 +-
- src/util.h   | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.in b/configure.in
-index 000bb91..d79e6d0 100644
---- a/configure.in
-+++ b/configure.in
-@@ -256,7 +256,7 @@ SN_CHECK_DECLS(printf fprintf syslog puts fputs fputc fopen  \
-            strcasecmp strncasecmp strerror perror socket sendto   \
-            vsnprintf snprintf strtoul)
- 
--AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop])
-+AC_CHECK_FUNCS([sigaction strlcpy strlcat strerror vswprintf wprintf memrchr inet_ntop gettid])
- 
- AC_CHECK_FUNC([snprintf],[have_snprintf="yes"],[have_snprintf="no"])
- AM_CONDITIONAL(BUILD_SNPRINTF, test "x$have_snprintf" != "xyes")
-diff --git a/src/util.h b/src/util.h
-index 6880906..c310b83 100644
---- a/src/util.h
-+++ b/src/util.h
-@@ -374,6 +374,7 @@ static inline int IsEmptyStr(const char *str)
-     return 0;
- }
- 
-+#if !HAVE_GETTID
- static inline pid_t gettid(void)
- {
- #if defined(LINUX) && defined(SYS_gettid)
-@@ -382,5 +383,6 @@ static inline pid_t gettid(void)
-     return getpid();
- #endif
- }
-+#endif
- 
- #endif /*__UTIL_H__*/
--- 
-2.22.0
-
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
index fbec1950d4..d8073d865b 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.15.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.16.bb
@@ -13,11 +13,10 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
-    file://0001-chdeck-for-gettid-API-during-configure.patch \
 "
 
-SRC_URI[md5sum] = "b56cadfa840f706ff67d4df0256c03eb"
-SRC_URI[sha256sum] = "bfb437746446ef72a03c501db13cd6da5edd2b41f55c80c437ba288be6da7dba"
+SRC_URI[md5sum] = "1cec58babaea3420014d61a93e6e1545"
+SRC_URI[sha256sum] = "9688d8edf1da09dec6574000fb3c0e62f99c56428587616e17c60103c0bcbad7"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1

