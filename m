Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D2FC369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.43038.1744017444610489553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ECEZlMz1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017444; x=1775553444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=emQGnO/qjQ5s4UgytQbzeK3zSS/8YmlDrF6QgB1boC8=;
  b=ECEZlMz1DMh6IErLgKEq9DCG7gpVtANnB+tOTBpavTf2Y8pgN63CIG1S
   bF6wxRr29DsvL3E4OL8EUShB0MzRTZSvaICUqUy9zhs50B8up5PZG/7Wy
   vGmhJlDZk8P/8r6kXwqjd7toIqL29xUmtag27UohSZOrSb1dpd/yVqd/Q
   e0At9tQ4knedNST27BMcTA9W8sPWNvYHuNCrhoWWU8ofMmw6bX6rSRPE0
   C2AaFTT1nIN5+IWjyTYrY8HHUcLu+gPIT+zmw5vBNS71IiSLZ7gOETrzZ
   w8vdPotWb/ZqEXTlRz3fcpgKFZoYqLZ56VjQG0wlKhKbLHQWXHEX5zozN
   g==;
X-CSE-ConnectionGUID: 4HOenbBKQ3K1AY281hWXyw==
X-CSE-MsgGUID: FpGIBiJNR4WOliRVyAjtQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174543296"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174543296"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 30452D4F55
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFCBFD507E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 695D91A0071;
	Mon,  7 Apr 2025 17:17:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 03/30] libcgi-perl: upgrade 4.67 -> 4.68
Date: Mon,  7 Apr 2025 17:16:44 +0800
Message-Id: <1744017431-22217-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116628

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.67.bb => libcgi-perl_4.68.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.67.bb => libcgi-perl_4.68.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
index fcda790d33..59934fe36d 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.68.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f4a6896eb94a3ecaa1c1ba02f7e0d2bed0be4c5ad3378d80196ec25662ac4111"
+SRC_URI[sha256sum] = "12fb5a5b392032413571169257f98533488005550774bcbd0715be687a590cf2"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.43.0


