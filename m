Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D96CA0FED
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4723.1755766812419617460
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=azew5nPv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766813; x=1787302813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tPV8Gsnt0bep7VmNCmSI1cy04fjbbrHhxSRYEpnXN/w=;
  b=azew5nPvaiRGd80+C/RDJAx6+GxSUAqUTHAF5TnI7XqWF/iRorTYDlWW
   sGOZNnLnd/zjEpNpreEYY/b2DvckLlJo37g8C4d+P9h2/F6ngx49YmB2g
   s33WcE7vuMkHhq9GKjAR6v1p95YP1q2VYX1jlWklODRtMQNlTEKf8CvVu
   jFZqduZv6ZWZiHhoYSsMzzitPG/px5m7ULDfnn2lRViqb4UhS/XISuQre
   sOxyussEJGErAOpr5j4OIqDUxTcze5T9FExDiIqoPcEi8P60/MGJCRAWn
   WjFlqCDq9Zxt+0UNdEPz6bJFuB8RfErGWV3I9Y/e3Z/ClAhR3Urezpmc4
   A==;
X-CSE-ConnectionGUID: ETO6EkgcSr63VIGECGKsFQ==
X-CSE-MsgGUID: MdcBlcjSSDGYIVLo/92oxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210213286"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210213286"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8FDE342A33D
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 37C621C08338
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 182261407699
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EA5D1A007E;
	Thu, 21 Aug 2025 17:00:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/21] python3-icecream: upgrade 2.1.5 -> 2.1.7
Date: Thu, 21 Aug 2025 16:59:37 +0800
Message-ID: <20250821085954.2056-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119055

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed: Pretty-printing of SymPy (and similar) objects.
- Added: Configurable line wrap length.
- Improved: The package no longer includes tests in the production installation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-icecream_2.1.5.bb => python3-icecream_2.1.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.5.bb => python3-icecream_2.1.7.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb
index 7e9383457b..99aaff7e7d 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "14d21e3383326a69a8c1a3bcf11f83283459f0d269ece5af83fce2c0d663efec"
+SRC_URI[sha256sum] = "936df053e65ff3c7a219fa79311b32bdae19aad83dd2e23d153ab8864b78acd9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


