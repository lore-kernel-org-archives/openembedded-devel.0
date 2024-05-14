Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C4BC04FFE
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.10756.1715677840920283919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CDRUpt7A;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677842; x=1747213842;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b6jMq1ElJ+O/pI4/HgtJKFoQjAr1rsC3wCcmt6HkQZo=;
  b=CDRUpt7A989PleZit4+3Z6Qut+s2saKAw2q5gkwOJkbltMusvDQgwv17
   aL/Q0Db2uQVx4GML51h8e+fTvTCe/+VqjsdFUsPjuzgofzlk2NnqB4H7A
   ot7qtDqqVZTmJw09S4cTIVKmWUhMbjRXBBmnVZjpg+CJS+j9WeAm43dR+
   Rr2a1XjraYoIR2Jb5jOsmnjlZaMC0HuUKyYE0fe0IbcGGgZ02iozPYmrR
   LFPEzQJg+J+eZPPZUTvujFwVvemoiP9wuvcPRF8n3I2ZjvGlW2+GKBg1n
   /AkEQqZj9wmCPKCqYSJ3PVpz+uYyVmHDdBiSDB6aUt0oDai1TXaWnKwHQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257837"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257837"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 856E9D994D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE47BF765
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5339120076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00CD41A000B;
	Tue, 14 May 2024 17:10:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/44] python3-pdm: upgrade 2.15.1 -> 2.15.2
Date: Tue, 14 May 2024 17:10:05 +0800
Message-Id: <1715677817-2223-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-2.359400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrgbNN0R684zPG5dXdQTj2OGUz
	B7Xp5yOC4k835hqf2QdRendkL4CYElBHs28rzn8n6ws6Flw3FGJoQA0psEk3XbgMZBX0PrAKvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBRDnO00siWmc0BQI
	BoYTalfAADKbZwQswRwa3L0MOEEoa+JcGJ70kOS/noPlvD0UavCNu9+/f/Sm1HFCR8T+ybFR7c0
	78HvKhjsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110377

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use get_runner() method to build the task runner in run command.
  runner_cls attribute is deprecated.
- Expand ${PROJECT_ROOT} in source URLs.
- Fix env and other options being inherited in nested composite scripts.
- Keep the ${PROJECT_ROOT} variable in dependencies after running pdm lock
  --update-reuse.
- Make direct_minimal_versions work on newly added dependencies.
- Fix a syntax error in the zsh completion script.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.15.1.bb => python3-pdm_2.15.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.15.1.bb => python3-pdm_2.15.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb
index 270850061..fee39fd9d 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.15.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "1c9cd049c1016633a23ef92ec1fc782da8ae0743142ef33faf7d48872f874b39"
+SRC_URI[sha256sum] = "c08e87078c29c00e7ad9681dc6a23419dc5617dcbe6cc205024ef4b4e7e28475"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


