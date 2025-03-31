Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB6C36011
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.47547.1743412325210251063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cAgrgoyx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412327; x=1774948327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1jZXJxj02I0BLvh7MT1ES1NN+SsZBbcsfNoa8BIt8iU=;
  b=cAgrgoyxA5CFDTi0RNaoMrrwtbLcgS7XNZwXZVvjp6bZ4v/G+qESjo39
   WVsTI0j4yGla+gRryg2WnSefjzJ6i5v/XgY8vKALduipSlve8vcvOYlfK
   1Budqi2XE5lc/nl8MqfqtXPu7KSH/u/hfjer5mYor/QBXl0ommyWOtum3
   FphiFRRGlhTO8M0yBDr9XMQm0iuHbKXZMJSiDHaPk29Z1tfTYyFTQkcfi
   t5MJCnqOhLcDmlf0QhkjFEtAL45l62/jrPibcmedu3XiFV3k8aqWU/ua4
   AKmSwpMyTYBYL5Eh07H01wSY24JFzGX8vhNdTYdCoo6BvcLjErErcMGWG
   w==;
X-CSE-ConnectionGUID: qyU2dGToQdSmXUuidBHEWg==
X-CSE-MsgGUID: aJtXPJyAT3auhiTF0ZKRMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950094"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950094"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC7A0D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A6254D5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64F0A1A009A;
	Mon, 31 Mar 2025 17:12:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/26] python3-tox: upgrade 4.24.2 -> 4.25.0
Date: Mon, 31 Mar 2025 17:11:46 +0800
Message-Id: <1743412308-21887-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116423

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.24.2.bb => python3-tox_4.25.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.24.2.bb => python3-tox_4.25.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb b/meta-python/recipes-devtools/python/python3-tox_4.25.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.25.0.bb
index 2b7d8d896d..c7a7d2e29c 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.25.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "d5948b350f76fae436d6545a5e87c2b676ab7a0d7d88c1308651245eadbe8aea"
+SRC_URI[sha256sum] = "dd67f030317b80722cf52b246ff42aafd3ed27ddf331c415612d084304cf5e52"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


