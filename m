Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CB6C5B549
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6737.1747817995751750177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JE2D8RQ4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fHyD7KoXf5aVbKi38MaBiEit2TdPgrfmn0wp/oSpHJ0=;
  b=JE2D8RQ4GLKesn+U5S/x967N+j9zB8zIqrO+VuLM+YqdjlNQzhaeQUwZ
   PXanxCHTN5JUSOR8dUfJ0iXBPIngWJUDwfAk+dh6rsuUpNUWaG7wI492p
   LnEJHVVG1nIucLaEoSI7cjK3A8pc4ks3hNyMN4Qrn8lLayBXTRUYW58/K
   iJWMNHFp2Zyb6/GzLf8O9NbY/3nYONNin6sEkvAC6yQVp7eqMDv3kQB6b
   jGi/tOV2GhFlWRghSpq5ouWgIE3SZ+W4q/wZgwyvjY2MounaqOAvl8Se/
   mnZCn0n3tJ8m3BBHRFzppgEgHY4nXHXQG5oQw5mO6pkVxEeIYoftiHFYb
   g==;
X-CSE-ConnectionGUID: /IeFyNCXSkCQV7sNqXu4ig==
X-CSE-MsgGUID: AQa10ISzSTax7jWw7nyX2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179076135"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179076135"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 680CDE9E80
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21076D9469
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A65691A0078;
	Wed, 21 May 2025 16:59:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/43] python3-moteus: upgrade 0.3.82 -> 0.3.87
Date: Wed, 21 May 2025 16:59:09 +0800
Message-Id: <1747817972-28874-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117544

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.82.bb => python3-moteus_0.3.87.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.82.bb => python3-moteus_0.3.87.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
index b4e7b64806..433bfc4965 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.82.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.87.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "88f76d6901312ba044240f038a97f54fff463221888ca89e2c2bdc7e1679bd5d"
+SRC_URI[sha256sum] = "988f264c330a17d63219c49dd2365bdaff97156be3ab6c5eaa204b45dca621e8"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


