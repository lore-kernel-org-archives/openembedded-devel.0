Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D03CA0FEA
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15255.1755679204336650566
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V+h/iVCq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679205; x=1787215205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cCLCGGbIP0p9ynv+5oQ905qu8TsvdKbW7+1dAMYhgp4=;
  b=V+h/iVCqyVNaFsM+X/3sfd53mEBukiMmap0/b28Qy3RAVF8FHKHau1x1
   Rzo9eJaYzS352+IV0qbhNxNvNz2LhfrrG+lsZxWyRZLnwoRvJOrA8Akt8
   QkvXoLwG2iOc2uzweb7QLWR+7yBhjOiQuyRs/snjflciwTCoLLvdGmVWH
   WOFPhD5uwswBIV9gNxQp5ph4hYL6Vg3wgqauvGLJMXyDC4FkU4CN6M64i
   JFtZ04AvRoAv9+cUtx2eKJ+W4Gtv40exbUrfluxEOhz/wulX1fwFJXeiU
   cH+PcEw42ZGHuj66w7MV4IOs5HglEWOTm/evwXeXDx9X6d/4g8HCxDyme
   Q==;
X-CSE-ConnectionGUID: EosEfPRDTJmHyvO10cQm0w==
X-CSE-MsgGUID: xEPlf4KwSYW5GxKcOl/0NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209365709"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="209365709"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 10E421C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:03 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BCD3C100084E
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 9E1FB10003E3
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD3781A0073;
	Wed, 20 Aug 2025 16:39:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/26] libyang: upgrade 3.12.2 -> 3.13.5
Date: Wed, 20 Aug 2025 16:39:31 +0800
Message-ID: <20250820083945.802-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119027

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
============
- yanglint extension-instance YANG data validation support
- compatibility fixes for FreeBSD
- minor LYB data format improvements
- lots of other bugfixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_3.12.2.bb => libyang_3.13.5.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libyang/{libyang_3.12.2.bb => libyang_3.13.5.bb} (91%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb b/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
similarity index 91%
rename from meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
index 7fff0b96a1..9dad6ba279 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.12.2.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/CESNET/libyang"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9bb3d334294e8719f41c531e28a9a697"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
 
-SRCREV = "da7272e19d9e27d1bfdd68108fa9dce25fbdf5e8"
+SRCREV = "efe43e3790822a3dc64d7d28db935d03fff8b81f"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.43.0


