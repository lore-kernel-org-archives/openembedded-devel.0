Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3855C52D74
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2890.1722934024776036929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YM16tcKd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934025; x=1754470025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iFx/OGcEejA34KEOSXRXlZSw0FBTkvkAiAXe/e8a9bY=;
  b=YM16tcKdh1wd4nnEY5xFxnsmGZFR6/RCdWGpbuEudMNWUXJW8Bn4xSEW
   iIrEVyI+yuVtINYBbUC+Paj0hBWYOjSm20q7PD2BttnfKeKMh/WE3yAtD
   MoFU415Ay5oGBQG9v1EuO9bpPtJPCYZ7fowT3/BGV4rKbx0yDkohPIosK
   jiEa8QCOss8uNh8XP6VqUP0P5Z3361yUh6XGPJnyHIDlPhoJC60O0e6hZ
   vmoDjaKgCIo7spJV64gPQvHPlcuAloY1VUBOXQ+PTCWjqaYm9WF72LeaA
   GLI4oevEDqmCExQIhk07Mu4hA2aT0E5+VYmHO7JgbkeXS66r9i1g5Vsx7
   w==;
X-CSE-ConnectionGUID: QrQrvs9lTu2p1ZfPRdUuVw==
X-CSE-MsgGUID: 0uVen1/6QnqQ46JAfEwsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882462"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882462"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC059D64B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39EA2D752B
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D259920050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8166A1A000D;
	Tue,  6 Aug 2024 16:46:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/60] python3-rapidjson: upgrade 1.18 -> 1.19
Date: Tue,  6 Aug 2024 16:46:20 +0800
Message-Id: <1722933994-32549-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.526900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRtSHjB5Y+o5ZEEWUFPT+HGNo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXI6mccacpHuKRt/F/BG7Nh+4TCzJ75K/OEWAc
	++OEw7xuvintr+TJF4JIbG3kBx0l3WAhdQ3rhK5EfeEt+8bKETZSoXkF1xNO3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111564

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rapidjson_1.18.bb => python3-rapidjson_1.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rapidjson_1.18.bb => python3-rapidjson_1.19.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb
rename to meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
index 9ca1e826d..bfc05a735 100644
--- a/meta-python/recipes-devtools/python/python3-rapidjson_1.18.bb
+++ b/meta-python/recipes-devtools/python/python3-rapidjson_1.19.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/python-rapidjson/python-rapidjson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6fe0b2465366662d7cfa6793ccbab563"
 
-SRC_URI[sha256sum] = "09a5c362e2fec2a41b53e79e88bd8f0704447cb67c1c89a59e3092ccb4a30355"
+SRC_URI[sha256sum] = "81e7260f6297cad564389b700783c0a33de71310b9eb01fd013faec5e7ed4eff"
 
 # Inheriting ptest provides functionality for packaging and installing runtime tests for this recipe
 inherit setuptools3 pypi ptest
-- 
2.34.1


