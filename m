Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2479CAC5BA
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8320.1758704443129004005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OOuzx3xW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704447; x=1790240447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nTGW6iV1Cei8K+FDyeyXXlJINBek83g6yLC+KM3eAWY=;
  b=OOuzx3xWif5vBfiLNw5DENVJq1mAulKRpo7MyhvXacUedNpbt1OifMNS
   ZI6lGqEBcqgemwXjqekegHhspgvfiI7me633airi01wmXCNmkHNi/meZX
   Nih+TRgSPTpm/WdRHtwFsIFyeIPiqTMM8AfjIVNnTL0uw/vJmrdrCyKNY
   bTnz7SvKp/1ddvXXACa7jFqmTNm6Y5yIDUDZ/xdhJgYb58a76e40QoYlQ
   8O1p5XOEI5gWJXtb9knpNJx/h3QjNOsMdR0Q2YK83d2zVrCLhkON9hnXQ
   k0ezx6k9MRsHpHLQmweeoZvXIFN9kE7hvmI7JoYPkxYdtQnUZv2f1KHIJ
   Q==;
X-CSE-ConnectionGUID: ALqU45amQ8u+NG/ZpzH+YA==
X-CSE-MsgGUID: y9xA518PRKalLFDtTpX8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213818439"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213818439"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1255D1000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C4D88180198D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 2AEE71003111;
	Wed, 24 Sep 2025 09:00:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D47C1A008A;
	Wed, 24 Sep 2025 17:00:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/29] python3-pymongo: upgrade 4.15.0 -> 4.15.1
Date: Wed, 24 Sep 2025 17:00:25 +0800
Message-ID: <20250924090029.1786-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119786

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.15.0.bb => python3-pymongo_4.15.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.15.0.bb => python3-pymongo_4.15.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb
index 608df4a24d..cf35e810c0 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.15.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "430a6dc088355209e5755f77d85ddea2f1da0bb6123185952a573e7cf25a250a"
+SRC_URI[sha256sum] = "b9f379a4333dc3779a6bf7adfd077d4387404ed1561472743486a9c58286f705"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


