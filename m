Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.9670.1597214237974431690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qIFUDcyP;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id f9so612576pju.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OQthv+M6XtFaTgOV2TirYqKfr/cs7/lwSaYche2jHeo=;
        b=qIFUDcyPGYhn/zpr2LGOycT5I9SD3IhSjH0v5uGq5NeAZokMZYyXEaRx9B+O0K2dfJ
         F615bIXgfvShsW1RPDMAlr6ni7q0MwWV3lfcUGb0anvYbO89Ye8AxccA2mtFglFaoXjQ
         Jkk+zLbGJ5xKSWH5dM43hft7TEyhNrMYOIdNRpcmsxBNS61w2WWgS5QECbUbqPJn3xsb
         HxSPgrws9dXyAJmPpLR0fSr5l5faGTXoeOox4W54MLjAcL6ud0gSa4XavNR0aD8XgjP0
         8pvMUzsUKDRyckafTt76V+OcWwfPDBvWuX9Yvkn94efo2y/apa5AIniyWycVUBumdLcI
         c1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OQthv+M6XtFaTgOV2TirYqKfr/cs7/lwSaYche2jHeo=;
        b=VIHDINJsMCWc6YK1pKLEra49JPKlkm49LcIT87cd2VZ5bXZreZIPhl5lSqvyMUzBjA
         iKXQ12tW6uaXa+9fCndEjAL3m1alJEzvERwpySceU3h8SfP/e7FxOQoekgvE1L3ypf9s
         m1iWt4mO7SRolcvdQfgwu8gNlMe2OrWPYcXRv59yEeTeG4/8dlsv0mD4aSDqYXjFc3ZA
         VlnV0qBe9FJ4UjgcSDnz0MIHKTMWIkZltzsqaPOwT+yDUvH8JgaUemX8bRl7ibsrUzO4
         7NJcmOaEfIrdMJsyr5P3xQFsmO3PoEJTO3PsUdCE6aprd9gkHv76i52NMQrWN93ErQJK
         v7bg==
X-Gm-Message-State: AOAM533f26a5W1x6LjaIWWNycH89eHDC82YwFpDzhQZVHUK1fkWj+I+m
	tmnwnAR+YtD7E0y5DmCRq4RPQZ65Xo0=
X-Google-Smtp-Source: ABdhPJzTrcsZ0mHLQogpcQ8Q5bU41j/NEXZlc9/Cd2FbqCvSMIatXroBudaGjibqirAYBEwXCC+9rw==
X-Received: by 2002:a17:90a:ba93:: with SMTP id t19mr4611057pjr.213.1597214237145;
        Tue, 11 Aug 2020 23:37:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 3/9] gpm: Upgrade to latest master
Date: Tue, 11 Aug 2020 23:37:05 -0700
Message-Id: <20200812063711.2758315-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mptyset-API-instead-of-__sigemptyset.patch | 34 -------------------
 meta-oe/recipes-support/gpm/gpm_git.bb        |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch

diff --git a/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch
deleted file mode 100644
index a9198166a9..0000000000
--- a/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 52e6cf052b1f938fcca1bc24d578fe0bfd972988 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 25 Jun 2017 07:25:33 -0700
-Subject: [PATCH] Use sigemptyset API instead of __sigemptyset
-
-__sigemptyset has been removed from glibc public
-API headers in upcoming (2.26) release onwards
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/prog/gpm-root.y | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
-index 5126c65..76c896c 100644
---- a/src/prog/gpm-root.y
-+++ b/src/prog/gpm-root.y
-@@ -1196,11 +1196,7 @@ int main(int argc, char **argv)
-                                                         LOG_DAEMON : LOG_USER);
-    /* reap your zombies */
-    childaction.sa_handler=reap_children;
--#if defined(__GLIBC__)
--   __sigemptyset(&childaction.sa_mask);
--#else /* __GLIBC__ */
-    sigemptyset(&childaction.sa_mask);
--#endif /* __GLIBC__ */
-    childaction.sa_flags=0;
-    sigaction(SIGCHLD,&childaction,NULL);
- 
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 3800d147f9..600b25df86 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -9,14 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
 PV = "1.99.7+git${SRCREV}"
 PR = "r2"
-SRCREV = "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
+SRCREV = "e82d1a653ca94aa4ed12441424da6ce780b1e530"
 
 DEPENDS = "ncurses bison-native"
 
 SRC_URI = "git://github.com/telmich/gpm;protocol=git \
            file://init \
            file://gpm.service.in \
-           file://0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.28.0

