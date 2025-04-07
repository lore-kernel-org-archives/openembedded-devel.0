Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CDFC369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.43038.1744017444610489553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mAvsDVsW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017445; x=1775553445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/w2s9QUyoV0xZr5bLu+Gr6PHEvWlTqcPoSaX9eBo544=;
  b=mAvsDVsWf3PW69WBDrFRl6qLmBSpvkWEa7Qtom1QCVy9xcPSqeiyay7g
   IOhB60ddKNDtrcGonmZG/rNJayeGbyDCM1Qidwd/v3Lsr4rhcYDF47y1K
   8ZkFKL7a8jsSwYF/osD+R+IaiDLOn0OJV+3ClHnaimOzPYOuXI+AI16b3
   5PjaJD+JCdFeaXJ3fRMQrB8MSO603WJjowIaJyzcHt/aXZazO9xw5BsFN
   6b8yNk+JAQMhqfPHpOxlhw2yWOAB2Ju3CivE9yr/PyrRrQJ1xD88wUc/9
   ZuFY4dp8Q5pwsCcgQS5e32zNVvdn2AfFglagkOq60dVIqeEGzUyEUe5kU
   w==;
X-CSE-ConnectionGUID: FWg9KxyLSUyjoXkTBo7NWw==
X-CSE-MsgGUID: yVXNhp4ZROWfbDPkP6aBxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174543298"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174543298"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06BE5DB61A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BCE11D88B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:20 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B28F1A0071;
	Mon,  7 Apr 2025 17:17:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/30] libei: upgrade 1.4.0 -> 1.4.1
Date: Mon,  7 Apr 2025 17:16:45 +0800
Message-Id: <1744017431-22217-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116629

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.4.0.bb => libei_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.4.0.bb => libei_1.4.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.4.0.bb b/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.4.0.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
index 40e8015116..a2705785ae 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.4.0.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "5d6d8e6590df210b75559a889baa9459c68d9366"
+SRCREV = "9e0413cbc7d3ae6656266890425f152589ddf74d"
 
 inherit meson pkgconfig
 
-- 
2.43.0


