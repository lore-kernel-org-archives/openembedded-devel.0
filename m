Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A633C36011
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MyaBc6q/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893335; x=1774429335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=khZThjeIpSkpR0/jAXXWH/ikCTCSM6TPEXLg3wMYLb0=;
  b=MyaBc6q/WeIWyi2vCYKM/F2exwgkjj6FUKv0jpDYsK4MeHgcj69isGZc
   8MbIJxIt5jHR1Vp7jj7TNmXv6KczuPQSzOon68cYYBMkvnIpquveItiu2
   YPVc02kpnxzOGEWiYdWUS2+Wl+8YnUQnUgpCT29zCyaoAY5O3KjNjLClR
   GHhDU5ibe2HQeDSwxyUpH77OPMdduVKhili0a5p9b1EX+mbcB2FIYHyiZ
   sbDCNuH3hSkZMNTbCBmPB45Vn25Xoh7GX5YgJ5/cws0q+JrZLeA/jXJm2
   5ijfsO2/05BUB48FfuIr848JBNLe51tp/ofuRDO9k9XWHZn8fixHYIwVM
   A==;
X-CSE-ConnectionGUID: ct/WbH8xSb+fRPVzmUH4jw==
X-CSE-MsgGUID: KWneCyKfQxOco4xcBvN2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576279"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576279"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:14 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C310DC726
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4E8BD6FE1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 600641A009B;
	Tue, 25 Mar 2025 17:02:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/45] libharu: upgrade 2.4.4 -> 2.4.5
Date: Tue, 25 Mar 2025 17:01:19 +0800
Message-Id: <1742893312-3809-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116236

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libharu/{libharu_2.4.4.bb => libharu_2.4.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libharu/{libharu_2.4.4.bb => libharu_2.4.5.bb} (89%)

diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.4.bb b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
similarity index 89%
rename from meta-oe/recipes-support/libharu/libharu_2.4.4.bb
rename to meta-oe/recipes-support/libharu/libharu_2.4.5.bb
index 02dc499e03..db8acd4532 100644
--- a/meta-oe/recipes-support/libharu/libharu_2.4.4.bb
+++ b/meta-oe/recipes-support/libharu/libharu_2.4.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=924546dab2bef90e370d7c0c090ddcf0"
 DEPENDS += "libpng zlib"
 
 SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https"
-SRCREV = "0c598becaadaef8e3d12b883f9fc2864a118c12d"
+SRCREV = "8fe5a738541a04642885fb7a75b2b5b9c5b416fa"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


