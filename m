Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CACC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:35 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.2358.1654283972924592070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPLoz5he;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id u2so7853591pfc.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W8iqiCtDncMXb1uvrI9GYCDuD2da0w6tCtiBcekYrhs=;
        b=QPLoz5hemhwmdYI0Mgjf72Gj9ddHtqdLdHHYIapOf/dqto9S3BfNAHFUsN5A/AwfZh
         Ix6PLQ2wG6JtntrZkqjNcIvxEnjGm+bueboCqhWfmAspQkqW9zUbsJRleez6qtAgjGif
         Uw7PUNpLojjjed6BWSOQPrYKLruAnxqxQyxy75Ag4CXC1PJbNSz6oVwDBmvybFZpBS5y
         mUE/2Ys4kV2C0GGkz9ky2UFx3HBwP7EM8XVttLfzpGzAdz+K74UPbCZ5oMplwgOW+1M0
         4WuZrVvJ8TEY1t7S45fSFJOkvsthDHfyNgmAQToWLcGh5Z783mtiQiCC4Zugt/QSIhC4
         +V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8iqiCtDncMXb1uvrI9GYCDuD2da0w6tCtiBcekYrhs=;
        b=YuJ6lJ1xcVI+hFQ84vOsKZTIsn8T0Nvjft8WRgXJLOnIezTvLBCh+6kxUfMAs8lFLe
         1sm0f2bu7AvRuWJOxuVI95JEStSD+EBTlx47nwFncUkvlhGfbmD62FMVbM2AHCDHlCaS
         pOm/1QBHQIWG2ONDpUraWXf9yvBBtjyByTvb8qFGa6euPIVnfkfLxpFPpWq4YCLy1KtD
         OYKhKEtbcEcabulpiLHPRKKQALGMHkw79/tstqAt9T7CcdH5CVDUVmgW+5YX6BAeGDPn
         fAw66TvT+6OVMq9DNs5IR9HnL9+b5lH3cOckplXB4fXCIsCZ5VKbyRQFu2/8K3qjDAcR
         QV4w==
X-Gm-Message-State: AOAM532XxmIPzheG7kNoQ13iSBlGDCfCKVGEXWYSccyfk6Jva26AXgno
	AO3lm6PmiP0KsjrTeIcAznnL9mxXeKw=
X-Google-Smtp-Source: 
 ABdhPJzaj2NGgCvBDt14dGWAruzZVP5VJLkQwxiD5ZUSrFOeejvB6c1jRvjoprF00u4ZVFAGLmj/7A==
X-Received: by 2002:a63:c00c:0:b0:3f6:103:5bc1 with SMTP id
 h12-20020a63c00c000000b003f601035bc1mr10223607pgg.404.1654283972159;
        Fri, 03 Jun 2022 12:19:32 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 06/20] postgresql: upgrade 14.2 -> 14.3
Date: Fri,  3 Jun 2022 12:17:05 -0700
Message-Id: 
 <133d2c20031dd573fbc2fcd8f3b537a358e425c1.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97395

From: wangmy <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b3aa90d11d0b6dbf705a0ed08d256e4980766902)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...01-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_14.2.bb => postgresql_14.3.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.2.bb => postgresql_14.3.bb} (80%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 39ec7c2c8c..78f24585e8 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 9c9ac8b64f940bf69ecdc92abca9b58f12b401c3 Mon Sep 17 00:00:00 2001
+From f7084ba49758a6b8db46b917b7c0f831bd65a08f Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3b148b6..94f39c5 100644
+index d3c55f2..9120184 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
similarity index 80%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
index 52e8867142..c686c9b358 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
@@ -10,4 +10,4 @@ SRC_URI += "\
    file://remove_duplicate.patch \
 "
 
-SRC_URI[sha256sum] = "2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a"
+SRC_URI[sha256sum] = "279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38"
-- 
2.25.1


