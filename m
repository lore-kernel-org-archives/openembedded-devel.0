Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6F1CA9ED0
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.350.1791866431028504203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GIjCG1mA;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1154330a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866430; x=1792471230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=GIjCG1mAxplHJ05mpiiYhL2b9DHbOFxE2dRx4j8KVUhC5zJEUwiKiUSITM4hhY/oC+
         kTwneaoQRJmLs68o6QYH1wG7IOiTZf6B38bey8qIsFkiY+bmAxjU8s9/BCkbyXWQlyTz
         muY5lvIiOc4mtj8rcU/738Y4TfkXWeNqCr/263pha/IZw9Gxra+jq3mDG3hYKK5+z8Oc
         WzSWzzbwZ6k+EBtoq+RMj194gW9JdRHjIlWlcJXVXFN6TmfcK6WvIvZc8rhr4LzWLV2K
         jhuq2YgqaJGjoCEV1cpJKnZB6h0dxUsOynkzYAwX1WA9w7UAQvVOyMByYkGFvvdxJWzq
         I8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866430; x=1792471230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=JFLPEj+mScRDL8cYpllrFSPJIkk1p6yzqLlMtTNlZdHTFpthz0pNKqrtJ4MLyIMAA2
         alt1OvwCwWrpGB/gfbPfZBqobITLtMT8/YQ0hhpeDbb0X/NCVhRrHdlx7NTg1yakn8WB
         4agB3dYQcLSLT2e7UTCtAYCm4dI9NCVRUn/r5rMzuJX89OKpO8QnM8w5u58eOGC4HfHh
         fnc1odBwNxcMd2LvhCHVdE7+oE8TfoW4ufww0OBg+nBewMq2trBBnkvE26mGTP08y0LN
         MQtGfHgHZjmhX3CgCVZZHwU+RoaB6I9s1qK7/6jkP/Kmq3my+zF1GLF8DTPkUAcXfBbN
         3/0g==
X-Gm-Message-State: AFq9FYKUD6mlSwg3RlsMi2AI85xzGDFqrBjJ1AwoKuTSvFeCwezVAYUQ
	ODjfXMZ/yMjIc4Pc/rYWeLXsM/jCb9ozqkGtN/AEuV0mwPk+3ty3/QpblaL4jg==
X-Gm-Gg: AYBFou0NjC6i8nl7wMDyT5fBfO8npDOQRN++4prlz2dIKNyK/APUo3KL4RpPz5r2+kG
	GrBNO7bnVw93tyHoWvl2vgNayAMpzS0Y7dBj5djV7DeMmciQR4LurQVzSWht5DtvuKLtuk7dY4Q
	/rta/PITQYrnxTjxKo1KXjU55V7eemb5hrCBxFvfRjATbikreV+gY05ZCAmkiSnQ46eIEOYK+R3
	DinTn1Pjt2Fe6eGhhBlBsrxHCrwrh0l17icS5Us2HCMNiXi4FTlKN4lYtE8hMZDfwg/XMFHsUXt
	QylT9rXKIkZ2EvT1c2C+r8Rno7tE+yxwrClItqbS50/deGRbCSjjpaOXJAQrInQfVFG2uh/ddRl
	L3BOo+AzeWMynuhX9PYc3z1Bypym23N5Tfm3r+Mq85z3C+zOLhXV88wehgtnfxuEErm0Wp7j3A9
	1ZM0AcUJbVHeiWgzsH6WesPH4j2XjJzNWa0MlhdIIRdlKkd3yho0dUmQMyYKx/SaPNYTZwiPJey
	o/SvP3Fvh7fSy1nk4z5hhggZUNvMAGVysVAdN+f53krCK93Aw==
X-Received: by 2002:a17:90b:48c5:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ab3a4871f1mr9713426a91.4.1791866430190;
        Mon, 12 Oct 2026 21:40:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 5/16] ntopng: patch CVE-2026-84990
Date: Tue, 13 Oct 2026 17:39:55 +1300
Message-ID: <20261013044006.834868-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130819

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

