Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.18020.1590941800841892803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YKgc6k/J;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t7so1521442pgt.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LVZzE2mxaWtMQhuSz9FKNb249YqsU6atyqa2mD7uKAQ=;
        b=YKgc6k/JeELpyoV8q9k4riE1Ww8XGxEjd3QD74TALcEGtOOMba74Qdn9u71YDjwykA
         JMbvH06671HVCjeJTakFNJBrL2qWkPoNCYuD8K1W/Ldx3jJxlQwU+1TvkdYlhYAi11Ac
         gFg36tKnPJ/QATz5T39pduBOuukJvK0OPJsNn8daXGVM+r7RWzX5R4CoC3kdGXia8ZHR
         Ol6k6Y/es50PuDVEArLCZ28Fm4eybsKdzBWQ8I+CYx4ojy1AfJ1jbUIVZE9DJRGkRTK/
         OFM+3628Blcv0iU1XgirO64iifyfC2pN/+g0b8WYYWEt5vd3aOXj+yQLoIqVXqlVIIK6
         yqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LVZzE2mxaWtMQhuSz9FKNb249YqsU6atyqa2mD7uKAQ=;
        b=jvMjNXU/QnP0FWDIRzkarFnmNvdkNEQmWW5aDz8hIr6uzEdpa9mCYLFyelmg0L0YOn
         N94MdbioMT5KeVvkZDaV/4nMuHJBHXmFbKXQZOBwALmEmB8oxCL+Jytv3ewZcCkcPdHy
         UvojKJXFYXLTQFLbZF1bZgrcpz7Hkwusbu+JHDcMLUSxq1SwtjkAcqlC2IS0i1iYbo4v
         ewE9uSeG1qSAR01dy9OCu/1/Kf01G0iO43nvC2wXhT4FFECPh257R891GxlNJz3tiq/G
         sEyZdDuO4i8daZAFgWIk4t5zEX1C5X1vVP1PxuY1AKigF2+O6fW5tdD3W7C4rCiTJ1qq
         NQsg==
X-Gm-Message-State: AOAM532xBMAF7vD1NiM7cEIzpUJUaVG0KFyWTmyEO+ne2DATZYOJqS53
	sm7T+ODHY4qqY5qkCzM1tBD/PI5J
X-Google-Smtp-Source: ABdhPJyZBVm+DzHxmSM361Curx+M+9+YpD0karI9fcjtzgmYo4SQt8io9k3kpirOg7YvgFICRzO1gA==
X-Received: by 2002:a63:c407:: with SMTP id h7mr15794893pgd.174.1590941800173;
        Sun, 31 May 2020 09:16:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:39 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 12/35] postfix: Upgrade 3.4.10 -> 3.4.12
Date: Sun, 31 May 2020 09:15:59 -0700
Message-Id: <de5df836def1f2592b902c0d7b03d80a3e168105.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Adrian Bunk <bunk@stusta.de>

Remove patch applied upstream.
Manual -fcommon is no longer necessary.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3d81f6d013b21a5db8e71328648aa896177e40eb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ure-with-glibc-2.30-due-to-dropped-R.patch | 37 -------------------
 .../recipes-daemons/postfix/postfix.inc       |  2 +-
 .../{postfix_3.4.10.bb => postfix_3.4.12.bb}  |  3 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.10.bb => postfix_3.4.12.bb} (80%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
deleted file mode 100644
index 22adaff729..0000000000
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8b3792830f4930fee7fbb00c854d9766f2b74dca Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jul 2019 11:35:38 -0700
-Subject: [PATCH] Fixed build failure with glibc 2.30 due to dropped
- RES_INSECURE1/2 macros
-
-see [1]
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=333221862ecbebde60dd16e7ca17d26444e62f50
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dns/dns_str_resflags.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/dns/dns_str_resflags.c b/src/dns/dns_str_resflags.c
-index 5f2cce5..df32345 100644
---- a/src/dns/dns_str_resflags.c
-+++ b/src/dns/dns_str_resflags.c
-@@ -60,10 +60,16 @@ static const LONG_NAME_MASK resflag_table[] = {
-     "RES_DEFNAMES", RES_DEFNAMES,
-     "RES_STAYOPEN", RES_STAYOPEN,
-     "RES_DNSRCH", RES_DNSRCH,
-+#ifdef RES_INSECURE1
-     "RES_INSECURE1", RES_INSECURE1,
-+#endif
-+#ifdef RES_INSECURE2
-     "RES_INSECURE2", RES_INSECURE2,
-+#endif
-     "RES_NOALIASES", RES_NOALIASES,
-+#ifdef RES_USE_INET6
-     "RES_USE_INET6", RES_USE_INET6,
-+#endif
- #ifdef RES_ROTATE
-     "RES_ROTATE", RES_ROTATE,
- #endif
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a8d55a6c93..4b9940cc7a 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -61,7 +61,7 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -fcommon -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
similarity index 80%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
index d0ef708c50..db5b41bfbd 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.12.bb
@@ -13,7 +13,6 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://postfix-install.patch \
            file://icu-config.patch \
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
-SRC_URI[sha256sum] = "908a66fc38537a0047e8561e1bc0ef096c53357ffad16d2d728cd4fc8ae56654"
+SRC_URI[sha256sum] = "18555183ae8b52a9e76067799279c86f9f2770cdef3836deb8462ee0a0855dec"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.1

