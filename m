Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDB6CC6B14
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:37 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3420.1791885569409458576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N9V8d5ei;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3aacde0cc0fso1041557a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885569; x=1792490369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=N9V8d5eisU/BmJVcr8CJZgrYOAXxO31GSlXOK4IcHiyJkFMFo0REFJb4dIDrBWt9hl
         +8ign+Dos8G4eb5/8Uk3ydWX5KV5C+AyrT0+tJ3QqrndynaUyGJzTyaN+GeLzmq4Ol/Q
         9+cf2hf3UJmnJpaE6qXCJsdTYRbQLiqXoJEtjIUdueYqqtIjeZ+NwWOBM0Rl1WXQiXKp
         WR9kCCseh2CFyLc/PfODz3WxXmYPQdVtpeOF+I02qgLhFY9h65DCeMYU/G3BLZexh+Pf
         7XIivoJjT7dpIOhPJf6W45NTJIFxQbZGSrLaS/kYdcgsFnBLv/5d9kw9gkIPp8x00tyg
         sq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885569; x=1792490369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=I7+C1WvWdgQsneP/qzIcnZEriSB+DrDJhAem0r4GPsZoXcc1ukPUAtNYDzX9ulSQNj
         iZqzo3SrCU78H963MQtJkZaWZi6UvPV60fLlrTmY6+FDcV+wkZkDoE2cavBmtq6ibloU
         bNAG0OF+HfQQdC7ELauQGJG1KkGcmAiYtJbyro88w58sOZ9eyTZMsifWxOsg016Lldak
         PICS5h/HY6iirum863toTHk8EyC3m787gvsjmIO5rPEYMzClI8Ndy8luoPkWkMSfxNH/
         1I8adI6xo7ANjwajuVc9mGPmZVZD2zpWwFiW0LdHCFp1Cvj88uRgrzAZzs1YoBS+sBG7
         B5HQ==
X-Gm-Message-State: AFq9FYIb2PYU080BWvxfKM9riKsx/IRuk9zVN6h93w8f62Z6i/iKYajs
	ELaWhi7V0xhPHeuKwzhYsQdTcVkwewzqtlF+kBtotaAnxvtowS5iUY1arWRijA==
X-Gm-Gg: AYBFou1pLCApz5zPqKIe21PDNw3rVPYTWOTsw9u7h5gF+lDYJO6ZG/sazoAbctUENIz
	nGmberKQM6G8u8t/LiRAHRbUufINxl6i5hbQgLSWp8xerq7YXxKMkOPW46uH91KYuMY6Fx+h3Rw
	q6eNEdELtz8AvUogyazgqXA+bwyS6jaWP7ytwlIaAOGCFwZsWTT4tRjHrPPhimeE311vGG+qv0Q
	02R2TUlnBTAuWktXzrAxzLpWJeGQ+gekr2oHignC965XHf5VZqinis6KKvzIatb20tznf6T+KVT
	3wo1WJWDk6hN8njzaMkwBCIUs4yUXQDYIGxADDi5/XQtYBK0bgtZ0OEB8HPKARiR8DUC64bMxBJ
	mx0WhwjczmN2OwQ6ANjPSw8bbnD/Wxn7wvJZuS7vgNPoh33RDAml8XqTdqIJNMPP9VbAe1Be1vc
	07xF38+vXkjXlYalUiLrbDoGV+k5EHyhAo7WhO3lGMMG6RiFKiwJJbDGO64AsAW81d/SexDlljh
	oY4Am6pMG62ljC46s8gYt3+ZwQMYI6YOizBAsM=
X-Received: by 2002:a17:90a:ec87:b0:3ac:5ca:c7a8 with SMTP id 98e67ed59e1d1-3ac05cac819mr3352083a91.60.1791885568562;
        Tue, 13 Oct 2026 02:59:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 7/28] ntopng: patch CVE-2026-84990
Date: Tue, 13 Oct 2026 22:58:42 +1300
Message-ID: <20261013095903.3544906-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130840

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84990

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 2d932fa4e349690dc42485b9dd04ab04d19710d9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ntopng/files/CVE-2026-84990.patch         | 53 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_6.6.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
new file mode 100644
index 0000000000..0b443e3050
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
@@ -0,0 +1,53 @@
+From 2f36e393fc35f576d7c447af337848e81990b084 Mon Sep 17 00:00:00 2001
+From: Alfredo Cardigliano <cardigliano@ntop.org>
+Date: Fri, 17 Jul 2026 11:51:03 +0200
+Subject: [PATCH] Add admin check in conf backup listing and download
+
+(cherry picked from commit f912ee93bc143330b6ff3bb946ee7211e5ee9e1a)
+
+CVE: CVE-2026-84990
+Upstream-Status: Backport [https://github.com/ntop/ntopng/commit/f912ee93bc143330b6ff3bb946ee7211e5ee9e1a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../rest/v2/get/system/configurations/download_backup.lua   | 5 +++++
+ .../v2/get/system/configurations/list_available_backups.lua | 6 ++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
+index 1603a94c48..404b09ed97 100644
+--- a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
++++ b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
+@@ -12,6 +12,11 @@ local backup_config = require("backup_config")
+ 
+ -- ##############################################
+ 
++if not isAdministratorOrPrintErr() then
++    rest_utils.answer(rest_utils.consts.err.not_granted)
++    return
++end
++
+ local download = _GET["download"]
+ local epoch = _GET["epoch"]
+ 
+diff --git a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
+index d901a876b0..8a08ad15d5 100644
+--- a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
++++ b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
+@@ -8,11 +8,17 @@ package.path = dirs.installdir .. "/scripts/lua/modules/system_config/?.lua;" ..
+ 
+ -- ##############################################
+ 
++require "lua_utils"
+ local backup_config = require("backup_config")
+ local rest_utils = require("rest_utils")
+ 
+ -- ##############################################
+ 
++if not isAdministratorOrPrintErr() then
++  rest_utils.answer(rest_utils.consts.err.not_granted)
++  return
++end
++
+ local rc = rest_utils.consts.success.ok
+ 
+ local order = _GET["order"] or "desc"
diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
index 03350f240c..b4a1ff1883 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
            file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch \
            file://ntopng.service \
            file://0001-Fix-build-with-OpenSSL-4.0.patch \
+           file://CVE-2026-84990.patch \
            "
 
 # don't use the lua under thirdparty as it supports cross compiling badly

