Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0681C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:56 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4295.1790160116397381312
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=emT23Ibf;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8674704dab1so756856b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160116; x=1790764916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TYu+ricJBAMwz3NudQS1clyMUIT8AKW95aEp4chE+Hg=;
        b=emT23IbftIlPq7UJnEw3UdDJeXAqK9xYMql/y4/LGnkJwl+Yn+vO+o453NZ2WMPh+U
         oS0S6Lh0gAGzb0KP7WfSP5ALEYppkeHk+VstOaizK07no2zMxmvmNbqlFOhCDpvI059/
         ZYqqq/usTDZzgZ6wPeiLS87Op7SDoBd56Bd6yYk425wT818XKWiWp6NLUsHDEq00L0Pi
         GpnwxIyAtkTXp3Xj22dTpzCzVKXJd4Ui5RcO+Hbw5N2CpSjiqkz/YEai4Bzh9LE1bngA
         Wz7Jq0Se8e9THcx428itLPjZ2/Vr4NN/RmyGsMCwG7Z3PSMJ+KLp0a0CYeHbJQF9VvU0
         af1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160116; x=1790764916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TYu+ricJBAMwz3NudQS1clyMUIT8AKW95aEp4chE+Hg=;
        b=nqF0NZOmxl2BS68dzzl3Jn2NuvmT624d2x50plIOoO/n1/6Sk1Asmb7p6XOXueJnde
         OC4oWvDOO/rEbR/IpFaLIlA4jPAeJ6zanX0GOPyfJMBf8FhjmTp+Bec+dJMhuiaOAoXl
         fDKzdq2Zus3PG5YuuNZd2VhJiFtzKBcLO2XIvJ3oCSGL2hdIVw+qbiRL4iHtc9WtaIlu
         XEaq3we6OlEkeJHGEUa75g0pqE/4MBQbiE9PDL++YR+TcQWhIia1K+90VXybaEgCbsyS
         uxxPWuWDcekWoMyNUehMWJkbZt9isyMpjE6tSUrE3re69RhvSyXauxjhuWdr8DKRZQzn
         DlsQ==
X-Gm-Message-State: AFuF++kpctQ8qPsBKyXteGjefvQCqITydHQYTj0qZE+MykuqtVr1JMbK
	79aEi4u+h7jVrgCi9gCzqhmMP0UWGNdJKpOj00Z+PicVpOstNssfKu8m+jP+qA==
X-Gm-Gg: AYBFou19OvwifPi4duurDGXbnCX9kRqJGwq0GQEAv8/GU0OrsrTaSG0QhP1PWQpR6Dv
	mhYkdL8FNXNQ2KzV4dpeCkccdeRQZQWVDRQ94CCSNnvmKxRUGUtf4AYgmAl8MATq2/nOzNyUbzk
	eaF8S5drRLipFbl+LqctItDnumP2n3UFVWgTEIcuabHbvlWCiGuLtVjj4Iq4VLLM7FNHeJ1o0ne
	CyWOmPeqD1G4vjmoC24CcI48Kv18KyLmvpbFGFl8dy6ASl/ZU8+zgN2I9EArBYfJviAMF8Sse0q
	jvRTsl5bU8cjjWsUxBkbWWwWf/LUZXU1B6avDtlB77jmGGPATkwRNpEP3EpaKO/kWFV9YqkpIU0
	lgDBEChn5XseDhxat+hLKiVp55NM/W7Rfrh6u7oY3FaD969VsHX879aUvRdrjrEwu9FZBpJeyFF
	XCWT35+ZVhrFM07IOhJFD8crX3pBjOVcr6DIm6jV5e8qGoj0ah5Nn8Ni6p4KaHCr95KOcNnF9Pr
	U0c8tCob2b/eQPFChUWqoE=
X-Received: by 2002:a05:6a00:3316:b0:87b:b7ca:20be with SMTP id d2e1a72fcca58-87d1cccc3dfmr1896923b3a.37.1790160115807;
        Wed, 23 Sep 2026 03:41:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 27/42] ntopng: patch CVE-2026-86090 and CVE-2026-86091
Date: Wed, 23 Sep 2026 22:40:41 +1200
Message-ID: <20260923104056.457360-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130214

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-86090
https://nvd.nist.gov/vuln/detail/cve-2026-86091

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
index 11c4a2d3b6..c3bcb9844f 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
            file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch \
            file://ntopng.service \
            file://CVE-2026-84990.patch \
+           file://CVE-2026-86090-CVE-2026-86091.patch \
            "
 
 # don't use the lua under thirdparty as it supports cross compiling badly

