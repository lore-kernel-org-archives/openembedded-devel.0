Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C51C28B26
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2308.1740525905856819302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DyFcoFWt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525906; x=1772061906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZSMOM+uug0VG7naSr89cu4nLr2YYOUiwbQmlMB7pedI=;
  b=DyFcoFWtj7HF3znWg6xD4P5/uxeTWEpwf4FMilMkrt9djueticmzg0rU
   e66hxyluIp2AeQHmQPj7WvhKM5L/jp890My1o1rBbZXthywNADoDH0wif
   7f17Wp1AUcVyz5igzRa+nfH+jMyKPegS6shWnGtV4ShvMMfo6YSF/Z980
   GoKEt5Eqz712FvjmTMARBL1hWXl7j+BB84NtnoyakCOm47yY5aDOW+BH5
   QcUMhUMmEan7ti4Aet+SISEO2U0pRjc60k3DQt+4xqD02unrQ38Oa4DUv
   oucZ5hccXGL/H/MrJSF8N/zDDjP2bnh/6IOVxqx3DBel8TUgJWE8kLlFX
   w==;
X-CSE-ConnectionGUID: +3COeCacQG+BuazSK8cshQ==
X-CSE-MsgGUID: aidqvsIsQT23zYF3da2Cwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179538606"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179538606"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FCD2C2262
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7491D4BEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B9C21A000B;
	Wed, 26 Feb 2025 07:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/51] python3-virtualenv: upgrade 20.29.1 -> 20.29.2
Date: Wed, 26 Feb 2025 07:24:36 +0800
Message-Id: <1740525881-21103-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115645

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Remove old virtualenv wheel
- Bump pip to 25.0.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.29.1.bb => python3-virtualenv_20.29.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.29.1.bb => python3-virtualenv_20.29.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb
index dc42b4c79f..c9f20d44e3 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "b8b8970138d32fb606192cb97f6cd4bb644fa486be9308fb9b63f81091b5dc35"
+SRC_URI[sha256sum] = "fdaabebf6d03b5ba83ae0a02cfe96f48a716f4fae556461d180825866f75b728"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


