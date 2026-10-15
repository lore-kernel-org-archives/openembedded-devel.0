Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80F3CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:59 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32852.1792043096238819499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=giLs52ey;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so26196645ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043096; x=1792647896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=giLs52eyxv3vwDzvnacuipTlhkziikO0VbdbauK/JUo2Cc9MhYIMxgVqQ22IW+ecg/
         N65ESvvA81Mc2JLxiMYmanVEtJZ4ygexa3i7L/QbxUr1IU+z7B1NbK0TUhzpF61eyyVF
         f5ZpR09JYgtco1RWg1UZUm8lfDycNWwUjaNgsEtwqedxh5UbQNaAxvk+TFv5wcn9oJT+
         OHRuSx8f1R1HZ+ZDi9WaQkvdeO6CM8eci9NbXy6QpQsPh2pIKxe8oExiVHLwA7tndH+0
         DZdBpzV7TE/kq6IifV7fpFM7jKNKS0cY+Boe2y0r5w5D0VXMX3JcQV9v4IK+KLaeEigY
         GQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043096; x=1792647896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qb8/j2uKVCmvYEcp11K6RjURHYDD16OFpwlyTN8Ral8=;
        b=l3IgROcDtTxzLos2MNy65mAKVkVQhJ7MBrvHSeNI+iy62KCBFtj/XSSiWvaFGUfhKe
         EpyWa9VcGEi5JKZzQRscDbuJnxlCBO9xiQTzffxBpW+Gj2LuOQr1bSHhUiHbnhslwwJe
         +ZeAYxARAGm13Swum1U/1N4RZL9VnDNBOWuZlQP00te82HnqZmuRp5U7CAnYg01ATH+r
         gQGvDtwkFEcj/L5TEauDOYVzR0YpIyvw5oMOkkIZC0ppp4Ez0Y3mbN4k/1SOSLkuVCB+
         WAnJXjHsKZb+ybjwmFGa4/b1TSiR7qyWOeCUNoha7TKd7PpK7U/DAVF2KvZKOEtRL8n3
         KqcQ==
X-Gm-Message-State: AFq9FYKvN+hdXkKw1pyyT2nMY3w3ZcjbBMhYNDgPg1vJGrsV4nrxi18t
	BriIrVLSOXHUFVqlhc9bWV27pw4D1WiGVHW/0aCcfJv6uBEzvqXpnYAZU4mcHg==
X-Gm-Gg: AYBFou0q7z+7OMyDau0FLktlSbG500y6fAsAZfh0/RjsQJPD3LCgOgIZpWAcy7xNaYo
	zxAvVuyUl8QHSUsveMQrL3NpHLENMwA//MB5XmG3Rsuqou+2aKIpiFu3vB06WQfix2cIYwv7Dqk
	1vJ+aitax+SGnxZgOgQxrwKgwqryIWw2kpcDQWMHHDTAjZ3OA1asuV45WDvt0T7CCiDlkvHzGIq
	3UyGry4zu4YibPkDKrSVwZVYIe/QmeX/u2SbbTGPr8oRbkAAkyVxdyrR+LplJn3yy6+6HNvDUV2
	OiqAmMB0TX2t7BFKafYSnWlTnixnUedvwx+16mRY+EMM4+bmkdBJ/AtXK9sY8ErXKpH5iTepQag
	V3iqpWHVKFLYQWrTMN1OaL+khX+erOwisfujAq64uFETQb9i96FQ3PRi40znM73fJE4P5EJuciV
	mB5wa9csVmZXX0MBEd9uFXb8Dyn8fjTeGY72yXG5iKQoLds4Upuelnbn7V2ehjW8b7CiCGNHjDB
	sY0UEA7d+57BcVp9m6pKPE=
X-Received: by 2002:a17:902:fc43:b0:2e2:da27:a926 with SMTP id d9443c01a7336-2e84280dfa1mr153159165ad.1.1792043095501;
        Wed, 14 Oct 2026 22:44:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 59/82] ntopng: patch CVE-2026-84990
Date: Thu, 15 Oct 2026 18:41:47 +1300
Message-ID: <151f9c3204cfc0e34d283f756a529253e236e7c7.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130979

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

