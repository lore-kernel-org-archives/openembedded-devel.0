Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FDACC6B0E
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.351.1791866433815080290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hHzYd0i7;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381b831d535so2972100a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866433; x=1792471233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=hHzYd0i79LKS36LI19Kt3TigtHzhroL1adhXg8mgoIhNV1ERq5yFSTvtwxDw5o42z6
         pTr8H8cAf/VUwAU2NusCRL9F4WUpo3tq737FdxoHx5LK4U+ux23+C/98zKvbGWUj5fr0
         pnJoLBlf7/UnlnomG951pBKonzXNX8ET4wil85kYdNga7B2CzrNuGtmA9ujySn/t4hjG
         yBf/X0iRAwTSYG0eC82ztyU/t4wnWkHcY1OGfbz52nXh+aqDDD4C3Zqe4h7t6oPDPh9b
         2RuKQCxZAqDs4NcybP0GDXNEKUrCzJm4ibAVRjhNV4ab1dyRg5FQ8ngAMQbgqRgnZnS6
         GqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866433; x=1792471233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu7dE7rXvJZDuxDzliREsmItfHQTI6WQZRQJ4oaFchY=;
        b=T8TcrjTYZq6vzboqqOUqt2cC/ekTKrZShMW02sk0x2vczD6LYcZqpc1OfkCn3AIcnB
         b6xyNrla+W4OFpnON1Ds9eYC4AMZG8EIxcl2O0g0cZO3GB4fu4IZKu9qJip9W+pDsVgX
         frYdJYXLsYRIr4kyEDMaEVdesBt5eNlLX0zhTYOxJoVUIrnufmub9gmqA+V++oehvMXV
         aTsTezCqc21awmJuII/yFSZJM7ugG1Ns1nVXATSXtnhb9aIg6jJCv5mTjHfmvpPSrHG2
         gVc03LSdPxX7odr9zTeQTc5Kl0Mr0ygIeXFi7KpDBuUEsBHNqDJCswbKBu3QAad1TaGR
         fz/A==
X-Gm-Message-State: AFq9FYL13X7gwaxfL1NqNLs8OL5tn2jxvFS5BF/K/iop6rrMXUlXuqv3
	VVindTFBSu1QyfxJ3lQMbbLKjGCSFedvOfJbV6D0b5QxuG8C87AoN83w5TbcbA==
X-Gm-Gg: AYBFou2LOTWWf6aQg1U6hk3aBI6hqcRfbNcs1xH1IMlv1t9ofuygXRNi5eQ7/RHOO1l
	RXGbsuHwIOb+m2R2znOp9p7eFe3f1UiK99Adezd3d5yl+bdYIQCdrOACRBuQLz4GcWHxk4anUCP
	wAqus89nsH5HRiHaRji5dSG+t3P2iAEj6Gw8Xhf9tg8LZ/fak9UO/znzZP2skv01yRoTWFONtNC
	tG/IADxrJKhtaUxOBNDswD8hQRA3CGs1BR1UmTedIA+BM94JurYJ1FlXnRVXU3YpTWWRCEPkkdt
	M2ADKbuGbn8MLCBMP5X5qwp8JmvirSpRfn8E49WRUniMPDvsCSZnj/7j19XL/576SdyudXWnX38
	DCT37o9TyFvAvOxroLvEoOaklxGpgIsMDuS3LdsNw2S69I1xHD2HUI7hvBKvkT4Dkitn6OD/9MM
	7fEfEOpxgkYi3HJlDEJRw1WRPOgUEWW3IYEXYpgpLvqa7p9xoFnz5UetmNu/DlMqfgfu6j30Ail
	d+zbtiVjLaEPQiYAtR+Oom8H1lRWBsYvq3BY2k=
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3ab3a9a8d66mr11434457a91.26.1791866433120;
        Mon, 12 Oct 2026 21:40:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][PATCH 6/16] ntopng: patch CVE-2026-86090 and CVE-2026-86091
Date: Tue, 13 Oct 2026 17:39:56 +1300
Message-ID: <20261013044006.834868-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130820

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

