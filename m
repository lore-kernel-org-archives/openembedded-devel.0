Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171FDC7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:23 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.11439.1685531596982289940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZSFYFagp;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-75b08ceddd1so652700685a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531595; x=1688123595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Pnfe+KjcSZbPnUD9/06v9/5iJkKyx/yUicwME3yI7U=;
        b=ZSFYFagpQ6Nk76EimOQ9R4YRyeISQVp41wuzvKledH70VW1+QWEydB9T5fu2OJLNUp
         S1hSF+j6GBpgXzC+fhyZodl9ig62uOzcKjYCczy8v/OvUXrUFmLBkicYcD86r1ikWbIt
         H83sVGZ0v3JNfYRV+ZBmqCvQmC9G/SEKjDQFGrb9+KzVH1V1eP5WANW6O7kyyB5xMXPf
         paYvNUFD0XXX6XVJv98Z/aHH/46g7UWZWZbu92a/HXSkWZjKPJduspZtrCGkUvFqG9Uh
         LSMBhH9csoS0ct7G5MEY4oj6NElSbHvZXYXCMpFianK9iGSXgshGhUWUebBQBSLuI//q
         GU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531595; x=1688123595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pnfe+KjcSZbPnUD9/06v9/5iJkKyx/yUicwME3yI7U=;
        b=UKPCdA4T3w5oYbmvxi2T0AuZn9tK3xOMFeL4rR8ZzHx7GHj9fIB7NY4OU4YoKSpHPc
         mTFJRuTgf6phsVfJX+xGEvjN9jMdjiHdBKjAJekjF0NM4SP+FXPnFw6zj+7oftHwaSma
         ibAn3R0t8zK5pDiIPGNhZpbb/xMnVBLVRV7SfKGTtqxx4qLaarQ01C1fVT9ufoc5IkZ3
         exiy/d7X2Cj9JjRYanuoyCjARdRuaAojHvNHnfBRx+WayPNJFllZZxhhD+or2y8yyT6c
         V+GuKm9GgPvE1M+FwNWGaUx4Dj47rly0JC73Kwl7fVgSFBPxf+MDh2XaEKXRC3rw4oNx
         RJKQ==
X-Gm-Message-State: AC+VfDxDYIjZeu8Jy3v1KbNhUxqnuGHDYF+x9Q6iiGy53BaPMTkwFJqP
	1xvSoGYC/E2KNI9Q0V5DpgdmjQ4e2ug=
X-Google-Smtp-Source: ACHHUZ4cALPeYBMcD46l7dxJ5fRSO40ZsbCSb1oSUUEsviCUmr/Rrzzzgoqeg/LWbh44rS7Xl2vUDw==
X-Received: by 2002:a05:620a:3f43:b0:75b:23a0:deb8 with SMTP id ty3-20020a05620a3f4300b0075b23a0deb8mr4523437qkn.54.1685531595553;
        Wed, 31 May 2023 04:13:15 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 07/36] postgresql: upgrade 15.2 -> 15.3
Date: Wed, 31 May 2023 07:12:40 -0400
Message-Id: <20230531111309.2454603-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103036

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 15.3

Changelog:
https://www.postgresql.org/docs/release/15.3/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 53527a8e7f7dac6910ed7ef8b718a9981a561366)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...nfigure.ac-bypass-autoconf-2.69-version-check.patch | 10 ++++------
 .../{postgresql_15.2.bb => postgresql_15.3.bb}         |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.2.bb => postgresql_15.3.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 467b5c4f5e..3c8187d1a2 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 258c6bd2ad96f2c42f1cb5f4c84e4ca5865059f0 Mon Sep 17 00:00:00 2001
+From 5f9dedc91a0a9710033fa155ea759f765ce5b58b Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -8,17 +8,18 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48d7256..9bee38f 100644
+index 998ff31..912e490 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +28,3 @@ index 48d7256..9bee38f 100644
  AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
index 5c95e4da32..c4d4124f9a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7"
+SRC_URI[sha256sum] = "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


