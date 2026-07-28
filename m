Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C571C54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5764.1785218810579443964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=adup6/P0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218813; x=1816754813;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+KEXWBFOYobHyZC+b+Qea/k87tc+j/JBSG9TPW3yjCc=;
  b=adup6/P0uJDYMcP+8jKqMMEd5QJgHT0vVgD19Ri/f6UYEHjVDe87o8Zu
   zO6vRH/wVen1x0ersZFEkzpLvkJeKfsv9S+jAFG3sjT/SzHkFAZf5RO83
   vreiTo+VXn1TXSEyWaagG2D4I/mv99yakQE6oJqp0OJJiEa64Tzg3B4bu
   iGfVP6JgM65KHp3tLTcUazJ4GCn9WLNhisTy9z1qSwfELiezWSl1vbtd2
   FGz5rKSZ0CPQVARxz2pPs/s3pT+Q8gUFLCHa2csOnlrqKbPZPnPjciGED
   ezKqK2abaoOHyakHmHHQQlCA13ULCGU41illk+e9BjazAjFYWOklATQRC
   Q==;
X-CSE-ConnectionGUID: P9bsFwFOStCU53OK5y1ZSA==
X-CSE-MsgGUID: VEAjCzckRDSFjxwrW2ic7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236797049"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236797049"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 876458200B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D8D01800271
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9BE7010005D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:46 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] bats: upgrade 1.13.0 -> 1.14.0
Date: Tue, 28 Jul 2026 14:06:13 +0800
Message-ID: <20260728060645.819-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128470

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.13.0.bb => bats_1.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.13.0.bb => bats_1.14.0.bb} (94%)

diff --git a/meta-oe/recipes-test/bats/bats_1.13.0.bb b/meta-oe/recipes-test/bats/bats_1.14.0.bb
similarity index 94%
rename from meta-oe/recipes-test/bats/bats_1.13.0.bb
rename to meta-oe/recipes-test/bats/bats_1.14.0.bb
index 3545295a3c..bece4177c3 100644
--- a/meta-oe/recipes-test/bats/bats_1.13.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.14.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
   "
 
 # v1.13.0
-SRCREV = "3bca150ec86275d6d9d5a4fd7d48ab8b6c6f3d87"
+SRCREV = "eb7f42f8d608ac693d7a4b67474f6714ea68cfc5"
 
 
 # Numerous scripts assume ${baselib} == lib, which is not true.
-- 
2.43.0


