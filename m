Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A082C4743F
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.7256.1649903652305436040
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bA30334o;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903650; i=@fujitsu.com;
	bh=FCMjtBJUC+I91OJJ6Zn7a6Kjhl+a9ANtMOB7Ux+A/Ys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bA30334oVpW7Q5DY2qgQjbUWUKc9xo8u/9RQCC1//AtV3zbAQ6oSBYrEWsIkdq0ON
	 3HnJ59h7nQQgyj6CNGK+2zrDQ66T9lluQxtroq4ScONuwNrDYvqNfPX5uG37GDO/hH
	 6k4t2KzFTJ6K8pqDSHv037b8w5NnXpPBiAq980Z6Keqzymfhj1vcqFLkw6aBWXnex6
	 bO8/Suq91EK/5leAngKYgMIGyTIfdrSAgG7lGSmiP3vph0+iC+Wi8JDJB48CVEPGAL
	 wsuYvWp5AodkRcSFeyzZkvcxHGNjQ9ViG/tBzv299+yvp0+OajsiwOM5XrDf5baokL
	 yRi7Gu/tX0zSw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqKvYEZ5
  ksPqBqsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHi5Qv2ggWcFe+v3mFpYNzH0cXIxSEk8IRR
  YueZaawQzgUmiRnbVzNCOHsYJZpa97F1MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgLvH79hkwm0VAVeLH1gVgNq+Ak8TirUfB6iUEFCSmPHwPZHNwcAo4S3QuVQEJC4GU3J
  3ABlEuKHFy5hMWiPESEgdfvIBqVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEuqSgzPaMkNzEzR9fQwEDX0NBU1xxImZnpJVbpJuqlluomp+aVFCUCpfUSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOaXYbdkOxn19P/UOMUpyMCmJ8mYZhicJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuD1agXKCRalpqdWpGXmACMLJi3BwaMkwttUA5TmLS5IzC3OTIdInWLU5bh65cpeZiGWvP
  y8VClx3vx2oCIBkKKM0jy4EbAov8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcbZApPZl4
  J3KZXQEcwAR3xbVUoyBEliQgpqQamOFeLO3b5Ezyf3M+WthFzK61hEF09793eJPltcVbL36ao
  /HheJ8ursZmR62x8Q8xZPc1vk0uXm2621LRbdIHDYraMYsK+2iRxreM5cx48VFCb37mJUUmQ1
  an62xGvYwJlqcXfNnxdfT63837vxj/df1wfX3vx7Pqek+9d9ZWvZdRNedcSr818OmX7Vk3/5u
  fcDT8eWofdrdr0o8UrT4WxvU6wdsWkPpWzfs839RvGGM6/sMJv70TRV/92n+xtPhFYzSJr9b1
  oqry4tV7f+89Lq4WXvpNlnR9Zlfd96dSpT29nr1+s2K23sWjVtNqpGWvl1fpyZN7qxry0DC+s
  +d0rFDq/p+2N4fvnLzTfbjqpxFKckWioxVxUnAgAaN24pW0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1649903649!215807!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2605 invoked from network); 14 Apr 2022 02:34:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:34:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 23FB1100197
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:34:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 17DD2100183
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:34:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:33:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 39.0 -> 40.0
Date: Thu, 14 Apr 2022 10:33:43 +0800
Message-ID: <1649903624-17790-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649903624-17790-1-git-send-email-wangmy@fujitsu.com>
References: <1649903624-17790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96640

Changelog:
https://github.com/linux-rdma/rdma-core/releases/tag/v40.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rdma-core/{rdma-core_39.0.bb => rdma-core_40.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_39.0.bb => rdma-core_40.0.bb} (95%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb
similarity index 95%
rename from meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb
index 5fb72c7acb..c567e3314b 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_39.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_40.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https"
-SRCREV = "b2fedc4b1b891afd2c26ebfd21f9e440e83c28ff"
+SRCREV = "a3e69268892bbd5ab30123748e89a26509a25ac5"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1


