Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AA4D11199
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 00:21:49 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.47190.1730679706806352721
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 16:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QhhCWFjk;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7206304f93aso3500831b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 16:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730679706; x=1731284506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WM7NIzsZzJVC/y6m2EI3+4sTK0KHUMU+mH5gCzwP/hU=;
        b=QhhCWFjkUTnUJbY/Aojbex6AEs2LiYKYfgy8Ftu9b4cjb4rpgBu04Uvk2uVTZJsf9V
         hBHLAI3pwjlvUkz+jjVhAttFXTsesRK14KYttHJDaDFG24d0Ngo7PywStWAIaSZQ1YUq
         Y1QVb1p934MPzXEpyD5V60JMa0AZw4NDp258Xls42tsH2+jixn6C4z3/fT6GKJWZzTZm
         nFuKLCSGQw6gz4V3l3rxFwrDz040B4C6lTNKuyJdZAaPUOqj7QVIsRAC8q62XHufU9Wt
         GbpK5Qp5MunJ0FPb8lNLKC1Db1KIAJNjQDfaUlnP+R8xCfNquYr4Q2/4irU4T9pEZFMX
         JFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730679706; x=1731284506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM7NIzsZzJVC/y6m2EI3+4sTK0KHUMU+mH5gCzwP/hU=;
        b=pNNbqoyZLMCbZbOh0BYKi69xkmecQmlNOwwiidz1AjUqPPiMrhAfS+iJdvHk5lfbpv
         wKdoxE55mP+hkRVwEm2Lt+8LKKQl81sA/SxmmRjbcDv1aqxdFRFX3zLLeXtcMu9/g2MR
         sAL8aI8MQftqtW+yU9OpnwwVeWQltc7uOgNT28Hn70/1LbqZoaJyn/c4sZdR8/+nVoOB
         tyxX0Aj9GzMjz2x7JAILAblbQiQbUNGchCHKF4Iq5TTolNY5M/MrSJ4kKQzLebKk+Nfw
         lLHjj3uwAZgkPcTdU6ZbSR7JlB06MF78bym9I0aVCBtFhSTRvQn9mhxUDJBjaH62o4/J
         Rr8Q==
X-Gm-Message-State: AOJu0Yw+cWuQun2gjqpZOIjuXSBZnjQ5VmxO88DXWtRAJ3wo87Gg8lUT
	HNlBzK0jbg17+lKPp9S1FuPjBkP0dqcSjuUsJgllyTkFsrPjmB2RLCGBMw==
X-Google-Smtp-Source: AGHT+IGSb4WCrXueJgv8kpYagrz/OdmfkX8EULYCmJ6lTu5/08nIdVzGgAY+N2SgpRG+M6lc3zoSIA==
X-Received: by 2002:a05:6a00:188d:b0:71e:4a1b:2204 with SMTP id d2e1a72fcca58-720c99ee954mr15302357b3a.25.1730679705885;
        Sun, 03 Nov 2024 16:21:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::18d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c498esm6413871b3a.97.2024.11.03.16.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 16:21:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] postgresql: Add tclsh 9 support
Date: Sun,  3 Nov 2024 16:21:42 -0800
Message-ID: <20241104002143.2982616-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 00:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113401

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-tcl.m4-Recognize-tclsh9.patch  | 26 +++++++++++++++++++
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  2 +-
 .../recipes-dbs/postgresql/postgresql_16.4.bb |  1 +
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
new file mode 100644
index 0000000000..89a509087f
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
@@ -0,0 +1,26 @@
+From f0d8240dbf594e6dfab31fd7d70ce340ac365a65 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Nov 2024 15:50:50 -0800
+Subject: [PATCH] tcl.m4: Recognize tclsh9
+
+Add missing support to recognize tclsh9 as supported
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config/tcl.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/tcl.m4 b/config/tcl.m4
+index 9de31a5..568fd45 100644
+--- a/config/tcl.m4
++++ b/config/tcl.m4
+@@ -4,7 +4,7 @@
+ 
+ 
+ AC_DEFUN([PGAC_PATH_TCLSH],
+-[PGAC_PATH_PROGS(TCLSH, [tclsh tcl tclsh8.6 tclsh86 tclsh8.5 tclsh85 tclsh8.4 tclsh84])
++[PGAC_PATH_PROGS(TCLSH, [tclsh tcl tclsh9.0 tclsh90 tclsh8.6 tclsh86 tclsh8.5 tclsh85 tclsh8.4 tclsh84])
+ AC_ARG_VAR(TCLSH, [Tcl interpreter program (tclsh)])dnl
+ if test x"$TCLSH" = x""; then
+   AC_MSG_ERROR([Tcl shell not found])
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index fb3bca2724..ec5daeaa66 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -39,7 +39,7 @@ export LDFLAGS_EX_BE = "-Wl,--export-dynamic"
 
 inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext perl-version multilib_header
 
-CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
+CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
 SYSTEMD_SERVICE:${PN} = "postgresql.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
index 1a47369e4d..7135263dac 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "\
    file://0003-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://0004-config_info.c-not-expose-build-info.patch \
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
+   file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
 SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"

