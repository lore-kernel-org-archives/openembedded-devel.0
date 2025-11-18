Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5CFCCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8414.1763456981888670130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=URhzqTb6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456982; x=1794992982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6RA0211pfjk3ZKozq8RiAVH5Ssc82KcQy9B9/HZUypM=;
  b=URhzqTb6Gu0yCO3E33XYaVrR7HmT8OwKpwHj+1MSD3E8zj96Ke9kdA93
   Qct6/8a7G/SPhaSwN538urpaIMVqz/FjZ5eX3gCRL7rpb3Bc/Wz+nuuPq
   pqTZzOPuLW63tfEPBStUNoVDdkfCimzKhogPkcq3Uk10qowTIlp29/AVe
   4ZPJYueO7PIARuw21D1Cg8MhkOj3whP6lT6eEQRMR4CDBNH5fI2EG7pp0
   ZBa6GlcXV/H4DJbTb3ZFa/fz4ToGGe3cJezbGWWGpVaNETpNMnEBq8PcX
   wZJLJXLGubbBcYlBYjr8IHCJfTI9ISvLG4wHDctugL9hKrGudzaKVz3CZ
   g==;
X-CSE-ConnectionGUID: 6gvUmF9tRki+iXaw3psv1g==
X-CSE-MsgGUID: zpZE7qbWSi6mygsTw2j/0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219577982"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219577982"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 37B05C01819
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:40 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E22B51400364
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 810C8140024E;
	Tue, 18 Nov 2025 09:09:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 28/29] ser2net: upgrade 4.6.5 -> 4.6.6
Date: Tue, 18 Nov 2025 17:08:45 +0800
Message-ID: <20251118090846.1484-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121839

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.5.bb => ser2net_4.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.5.bb => ser2net_4.6.6.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
index 59322dae09..56ade35bc7 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.5.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "96dfc3fd06b1bf4d7c1f46d7e8cc1eff555de64f419d76f57bd0346e000f9781"
+SRC_URI[sha256sum] = "a468073c7bf8166c78c61d30bba487916dc4088e98f96e190b37ea8100a94fd4"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.43.0


