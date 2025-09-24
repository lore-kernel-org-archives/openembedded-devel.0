Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C345CAC5B8
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8226.1758704439377690112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gkefbxTT;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704439; x=1790240439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bclfFEg2SNZguZD2mRRLQ4Ab7S7aNjyI1JgIgL4I3Us=;
  b=gkefbxTTXUIrYtBixalaXbCH0y8e5plwu5idkij0e+3XYGtf7zTEji8O
   r1n1uj1hNktU+PhyKp916eIqAQMWXsLRO6tRO59pQ49t2w9bWOGyGuk3l
   4ptqXY1IFTbxy4L25pgUt4VIHPai75VhWtX+IGFhuRHbTeYiXxLcYcmXe
   QxEwQbjKLQUjCpdSt3bnAe0m+zdRST+Dj4L0AFX4MMl025jdQ9XybRfUO
   ZnDea4Sda1ShaMUMSVYuyNM0qZOK5O6+dHDQKMZ8deg/MOWfcmbzK6EW0
   jmIWOuu3lw1z8gCBv0GceNWSrHJef1BohI/G01Hwf1F0AFyBR5ZpO0Ft1
   g==;
X-CSE-ConnectionGUID: MWRVw25nSo2RqkVrPt4sfg==
X-CSE-MsgGUID: lnNSCV8HRHS+HhQo/hKczA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="192706850"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="192706850"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:37 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BB22F1000346
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7C2561800EBA
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id E72C9180218D;
	Wed, 24 Sep 2025 09:00:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E30821A0074;
	Wed, 24 Sep 2025 17:00:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/29] dash: upgrade 0.5.12 -> 0.5.13
Date: Wed, 24 Sep 2025 17:00:03 +0800
Message-ID: <20250924090029.1786-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119766

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-shells/dash/{dash_0.5.12.bb => dash_0.5.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-shells/dash/{dash_0.5.12.bb => dash_0.5.13.bb} (90%)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.13.bb
similarity index 90%
rename from meta-oe/recipes-shells/dash/dash_0.5.12.bb
rename to meta-oe/recipes-shells/dash/dash_0.5.13.bb
index 1bf3625760..bab2200bcc 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.13.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 inherit autotools update-alternatives
 
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
-SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
+SRC_URI[sha256sum] = "fd8da121e306b27f59330613417b182b8844f11e269531cc4720bf523e3e06d7"
 
 CVE_PRODUCT = "dash:dash"
 
-- 
2.43.0


