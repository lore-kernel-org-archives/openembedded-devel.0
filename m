Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A67C5B55A
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.6737.1747817995751750177
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qxjM+dkM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817996; x=1779353996;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/pGMAyoHLT9QPBGpNKj02RSEY0mCKmGdGwQm8o3Kq50=;
  b=qxjM+dkMesrS5ePEwLVFTtCr3L8EQmTUI+lTcJJPq28LqYhdaphkqMnd
   LFf7PnJ2TSUHdWpZ206fzyKXPi4RyxPv3UursA/FAQ+W1SmpVO4Y3yLi3
   u5SWul/Y7iwlxp0fRaQk4q74Mwtje/PPTTzI7Q0fAbQQSuNDck6RnTi1L
   XOueafRe7CvQUlcdNpeHS3CHHRyS18zosBej+UIqTqZvA4yqwbLWb945c
   6x9eu3YGSntwNNOU8ldwMfZetffhvNmN+N+4QBE9D1xMzipxQ6oBOcYuK
   5E233zlZ86GiUv7WrZoJIwoVONt3vGsR+ijUSnChBkghs6wPLtJft9Got
   g==;
X-CSE-ConnectionGUID: JPAS4l3uQAGaVYFdZR2ALw==
X-CSE-MsgGUID: gYrEepqPQdyRvAnLQOBefQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179076130"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179076130"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:55 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 96EA7D9430
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5964917CA3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D25DB1A00A0;
	Wed, 21 May 2025 16:59:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/43] python3-eventlet: upgrade 0.39.1 -> 0.40.0
Date: Wed, 21 May 2025 16:58:59 +0800
Message-Id: <1747817972-28874-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117534

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [fix] Fix ssl test when linking against openssl 3.5
* Drop support Python 3.8
* [doc] Various doc updates
* [env] Drop PyPy support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.39.1.bb => python3-eventlet_0.40.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.39.1.bb => python3-eventlet_0.40.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb
index 6286727ebe..88c3d06967 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.39.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "4a8a6475282d4021edde06ba335228c230b911b8d014577ddb33114c2b0c0510"
+SRC_URI[sha256sum] = "f659d735e06795a26167b666008798c7a203fcd8119b08b84036e41076432ff1"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


