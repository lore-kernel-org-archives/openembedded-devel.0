Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F027C3ABA9
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7603.1745900152462873842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kg2DBBn9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AbHL98HjrGKMSD8mKhK/P4sRNVu9JarV4qQ10GlJkYE=;
  b=kg2DBBn95ZFJRrfGmXvxYkIT+MB7ddIKSqlmXooyUio1xTVRv16GhKB0
   a4nmjlfk+8YEAHO7LWTuBwkUJirD7zZjDMAK7GnB16eAREdaeNuk9hqgN
   4caZuO1DkubphGDuP00TVwAhA/QyvLMdBMsmjizzCUEgHlAj2aIvX64MW
   hMR4WYavL54vW+sfhrEdDQAni2bKUYCzY2MYUHoP3/dtKw/X5Xm4FQ01s
   qpE2HTgfHuYDuz5msyOSzT/KywX/dY5olcWdJJCpmTyOzeF55tiDC551w
   lg+MJsV/G/mJJdIH134S1fYU5ZcocakR7/r6mpQqrpnXw7mqMUv7/jtpr
   Q==;
X-CSE-ConnectionGUID: cTkhnAamQiq69zyaZoa5uQ==
X-CSE-MsgGUID: WmSDE0BxRnmLgniUX7PRNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="200848077"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="200848077"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FD4FD4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CB13BF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D115D1A009A;
	Tue, 29 Apr 2025 12:15:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/23] parallel: upgrade 20250322 -> 20250422
Date: Tue, 29 Apr 2025 12:15:24 +0800
Message-Id: <1745900138-26424-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117214

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250322.bb => parallel_20250422.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250322.bb => parallel_20250422.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250322.bb b/meta-oe/recipes-extended/parallel/parallel_20250422.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250322.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250422.bb
index 8767f2946b..88d1cf040b 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250322.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250422.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "c82896e779b18c2a157527f32f35de9a6d984f8b8ebad2b41dbc78c33adbaabe"
+SRC_URI[sha256sum] = "10f0a7b7fbed87edcbd63a403fdc0ee1a1f86c241a3605f33162b4b9aff248dd"
 
 inherit autotools bash-completion
 
-- 
2.43.0


