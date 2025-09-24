Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA22CAC5B6
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8320.1758704443129004005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JvLn8CIz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704444; x=1790240444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N/c74rVidgpFR4rx4nUhc/YjtT/kJhO5x+DbstIjuT4=;
  b=JvLn8CIzy27NvX47qtMObsGmJ+rGg9YfZaHrKvay/SzK9YWcY2ovYu5D
   swGMrJnfYQ6o/vce//W97QKIBkecftERJ2F4wRKr9MCq7S9rHMNaYKnHB
   ImMd4/kVEG8FpJkG9J17ZUGsIKZIIxweUBpWcHJ5BK4PBS6J7FD4+3tjd
   BBsO1+OVs7BmW9X8DI2LnODeJ/TQrQEPyLFKnDdDGrPxmRHCpBsbKCwTG
   rRYMZogPPCFuHakGhWon2iUbjktoyp0Xp/VlI0w7Pxk5m928aUlerb20r
   zZDN1kWe2BhZ1kLaLxZOHgomJU1sEyTnUaBmgwu1sfSyOljw9Q70kA7XX
   g==;
X-CSE-ConnectionGUID: YnpTa70KSw6kTozLjuIw/w==
X-CSE-MsgGUID: bHLAflLERlaOlcP+bhug3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213818422"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213818422"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6003A1000349
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2721A1000460
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 8457C1800177;
	Wed, 24 Sep 2025 09:00:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 489011A0071;
	Wed, 24 Sep 2025 17:00:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/29] mcelog: upgrade 204 -> 206
Date: Wed, 24 Sep 2025 17:00:12 +0800
Message-ID: <20250924090029.1786-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119774

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_204.bb => mcelog_206.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_204.bb => mcelog_206.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_204.bb b/meta-oe/recipes-support/mcelog/mcelog_206.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_204.bb
rename to meta-oe/recipes-support/mcelog/mcelog_206.bb
index c3d082aa67..7685de722e 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_204.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_206.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "ad244c6b60fcbd08a5d73497bfb3487983801598"
+SRCREV = "7aa81797e3a42973c6aca0468ca35638bbbb06dc"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


