Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EACC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 03:41:02 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.150327.1680752459842093351
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 20:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lkfQKHZ/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id n14so20498842plc.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 20:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680752459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J7Wpb9HQTnwzTpND8+x8g6aAzk8Wku+uQ+x789O8oZw=;
        b=lkfQKHZ/313TDmh6NZ7UlKaysA3KsBqhYfQ38PtonEG0K21Hg8Y868/CgPwiEBd+FJ
         YTU1rs9doV3ZIYgVwrWxXt9pYS/+32S3NcY/ZpEw9vGPZFm2BDMzHIuEZsULJzmosoyC
         8wFk2pXr6Wm2b9R0tWW82SEx0wqdqqEqwCrmcrfex+jZwkHVy/YqxjYmVKRNYaGpWxbM
         uzQhHwRdYW9eydHR3tc9o1w4LitR/nvtGHm1PK1nkzYuma75EnFpCYHtTxdRXKSNd5zm
         afLqnx4tURL1ULxxJTf8NlQRS7GR+AY9/PIFAtqKl8XDYYwLhkxy6YAtAxq+lXC/S+xY
         vAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680752459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7Wpb9HQTnwzTpND8+x8g6aAzk8Wku+uQ+x789O8oZw=;
        b=Glww2v+fI2MA7/qM+7UVYxsaaTgCAh0uHWGbqz/l+YFBwoQYrahgskC6pmTaLCFWjz
         WYhk3ioQ6/UDLHOn6NS9yeeLulzI1P5/T3FkCXmo37gXyzFaXVgNPwOcewGDN/T+aQLr
         BKq5S40YrOnncLnEtt7z09/gqmbtTBxKU7UOQp6ppKhciobJ1aEdtRB9D+AVZcWyTDd5
         7Ntsq5wf6X+emr+GHW7d4H6OTJW9W4x6v0TPSYijMxu7/5rVd6mWalruDQ/kQR7+hGlh
         TjgSve6lDBE0I40ersfQdpbMjV69dkA737g3lyVH1vjbaKDFps9oOq76M+EeNLgBkQa1
         KUOQ==
X-Gm-Message-State: AAQBX9cJIqXkhhBpXMotqxfQED1OSuhz+POQxnNO4J96VSWnaG+GAMB8
	lads7eKUbwoi/g57GiE//Wjm+tAwO0fpHA==
X-Google-Smtp-Source: AKy350aGQZhxI4ABBpXKNTwegR9LO2m6JLzf04Cp1vYweeUAOlSk6kZHze8TePPQ0pyOhJKR0EpQUg==
X-Received: by 2002:a17:902:d491:b0:1a1:d70f:712d with SMTP id c17-20020a170902d49100b001a1d70f712dmr10490348plg.31.1680752458902;
        Wed, 05 Apr 2023 20:40:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id ik23-20020a170902ab1700b001a281063ab4sm260932plb.233.2023.04.05.20.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:40:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] meta-webserver: Fix missing upstream status on patches
Date: Wed,  5 Apr 2023 20:40:56 -0700
Message-Id: <20230406034056.3289471-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 03:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101965

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...gure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch |  1 +
 .../0001-make-Do-not-build-po-files.patch        |  1 +
 ...onfigure-Respect-LIBS-variable-from-env.patch |  1 +
 .../0001-remove-tests-dep-on-gobject-intro.patch |  2 ++
 ...file-use-copy-rule-for-unmodified-files.patch |  2 ++
 .../webmin/files/init-exclude.patch              | 16 ++++++++--------
 .../webmin/files/media-tomb.patch                |  4 ++++
 .../webmin/files/net-generic.patch               | 10 +++++-----
 .../webmin/files/remove-startup-option.patch     | 12 ++++++------
 9 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
index f3be7c6e52..b16060f2a1 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
@@ -7,6 +7,7 @@ Fixes errors like
 | Makefile.am: error: required file './README' not found
 | Makefile.am: error: required file './ChangeLog' not found
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac | 2 +-
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
index d4c0b6e8c6..1d6a2182bd 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build-po-files.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] make: Do not build po files
 
 Target fails to build
 
+Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am | 2 +-
diff --git a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
index 7a229513b6..6669848a06 100644
--- a/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
+++ b/meta-webserver/recipes-httpd/monkey/files/0001-configure-Respect-LIBS-variable-from-env.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] configure: Respect LIBS variable from env
 For musl we need to pass -lexecinfo from env
 this change accomodates that
 
+Upstream-Status: [OE-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure | 2 +-
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
index 8f70fe9434..b633cb0cf3 100644
--- a/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-remove-tests-dep-on-gobject-intro.patch
@@ -3,6 +3,8 @@ From: Adrian Freihofer <adrian.freihofer@siemens.com>
 Date: Wed, 4 Dec 2019 17:23:46 +0100
 Subject: [PATCH] remove tests dep on gobject-intro
 
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/ws/Makefile-ws.am | 54 ---------------------------------------------------
  1 file changed, 54 deletions(-)
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch b/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
index 48702c3d1e..1e5cf09d16 100644
--- a/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0002-fix-makefile-use-copy-rule-for-unmodified-files.patch
@@ -3,6 +3,8 @@ From: Michael Haener <michael.haener@siemens.com>
 Date: Wed, 25 Mar 2020 08:32:07 +0100
 Subject: [PATCH] fix(makefile): use copy rule for unmodified files
 
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  pkg/Makefile.am | 27 +++++++++++++++++++++++++++
  1 file changed, 27 insertions(+)
diff --git a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
index 4212917f6e..027a9d4ad9 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/init-exclude.patch
@@ -1,11 +1,11 @@
-# Hack in support for an "exclude" config option for the init module, so
-# we can hide certain system services that shouldn't really be configurable
-# via the web interface
-#
-# Upstream-status: Pending
-#
-# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-# Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Hack in support for an "exclude" config option for the init module, so
+we can hide certain system services that shouldn't really be configurable
+via the web interface
+
+Upstream-status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
  init/index.cgi   | 27 ++++++++++++++-------------
  init/init-lib.pl |  5 +++--
diff --git a/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch b/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
index 46f3109796..dfc962bfb7 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/media-tomb.patch
@@ -1,3 +1,7 @@
+add mediatomb support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 diff -Nru webmin-1.570.bak/mediatomb/index.cgi webmin-1.570/mediatomb/index.cgi
 --- webmin-1.570.bak/mediatomb/index.cgi	1969-12-31 16:00:00.000000000 -0800
 +++ webmin-1.570/mediatomb/index.cgi	2011-10-26 10:00:05.992522036 -0700
diff --git a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
index 5549392851..6ae3dced72 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/net-generic.patch
@@ -1,8 +1,8 @@
-# Add support for configuring network interfaces on a generic linux system
-#
-# Upstream-status: Not appropriate [config]
-#
-# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Add support for configuring network interfaces on a generic linux system
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Index: webmin-1.850/net/module.info
 ===================================================================
 --- webmin-1.850.orig/net/module.info
diff --git a/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
index d957f4a3bc..358e53ab8c 100644
--- a/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
+++ b/meta-webserver/recipes-webadmin/webmin/files/remove-startup-option.patch
@@ -1,9 +1,9 @@
-# Remove "start on boot" option from webmin configuration, as
-# end-users should not need to configure this from the web interface
-#
-# Upstream-status: Inappropriate
-#
-# Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Remove "start on boot" option from webmin configuration, as
+end-users should not need to configure this from the web interface
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 --- webmin-1.570.orig/webmin/index.cgi
 +++ webmin-1.570/webmin/index.cgi
 @@ -79,20 +79,6 @@ print &ui_buttons_start();
-- 
2.40.0


