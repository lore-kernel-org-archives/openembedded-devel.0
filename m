Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA8ACE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 14:38:23 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.40596.1695566298513888538
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 07:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROlmh9FN;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59c215f2f4aso60319217b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695566297; x=1696171097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5FcIFy5LtULrOSB51Ffcn0TYk/Xsz6DI9isYdsn7JQ=;
        b=ROlmh9FN9pOc7sWRPcSP3WT/nn+dz62mIkAzXhlNbXlRm1tmxuUkU4rYY2Y4Q9Lr0B
         H2+CPUBM3LN+L1CgsQu5tBpHc6MMWeRJLx271Zo4AVhLRDWIspCJkOg3L4BlRLkBO28c
         5NhaWbs7sJkrxjvloksb4Hy9WGH2O0LxRl8q0Z/nkuBkeWcqWB3ay6ZMoIj5PO60Zw3R
         3afpfjC0VXxpVW2uEQOZ7MtVPorBYw9avKJdGnws8XNqwi1PO5gga1C4MaIXk68Y/v5x
         9mn3h9BO+RhU7nQefedRY3J6nvGrOKrypVEDROeQdUGXbTIhrh/40WagHs1N+lFsFn5f
         EIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695566297; x=1696171097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5FcIFy5LtULrOSB51Ffcn0TYk/Xsz6DI9isYdsn7JQ=;
        b=eppB1t0Ap/ywRYfofSQ9nTPz99ZwrqK+PNJiCuCcGnO5zvUUftVPxRU6K1WlbkAS9t
         E9yzN974O9BG33R2npHvN7YWay24kn/0yeW3cAGmQxapQPDi2nxrIuM0JHw7pK9mePsU
         V13W9kJmxY8dPyIW/gkdQcJtMv4nlwN3OUz9t+lxD5hwFUVMpcb9dUtOVdyt+9OeTtMh
         LPcgZ4dM/rMFxJBkIesPoqIWzKVROgqFpk2YDoomDhwzS/D3jfLlqFn1JSAK0AzmYYut
         HX/sRXQtHEKCmjz3bZa8OPzm8Xc7W3iW/KhSIsPheB4cSAPkznIo5NclYBDlZNlUcfmc
         cYBQ==
X-Gm-Message-State: AOJu0Yy9EEoEx8bBVTecEcLlGLu2T8bO50MfV+a9KRXOi4CRU1JjJ1vQ
	wgrQEEi0vQBHqFI3sp52mTrMh+9MLvs=
X-Google-Smtp-Source: AGHT+IFPk0Tju6+lWAOZQHJhCLXPIrLeLhop463xXRjJR1ZKZXXoiKmPBYJ+Faq1I+mQKtibOA4B2w==
X-Received: by 2002:a0d:d046:0:b0:586:c27c:3eee with SMTP id s67-20020a0dd046000000b00586c27c3eeemr5271958ywd.38.1695566297426;
        Sun, 24 Sep 2023 07:38:17 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id j68-20020a0de047000000b0059b3d594c04sm1926418ywe.125.2023.09.24.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 07:38:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH] openldap: update to 2.5.16.
Date: Sun, 24 Sep 2023 10:38:16 -0400
Message-Id: <20230924143816.982891-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105105

From: Armin Kuster <akuster@mvista.com>

2.5.x is an LTS version per the project.
Drop patch now included.

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7a423279cf6afe27cf6abf747f1a2021ee5b6d26)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...ure-Pass-pthread_t-to-pthread_detach.patch | 32 -------------------
 ...{openldap_2.5.13.bb => openldap_2.5.16.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.5.13.bb => openldap_2.5.16.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch b/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
deleted file mode 100644
index 6e73f8b382..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/0001-configure-Pass-pthread_t-to-pthread_detach.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7577b120acda087bf3f5f613c2c72663b3864ad8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 4 Sep 2022 09:43:06 -0700
-Subject: [PATCH] configure: Pass pthread_t to pthread_detach
-
-This helps compilers when using C2X standard
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0978eeb..58d15f8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1467,10 +1467,7 @@ pthread_rwlock_t rwlock;
- 				dnl save the flags
- 				AC_LINK_IFELSE([AC_LANG_PROGRAM([[
- #include <pthread.h>
--#ifndef NULL
--#define NULL (void*)0
--#endif
--]], [[pthread_detach(NULL);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
-+]], [[pthread_detach((pthread_t)-1);]])],[ol_cv_func_pthread_detach=yes],[ol_cv_func_pthread_detach=no])
- 			])
- 
- 			if test $ol_cv_func_pthread_detach = no ; then
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.13.bb b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.5.13.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.16.bb
index b117677f9b..a56b454dc0 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.13.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
@@ -19,10 +19,9 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
-    file://0001-configure-Pass-pthread_t-to-pthread_detach.patch \
 "
 
-SRC_URI[sha256sum] = "ee3c430c4ef7b87c57b622108c7339376d6c27fbbf2767770be3de1df63d008c"
+SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


