Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E04C369A6
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.47776.1743412319621125398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bfiw3M67;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412324; x=1774948324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XDzPJR8PfsRczJZPdcQoOH+0+MOm2efBOUKFoI7y0QE=;
  b=bfiw3M67f+E0eJPIk66Rn3seSDa8jabELe2M/dcLXmFoFPsuuRNYDPju
   BeO287Ms8n3IdKES7y3hLMuYmWfA3CFi5kR34QAofJxcpCuZrw4rWgRFe
   MqyfcoEXtNavDPvFSssk0gOEv7AzE3mMatbgOoNJVGDcCV2/cdrxmVKOn
   roajAVH7A6bD6N23CBaqUtaQXqk+e0T01TKDFHkZES55ll6+nWwaA0LTO
   Yssj2N8rGIqjUKb4zlYBZ7+mrzi0jcLhsVDWq2Zep9A9tl8gwpbNuGdjJ
   0jfGYqx5WzMgRBdNtJv4FosoYgh+8F1VZ34gMlWI63Hfqx61r45OcuLW8
   Q==;
X-CSE-ConnectionGUID: i2wrNzBJTsKU+j7lSaacRg==
X-CSE-MsgGUID: 6VB00YoJTrC0c3xBcB5noA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="182316073"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="182316073"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24B7896747
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9AC1F310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 993DC1A0078;
	Mon, 31 Mar 2025 17:12:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/26] python3-tzdata: upgrade 2025.1 -> 2025.2
Date: Mon, 31 Mar 2025 17:11:47 +0800
Message-Id: <1743412308-21887-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2025.1.bb => python3-tzdata_2025.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.1.bb => python3-tzdata_2025.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
index 35246e8ec7..d7bcb11364 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2025.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "24894909e88cdb28bd1636c6887801df64cb485bd593f2fd83ef29075a81d694"
+SRC_URI[sha256sum] = "b60a638fcc0daffadf82fe0f57e53d06bdec2f36c4df66280ae79bce6bd6f2b9"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


