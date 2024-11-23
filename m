Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C7EE6688F
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 22:34:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.57201.1732401289383873513
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 14:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcnwZZkS;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2142214abd2so12485845ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 14:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732401288; x=1733006088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6YCmy6lCMI4J6elwpYJyft5zlwN8uvtp3ibilL3LvQ=;
        b=gcnwZZkSejBLgLWXFcqSHiYpFKnXZWVBL370/cnASkyclY3t2/AZQagjdy254OV7Lu
         2M86Z/zNZD8Om6Cj9N77QUqu+drTqgp8lGQFryrF4GXqqySXjr0caX2ld7luiz7rDplq
         yyQ+/Au6BdRiL+O7szXfCq+XMA74OAEYlY5EcZSvPBsLXb3/cCE3dw9m0ypcwmeUqtPh
         2g/HSp0/O8ouw4uayQp4V12mv2ZBBJLPzFRbCPfAYE4vX2jcAkTG+PTCbQHgZSbrWTQZ
         YokpTYZug3lzshGz1vKdvYOxWJqi5AFWBppP099pbzz5+VcrPydLItwtqyps2XUBXF/0
         PQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732401288; x=1733006088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6YCmy6lCMI4J6elwpYJyft5zlwN8uvtp3ibilL3LvQ=;
        b=aKXst/P52V+KldjR26pZLwCHx8yHeEe4bm291APhX3J5BuFw77LsXmvtuYgP06vmS5
         kGbl/1uFu9amS20xXO0X5LKl/UzKGOTopnxsIO4rxnYrMEpEVbqhpOBGzBhkAxHuEw5g
         ZPYCO9YM8ilWxyX79nI7BA8AQaPjIK6IEEpEtTEdNNswYjsgDqmDVXI5H9t+yR/9bcsD
         OppJRUKk9Gh7azzmaXu2np+71MHtkw3h9wsVdGoXC6oiNwVW9HDmUlDqWQcklZ3XgDVD
         FEp2swqb03XMuV2RYzwGu5sxZWVqRQlhdy55sVs8HNr4LQu9Cs9n70KNPigyXyZhqx0H
         UkvA==
X-Gm-Message-State: AOJu0YxyGqOnYxAD7SNOTBobOsUgASwDc83EZUyvhcQ06BDvzMfjixlA
	mZYk84vb3BY4llyp29icCXKxQHe2iMADKYL8Xf3fMZK1CoKUnnxUlzCevA==
X-Gm-Gg: ASbGncv2c95j5YbpI+n6etQZcpYCeEKF6XMKjDa7+dCpRSq7n1I8Vam2BHB3aG8DUFj
	zWw4WBhHtkBY6EWerAJidgzj/KuCA2sRMAiGP3HItLsq2/E8xphOPdHm4eC94cF0lRJKlr1IdOG
	PRWfc71GDYj1FyMIki5FXFydegtu/wM4vWd/xcCLHoyY6dPtFJxqvbH5vtPUAnbdr3tSNAVydgz
	Ij/tKUOG71GO1jiSr25eSWOM+/Z5L5tj/F4xvC5VO1Hb4nyvoA=
X-Google-Smtp-Source: AGHT+IE/ChF9QX7TKSNaMfQ3uH6dqPbDMGTlRGlkmk5Mr+sk+iBVWQFwVhzHEJn1o1o+Zw+Fzqgaxg==
X-Received: by 2002:a17:902:cec7:b0:20c:a175:b720 with SMTP id d9443c01a7336-2129f65a8d7mr117664685ad.1.1732401288396;
        Sat, 23 Nov 2024 14:34:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba2f26sm37521945ad.85.2024.11.23.14.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 14:34:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] evolution-data-server: Fix build with ICU-76+
Date: Sat, 23 Nov 2024 14:34:45 -0800
Message-ID: <20241123223445.1611457-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 22:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114026

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../evolution-data-server.bb                  |  1 +
 ...Fails-to-build-link-against-icu-76.1.patch | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 384484e0dc..f0b43256d7 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
     file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
     file://0004-call-native-helpers.patch \
     file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch \
+    file://0001-I-574-Fails-to-build-link-against-icu-76.1.patch \
     file://iconv-detect.h \
 "
 
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch
new file mode 100644
index 0000000000..9f1bbfe5e0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-I-574-Fails-to-build-link-against-icu-76.1.patch
@@ -0,0 +1,42 @@
+From 12666816df679118fe50f15ba2da3244c62ac215 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 19 Nov 2024 11:15:12 +0100
+Subject: [PATCH] I#574 - Fails to build/link against icu 76.1
+
+Closes https://gitlab.gnome.org/GNOME/evolution-data-server/-/issues/574
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/evolution-data-server/-/pipelines/761044]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 42721b3..fcaa188 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -376,13 +376,13 @@ endif(WIN32)
+ # ICU started shipping pkg-config files but it's not present
+ # on many systems, if we don't find the pkg-config
+ # file then let's fallback on a manual check
+-pkg_check_modules(ICU icu-i18n)
++pkg_check_modules(ICU icu-i18n icu-uc)
+ 
+ if(NOT ICU_FOUND)
+ 	CHECK_INCLUDE_FILE(unicode/ucol.h HAVE_UNICODE_UCOL_H)
+ 	if(NOT HAVE_UNICODE_UCOL_H)
+ 		message(FATAL_ERROR "ICU unicode/ucol.h not found; icu-i18n is required")
+-	endif(HAVE_UNICODE_UCOL_H)
++	endif(NOT HAVE_UNICODE_UCOL_H)
+ 
+ 	set(CMAKE_REQUIRED_LIBRARIES "-licui18n -licuuc -licudata")
+ 	CHECK_C_SOURCE_COMPILES("#include <unicode/ucol.h>
+@@ -393,7 +393,7 @@ if(NOT ICU_FOUND)
+ 		set(ICU_CFLAGS -D_REENTRANT)
+ 		set(ICU_LIBS "-licui18n -licuuc -licudata")
+ 	else(HAVE_UCOL_OPEN)
+-		message(FATAL_ERROR "Failed to find icu-i18n, install its development files or build them first")
++		message(FATAL_ERROR "Failed to find icui18n, icuuc and icudata, install its development files or build them first")
+ 	endif(HAVE_UCOL_OPEN)
+ endif(NOT ICU_FOUND)
+ 

