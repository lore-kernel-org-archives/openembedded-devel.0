Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC3CE7D0B8
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 00:57:40 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.11976.1695344253797945446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Sep 2023 17:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMD7O29b;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d852b28ec3bso1858212276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 17:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695344253; x=1695949053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XatKy6vmo+9ZSBWC27HNTDInOdC6yBdbjdq1jyj7z/E=;
        b=VMD7O29bIu7Tfr5keVkxPVtYvsIR1KPyK0kZGZB22oh7ZQeQ8H3J1BpuPKYRw32R6z
         N2y/1xAq3Kh8aEeloTFs11urR+MbDpnE4SzIhjZO25++XRO2KO1vrCIKOPlL119/lzO8
         uDPCg3/lXqRU00ukS7elzXpmfti8Y7+kLIg7l4OBbQm2HTUGoZLyq7nMBi84ttUrDcIP
         kysDA2oBtNK8fbuIMxwUJCDiYtOoLquofgyRAh+GkRH79yixUCknNVIm1rNAnsRBf4D6
         gZJPW5JmytOmqNeKXQb0XWLblg0Xj2+1eQY4ZXPOWp4G83b6Gx0NB8ghuLF4sD347C3b
         E5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695344253; x=1695949053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XatKy6vmo+9ZSBWC27HNTDInOdC6yBdbjdq1jyj7z/E=;
        b=M4tmfwIu8vTACxtqaIr35gDn2iT6s9ha8iQnOlTRZTszqr+3BnbgHlgAs87PBPJ8v4
         Oyg5o0YDfd2/nBlBPT8sfB463QMo3tLe5q6Yo60IwgtyblYJX60c+kjX9ze9KxHODoqm
         cNrxFD8mDlwTCuFRjO21bSp2gHE2DTO5bLNQ8W5BbyHchEglN3MdtYziwRODH4Ak+jgX
         S+dR9YRWAT9iWgsZzLeR24rss/83JnqLNPzQsaiIJ+O+HBpepvbcCN5/XzjKDuXJRDru
         Cd7laSpcipSyxG9lEWvt297I37CwyaYWSYkw/s/NJdUQvhd/9H5vBwC97QxuRa7Qy64/
         zYgg==
X-Gm-Message-State: AOJu0YyJE3hLQdU0aOgCRFaPCT2s9ps5f/6t8cUIyPOqwTu9MqgnaLdy
	FfOcS//tM0VY8ghUi1jD8G6mAoMA3SU=
X-Google-Smtp-Source: AGHT+IEm4itAVlqTXeDgXenhIH5c+w0pnIUh7M6+EMAgDWxXhox6lTlT0/PSRGTJXfaKpAJNyp9B9A==
X-Received: by 2002:a25:ad98:0:b0:d81:7f38:6d64 with SMTP id z24-20020a25ad98000000b00d817f386d64mr7455683ybi.4.1695344252766;
        Thu, 21 Sep 2023 17:57:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:15b9:8178:ac:c972])
        by smtp.gmail.com with ESMTPSA id x2-20020a056902102200b00d818ced8939sm600312ybt.1.2023.09.21.17.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 17:57:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH] openldap: update to 2.5.16.
Date: Thu, 21 Sep 2023 20:57:31 -0400
Message-Id: <20230922005731.725345-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 00:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105043

From: Armin Kuster <akuster@mvista.com>

2.5.x is an LTS version per the project.
Drop patch now included.

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
index 7dc926c61c..8d13a4ddbd 100644
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


