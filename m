Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9CACC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:00 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33268.1792043098388065155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wq1IUlb3;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e95bd1c14cso3273125ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043098; x=1792647898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=Wq1IUlb3mNTcRMeVcTsRERGgzKwMIpZ9ShC6tM9fV8/yKa988FO2CxZ3eGGifY947T
         Tb3QwAigd1nf7PwPXreCmux8jzTczaiTyUdxYi3NELykRpu8tKf0j2kHw5NLXXHOpoH0
         uxtwsaqmi2UPfcJUpI/Ylk4evxitgoClI2n/eNPVcmR1PwsYvhcsL8uSvj/Hdb2X7ws2
         yoBMAkn2rG9YNL/98B/mBYSeFBWusVrGW2zj7tKWQus+74D8YbpoadxuVzjw4JIFTbKd
         Ws23roSh40F0weU/bQ8WvJEeuX1KjQfWmiQcqM6+okew/9NKK5LYPsIOipuZJo1zVUz8
         SKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043098; x=1792647898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=05bLtUiATR2gxgjsLblndS37ddsSNSezxvt/xSp2RDaTmDgoPdf0kDq0EYc3+oVI1H
         EHDv0mNCJzB3ySALUH6w47J0hgR/IKQ/9PogCCBVgUCOYhup+d0soFdBk/oIUy2sNmEW
         /SJqBgxBobXyLo/huI1V4yT51i6dAfSK5lnqbz3npRdsDJ1gAo9cjvtt/95lJtO8WAgI
         QWk1k9x8oZ31p4LEeSce9R04Aj1ZMyj2tZMbRADhL2GHOc/nZPVWFvxLSv5xLK4qU35b
         UgrUjdG51NZlp7eLXJ3r+cmKN+EzTujnvVZgkZwZmI9nxqpiBUydAp5lbNDN4SWMWLJ8
         2Ycg==
X-Gm-Message-State: AFq9FYIRqS54vEgBrd6kl3/1OlDxVkHib210lLKOk5kmI2zpLYKRMZ+s
	/4weOjxGPOCMMDquirFo2HBnubPNhLhh4cTSEZaZGU9mFese80LrR/anhUAtcw==
X-Gm-Gg: AYBFou2cIRmaG8zTkb/bhnPkF94jaVrvhDpn+SHQn6uca3CwAPizdBsCh/HdgU6fvkb
	wJqLVpyybZdbG+jI3Oz2+pclNWtZ5WDuBBe2NXHeB7Bp8rpPLBCMfXWYSSUgy5YOlzRXK/JxYym
	ltCiqpmuOckfxR9bMxmcB4tgDRT0iBVKrulsH52d2BGxtdrfThrER7/RyV9kDaTB7+UaxRmndbe
	Nwc9ww+T8pYUf+itTeU4A6hFMXdZmWBfpUbCRJLINIHPJLpAhQhC/9PByiOy7DjynjU2xL1PdIP
	yXMVQNNNpxPk96tCNwm9i5EVxkgBTLpmD6iEOp/4qXTEvSOTqRHH43h9kaot6q4AVHVOyZfveYm
	wZvRNcIV3MttS4QCvKsQBCv5ZWPP/YyPXFWI4Ll5sdzdaie3Iwv22/BcqtknSA/mBqKRvGeOwoz
	/lnoxICsQseQNcBIsdAhwQ067ROZBLdgxpvqEW2fGScU0fMxz447RZWm/I0vzDZtQRqVcaFVRGQ
	T3fieuTPqPf5Gvc8pwSPcY=
X-Received: by 2002:a17:903:244e:b0:2e5:2e03:9c8b with SMTP id d9443c01a7336-2e842cd481amr168994865ad.11.1792043097722;
        Wed, 14 Oct 2026 22:44:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 60/82] ntopng: patch CVE-2026-86090 and CVE-2026-86091
Date: Thu, 15 Oct 2026 18:41:48 +1300
Message-ID: <8527b6772dc792b0b80bdb03d354ed8cb931639c.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130980

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-86090
https://nvd.nist.gov/vuln/detail/cve-2026-86091

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit ae180302f4c7f7dc0ba45c330d55b127aeefaf01)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../files/CVE-2026-86090-CVE-2026-86091.patch | 67 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_6.6.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
new file mode 100644
index 0000000000..a8a3ba72ac
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
@@ -0,0 +1,67 @@
+From c6f4d42e1bb029463f927532819c5f5b331ea066 Mon Sep 17 00:00:00 2001
+From: Alfredo Cardigliano <cardigliano@ntop.org>
+Date: Thu, 16 Jul 2026 14:42:29 +0200
+Subject: [PATCH] Fix user capability check for deleting notification endpoints
+ and pools
+
+(cherry picked from commit 7d830f31af367745431c5d92e2e82fc432f6bdd8)
+
+CVE: CVE-2026-86090 CVE-2026-86091
+Upstream-Status: Backport [https://github.com/ntop/ntopng/commit/7d830f31af367745431c5d92e2e82fc432f6bdd8]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ scripts/lua/modules/pools/pools_rest_utils.lua | 5 +++++
+ scripts/lua/rest/v2/delete/endpoints.lua       | 6 ++++++
+ scripts/lua/rest/v2/delete/recipients.lua      | 6 ++++++
+ 3 files changed, 17 insertions(+)
+
+diff --git a/scripts/lua/modules/pools/pools_rest_utils.lua b/scripts/lua/modules/pools/pools_rest_utils.lua
+index 9b692ea5db..73f08e0c8d 100644
+--- a/scripts/lua/modules/pools/pools_rest_utils.lua
++++ b/scripts/lua/modules/pools/pools_rest_utils.lua
+@@ -452,6 +452,11 @@ end
+ 
+ -- @brief Get all pools of all the available (currently implemented) pool instances
+ function pools_rest_utils.delete_all_instances_pools()
++   if not auth.has_capability(auth.capabilities.pools) then
++      rest_utils.answer(rest_utils.consts.err.not_granted)
++      return
++   end
++
+    local all_instances = pools_lua_utils.all_pool_instances_factory()
+ 
+    for _, instance in pairs(all_instances) do
+diff --git a/scripts/lua/rest/v2/delete/endpoints.lua b/scripts/lua/rest/v2/delete/endpoints.lua
+index 31852cedab..6d25c01953 100644
+--- a/scripts/lua/rest/v2/delete/endpoints.lua
++++ b/scripts/lua/rest/v2/delete/endpoints.lua
+@@ -10,6 +10,12 @@ package.path = dirs.installdir .. "/scripts/lua/modules/notifications/?.lua;" ..
+ local rest_utils = require "rest_utils"
+ local endpoints = require("endpoints")
+ local recipients = require "recipients"
++local auth = require "auth"
++
++if not auth.has_capability(auth.capabilities.notifications) then
++   rest_utils.answer(rest_utils.consts.err.not_granted)
++   return
++end
+ 
+ endpoints.reset_configs()
+ recipients.cleanup()
+diff --git a/scripts/lua/rest/v2/delete/recipients.lua b/scripts/lua/rest/v2/delete/recipients.lua
+index cbdffcae4c..14b3956498 100644
+--- a/scripts/lua/rest/v2/delete/recipients.lua
++++ b/scripts/lua/rest/v2/delete/recipients.lua
+@@ -8,6 +8,12 @@ package.path = dirs.installdir .. "/scripts/lua/modules/notifications/?.lua;" ..
+ 
+ local rest_utils = require "rest_utils"
+ local recipients = require "recipients"
++local auth = require "auth"
++
++if not auth.has_capability(auth.capabilities.notifications) then
++   rest_utils.answer(rest_utils.consts.err.not_granted)
++   return
++end
+ 
+ recipients.cleanup()
+ rest_utils.answer(rest_utils.consts.success.ok)
diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
index b4a1ff1883..808967e969 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
            file://ntopng.service \
            file://0001-Fix-build-with-OpenSSL-4.0.patch \
            file://CVE-2026-84990.patch \
+           file://CVE-2026-86090-CVE-2026-86091.patch \
            "
 
 # don't use the lua under thirdparty as it supports cross compiling badly

