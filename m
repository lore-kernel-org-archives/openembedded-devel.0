Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68089C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 20:36:45 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.5837.1743712600122339164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 13:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMvgNEWT;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6f768e9be1aso28807537b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743712599; x=1744317399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4u++QACU+kdTmb2MweAhJQ4nUuFW9zx1Yv5IYUAMfw=;
        b=UMvgNEWTElFlPaOSdjNHwkDuHctjHb4OeopMONwUQ4KUOa54d8lse71drXJmN7/3a1
         Pfo4UiZHnTyWIrScHIc185THyw7cmW/Z3hTO+NHhCnSt/DeJRsKN1QuQP8Kd2v4RR+AH
         umQxZvxRAPGRrkWSz3W6qfOafmxDAeKaBAubRNwXQRzPvihEt5n+SC4FlcvOAHDl/1pp
         +9XCzh15bNrYr5i8KGkkAaq++S2TDFcX9hDRLVGwROA/Pe6H9ujAybwabfEjm04cE9oG
         7wqixaNEYQCyBnY9ouAsfNt+7xGLLmgX9b0RJY6KnMXq4MEkN2agWeJE1E2aQblmrQwk
         UIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712599; x=1744317399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4u++QACU+kdTmb2MweAhJQ4nUuFW9zx1Yv5IYUAMfw=;
        b=Ykaxud/g0OxlUc/CeI053/UMjTa6Cafz1ZELsFtQSuIX6QahDZElGcJMaa1/EZ+2w2
         XaivAvlvZLZ4TfJWq9thcPvBJFvM331Oi3CzoAjmWacylGZh4e00qOvUQeCzmvN+/O7P
         evh0cRyreMEnDu1cUe9QXzz0sWMJjoN506hIjiuXxEX9taDOFuNmoc8vNe+zLQhN3vVi
         jb8PaEM55Llq1Zkv3Se4B2fVdcUeBtCX5aw7n2kvqszNnzfRBxGE+zD/4/qia4wd0eg6
         mBT6MC4QmsQbZTGYIE3QNUuE8GeefNgfQFr2yM7wS0/dOAamavPNVjgw33Da1ATSEt9T
         CEVg==
X-Gm-Message-State: AOJu0Yywtpuvyw5tUa/gejKay3rhZQnJx+Y+oSqqy/Xuwoe49VE8u4LE
	saYWqC6JXLFqqGb/YfPRXbuKaisUr8+OEW2TI3vTtg0OLy5pIVg/1+4d1mPQ
X-Gm-Gg: ASbGnctCgESvYElEI4v3Hr7DHTQa+kb2O9TKDbU7KyU6CJDko03hV6GaYsU1PY8k1xV
	1/c1ICfysJQQ3wJZ6InRPKoSwQxRuV+s79HM4kZEdMrFpHC6pvb54upSHkbuedRHRoWaBksxIXH
	pKcelmsGO3OFXFonU+j8a2dJimDE5dY8lPpERpi1XZ2IeNhdIFUzfOvjte65OPKCllEw10stPGO
	qK2Y1lfy0rnf9z6XoZxxe+D5YYlZc6Li7oAIqTWLFwnQuAm6w3k1R+x+YHEWizRwKhKoS6rxoNV
	s34C8w9y4SAOSPgIlAljOm/lHp2UO0dvQgm/JLBBpjyYzLFcdLcXC8kM7BLr
X-Google-Smtp-Source: AGHT+IEyarxESnFh+PncIQ7cgjIuszoQt72OYPNkqkpUEaX0IuHRVv2TtwdfIYcQzdnAi3Y2cK6jEQ==
X-Received: by 2002:a05:690c:6386:b0:6fd:a1dc:b409 with SMTP id 00721157ae682-703e18fe2dbmr13026297b3.5.1743712598658;
        Thu, 03 Apr 2025 13:36:38 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-703d1fded1dsm5241477b3.120.2025.04.03.13.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:36:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-gnome][PATCH] Fix warning : lack of whitespace around assignment
Date: Thu,  3 Apr 2025 16:36:08 -0400
Message-ID: <20250403203609.287005-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 20:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116545

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb        | 2 +-
 meta-gnome/recipes-gnome/gdm/gdm_48.0.bb                        | 2 +-
 .../recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb     | 2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb                | 2 +-
 meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb              | 2 +-
 .../libcloudproviders/libcloudproviders_0.3.6.bb                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
index 496e0dc7ae..050f6803c7 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.5.bb
@@ -1,5 +1,5 @@
 SUMMARY = "An archive manager utility for the  GNOME Environment"
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
index eea4196c80..1c8076e6c7 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME Display Manager"
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
index 8e4b238b85..07d631bccb 100644
--- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "This is gnome-user-share 43.0, a system for easy sharing of user files."
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
index ed5382035f..8e82b86285 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Image viewer and browser"
-LICENSE="GPL-2.0-only"
+LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
index 4b9f9fcf26..5f239a6c6b 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "File manager for GNOME"
 SECTION = "x11/gnome"
 
-LICENSE="GPL-3.0-only"
+LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 
 
diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb
index f5660b5267..7ea7c50462 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb
@@ -1,5 +1,5 @@
 SUMMARY = "libcloudproviders is a DBus API that allows cloud storage sync clients to expose their services."
-LICENSE="LGPL-3.0-or-later"
+LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 VALA_MESON_OPTION ?= 'vapigen'
-- 
2.43.0


