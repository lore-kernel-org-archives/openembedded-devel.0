Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33C0C021AC
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.46620.1739178111221225344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eCHEMZen;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178112; x=1770714112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9VgwGC+2r5LxhBxJ9eHZxmDBn+7c06D1SRpmEUrQleo=;
  b=eCHEMZeng/g8Of4aS+tEgn1AMikpWEk4lhu7s995cdR7Em2ctpQZ/uGg
   ZQZw8FHRc9B8XnI39Rc4pPpbMLbHRycQr/038jTaH959tjZc1HbeSyALq
   6Ws6KzzQKF4wBI0ugAkGpFy8GbMRI1jmuOAxOuqUkgmrwgoFO3O1VG+m5
   yVMfnaP8cG/dq/JZE8BqgfOXDKSnHk+HMEXumIGIyLegncmEuwlBZIgFw
   VHy9Qb08iGZ9Ky4oZvTZ1+PgRY7dLrp75VIsG3frUBO+U2QhNJg3wiusD
   8lAng0sAaDGb/qPcaVn2wlGVRn1EL9/SN3vxf3UeKyXOZOw1sT+zF1YEw
   Q==;
X-CSE-ConnectionGUID: WghBkGPmRxms639x3WofTw==
X-CSE-MsgGUID: RgEuxLZoTpCqd+sYwJMi1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189426321"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189426321"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 466F6DC6A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FD8EBF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:46 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A55F61A000B;
	Mon, 10 Feb 2025 17:01:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/66] dool: upgrade 1.3.3 -> 1.3.4
Date: Mon, 10 Feb 2025 17:00:33 +0800
Message-Id: <1739178095-26432-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix plugin loading for Python 3.13
- Added rudimentary Debian packaging information
- fix undefined variable 'mod' in plugin loading error reporting
- Tweaked the header lines to be + after an entire page has scrolled by
- Added documentation on how to package Dool
- Lots of work in packaging up RPM and Deb files
- Fix the top-io (all IO) and top-bio (Block IO) plugins and clarify the source of data for each

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/dool/{dool_1.3.3.bb => dool_1.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dool/{dool_1.3.3.bb => dool_1.3.4.bb} (93%)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.3.bb b/meta-oe/recipes-support/dool/dool_1.3.4.bb
similarity index 93%
rename from meta-oe/recipes-support/dool/dool_1.3.3.bb
rename to meta-oe/recipes-support/dool/dool_1.3.4.bb
index ba75a632ec..25662a0271 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.3.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.4.bb
@@ -12,7 +12,7 @@ RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell pyth
 SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https \
           "
 
-SRCREV = "e42e8c73043127283762eb52a2e31b7ab0aac177"
+SRCREV = "5068abef0a960c173a91e84a45e7fea1b0a802c0"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


