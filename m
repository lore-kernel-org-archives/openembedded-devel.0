Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411F4FB3D15
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:40:00 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48219.1774867196323277203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Rp90y6Ei;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d96be7c13so1263545a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867195; x=1775471995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj3D8UTTUcNdN4ErjdnHvRyE/b75TiPrek3nUIF+GcQ=;
        b=Rp90y6Ei3QIBEJYmdELAu/UqGmJHyCK1qvRWihKXKvunPL5RXTMBTNMZs/q06LqyPa
         Uf1f5bcquN3mMxfAz9TArm4UyrVrc7HRG33Il/ZY0bBaDydgFkwZoF9GXeJv7HyFYLBU
         carN28fwv0n4g3aIgvLXja/68EAxlWYMgsJuWbYZUtdb3CvsdW5AtUN1Tm5MPQ6Zj4G7
         Tn8goZ/i95vMRP3UXMnfXOw/n3f9hK9MflZ9YfowGTzRvIuQwYK+J6/Tx2XhaEA6AXdC
         ZHBBh83zzdG4AfK3nM7Po28IUfwvK+8pvJAcvupx2nUIe4uTxDohprVQ2ysAhV2LFtd5
         Jxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867195; x=1775471995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xj3D8UTTUcNdN4ErjdnHvRyE/b75TiPrek3nUIF+GcQ=;
        b=C3aITgo3hFF3HZY1S7MHDDQjDBKQ7cacFmU3PhXrRv+Q/e/a+IRJBC8wmkEaJ1V3Hs
         T4mUMfBqp+8uI7n2mkW233YTYIuJRcXIXF3QcjEsK3vaYFlQBGy5lo9AZL/A4x+kBSqA
         qfSZlx3arfHqjpGby9kj/kniR2OIy2gKocM1uYqnoC5JECttpP2HkGAX274VFQgW3JTO
         nhxAWvMA/iCwPSWxpkRq29afDNfz7amt/3i+LlFjl1ppxXcosxZ/9cYFeVi2+4Jji06r
         +ZnxdaGZ3lB7qEcHvJFpGUzuPRHplumn+kohKDIe796MvKbxLT8Wi1oXPT7YeRlPQGE0
         SOrw==
X-Gm-Message-State: AOJu0YwFZgdJnGumyEnLiuXRzDmIlGZkw3To+cc2zscR8UU0BWyg0DiX
	dqI66Et8HIjT7Jm8Eo0nz5WEv/hZTxXCn4Q49HKD25v3OK43rb3kzdbQeZDQcA==
X-Gm-Gg: ATEYQzx0JtnwaLtnm61CcJGLctvz3KOi3+HHjODJjyFwpzp7sQkCwbZLqw45OZaOxpg
	rAVYE4ar6cAig/cwLw2CI9AjhDGvgMkaAhfjb34TO8XQR6YoaMYkMKXgTHEjYHwaaktthgZtDVj
	hIgrKdwc9D1DGZyEMHKsVzlLB4WQj4JGeyzNYptbBIxO45blR4n3kd7NF1pwUSW6PiricM54kVr
	iUdVvuwJChGbhyLeo88nXUHn2SPvBoiO7AUftgGQuePovV3msnbGeN3XHEavTgL7uDvf5PI1wTO
	l/NAufrOdkr9iLJ5hjro76MOMYPiNXIy21+bH2i+hplPG6pvpwvZ+cRywFolCzU365Tu7To42tV
	XG1GUrgkwJciu0N9qrxRzcfw0Ed5vdUnmSOaU0Df10gn0SwcLznzdoCcq60XCwpSrcP2fmUc23k
	2SrMG4vQIoCINrFfRYGB02CPOQYneZtaui9Ss=
X-Received: by 2002:a17:90a:16cf:b0:35d:9fe9:f830 with SMTP id 98e67ed59e1d1-35d9fe9fd5fmr2379388a91.12.1774867195567;
        Mon, 30 Mar 2026 03:39:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Zhang Peng <peng.zhang1.cn@windriver.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][whinlatter][PATCH 19/19] libwnck3: upgrade 43.2 -> 43.3
Date: Mon, 30 Mar 2026 23:38:46 +1300
Message-ID: <20260330103846.3381644-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125862

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Version 43.3
============
  * Fix clang warnings. (!66, !68)
  * Fix regression with class group and application names. (#166)

Drop ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch,
already included in 43.3.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7d1d00858a031e371b3e6c411340b4fc76be4ccd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...40d59c32d7ebeb94d242436e3144cefc174a.patch | 40 -------------------
 .../{libwnck3_43.2.bb => libwnck3_43.3.bb}    |  5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
 rename meta-gnome/recipes-gnome/libwnck/{libwnck3_43.2.bb => libwnck3_43.3.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch b/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
deleted file mode 100644
index 2d526e7aba..0000000000
--- a/meta-gnome/recipes-gnome/libwnck/files/ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ef0e40d59c32d7ebeb94d242436e3144cefc174a Mon Sep 17 00:00:00 2001
-From: correctmost <136447-correctmost@users.noreply.gitlab.gnome.org>
-Date: Thu, 20 Mar 2025 03:03:44 -0400
-Subject: [PATCH] build: fix -Wheader-guard warnings reported by clang
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libwnck/-/commit/ef0e40d59c32d7ebeb94d242436e3144cefc174a]
----
- libwnck/pager-accessible-factory.h     | 2 +-
- libwnck/workspace-accessible-factory.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libwnck/pager-accessible-factory.h b/libwnck/pager-accessible-factory.h
-index 8e2fe30c..25220fc2 100644
---- a/libwnck/pager-accessible-factory.h
-+++ b/libwnck/pager-accessible-factory.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
--#define __WBCK_PAGER_ACCESSIBLE_FACTORY_H__
-+#define __WNCK_PAGER_ACCESSIBLE_FACTORY_H__
- 
- #include <atk/atk.h>
- 
-diff --git a/libwnck/workspace-accessible-factory.h b/libwnck/workspace-accessible-factory.h
-index d2d4a84a..335b465b 100644
---- a/libwnck/workspace-accessible-factory.h
-+++ b/libwnck/workspace-accessible-factory.h
-@@ -17,7 +17,7 @@
-  */
- 
- #ifndef __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
--#define __WBCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
-+#define __WNCK_WORKSPACE_ACCESSIBLE_FACTORY_H__
- 
- #include <atk/atk.h>
- 
--- 
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
rename to meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
index 4342325f11..d804facf52 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.3.bb
@@ -19,9 +19,8 @@ inherit gnomebase gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI += "file://ef0e40d59c32d7ebeb94d242436e3144cefc174a.patch;patch=1 \
-            file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
-SRC_URI[archive.sha256sum] = "55a7444ec1fbb95c086d40967388f231b5c0bbc8cffaa086bf9290ae449e51d5"
+SRC_URI += "file://0001-Fix-build-issue-caused-by-OE-core-changes-to-startup.patch;patch=1"
+SRC_URI[archive.sha256sum] = "6af8ac41a8f067ade1d3caaed254a83423b5f61ad3f7a460fcacbac2e192bdf7"
 
 # gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.

