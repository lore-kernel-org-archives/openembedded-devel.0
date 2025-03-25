Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031D5C36016
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.61117.1742893342880477147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j9adiVxX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wdHTdG8+ze/nH6XublH+1cqYOvp7lN6LJzWbJGla0+I=;
  b=j9adiVxXi8M9dGJyzIFfsuLDB4RFJHAspRmJ29Ek4pKzrDOwZJKAz4oO
   Scyw4IW180Vkw1qhgGdPGD2CAH/7AaFZFcJG3BFGtDgBTZruyeagpZEDo
   LorfuPXK+QjtM/iuQMlaod3UFiGlxxjoJCLEy293oKxJb0fCNo5gKaiCR
   jjpwiP3ITmjIrnhOfpE05OVUHjWQq7sUredpWnLDWeqWdkmYabv5slWrH
   c6C3XJkVVYYibRqYsaAIocizIlVzQLe28ytqCrU3ZKPQi47x1KrP/redM
   dNdlKB8K49lOTlDh9DG7TrirUhiL7u57g9O4qehq4j9l9yrBXLMkLUEgu
   Q==;
X-CSE-ConnectionGUID: NwKNNCeYQTG1tyorRgz83Q==
X-CSE-MsgGUID: m4SFHvqFRdSkzWWDY9/yCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194202345"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194202345"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D97CD6EE8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AD7CD50E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 18EA21A00A2;
	Tue, 25 Mar 2025 17:02:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/45] python3-protobuf: upgrade 5.29.4 -> 6.30.1
Date: Tue, 25 Mar 2025 17:01:40 +0800
Message-Id: <1742893312-3809-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116261

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_5.29.4.bb => python3-protobuf_6.30.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_5.29.4.bb => python3-protobuf_6.30.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
index d39c5e9790..48853699ac 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_5.29.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.30.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "4f1dfcd7997b31ef8f53ec82781ff434a28bf71d9102ddde14d076adcfc78c99"
+SRC_URI[sha256sum] = "535fb4e44d0236893d5cf1263a0f706f1160b689a7ab962e9da8a9ce4050b780"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.43.0


