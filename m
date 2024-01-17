Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F18EC47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.1323.1705454007199134054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AagfG0ED;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5f8cf76ef5bso94119747b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454006; x=1706058806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AehcvuitzCfUFmRiA7Wg5DGlMDdZ4QYD5E4X3I81HA=;
        b=AagfG0EDaBK0WSquH/6DaYivPyRnWfsV95mtporxbb9Jj8UvsFJjbF0UvAanYxAQcu
         yKlJ5NcGy4S8aDEmSKbeHJRoE3Te3+kNTgwz8zKJ3GxwGKB7lSqTwp0o/72YuK1SBLMZ
         fUFA4FYblBqHhmuQnaEQXWzcv3pZBayDxepkjMQp9dG97N2Vp4GXRgHETyK3+k4U/mgN
         uIT1PD3MTDMDxei7y+thmzNct5yO0xhTL96c+FUwzkaD3Et8oJclBQWx3Tz8j9d2u47b
         1RLzlSSgoddWjCLREDpWnTe7jyY1kfJQsXuTDvJulOfmePo4qPDEIXVeO/0N6AQMBrUr
         ldnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454006; x=1706058806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AehcvuitzCfUFmRiA7Wg5DGlMDdZ4QYD5E4X3I81HA=;
        b=IFizr+1pq2ucWwcPbZsORtp+1UEIHk4BkMuEMzjGXPf4MNVgxUzbiuQH9EkZbVk0/E
         7qxbYOWsze4jdomAn/ndmE22K80vGg3Sq7UvAcDYvWVVtdcg2BlrN6VcX81a2h7HgqVq
         Ui1IHry4d+/TCrfFHYtsOep6GtYNns7a+cEIg0Pxu5NH418LxskXjMAkTrLl/RyX42SC
         LtvbGPH+DSZTJkyEbCaRA0hFGTVrwMJ+XTEcNl92vb7k+fDQESsoiXyGTmOLxes8JGm/
         FRz5YjqiOn4l45stwsrLG3UZqofZvcbbGStQWd57HBU7YB2qt6y0eragfUp89eCRF9M+
         rVng==
X-Gm-Message-State: AOJu0YxeecCRZ8CokdCvHG0wdRonZ/CmvaBF3UY+WcMyQoXjB4oea5+L
	vazm1MebwwoF2PDLbIHC37V42eI/KRwbeQ==
X-Google-Smtp-Source: AGHT+IHe0LVTufoZc3jQeLnMG02BnbPkoPiy+feRLOulteQMAgOM/nR7sz/aZfKAW6LWzsjdijBxwg==
X-Received: by 2002:a81:9b11:0:b0:5d7:1941:3566 with SMTP id s17-20020a819b11000000b005d719413566mr5772616ywg.77.1705454006193;
        Tue, 16 Jan 2024 17:13:26 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 08/11] postgresql: upgrade 15.4 -> 15.5
Date: Tue, 16 Jan 2024 20:13:17 -0500
Message-Id: <20240117011320.1856392-8-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108318

From: Changqing Li <changqing.li@windriver.com>

Refer https://www.postgresql.org/docs/release/15.5/

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bcedf9f99ca683764ef19ab008e042c82da616ff)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-configure.ac-bypass-autoconf-2.69-version-check.patch | 8 ++++----
 .../postgresql/{postgresql_15.4.bb => postgresql_15.5.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.4.bb => postgresql_15.5.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index fb70b22720..ab578056ff 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 5f9dedc91a0a9710033fa155ea759f765ce5b58b Mon Sep 17 00:00:00 2001
+From d44c83ed0f30462a31930d6d925762b3f8412ce2 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 524fdf1..3bea642 100644
+index e988503..d1b2cfd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 524fdf1..3bea642 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.34.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
index 3aa2662891..cb90ff930a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9"
+SRC_URI[sha256sum] = "8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.34.1


