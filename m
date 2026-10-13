Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63954CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3421.1791885571779594141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZgdDinae;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab2bf5e75bso1418429a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885571; x=1792490371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=ZgdDinae2TD7RE+UyQnrVkIUR+f+LyP8GLY3CbbvMhhawC9ItThslF1jvYpDLYwLtT
         9WDEBmPQi7KvwJo1f6dGkL8XqzsIkwlojK5TaHBH2g7krJJD8i3L3nRuR+uNJo34G7A0
         Pyw+K14w/DSgM0us0eUe9rukG3y8I2LTQebTFDA6LEC7Q9Dw6NI8IopKtnWCH1MgNYm5
         KGzUbYmNE5jJgCM09mWhyc9bpDc0o8V2O82uxJVA+z4cqTdcS7JffqVvX6cASiPnKsdn
         MJQCXwfjEHCutQZGM5Ceg9jWpoeefpSDHdUFnnEawUP5V7gMorMinjV3Dmvd+S7nutcx
         17Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885571; x=1792490371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=MGtbVvVT0y1JqmwdzWfEBy/cGzk/NMTklMjxpaI8Ly8qu2pixTXqgH5nw2ssiI+Jsx
         IXt56jvcIiQRogLvUcnnfkDPIqf0g4LCgiCWA1H/a1wmaUIhtl1VkBrtSGl1RqWWrxCJ
         mK+HhQz/2DOJRDzNA95936z6bt8aPKgriNcEp9i/oEQutdHNy/+VksXckP9Foig0rn8K
         GIAEZd0XMBe9IQi3roD06msXHHkWdHKQ/9k1Q0VE2CkPXGhaQdJSxAAaXDpZfqcWzu/+
         Sf+GvIAVVK6Th/6HAQS/kujXKmMC5y377Upcelxb7Pkm7pk5HhFbUiFM7tpwwp2Sz/Up
         x5rA==
X-Gm-Message-State: AFq9FYLshCDczEFbPhMFjGfJcq0iTHfLM/3Q6rCMcfIuGkPzlukw7SCk
	qYGWoi3VIK2hBpOTG8CWb0ymI6iFWGKDXfsLp4LcWbfRrJUsfr4+ditPdGG+jA==
X-Gm-Gg: AYBFou2GnkNBou+l/YnkTZKkWC5AWW3dCtVkahCfoAd4AE6MMyXtEOppf5p+OaFxWGY
	PQ8YyV2AVA0EH/MBIOhvpjxmP2+F3P83Ta1JkkJkle/YSwt4z1lNCVZ5hpTgXkMIBSQB+LeVHEg
	YsIcc3LPNcy5w9l42YMY9nxPGdbvKw0zmAS4ug1C+NBzMasZaCFO9Cnwf52Psz86VUqEaMzMr1O
	nd67lCuz7pa1m0cHc6mvJe7OqohHyQKjhLUQ7wiz1yvP6KbZ5U5ViizF3VhatyLa5ogdrIjl+tS
	mUMsqRJzXcpFH2eMYymYQYUNSLLOX9N7DiAlkymkCEVg13UqtgsaY7FW9Q8aTS2YVmDDNpQ+y5y
	HqbhwjBZdvxXegYZofIrGmqwFWbuslR1H5O+zeL1YoQ+uANgQYJnNGh6zLlDNtA1dM8LGFA8FkA
	PZHUqZ2SlhZZakkEOK453O2wyfzFFoPGZ6jG1AgB6QttGIa6ImBxt09aEjETEgTmvlckfjv4+71
	ip2Q1CUEDjZMG8CRkLpSletj6r1zhmCRWV1RZlmubrfPJQjZw==
X-Received: by 2002:a17:90b:1d4f:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ab3a954001mr9920677a91.30.1791885571070;
        Tue, 13 Oct 2026 02:59:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 8/28] ntopng: patch CVE-2026-86090 and CVE-2026-86091
Date: Tue, 13 Oct 2026 22:58:43 +1300
Message-ID: <20261013095903.3544906-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130841

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

