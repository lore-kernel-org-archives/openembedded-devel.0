Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29D6C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.2755.1662594066063108099
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l8bSz1wN;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 202so15033681pgc.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/PCHI3p/qP9grLpy6DmQJ16veo0/36gKhqtKUIR+4eA=;
        b=l8bSz1wNv/Fd+82sneF9T4foNIXbJtyQw0XavcDgOgb9ziHbllswDaXvoiw8k8f36K
         p+3EXHOhdxeq3s7aNb9M24MRL/agPTsCMx2J0+VOZOsmJwMi+gawMpyqCaPDUFhw6iFk
         jaVcZ/DXZEJ16HjjEiARFHAkI4DnrUPALwOikkz/Z3UFjLwAP7ZI/claysgQHBkpL0hX
         M9gp3lcXl/iqxibGvnbHlY0MSaVQsbauns+0znrqZVoTO+i0HVz9nSPtPgst0vwz/xp9
         kA6rAMPTC8Kx9oP8VlHtAfscb2j30JoxEdL7UO8zxcdW+U0zbeW7FKODsT8CFXCEsLe2
         VKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/PCHI3p/qP9grLpy6DmQJ16veo0/36gKhqtKUIR+4eA=;
        b=xKcooXAXZMEYbOr6jV5BGehv7WRIEeusm+riF5ddISfE+i1peG2zIZpOVe0kW7Ct49
         WnMNcNO31lwuoqFvndfz4j5i/eM2U5bIvMiMds+MqCla0mmOkV6QRzuosQuQno92lk9U
         0uoz9aDKeeX8woo0gi2FZbdEBfrghX7oQstLO8w2mC07Eh6Cm6vqlkiri5Es2bTMWBWJ
         ZYD3c9VIX8JEbUhYbowDe5utoIqFXXljReMl3WWJbdW357oJ8TNvoqbet7rffc3H0wD9
         1HDRR0zL8hiHk7e9MuymufEjwS6jKmDY4Z1q8LTwSyEyt2NmyDBl0eVJC/nXI+fcbSYL
         uz4A==
X-Gm-Message-State: ACgBeo2+kuQaoiUy9+eRjlE3QxCo8gHoEpxmqlFrvw3TDMdSDindc29a
	CTMnM15z7ZsZShDSc9og5UI4NnWtMLYwuQ==
X-Google-Smtp-Source: 
 AA6agR7gS6ArZ3jy+ij2k+sLh7/3wDbe6vuC5U9umniwPTs76+NKBhwHiMs2QGBR3VuqT8MChAo12A==
X-Received: by 2002:a05:6a00:2292:b0:538:1d03:9818 with SMTP id
 f18-20020a056a00229200b005381d039818mr6174039pfe.42.1662594065087;
        Wed, 07 Sep 2022 16:41:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/22] openldap: Fix configure check for
 pthread_detach
Date: Wed,  7 Sep 2022 16:40:41 -0700
Message-Id: <20220907234102.3312797-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98691

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ure-Pass-pthread_t-to-pthread_detach.patch | 32 +++++++++++++++++++
 .../openldap/openldap_2.5.12.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch b/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
new file mode 100644
index 0000000000..6e73f8b382
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
@@ -0,0 +1,32 @@
+From 7577b120acda087bf3f5f613c2c72663b3864ad8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 4 Sep 2022 09:43:06 -0700
+Subject: [PATCH] configure: Pass pthread_t to pthread_detach
+
+This helps compilers when using C2X standard
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0978eeb..58d15f8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1467,10 +1467,7 @@ pthread_rwlock_t rwlock;
+ 				dnl save the flags
+ 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #include <pthread.h>
+-#ifndef NULL
+-#define NULL (void*)0
+-#endif
+-]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
++]], [[pthread_detach((pthread_t)-1);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
+ 			])
+ 
+ 			if test $ol_cv_func_pthread_detach = no ; then
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
index c01db08e46..a8ea84d70f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
     file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
     file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
+    file://0001-configure-Pass-pthread_t-to-pthread_detach.patch \
 "
 
 SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
-- 
2.37.3


