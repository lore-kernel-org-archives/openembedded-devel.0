Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90D9C54F2E
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.16222.1747731320135249066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=A2ZU+Ra+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731320; x=1779267320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T/VHQ5SSglGt/4XQE/4rwT+6otj8HWiHRrXOi8PeXxc=;
  b=A2ZU+Ra+WCE7w6C/qzvGye1LJvBav32T6CiF7Xm25B7QF7sPir81PFJk
   wYSqZlYxQttcrBDaIb49f8zAvyz0dOoUj49fQNIX/ud6obZBBhU2ojGb4
   P1/HqM1xKcCOT/YsfoD0nLwnN5W54yYJrhCmoc9mk9LDecbY2xBp03ymm
   Ypl6o7uHbhBSZv/R23V5lvw2qpeL99k27DF43sEVGznhG4XTyfMHoiVE5
   XJt3YJAWWS9GHX7f2DuNHQ+uhYzFEn86YaDZUpsw8m8l3lS7TWQGnDTf1
   mzvukIALXvUwB00Tjz0GBbmSwbWOzCU3qTIn8RzUje91rb7s9WMkBSN/9
   g==;
X-CSE-ConnectionGUID: njzuSvWYRIq6x/TPDYQ0/g==
X-CSE-MsgGUID: C5vd4qArRJWAJe9GnTKodw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="178929824"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="178929824"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B05A1D505A
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 736A5CFA28
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 053DE1A009A;
	Tue, 20 May 2025 16:55:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 16/27] nbdkit: upgrade 1.43.5 -> 1.43.9
Date: Tue, 20 May 2025 16:54:48 +0800
Message-Id: <1747731299-20448-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117498

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.43.5.bb => nbdkit_1.43.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.43.5.bb => nbdkit_1.43.9.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb
index 52a388e6f6..e71bfdac35 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "05705a45b1945be69e43b32205412cbf02d99656"
+SRCREV = "f443cbd3cff1d66db038e2afb9301d51224c7f09"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


