Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B526BCA0FE2
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15381.1755679202592972223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O4EfXAYM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679203; x=1787215203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TAkB1kCERrGB/155N0MkNhXVYkLtNag4j7lW5WN13Nc=;
  b=O4EfXAYMGP5nB9pt3NRla5AxO4v3R/S/2LuOs7REp6QOl2e1FYt9Kp3m
   2KmGASXVI1Lbhr4itg5Mcmak6bs+Qf70v3gEI2gvJYERIZtdGca76UaXy
   adlVYY7h4/VBK99kuSUWF9lmbM+fhfhDIu5eAAavJKTxJH9t/5/4b97cD
   PUyKe4gjS64TLlJW2RWz5GVWLWQ6IppiOxb4hh6A04KFc0b1OZU7i58rv
   DlX7g9DfwK9ABb8LCuh/UHrPWeQJD9jbbtbpHWfwIUOUMJrii1gzJBfqG
   iFhZY06Ldur75ak5BqyyTSVlJxPOtYo17QvCcVvMMlmddEFLm95wSc6Em
   A==;
X-CSE-ConnectionGUID: dItdjPdvS3uvNxnRrPfsDw==
X-CSE-MsgGUID: cauYbX1oSWuNc7rQyt7RYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="188901708"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="188901708"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7CBF41C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 389941004155
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 2F2EF200028C
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 218E21A0078;
	Wed, 20 Aug 2025 16:39:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/26] libnftnl: upgrade 1.2.9 -> 1.3.0
Date: Wed, 20 Aug 2025 16:39:27 +0800
Message-ID: <20250820083945.802-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119022

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.2.9.bb => libnftnl_1.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.9.bb => libnftnl_1.3.0.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb
index abcebceab8..705681641a 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.9.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "17190762f33f78090f5ff99a436c4cb866ac3ccd"
+SRCREV = "d36691a4ac486857fd437d3a9aa3701a073a9539"
 
 
 inherit autotools pkgconfig ptest
-- 
2.43.0


