Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3311C369B6
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.43039.1744017447888691469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UkYsaCUe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017448; x=1775553448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=t/lschSocRlVi42nBlub+cmD/KEKBNx4YGIzWZQz4iM=;
  b=UkYsaCUeCDiq77ZJh0+kV8ej/33j0W6t0g3ERgBHeTN7HHCOYMg8SYGo
   B3AMvv1pE4tgCm79G2oZJpvxFeZUig8Z6+CLTpmpq26CiMv4Xyk4Z8mzy
   18LlaUiicp6vndbFDOqt6Lelzc7eidDtrKicpv8B7g4oh5tA7pqadb1ea
   O4w/E5xby1fJgOZSHZZP84pihLc+JSm9Agd1C+8+hSGWlxSx8vxrtJplr
   BefZVzDIKzMd5GhPVRzqpmKBPASUfdiBrGnTesfb1AsJ2/kzLLnjXbE4p
   9V+7c6o4I7BVucBW5+AP+Xcgt8JfN6SKnssf+vYfAYbW7xPqkTSf3sQeU
   w==;
X-CSE-ConnectionGUID: vq9NhXh3RWG1NhisFhi6pw==
X-CSE-MsgGUID: QRbsf5A8S7+YpGLSqVMLYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195694336"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195694336"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A706D96742
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EF03CFA5C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DDBEE1A0071;
	Mon,  7 Apr 2025 17:17:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/30] openvpn: upgrade 2.6.13 -> 2.6.14
Date: Mon,  7 Apr 2025 17:16:49 +0800
Message-Id: <1744017431-22217-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116634

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.6.13.bb => openvpn_2.6.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.13.bb => openvpn_2.6.14.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
index 03b9b1b64f..67ea09fad5 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.13.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "1af10b86922bd7c99827cc0f151dfe9684337b8e5ebdb397539172841ac24a6a"
+SRC_URI[sha256sum] = "9eb6a6618352f9e7b771a9d38ae1631b5edfeed6d40233e243e602ddf2195e7a"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.43.0


