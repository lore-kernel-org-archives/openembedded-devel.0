Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A75CAC5B2
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8225.1758704439250344584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hn1drYhr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704440; x=1790240440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dltp778eb9XuApfqlFRSS37wb9zyXdVHlD8xl2fRTBw=;
  b=Hn1drYhrpBuUHbP1YBrxYlrSHHxBPEfojxbsC1URHNexrc5kvgE6TWPQ
   l/bdZLXd6yqJ/OE70wgN5uaFz1s/Li77R/G0bpkI4aKWXf/oP67D1xy7E
   Op1+h6uD414NA6Uc1+RerBElaNatWCZ19t3N8v8D1nV8UZZhbbrA0/G+D
   Z8x8QRnvdOwJUEx0vpYhSFphyNWxFD0UdaAJKcwm6YJjJK7c/yJvpVioX
   mm7VVjd3EDRArVzDeDF0lGusCRSxvbjicdXZHiM4Otz+9w/VwkKmHOW58
   m8i8Lh74WqqeiajuLLldkjJazPqABSsmBUrjaMLyjhGDpYYDnh2uIitIR
   g==;
X-CSE-ConnectionGUID: F/u8Ys49QtamptEmsNTCuw==
X-CSE-MsgGUID: ijXzCyqaSCyYOcuKhkgxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213113597"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213113597"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:38 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6BF511C0008D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:37 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 25FE0C01284
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 9168A2001093;
	Wed, 24 Sep 2025 09:00:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8C5901A0073;
	Wed, 24 Sep 2025 17:00:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/29] ctags: upgrade 6.2.20250907.0 -> 6.2.20250921.0
Date: Wed, 24 Sep 2025 17:00:02 +0800
Message-ID: <20250924090029.1786-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119765

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250907.0.bb => ctags_6.2.20250921.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250907.0.bb => ctags_6.2.20250921.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb
index d2f7afa160..7f87f15f9a 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250907.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "46d78a217f883e9d4e4110b496f47ed765bfc1f1"
+SRCREV = "d45ba7971bea23a404a275a3a77c53a85f808fed"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


