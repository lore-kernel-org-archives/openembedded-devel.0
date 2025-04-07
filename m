Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B4EC369AE
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.42482.1744017450122620264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CvxGWkC7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017451; x=1775553451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kghmAdLeUZWl4uw4cSmI6a0wO4asyjecGEYFXayViJM=;
  b=CvxGWkC7Nosd7ihJmKEPliLuvUbjSuBMOkgXZ5Na1rpuq7ZNWNziQQFq
   w36Y013IzrxxHthjoYR8IjvHCI2AB4C1qpQ9gvxu/sZ/AxzDAmORgAVWA
   5vQOQpRmCUT2XYcIHpszqofGDOmURNTaGCTIPwthFLWY8Z1WkW2PeFCaU
   0kp1kQx2VQAdff5o3Cqgp9jz7GtnUuL1bWXytcG3a596Xa0fC5D46owPR
   z2ftMve625lSSyMEOeOpPKCjI5cVSRsOTgIMjw5rQ+oG/WuVjpw6xz9dL
   aS2MA8zgpPHzFbPRFqWoqThGIRIGhkoj7TkexZMXFFjn/UnE4LWyJGhai
   w==;
X-CSE-ConnectionGUID: C+JUvE3pTPqu1nL38s8cyg==
X-CSE-MsgGUID: Oox50c2PRZmUepMNQ8vLsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668930"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668930"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AA37D4807
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F0FA2D4C3B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEAF71A009A;
	Mon,  7 Apr 2025 17:17:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-moteus: upgrade 0.3.78 -> 0.3.79
Date: Mon,  7 Apr 2025 17:16:57 +0800
Message-Id: <1744017431-22217-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116641

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.78.bb => python3-moteus_0.3.79.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.78.bb => python3-moteus_0.3.79.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
index 9e42e1796c..4944e13ff4 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.78.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.79.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9cf58e748b847708e04e362991fc04c11861624a81e1a73a2773b0f1e0e11ab7"
+SRC_URI[sha256sum] = "fae569f0c2e208059e081cf0fcca2e8f71c6c1de582836c745bb884af1e35bf4"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.43.0


