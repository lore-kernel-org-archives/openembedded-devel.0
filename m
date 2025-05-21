Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49A7C677C4
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6740.1747817996379290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hrzw5Ilq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818006; x=1779354006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6szFOdLBPH7/VUISsO2qf7b5CCFvnqmD/G7GFc3MI1E=;
  b=Hrzw5IlqO8/US+PPgLPD/eOls9UEqN5eKJ5A9M4ro61SOrFftsxNtGH8
   CYrUpo+3D7wX1ONH7qmib/uw9LDTBkcli2PzLDZSJ573d719O33VQPNDm
   hBPWXsf7WQSOGEo0xM0RiCrrXqsInGKGy54CUUsHbhvyXUQRgTmrpuKsO
   5Z/UiaJfkjzeLUKxxuEkfbEvqDCHy/zug6rIVXaeDMUhJ27+NPe+I258/
   0AnQsd0gHshT16sk22lUlakGR6xq4ncyRLCsywZugC9/zNRR91lpOi7p6
   3LXvbBlsfoA4SbvtmkuWepxaK4O142vztpeb7E0Ehqsv5ZZsXI4YbumjD
   w==;
X-CSE-ConnectionGUID: s34Q54g5QouUKJ/ntlK1gQ==
X-CSE-MsgGUID: KDmyj6t7Q1urbMZJFEplsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200161128"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200161128"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 390C413F6E
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EAB53D8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A48C61A00A0;
	Wed, 21 May 2025 17:00:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/43] python3-web3: upgrade 7.10.0 -> 7.11.1
Date: Wed, 21 May 2025 16:59:31 +0800
Message-Id: <1747817972-28874-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117567

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.10.0.bb => python3-web3_7.11.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.10.0.bb => python3-web3_7.11.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.11.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.11.1.bb
index e9f067aa96..ed57f6d79d 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.11.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "0cace05ea14f800a4497649ecd99332ca4e85c8a90ea577e05ae909cb08902b9"
+SRC_URI[sha256sum] = "1b23f323cb939c3c9c16a92228d1a62f109fed026089b0d8ce5829eca26031a3"
 
 inherit pypi setuptools3
 
-- 
2.43.0


