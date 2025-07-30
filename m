Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E42DC87FD4
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.31370.1753869305878522006
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DSmouG1a;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869306; x=1785405306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMS1YHrKSAd0YfDBcHC7F8y6BVN3Zoyj2FIKNc+kpz4=;
  b=DSmouG1adTDrQc5xVCip5Wv1SRfX1G0E7LBO6G6ixq5iTdx3wCkEudpt
   hzrWFJBtsJC40qtyz2A9NaAMg2l/08kO2ESweSV1saKDtLcAzprqjLqe1
   y5teXNuFy+yaibaDmk3QIVb4CGI2eUNSiLQJj5NbSn8RrJm2OFyXLhnIa
   SLBH4huDDMLlRcLOiP+Njj2UZTud9PVJq1ZkxoKa6T2fwNnMC509pARDY
   +DICUtsuim4cbziSZ2hBc9eUZrT7A+LSLcdEehVONAf/+pUBkArcGbInh
   XH9QigItWg0Nadk5i/IubzTWFGuNCytCwbp8Twr/ucvE4Uufuy9x3KgKz
   Q==;
X-CSE-ConnectionGUID: vt3YqQlhQmmdit252yMuow==
X-CSE-MsgGUID: I2QJFLD3QfqNwvrfbFPOKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207935298"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207935298"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:04 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 377DC1C0213E
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A2179823C42
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B919B1A008D;
	Wed, 30 Jul 2025 17:55:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/40] cfengine-masterfiles: upgrade 3.21.5 -> 3.26.0
Date: Wed, 30 Jul 2025 17:54:21 +0800
Message-ID: <20250730095456.695-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118771

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-masterfiles_3.21.5.bb => cfengine-masterfiles_3.26.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.21.5.bb => cfengine-masterfiles_3.26.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb
index 1baacac03d..d8869f20cb 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.21.5.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.26.0.bb
@@ -18,11 +18,11 @@ or wherever `$(sys.masterdir)` points. \
 HOMEPAGE = "http://cfengine.com"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bb843e794feb6890f7697637b461c36e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22b3189b9b79f1de35860dcc299bb6bc"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "0adcfcf36d47317776ad64331058a4d2e3669683314716ddb885f8a13309f47d"
+SRC_URI[sha256sum] = "fc8b0ad20e803e0d1e9dcda7afb2f3f5110357ac0e553ed95cf2cbea9652451d"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


