Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023DAC36006
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4167.1741683332447897203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tFCmcoRk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683333; x=1773219333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eueCCgXTOp2cw3tV7H9/N7pD+0cbxQA1wm+uchcBBpA=;
  b=tFCmcoRkQZ7Eh4J7JdJdnBofeW1L8tIHecfhkIgy76xEU6P+/KE4sVb/
   o0aH+s/pr4gHSeXf/as7u9r/5wwHTnU9SDounyJVfLEasHuFErg2EI++x
   gUa9FhEMSdeTTmQyVSsEbbg9T15RruQ8TC3Oni+WXtaNWULaAqtONsbDR
   SJwokE+g8S6XBpZxY4Ek7JfNOeMHvkmRFan3yUG1WEQZumPwJQCizeuKt
   i9NZBjiF6LOj7Ll5f2axeISlILEJqLvZbV7Byz25VZtyeo+ums1nKN31u
   R+COI6A3h90WhGgaDOoo4xivcSHvLq3SpDK1Z6BZBgygQwhoBQAzH0x+J
   w==;
X-CSE-ConnectionGUID: uQlZJaMXQxqrndAwG57+uA==
X-CSE-MsgGUID: acdzuYMVQTSS8E9Z8IMbCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="191859676"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="191859676"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D9C4D4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 237F0D729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6CBD1A009B;
	Tue, 11 Mar 2025 16:55:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/36] python3-cmake: upgrade 3.31.4 -> 3.31.6
Date: Tue, 11 Mar 2025 16:54:50 +0800
Message-Id: <1741683310-8681-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115868

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.31.4.bb => python3-cmake_3.31.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.31.4.bb => python3-cmake_3.31.6.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb b/meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb
index 2f199d7cde..67e19aa151 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.31.6.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "a6ac2242e0b16ad7d94c9f8572d6f232e6169747be50e5cdf497f206c4819ce1"
+SRC_URI[sha256sum] = "8edddfbf367fa1bcf4b9f3064470bc0e1022f70609c0cf69c863961897826205"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


